package com.qihang.jd.controller;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.request.refundapply.PopAfsRefundapplyQuerylistRequest;
import com.jd.open.api.sdk.request.shangjiashouhou.AscQueryListRequest;
import com.jd.open.api.sdk.request.shangjiashouhou.AscQueryViewRequest;
import com.jd.open.api.sdk.request.shangjiashouhou.AscServiceAndRefundViewRequest;
import com.jd.open.api.sdk.request.shangjiashouhou.AscSyncListRequest;
import com.jd.open.api.sdk.response.refundapply.PopAfsRefundapplyQuerylistResponse;
import com.jd.open.api.sdk.response.shangjiashouhou.AscQueryListResponse;
import com.jd.open.api.sdk.response.shangjiashouhou.AscQueryViewResponse;
import com.jd.open.api.sdk.response.shangjiashouhou.AscServiceAndRefundViewResponse;
import com.jd.open.api.sdk.response.shangjiashouhou.AscSyncListResponse;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.common.mq.MqUtils;
import com.qihang.jd.domain.JdOrderAfter;
import com.qihang.jd.domain.JdRefund;
import com.qihang.jd.domain.SysShopPullLasttime;
import com.qihang.jd.domain.SysShopPullLogs;
import com.qihang.jd.openApi.ApiCommon;
import com.qihang.jd.openApi.PullRequest;
import com.qihang.jd.service.JdOrderAfterService;
import com.qihang.jd.service.JdRefundService;
import com.qihang.jd.service.SysShopPullLasttimeService;
import com.qihang.jd.service.SysShopPullLogsService;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@RequestMapping("/refund")
@RestController
@AllArgsConstructor
public class RefundApiController {
    private final ApiCommon apiCommon;
    private final SysShopPullLogsService pullLogsService;
    private final JdRefundService refundService;
    private final MqUtils mqUtils;
    private final SysShopPullLasttimeService pullLasttimeService;
    private final JdOrderAfterService afterService;

    /**
     * 拉取售后数据
     *
     * @param params
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/pull_list", method = RequestMethod.POST)
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
        String sellerId = checkResult.getData().getSellerId();

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
        JdClient client = new DefaultJdClient(serverUrl, accessToken, appKey, appSecret);

        // 用于更新状态
        // https://open.jd.com/home/home/#/doc/api?apiCateId=241&apiId=2171&apiName=jingdong.asc.sync.list


        // https://open.jd.com/home/home/#/doc/api?apiCateId=241&apiId=2136&apiName=jingdong.asc.query.list
        AscQueryListRequest request = new AscQueryListRequest();
        request.setBuId(sellerId);
        request.setOperatePin("testPin");
        request.setOperateNick("testPin");
        request.setApplyTimeBegin(Date.from(startTime.atZone(ZoneId.systemDefault()).toInstant()));
        request.setApplyTimeEnd(Date.from(endTime.atZone(ZoneId.systemDefault()).toInstant()));
        request.setPageNumber(1);
        request.setPageSize(100);
        AscQueryListResponse response = client.execute(request);
        int insertSuccess = 0;
        int totalError = 0;
        int hasExist = 0;
        if (response != null && response.getPageResult() != null) {
            if (response.getPageResult().getData() != null) {
                for (var item : response.getPageResult().getData()) {
                    JdOrderAfter after = new JdOrderAfter();
                    BeanUtils.copyProperties(item, after);
//                    // 详情 https://open.jd.com/home/home/#/doc/api?apiCateId=241&apiId=2118&apiName=jingdong.asc.query.view
//                    AscQueryViewRequest request2=new AscQueryViewRequest();
//                    request2.setBuId("10706");
//                    request2.setOperatePin("testPin");
//                    request2.setOperateNick("testPin");
//                    request2.setServiceId(item.getServiceId());
//                    request2.setOrderId(item.getOrderId());
//                    AscQueryViewResponse response2=client.execute(request2);
                    after.setShopId(params.getShopId());
                    var result = afterService.saveAfter(params.getShopId(), after);
                    if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                        //已经存在
                        hasExist++;
                        mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE, item.getServiceId().toString()));
                    } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                        insertSuccess++;
                        mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE, item.getServiceId().toString()));
                    } else {
                        totalError++;
                    }
                }
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

    @RequestMapping(value = "/pull_update_status", method = RequestMethod.POST)
    public AjaxResult pullUpdateStatus(@RequestBody PullRequest params) throws Exception {
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
        String sellerId = checkResult.getData().getSellerId();

        // 取24小时内的数据
        LocalDateTime endTime = LocalDateTime.now();
        LocalDateTime startTime = endTime.minusDays(1);


        String startTimeStr = startTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String endTimeStr = endTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        JdClient client = new DefaultJdClient(serverUrl, accessToken, appKey, appSecret);

        // 用于更新状态
        // https://open.jd.com/home/home/#/doc/api?apiCateId=241&apiId=2171&apiName=jingdong.asc.sync.list
        AscSyncListRequest request1 = new AscSyncListRequest();
        request1.setBuId(sellerId);
        request1.setOperatePin("testPin");
        request1.setOperateNick("testPin");
        request1.setUpdateTimeBegin(Date.from(startTime.atZone(ZoneId.systemDefault()).toInstant()));
        request1.setUpdateTimeEnd(Date.from(endTime.atZone(ZoneId.systemDefault()).toInstant()));
        request1.setPageNumber(1);
        request1.setPageSize(100);
        AscSyncListResponse response = client.execute(request1);
        if (response != null && response.getPageResult() != null) {
            if (response.getPageResult().getData() != null) {
                for (var item : response.getPageResult().getData()) {
                    JdOrderAfter after = new JdOrderAfter();
                    BeanUtils.copyProperties(item, after);
                    after.setShopId(params.getShopId());
                    var result = afterService.updateAfterStatusByServiceId(after);
                    if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                        // 更新成功，发送通知
                        mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,result.getData().toString()));
                    }
                }
            }
        }

        SysShopPullLogs logs = new SysShopPullLogs();
        logs.setShopId(params.getShopId());
        logs.setShopType(EnumShopType.JD.getIndex());
        logs.setPullType("REFUND");
        logs.setPullWay("主动更新状态");
        logs.setPullParams("{ApplyTimeBegin:" + startTimeStr + ",ApplyTimeEnd:" + endTimeStr + ",PageIndex:1,PageSize:100}");
        logs.setPullResult("{total:,hasExist: ,totalError: }");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - beginTime);
        pullLogsService.save(logs);
//        mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,item.getId()));
        return AjaxResult.success();
    }
}
