package cn.qihangerp.open.dou.controller;


import cn.qihangerp.open.dou.DouRefundApiHelper;
import cn.qihangerp.open.dou.DouRequest;
import cn.qihangerp.open.dou.DouTokenApiHelper;
import cn.qihangerp.open.dou.common.ApiResultVo;
import cn.qihangerp.open.dou.domain.OmsDouRefund;
import cn.qihangerp.open.dou.model.Token;
import cn.qihangerp.open.dou.model.after.AfterSale;
import cn.qihangerp.open.dou.service.OmsDouRefundService;
import com.alibaba.fastjson2.JSONObject;
import cn.qihangerp.common.common.AjaxResult;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.enums.HttpStatus;
import cn.qihangerp.common.mq.MqMessage;
import cn.qihangerp.common.mq.MqType;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RequestMapping("/dou/refund")
@RestController
public class DouRefundApiController {
    private static Logger logger = LoggerFactory.getLogger(DouRefundApiController.class);
    private final DouApiHelper douApiHelper;
    private final OmsDouRefundService refundService;
    private final KafkaTemplate<String,Object> kafkaTemplate;
    @RequestMapping(value = "/pull_refund", method = RequestMethod.POST)
    public AjaxResult pullRefundList(@RequestBody DouRequest req) throws Exception {
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        var checkResult = douApiHelper.checkBefore(req.getShopId());
        if (checkResult.getCode() != ResultVoEnum.SUCCESS.getIndex()) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }

        String accessToken = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSercet = checkResult.getData().getAppSecret();

        ApiResultVo<Token> token = DouTokenApiHelper.getToken(appKey, appSercet,checkResult.getData().getSellerShopId());
        if(token.getCode()==0) {
            accessToken = token.getData().getAccessToken();
        }else{
            return AjaxResult.error(token.getMsg());
        }

        Long endTime = System.currentTimeMillis() / 1000;//订单更新结束时间
        Long startTime = endTime-(60 * 60 * 24 * 7);//订单更新开始时间

        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数
        ApiResultVo<AfterSale> apiResultVo = DouRefundApiHelper.pullAfterSaleList(startTime, endTime, 0, 50, appKey, appSercet, accessToken);

        if (apiResultVo.getCode() != 0) return AjaxResult.error(apiResultVo.getCode(), apiResultVo.getMsg());

        Integer total  = apiResultVo.getTotalRecords();
        //成功
        if (apiResultVo.getList() != null) {
            for (var item:apiResultVo.getList()) {
                OmsDouRefund refund = new OmsDouRefund();

                BeanUtils.copyProperties(item.getAftersaleInfo(), refund);
                refund.setOrderLogistics(JSONObject.toJSONString(item.getAftersaleInfo().getOrderLogistics()));
                refund.setAftersaleTags(JSONObject.toJSONString(item.getAftersaleInfo().getAftersaleTags()));
                refund.setAutoAuditBits(JSONObject.toJSONString(item.getAftersaleInfo().getAutoAuditBits()));
                refund.setTextPart(JSONObject.toJSONString(item.getTextPart()));
                refund.setRelatedOrderInfo(JSONObject.toJSONString(item.getOrderInfo().getRelatedOrderInfo()));
                refund.setOrderSkuOrderId(item.getOrderInfo().getRelatedOrderInfo().get(0).getSkuOrderId());
                refund.setOrderStatus(item.getOrderInfo().getRelatedOrderInfo().get(0).getOrderStatus());
                refund.setOrderPayAmount(item.getOrderInfo().getRelatedOrderInfo().get(0).getPayAmount());
                refund.setOrderPostAmount(item.getOrderInfo().getRelatedOrderInfo().get(0).getPostAmount());
                refund.setOrderItemNum(item.getOrderInfo().getRelatedOrderInfo().get(0).getItemNum());
                refund.setOrderProductId(item.getOrderInfo().getRelatedOrderInfo().get(0).getProductId()+"");
                refund.setOrderProductName(item.getOrderInfo().getRelatedOrderInfo().get(0).getProductName());
                refund.setOrderProductImage(item.getOrderInfo().getRelatedOrderInfo().get(0).getProductImage());
                refund.setOrderShopSkuCode(item.getOrderInfo().getRelatedOrderInfo().get(0).getShopSkuCode());
                refund.setOrderSkuSpec(JSONObject.toJSONString(item.getOrderInfo().getRelatedOrderInfo().get(0).getSkuSpec()));
                //插入订单数据
                var result = refundService.saveRefund(req.getShopId(), refund);
                if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                    //已经存在
                    logger.info("/**************主动更新pdd订单：开始更新数据库：" + refund.getAftersaleId() + "存在、更新****************/");
                    kafkaTemplate.send(MqType.REFUND_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.DOU, MqType.REFUND_MESSAGE,refund.getAftersaleId().toString())));
                    hasExistOrder++;
                } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                    logger.info("/**************主动更新pdd订单：开始更新数据库：" + refund.getAftersaleId() + "不存在、新增****************/");
                    kafkaTemplate.send(MqType.REFUND_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.DOU, MqType.REFUND_MESSAGE,refund.getAftersaleId().toString())));
                    insertSuccess++;
                } else {
                    logger.info("/**************主动更新pdd订单：开始更新数据库：" + refund.getAftersaleId() + "报错****************/");
                    totalError++;
                }
            }
        }
        String msg = "成功，总共找到：" + apiResultVo.getList().size() + "条商品数据，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        logger.info(msg);
        return AjaxResult.success(msg);
    }

}
