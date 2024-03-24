package com.qihang.jd.controller;

import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.common.mq.MqType;
import com.qihang.jd.domain.JdOrder;
import com.qihang.jd.domain.SysShopPullLasttime;
import com.qihang.jd.domain.SysShopPullLogs;
import com.qihang.jd.openApi.ApiCommon;
import com.qihang.jd.openApi.OrderApiHelper;
import com.qihang.jd.openApi.PullRequest;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqUtils;
import com.qihang.jd.service.JdOrderService;
import com.qihang.jd.service.SysShopPullLasttimeService;
import com.qihang.jd.service.SysShopPullLogsService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/order")
@RestController
@AllArgsConstructor
public class OrderApiController {
    private final ApiCommon apiCommon;
//    private final RedisCache redisCache;
    private final MqUtils mqUtils;
    private final JdOrderService orderService;
    private final SysShopPullLasttimeService pullLasttimeService;
    private final SysShopPullLogsService pullLogsService;

    @RequestMapping(value = "/pull_order_jd", method = RequestMethod.POST)
    public AjaxResult pullList(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }

        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();

        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String serverUrl = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();

        // 获取最后更新时间
        LocalDateTime startTime = null;
        LocalDateTime  endTime = null;
        SysShopPullLasttime lasttime = pullLasttimeService.getLasttimeByShop(params.getShopId(), "ORDER");
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

        //第一次获取
        ResultVo<JdOrder> upResult = OrderApiHelper.pullOrder(startTime,endTime,1L,100L,serverUrl,appKey,appSecret,accessToken);
        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数
        //循环插入订单数据到数据库
        for (var order : upResult.getList()) {
            //插入订单数据
            var result = orderService.saveOrder(params.getShopId(), order);
            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                //已经存在
                hasExistOrder++;
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD,MqType.ORDER_MESSAGE,order.getOrderId()));
            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                insertSuccess++;
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD,MqType.ORDER_MESSAGE,order.getOrderId()));
            } else {
                totalError++;
            }
        }
        if(lasttime == null){
            // 新增
            SysShopPullLasttime insertLasttime = new SysShopPullLasttime();
            insertLasttime.setShopId(params.getShopId());
            insertLasttime.setCreateTime(new Date());
            insertLasttime.setLasttime(endTime);
            insertLasttime.setPullType("ORDER");
            pullLasttimeService.save(insertLasttime);

        }else {
            // 修改
            SysShopPullLasttime updateLasttime = new SysShopPullLasttime();
            updateLasttime.setId(lasttime.getId());
            updateLasttime.setUpdateTime(new Date());
            updateLasttime.setLasttime(endTime);
            pullLasttimeService.updateById(updateLasttime);
        }
        String resultStr ="{insertSuccess:"+insertSuccess+",hasExistOrder:"+hasExistOrder+",totalError:"+totalError+"}";
        SysShopPullLogs logs = new SysShopPullLogs();
        logs.setShopType(EnumShopType.JD.getIndex());
        logs.setShopId(params.getShopId());
        logs.setPullType("ORDER");
        logs.setPullWay("主动拉取");
        logs.setPullParams("{startTime:"+startTime+",endTime:"+endTime+"}");
        logs.setPullResult(resultStr);
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - beginTime);
        pullLogsService.save(logs);
        return AjaxResult.success(resultStr);
    }
}


