package com.qihang.jd.controller;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.request.refundapply.PopAfsRefundapplyQuerylistRequest;
import com.jd.open.api.sdk.request.shangjiashouhou.AscQueryListRequest;
import com.jd.open.api.sdk.response.refundapply.PopAfsRefundapplyQuerylistResponse;
import com.jd.open.api.sdk.response.shangjiashouhou.AscQueryListResponse;
import com.qihang.common.common.ApiResult;
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

    @RequestMapping(value = "/pull_refund_list", method = RequestMethod.POST)
    public Object pullRefundList(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return ApiResult.build(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();
        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return ApiResult.build(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String serverUrl = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
        JdClient client = new DefaultJdClient(serverUrl, accessToken, appKey, appSecret);
        //https://open.jd.com/home/home/#/doc/api?apiCateId=71&apiId=307&apiName=jingdong.pop.afs.refundapply.querylist
        PopAfsRefundapplyQuerylistRequest request2=new PopAfsRefundapplyQuerylistRequest();
        request2.setPageIndex(1);
        request2.setPageSize(100);
        PopAfsRefundapplyQuerylistResponse response2=client.execute(request2);
//        System.out.println(request2);
        int hasExist = 0;
        int insertSuccess = 0;
        int totalError = 0;
        if(response2 != null && response2.getRefundApplyResponse()!=null ){
            for (var item :response2.getRefundApplyResponse().getResults()){
                JdRefund refund = new JdRefund();
                BeanUtils.copyProperties(item,refund);
                refund.setRefundId(item.getId());
                refund.setId(null);
                refund.setShopId(params.getShopId());
                //插入订单数据
                var result = refundService.saveRefund(params.getShopId(), refund);
                if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                    //已经存在
                    hasExist++;
//                    mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,item.getId()));
                } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                    insertSuccess++;
//                    mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD,MqType.REFUND_MESSAGE,item.getId()));
                } else {
                    totalError++;
                }
            }
        }

        SysShopPullLogs logs = new SysShopPullLogs();
        logs.setShopId(params.getShopId());
        logs.setPullType("REFUND");
        logs.setPullWay("主动拉取");
        logs.setPullParams("{PageIndex:1,PageSize:100}");
        logs.setPullResult("{total:"+insertSuccess+",hasExist:"+hasExist+",totalError:"+totalError+"}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - beginTime);
        pullLogsService.save(logs);
        return response2;
    }

    /**
     * 拉取售后数据
     * @param params
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/pull_list", method = RequestMethod.POST)
    public Object pullList(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return ApiResult.build(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();
        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return ApiResult.build(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String serverUrl = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
        String sellerId = checkResult.getData().getSellerId();

        // 获取最后更新时间
        LocalDateTime startTime = null;
        LocalDateTime  endTime = null;
        SysShopPullLasttime lasttime = pullLasttimeService.getLasttimeByShop(params.getShopId(), "REFUND");
        if(lasttime == null){
            endTime = LocalDateTime.now();
            startTime = endTime.minusDays(1);
        }else{
            startTime = lasttime.getLasttime().minusHours(1);//取上次结束一个小时前
            endTime = startTime.plusDays(1);//取24小时
            if(endTime.isAfter(LocalDateTime.now())){
                endTime = LocalDateTime.now();
            }
        }

        String startTimeStr = startTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String endTimeStr = endTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        JdClient client = new DefaultJdClient(serverUrl, accessToken, appKey, appSecret);
        // https://open.jd.com/home/home/#/doc/api?apiCateId=241&apiId=2136&apiName=jingdong.asc.query.list
        AscQueryListRequest request=new AscQueryListRequest();
        request.setBuId(sellerId);
        request.setOperatePin("testPin");
        request.setOperateNick("testPin");
//        request.setServiceId(123456);
//        request.setOrderId(123456);
        request.setApplyTimeBegin( Date.from(startTime.atZone( ZoneId.systemDefault()).toInstant()));
        request.setApplyTimeEnd(Date.from(endTime.atZone( ZoneId.systemDefault()).toInstant()));
//        request.setFinishTimeBegin(Date.from(startTime.atZone( ZoneId.systemDefault()).toInstant()));
//        request.setFinishTimeEnd(Date.from(endTime.atZone( ZoneId.systemDefault()).toInstant()));
//        request.setVerificationCode("abcd");
//        request.setExpressCode("JDVA1234");
//        request.setOrderType(0);
//        request.setProcessResult(40);
//        request.setCustomerPin("testPin");
//        request.setCustomerName("testPin");
//        request.setCustomerTel("123456");
//        request.setApproveTimeBegin(Date.from(startTime.atZone( ZoneId.systemDefault()).toInstant()));
//        request.setApproveTimeEnd(Date.from(endTime.atZone( ZoneId.systemDefault()).toInstant()));
        request.setPageNumber(1);
        request.setPageSize(100);
//        request.setExtJsonStr("a");
        AscQueryListResponse response=client.execute(request);
        int insertSuccess = 0;
        int totalError = 0;
        int hasExist = 0;
        if(response!=null && response.getPageResult()!=null){
            if(response.getPageResult().getData()!=null){
                for (var item : response.getPageResult().getData()){
                    JdOrderAfter after = new JdOrderAfter();
                    BeanUtils.copyProperties(item,after);
                    after.setShopId(params.getShopId());
                    var result = afterService.saveAfter(params.getShopId(), after);
                    if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                        //已经存在
                        hasExist++;
                        mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,item.getApplyId().toString()));
                    } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                        insertSuccess++;
                        mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD,MqType.REFUND_MESSAGE,item.getApplyId().toString()));
                    } else {
                        totalError++;
                    }
                }
            }
        }
        if(lasttime == null){
            // 新增
            SysShopPullLasttime insertLasttime = new SysShopPullLasttime();
            insertLasttime.setShopId(params.getShopId());
            insertLasttime.setCreateTime(new Date());
            insertLasttime.setLasttime(endTime);
            insertLasttime.setPullType("REFUND");
            pullLasttimeService.save(insertLasttime);

        }else {
            // 修改
            SysShopPullLasttime updateLasttime = new SysShopPullLasttime();
            updateLasttime.setId(lasttime.getId());
            updateLasttime.setUpdateTime(new Date());
            updateLasttime.setLasttime(endTime);
            pullLasttimeService.updateById(updateLasttime);
        }
        SysShopPullLogs logs = new SysShopPullLogs();
        logs.setShopId(params.getShopId());
        logs.setPullType("REFUND");
        logs.setPullWay("主动拉取");
        logs.setPullParams("{ApplyTimeBegin:"+startTimeStr+",ApplyTimeEnd:"+endTimeStr+",PageIndex:1,PageSize:100}");
        logs.setPullResult("{total:"+insertSuccess+",hasExist:"+hasExist+",totalError:"+totalError+"}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - beginTime);
        pullLogsService.save(logs);
//        mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,item.getId()));
        return response;
    }
}
