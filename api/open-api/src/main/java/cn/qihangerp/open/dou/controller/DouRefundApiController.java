package cn.qihangerp.open.dou.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.enums.HttpStatus;
import cn.qihangerp.common.mq.MqMessage;
import cn.qihangerp.common.mq.MqType;
import cn.qihangerp.common.mq.MqUtils;
import cn.qihangerp.domain.OShopPullLasttime;
import cn.qihangerp.domain.OShopPullLogs;
import cn.qihangerp.module.open.dou.domain.DouRefund;
import cn.qihangerp.module.open.dou.service.DouRefundService;
import cn.qihangerp.module.service.OShopPullLasttimeService;
import cn.qihangerp.module.service.OShopPullLogsService;
import cn.qihangerp.open.PullRequest;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.dou.DouApiCommon;
import cn.qihangerp.open.dou.DouRefundApiHelper;
import cn.qihangerp.open.dou.DouTokenApiHelper;
import cn.qihangerp.open.dou.model.Token;
import cn.qihangerp.open.dou.model.after.AfterSale;
import com.alibaba.fastjson2.JSONObject;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * 淘系订单更新
 */
@AllArgsConstructor
@RestController
@RequestMapping("/refund")
public class DouRefundApiController {
    private static Logger log = LoggerFactory.getLogger(DouRefundApiController.class);

    private final DouRefundService refundService;
    private final DouApiCommon douApiCommon;
    private final MqUtils mqUtils;
    private final OShopPullLogsService pullLogsService;
    private final OShopPullLasttimeService pullLasttimeService;
    /**
     * 拉取退款
     * @param req
     * @
     * @throws
     */
    @PostMapping("/pull_list")
    @ResponseBody
    public AjaxResult pullRefundList(@RequestBody PullRequest req)   {
        log.info("/**************增量拉取dou退款****************/");
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        Long currTimeMillis = System.currentTimeMillis();

        var checkResult = douApiCommon.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }

        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
        Long douShopId = checkResult.getData().getSellerId();
        String accessToken = checkResult.getData().getAccessToken();

        // 取当前时间30分钟前
//        LocalDateTime endTime = LocalDateTime.now();
//        LocalDateTime startTime = endTime.minus(60*24, ChronoUnit.MINUTES);
        // 获取最后更新时间
        LocalDateTime startTime = null;
        LocalDateTime  endTime = null;
        OShopPullLasttime lasttime = pullLasttimeService.getLasttimeByShop(req.getShopId(), "REFUND");
        if(lasttime == null){
            endTime = LocalDateTime.now();
            startTime = endTime.minusDays(1);
        }else {
            startTime = lasttime.getLasttime().minusHours(1);//取上次结束一个小时前
            Duration duration = Duration.between(startTime, LocalDateTime.now());
            long hours = duration.toHours();
            if (hours > 24) {
                // 大于24小时，只取24小时
                endTime = startTime.plusHours(24);
            } else {
                endTime = LocalDateTime.now();
            }
//            endTime = startTime.plusDays(1);//取24小时
//            if(endTime.isAfter(LocalDateTime.now())){
//                endTime = LocalDateTime.now();
//            }
        }
        String pullParams = "{startTime:"+startTime+",endTime:"+endTime+"}";
        ApiResultVo<Token> token = DouTokenApiHelper.getToken(appKey, appSecret,checkResult.getData().getSellerId());
        if(token.getCode()==0) {
            accessToken = token.getData().getAccessToken();
        }else{
            return AjaxResult.error(token.getMsg());
        }
        String startTimeStr = startTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String endTimeStr = endTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        Long startTimestamp = startTime.toEpochSecond(ZoneOffset.ofHours(8));
        Long endTimestamp = endTime.toEpochSecond(ZoneOffset.ofHours(8));

        //获取
//        ApiResultVo<DouRefundResponse> resultVo = RefundApiHelper.pullRefundList(appKey,appSecret,douShopId,startTime, endTime);
        ApiResultVo<AfterSale> resultVo = DouRefundApiHelper.pullAfterSaleList(startTimestamp, endTimestamp, 0, 50, appKey, appSecret, accessToken);

        if (resultVo.getCode() != 0) return AjaxResult.error(resultVo.getCode(), resultVo.getMsg());

        if(resultVo.getCode() !=0 ){
            OShopPullLogs logs = new OShopPullLogs();
            logs.setShopId(req.getShopId());
            logs.setShopType(EnumShopType.DOU.getIndex());
            logs.setPullType("REFUND");
            logs.setPullWay("主动拉取退款");
            logs.setPullParams(pullParams);
            logs.setPullResult(resultVo.getMsg());
            logs.setPullTime(currDateTime);
            logs.setDuration(System.currentTimeMillis() - currTimeMillis);
            pullLogsService.save(logs);
            return AjaxResult.error("接口拉取错误："+resultVo.getMsg());
        }


        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数

        //循环插入订单数据到数据库
        for (var item : resultVo.getList()) {
            DouRefund refund = new DouRefund();
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
                log.info("/**************主动更新dou退款：开始更新数据库：" + refund.getAftersaleId() + "存在、更新************开始通知****/");
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.DOU, MqType.REFUND_MESSAGE,refund.getAftersaleId().toString()));
                hasExistOrder++;
            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                log.info("/**************主动更新dou订单：开始更新数据库：" + refund.getAftersaleId() + "不存在、新增************开始通知****/");
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.DOU,MqType.REFUND_MESSAGE,refund.getAftersaleId().toString()));
                insertSuccess++;
            } else {
                log.info("/**************主动更新dou订单：开始更新数据库：" + refund.getAftersaleId() + "报错****************/");
                totalError++;
            }
        }
        if(totalError == 0) {
            if (lasttime == null) {
                // 新增
                OShopPullLasttime insertLasttime = new OShopPullLasttime();
                insertLasttime.setShopId(req.getShopId());
                insertLasttime.setCreateTime(new Date());
                insertLasttime.setLasttime(endTime);
                insertLasttime.setPullType("REFUND");
                pullLasttimeService.save(insertLasttime);

            } else {
                // 修改
                OShopPullLasttime updateLasttime = new OShopPullLasttime();
                updateLasttime.setId(lasttime.getId());
                updateLasttime.setUpdateTime(new Date());
                updateLasttime.setLasttime(endTime);
                pullLasttimeService.updateById(updateLasttime);
            }
        }
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        OShopPullLogs logs = new OShopPullLogs();
        logs.setShopType(EnumShopType.DOU.getIndex());
        logs.setShopId(req.getShopId());
        logs.setPullType("REFUND");
        logs.setPullWay("主动拉取退款");
        logs.setPullParams(pullParams);
        logs.setPullResult("{insert:"+insertSuccess+",update:"+hasExistOrder+",fail:"+totalError+"}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - currTimeMillis);
        pullLogsService.save(logs);

        String msg = "成功{startTime:"+startTime.format(df)+",endTime:"+endTime.format(df)+"}总共找到：" + resultVo.getTotalRecords() + "条，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        log.info("/**************主动更新DOU退款：END：" + msg + "****************/");
        return AjaxResult.success(msg);
    }



}
