package com.qihang.jd.controller;

import cn.qihangerp.open.jd.AfterSaleApiHelper;
import cn.qihangerp.open.jd.common.ApiResultVo;
import cn.qihangerp.open.jd.model.AfterSale;
import cn.qihangerp.open.jd.model.Refund;
import com.alibaba.fastjson2.JSONObject;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.common.mq.MqUtils;
import com.qihang.common.utils.DateUtils;
import com.qihang.jd.domain.OmsJdAfterSale;
import com.qihang.jd.domain.SysShopPullLasttime;
import com.qihang.jd.domain.SysShopPullLogs;
import com.qihang.jd.openApi.ApiCommon;
import com.qihang.jd.openApi.PullRequest;
import com.qihang.jd.service.OmsJdAfterSaleService;
import com.qihang.jd.service.SysShopPullLasttimeService;
import com.qihang.jd.service.SysShopPullLogsService;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@RequestMapping("/after")
@RestController
@AllArgsConstructor
public class AfterSaleApiController {
    private final ApiCommon apiCommon;
    private final SysShopPullLogsService pullLogsService;
    private final MqUtils mqUtils;
    private final SysShopPullLasttimeService pullLasttimeService;
    private final OmsJdAfterSaleService afterSaleService;
    private final KafkaTemplate<String,Object> kafkaTemplate;
    /**
     * 拉取售后数据
     *
     * @param params
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/pull_after_list", method = RequestMethod.POST)
    public AjaxResult pullList(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();
        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String serverUrl = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
        Long sellerId = checkResult.getData().getSellerShopId();

        // 获取最后更新时间
        LocalDateTime startTime = null;
        LocalDateTime endTime = null;
        SysShopPullLasttime lasttime = pullLasttimeService.getLasttimeByShop(params.getShopId(), "REFUND");
        if (lasttime == null) {
            endTime = LocalDateTime.now();
            startTime = endTime.minusDays(1);
        } else {
            startTime = lasttime.getLasttime().minusHours(1);//取上次结束一个小时前
            endTime = startTime.plusDays(1);//取24小时
            if (endTime.isAfter(LocalDateTime.now())) {
                endTime = LocalDateTime.now();
            }
        }

        String startTimeStr = startTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String endTimeStr = endTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        //获取退款
        ApiResultVo<Refund> refundVo = AfterSaleApiHelper.pullRefundList(startTime, endTime, appKey, appSecret, accessToken);

        int insertSuccess = 0;
        int totalError = 0;
        int hasExist = 0;

        //循环插入订单数据到数据库
        /*******处理取消订单*****/
        for (var item : refundVo.getList()) {
            OmsJdAfterSale afterSale = new OmsJdAfterSale();
            afterSale.setApplyId(item.getId());
            afterSale.setServiceId(item.getId());
            afterSale.setRefundId(item.getId());
            afterSale.setOrderId(Long.parseLong(item.getOrderId()));
            afterSale.setApplyTime(item.getApplyTime());
            afterSale.setCustomerExpect(1);//售前退款
            afterSale.setCustomerName("售前退款");
            afterSale.setApplyRefundSum(item.getApplyRefundSum());
            afterSale.setBuyerId(item.getBuyerId());
            afterSale.setBuyerName(item.getBuyerName());
            afterSale.setRefundCheckTime(item.getCheckTime());
            afterSale.setRefundStatus(item.getStatus());
            afterSale.setRefundCheckUsername(item.getCheckUserName());
            afterSale.setRefundCheckRemark(item.getCheckRemark());
            afterSale.setRefundReason(item.getReason());
            afterSale.setRefundSystemId(item.getSystemId());
//            jdAfterSaleList.add(afterSale);
            var result = afterSaleService.saveAfter(params.getShopId(), afterSale);
            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                //已经存在
                hasExist++;
                kafkaTemplate.send(MqType.REFUND_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,afterSale.getServiceId().toString())));
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE, after.getServiceId().toString()));
            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                insertSuccess++;
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE, after.getServiceId().toString()));
                kafkaTemplate.send(MqType.REFUND_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,afterSale.getServiceId().toString())));
            } else {
                totalError++;
            }
        }

        //获取售后
        ApiResultVo<AfterSale> afterSaleVo = AfterSaleApiHelper.pullAfterSaleList(sellerId, startTime, endTime, appKey, appSecret, accessToken);
        /*******处理售后list*****/
        for (var after : afterSaleVo.getList()) {
            OmsJdAfterSale afterSale = new OmsJdAfterSale();
            BeanUtils.copyProperties(after, afterSale);
//            afterSale.setOrderId(after.getOrderId() + "");
            afterSale.setApplyTime(DateUtils.parseDateToStr("yyyy-MM-dd HH:mm:ss", new Date(after.getApplyTime())));
            afterSale.setRefundId(0L);
            afterSale.setShopId(params.getShopId());
            var result = afterSaleService.saveAfter(params.getShopId(), afterSale);
            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                //已经存在
                hasExist++;
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE, after.getServiceId().toString()));
                kafkaTemplate.send(MqType.REFUND_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,afterSale.getServiceId().toString())));
            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                insertSuccess++;
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE, after.getServiceId().toString()));
                kafkaTemplate.send(MqType.REFUND_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,afterSale.getServiceId().toString())));
            } else {
                totalError++;
            }
        }

        if (lasttime == null) {
            // 新增
            SysShopPullLasttime insertLasttime = new SysShopPullLasttime();
            insertLasttime.setShopId(params.getShopId());
            insertLasttime.setCreateTime(new Date());
            insertLasttime.setLasttime(endTime);
            insertLasttime.setPullType("REFUND");
            pullLasttimeService.save(insertLasttime);

        } else {
            // 修改
            SysShopPullLasttime updateLasttime = new SysShopPullLasttime();
            updateLasttime.setId(lasttime.getId());
            updateLasttime.setUpdateTime(new Date());
            updateLasttime.setLasttime(endTime);
            pullLasttimeService.updateById(updateLasttime);
        }
        SysShopPullLogs logs = new SysShopPullLogs();
        logs.setShopId(params.getShopId());
        logs.setShopType(EnumShopType.JD.getIndex());
        logs.setPullType("REFUND");
        logs.setPullWay("主动拉取");
        logs.setPullParams("{ApplyTimeBegin:" + startTimeStr + ",ApplyTimeEnd:" + endTimeStr + ",PageIndex:1,PageSize:100}");
        logs.setPullResult("{total:" + insertSuccess + ",hasExist:" + hasExist + ",totalError:" + totalError + "}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - beginTime);
        pullLogsService.save(logs);
//        mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,item.getId()));
        return AjaxResult.success();
    }

//    @RequestMapping(value = "/pull_update_status", method = RequestMethod.POST)
//    public AjaxResult pullUpdateStatus(@RequestBody PullRequest params) throws Exception {
//        if (params.getShopId() == null || params.getShopId() <= 0) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
//        }
//        Date currDateTime = new Date();
//        long beginTime = System.currentTimeMillis();
//        var checkResult = apiCommon.checkBefore(params.getShopId());
//        if (checkResult.getCode() != HttpStatus.SUCCESS) {
//            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
//        }
//        String accessToken = checkResult.getData().getAccessToken();
//        String serverUrl = checkResult.getData().getServerUrl();
//        String appKey = checkResult.getData().getAppKey();
//        String appSecret = checkResult.getData().getAppSecret();
//        String sellerId = checkResult.getData().getSellerId();
//
//        // 取24小时内的数据
//        LocalDateTime endTime = LocalDateTime.now();
//        LocalDateTime startTime = endTime.minusDays(1);
//
//
//        String startTimeStr = startTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
//        String endTimeStr = endTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
//        JdClient client = new DefaultJdClient(serverUrl, accessToken, appKey, appSecret);
//
//        // 用于更新状态
//        // https://open.jd.com/home/home/#/doc/api?apiCateId=241&apiId=2171&apiName=jingdong.asc.sync.list
//        AscSyncListRequest request1 = new AscSyncListRequest();
//        request1.setBuId(sellerId);
//        request1.setOperatePin("testPin");
//        request1.setOperateNick("testPin");
//        request1.setUpdateTimeBegin(Date.from(startTime.atZone(ZoneId.systemDefault()).toInstant()));
//        request1.setUpdateTimeEnd(Date.from(endTime.atZone(ZoneId.systemDefault()).toInstant()));
//        request1.setPageNumber(1);
//        request1.setPageSize(100);
//        AscSyncListResponse response = client.execute(request1);
//        if (response != null && response.getPageResult() != null) {
//            if (response.getPageResult().getData() != null) {
//                for (var item : response.getPageResult().getData()) {
//                    JdOrderAfter after = new JdOrderAfter();
//                    BeanUtils.copyProperties(item, after);
//                    after.setShopId(params.getShopId());
//                    var result = afterService.updateAfterStatusByServiceId(after);
//                    if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
//                        // 更新成功，发送通知
//                        mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,result.getData().toString()));
//                    }
//                }
//            }
//        }
//
//        SysShopPullLogs logs = new SysShopPullLogs();
//        logs.setShopId(params.getShopId());
//        logs.setShopType(EnumShopType.JD.getIndex());
//        logs.setPullType("REFUND");
//        logs.setPullWay("主动更新状态");
//        logs.setPullParams("{ApplyTimeBegin:" + startTimeStr + ",ApplyTimeEnd:" + endTimeStr + ",PageIndex:1,PageSize:100}");
//        logs.setPullResult("{total:,hasExist: ,totalError: }");
//        logs.setPullTime(currDateTime);
//        logs.setDuration(System.currentTimeMillis() - beginTime);
//        pullLogsService.save(logs);
////        mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,item.getId()));
//        return AjaxResult.success();
//    }
}
