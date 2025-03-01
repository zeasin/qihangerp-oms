package cn.qihangerp.open.wei.controller;


import cn.qihangerp.open.wei.WeiPullRequest;
import cn.qihangerp.open.wei.RefundApiHelper;
import cn.qihangerp.open.wei.common.ApiResultVo;
import cn.qihangerp.open.wei.model.AfterSaleOrder;
import com.alibaba.fastjson2.JSONObject;
import cn.qihangerp.common.common.AjaxResult;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.enums.HttpStatus;
import cn.qihangerp.common.mq.MqMessage;
import cn.qihangerp.common.mq.MqType;
import cn.qihangerp.security.common.BaseController;

import cn.qihangerp.open.wei.domain.OmsWeiRefund;
import cn.qihangerp.open.wei.service.OmsWeiRefundService;
import lombok.AllArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.Date;

@RequestMapping("/wei/refund")
@RestController
@AllArgsConstructor
public class WeiRefundApiController extends BaseController {
    private final WeiApiCommon apiCommon;
    private final OmsWeiRefundService refundService;
    private final KafkaTemplate<String,Object> kafkaTemplate;

    @RequestMapping(value = "/pull_list", method = RequestMethod.POST)
    public AjaxResult pullList(@RequestBody WeiPullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }

        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();

        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != ResultVoEnum.SUCCESS.getIndex()) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String serverUrl = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();

        // 获取最后更新时间
        LocalDateTime endTime = LocalDateTime.now();
        LocalDateTime startTime = endTime.minusDays(1);

        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数

        ApiResultVo<AfterSaleOrder> apiResultVo = RefundApiHelper.pullRefundList(startTime, endTime, accessToken);

        if(apiResultVo.getCode() == 0) {
            // 拉取到了数据 拉取详情
            if(apiResultVo.getList()!=null) {
                for (var refundInfo : apiResultVo.getList()) {

                    OmsWeiRefund refund = new OmsWeiRefund();
                    refund.setOrderId(refundInfo.getOrder_id());
                    refund.setAfterSaleOrderId(refundInfo.getAfter_sale_order_id());
                    refund.setShopId(params.getShopId());
                    refund.setStatus(refundInfo.getStatus());
                    refund.setOpenid(refundInfo.getOpenid());
                    refund.setUnionid(refundInfo.getUnionid());
                    refund.setProductId(refundInfo.getProduct_info().getString("product_id"));
                    refund.setSkuId(refundInfo.getProduct_info().getString("sku_id"));
                    refund.setCount(refundInfo.getProduct_info().getInteger("count"));
                    refund.setFastRefund(refundInfo.getProduct_info().getString("fast_refund"));
                    refund.setRefundAmount(refundInfo.getRefund_info().getInteger("amount"));
                    refund.setRefundReason(refundInfo.getRefund_info().getInteger("refund_reason"));
                    refund.setReturnWaybillId(refundInfo.getReturn_info().getString("waybill_id"));
                    refund.setReturnDeliveryName(refundInfo.getReturn_info().getString("delivery_name"));
                    refund.setReturnDeliveryId(refundInfo.getReturn_info().getString("delivery_id"));
                    refund.setMerchantUploadInfo(JSONObject.toJSONString(refundInfo.getMerchant_upload_info()));
                    refund.setCreateTime(refundInfo.getCreate_time());
                    refund.setUpdateTime(refundInfo.getUpdate_time());
                    refund.setReason(refundInfo.getReason());
                    refund.setReasonText(refundInfo.getReason_text());
                    refund.setType(refundInfo.getType());
                    refund.setComplaintId(refundInfo.getComplaint_id());
                    refund.setRefundResp(JSONObject.toJSONString(refundInfo.getRefund_resp()));
                    refund.setDetails(JSONObject.toJSONString(refundInfo.getDetails()));

                    var result = refundService.saveRefund(params.getShopId(), refund);
                    if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                        //已经存在
                        kafkaTemplate.send(MqType.REFUND_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.DOU, MqType.REFUND_MESSAGE,refund.getAfterSaleOrderId())));
                        hasExistOrder++;
                    } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                        kafkaTemplate.send(MqType.REFUND_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.DOU, MqType.REFUND_MESSAGE,refund.getAfterSaleOrderId())));
                        insertSuccess++;
                    } else {
                        totalError++;
                    }

                }
            }

        }

        return AjaxResult.success();
    }
}
