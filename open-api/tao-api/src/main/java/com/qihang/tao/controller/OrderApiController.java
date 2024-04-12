package com.qihang.tao.controller;

import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.common.mq.MqUtils;
import com.qihang.tao.domain.SysShopPullLasttime;
import com.qihang.tao.domain.SysShopPullLogs;
import com.qihang.tao.openApi.ApiCommon;
//import com.qihang.tao.api.ApiResult;
import com.qihang.tao.common.TaoRequest;
import com.qihang.tao.service.SysShopPullLasttimeService;
import com.qihang.tao.service.SysShopPullLogsService;
import com.taobao.api.ApiException;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;
import tech.qihangec.open.tao.TaoOrderApiService;
import tech.qihangec.open.tao.common.ApiResultVo;
import tech.qihangec.open.tao.domain.TaoOrder;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * 淘系订单更新
 */
@AllArgsConstructor
@RestController
@RequestMapping("/order")
public class OrderApiController {
    private static Logger log = LoggerFactory.getLogger(OrderApiController.class);
    private final ApiCommon apiCommon;
    private final MqUtils mqUtils;
    private final SysShopPullLogsService pullLogsService;
    private final SysShopPullLasttimeService pullLasttimeService;
    private final TaoOrderApiService orderApiService;
    /**
     * 增量更新订单
     * @param req
     * @return
     * @throws ApiException
     */
    @PostMapping("/pull_order_tao")
    @ResponseBody
    public AjaxResult pullIncrementOrder(@RequestBody TaoRequest req) throws ApiException {
        log.info("/**************增量拉取tao订单****************/");
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();

        var checkResult = apiCommon.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }
        String sessionKey = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getApiRequestUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();

        log.info("/**************增量更新tao订单，条件判断完成，开始更新。。。。。。****************/");

        // 获取最后更新时间
        LocalDateTime startTime = null;
        LocalDateTime  endTime = null;
        SysShopPullLasttime lasttime = pullLasttimeService.getLasttimeByShop(req.getShopId(), "ORDER");
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

        //获取接口数据
        ApiResultVo<TaoOrder> resultVo = orderApiService.pullOrderList(startTime, endTime,  req.getShopId(), url, appKey, appSecret, sessionKey);

        if (resultVo.getCode() !=  ResultVoEnum.SUCCESS.getIndex()) {
            log.info("/**************主动更新tao订单：第一次获取结果失败：" + resultVo.getMsg() + "****************/");
            if(resultVo.getCode() == HttpStatus.UNAUTHORIZED){
                return AjaxResult.error(HttpStatus.UNAUTHORIZED, "Token已过期，请重新授权",checkResult.getData());
            }
            return AjaxResult.error(HttpStatus.SYSTEM_EXCEPTION, resultVo.getMsg());
        }

        log.info("/**************主动更新tao订单：第一次获取结果：总记录数" + resultVo.getTotalRecords() + "****************/");
        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数

        //循环插入订单数据到数据库
        for (var order : resultVo.getList()) {
            // 发送消息通知
            mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.ORDER_MESSAGE,order.getTid()));
            //插入o_order订单数据
//            var result = orderService.saveOrder(req.getShopId(), order);
//            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
//                //已经存在
//                log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "存在、更新****************/");
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.ORDER_MESSAGE,order.getTid().toString()));
//                hasExistOrder++;
//            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
//                log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "不存在、新增****************/");
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO,MqType.ORDER_MESSAGE,order.getTid().toString()));
//                insertSuccess++;
//            } else {
//                log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "报错****************/");
//                totalError++;
//            }
        }

        if(lasttime == null){
            // 新增
            SysShopPullLasttime insertLasttime = new SysShopPullLasttime();
            insertLasttime.setShopId(req.getShopId());
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

        SysShopPullLogs logs = new SysShopPullLogs();
        logs.setShopType(EnumShopType.TAO.getIndex());
        logs.setShopId(req.getShopId());
        logs.setPullType("ORDER");
        logs.setPullWay("主动拉取");
        logs.setPullParams("{startTime:"+startTime+",endTime:"+endTime+"}");
        logs.setPullResult("{insert:"+insertSuccess+",update:"+hasExistOrder+",fail:"+totalError+"}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - beginTime);
        pullLogsService.save(logs);

        String msg = "成功，总共找到：" + resultVo.getTotalRecords() + "条订单，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        log.info("/**************主动更新tao订单：END：" + msg + "****************/");
        return AjaxResult.success();
    }

    /**
     * 更新单个订单
     *
     * @param taoRequest
     * @return
     * @throws ApiException
     */
    @RequestMapping("/pull_order_detail")
    @ResponseBody
    public AjaxResult getOrderPullDetail(@RequestBody TaoRequest taoRequest) throws ApiException {
        log.info("/**************主动更新tao订单by number****************/");
        if (taoRequest.getShopId() == null || taoRequest.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        if (taoRequest.getOrderId() == null || taoRequest.getOrderId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，缺少orderId");
        }

        var checkResult = apiCommon.checkBefore(taoRequest.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String sessionKey = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getApiRequestUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();


        ApiResultVo<TaoOrder> resultVo = orderApiService.pullOrderDetail(taoRequest.getShopId(), taoRequest.getOrderId(), url, appKey, appSecret, sessionKey);
        if (resultVo.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
            mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO,MqType.ORDER_MESSAGE,resultVo.getData().getTid()));
//            var result = orderService.saveOrder(taoRequest.getShopId(), resultVo.getData());
//            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
//                //已经存在
//                log.info("/**************主动更新tao订单：开始更新数据库：" + resultVo.getData().getId() + "存在、更新****************/");
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.ORDER_MESSAGE,resultVo.getData().getTid()));
//            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
//                log.info("/**************主动更新tao订单：开始更新数据库：" + resultVo.getData().getId() + "不存在、新增****************/");
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO,MqType.ORDER_MESSAGE,resultVo.getData().getTid()));
//            }

            return AjaxResult.success();
        } else {
            return AjaxResult.error(resultVo.getCode(), resultVo.getMsg());
        }
    }


}
