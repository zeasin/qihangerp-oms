package cn.qihangerp.open.pdd.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.enums.HttpStatus;
import cn.qihangerp.common.mq.MqMessage;
import cn.qihangerp.common.mq.MqType;
import cn.qihangerp.common.mq.MqUtils;
import cn.qihangerp.domain.OShopPullLasttime;
import cn.qihangerp.domain.OShopPullLogs;
import cn.qihangerp.module.open.pdd.domain.PddOrder;
import cn.qihangerp.module.open.pdd.domain.PddOrderItem;
import cn.qihangerp.module.open.pdd.service.PddOrderService;
import cn.qihangerp.module.service.OShopPullLasttimeService;
import cn.qihangerp.module.service.OShopPullLogsService;
import cn.qihangerp.open.PullRequest;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.pdd.ApiCommon;
import cn.qihangerp.open.pdd.PddOrderApiHelper;
import cn.qihangerp.open.pdd.model.OrderListResultVo;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 淘系订单更新
 */
@AllArgsConstructor
@RestController
@RequestMapping("/pdd/order")
public class PddOrderApiController {
    private static Logger log = LoggerFactory.getLogger(PddOrderApiController.class);

    private final PddOrderService orderService;
    private final ApiCommon apiCommon;
    private final MqUtils mqUtils;
    private final OShopPullLogsService pullLogsService;
    private final OShopPullLasttimeService pullLasttimeService;
    /**
     * 增量更新订单
     * @param req
     * @
     * @throws
     */
    @PostMapping("/pull_order")
    @ResponseBody
    public AjaxResult pullIncrementOrder(@RequestBody PullRequest req) throws Exception {
        log.info("/**************增量拉取pdd订单****************/");
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();

        var checkResult = apiCommon.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();


        // 取当前时间30分钟前
//        LocalDateTime endTime = LocalDateTime.now();
//        LocalDateTime startTime = endTime.minus(60*24, ChronoUnit.MINUTES);
        // 获取最后更新时间
        LocalDateTime startTime = null;
        LocalDateTime  endTime = null;
        OShopPullLasttime lasttime = pullLasttimeService.getLasttimeByShop(req.getShopId(), "ORDER");
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
        String startTimeStr = startTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String endTimeStr = endTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        Long startTimestamp = startTime.toEpochSecond(ZoneOffset.ofHours(8));
        Long endTimestamp = endTime.toEpochSecond(ZoneOffset.ofHours(8));

        log.info("开始循环更新拼多多订单。开始时间：" + startTimeStr + "结束时间：" + endTimeStr);

        //获取
        ApiResultVo<OrderListResultVo> upResult = PddOrderApiHelper.pullOrderList(appKey, appSecret, accessToken, startTimestamp.intValue(), endTimestamp.intValue(), 1, 20);
        if (upResult.getCode() != 0) return AjaxResult.error(upResult.getCode(), upResult.getMsg());

//        ApiResultVo<PddOrderResponse> upResult = OrderApiHelper.pullOrderList(appKey, appSecret, accessToken,startTime, endTime);


        if(upResult.getCode() !=0 ){
            OShopPullLogs logs = new OShopPullLogs();
            logs.setShopId(req.getShopId());
            logs.setShopType(EnumShopType.DOU.getIndex());
            logs.setPullType("ORDER");
            logs.setPullWay("主动拉取订单");
            logs.setPullParams(pullParams);
            logs.setPullResult(upResult.getMsg());
            logs.setPullTime(currDateTime);
            logs.setDuration(System.currentTimeMillis() - beginTime);
            pullLogsService.save(logs);
            return AjaxResult.error("接口拉取错误："+upResult.getMsg());
        }



        log.info("/**************主动更新pdd订单：获取结果：总记录数" + upResult.getTotalRecords() + "****************/");
        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数

        //循环插入订单数据到数据库
        for (var trade : upResult.getData().getOrderList()) {
            PddOrder pddOrder = new PddOrder();
            BeanUtils.copyProperties(trade,pddOrder);
            List<PddOrderItem> items = new ArrayList<>();
            for (var it:trade.getItemList()) {
                PddOrderItem item = new PddOrderItem();
                BeanUtils.copyProperties(it,item);
                items.add(item);
            }
            pddOrder.setItems(items);
            //插入订单数据
            var result = orderService.saveOrder(req.getShopId(), pddOrder);
            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                //已经存在
                log.info("/**************主动更新pdd订单：开始更新数据库：" + pddOrder.getOrderSn() + "存在、更新************开始通知****/");
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.PDD, MqType.ORDER_MESSAGE,pddOrder.getOrderSn()));
                hasExistOrder++;
            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                log.info("/**************主动更新pdd订单：开始更新数据库：" + pddOrder.getOrderSn() + "不存在、新增************开始通知****/");
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.PDD,MqType.ORDER_MESSAGE,pddOrder.getOrderSn()));
                insertSuccess++;
            } else {
                log.info("/**************主动更新pdd订单：开始更新数据库：" + pddOrder.getOrderSn() + "报错****************/");
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
                insertLasttime.setPullType("ORDER");
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
        logs.setShopType(EnumShopType.PDD.getIndex());
        logs.setShopId(req.getShopId());
        logs.setPullType("ORDER");
        logs.setPullWay("主动拉取订单");
        logs.setPullParams(pullParams);
        logs.setPullResult("{insert:"+insertSuccess+",update:"+hasExistOrder+",fail:"+totalError+"}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - beginTime);
        pullLogsService.save(logs);

        String msg = "成功{startTime:"+startTime.format(df)+",endTime:"+endTime.format(df)+"}总共找到：" + upResult.getTotalRecords() + "条订单，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        log.info("/**************主动更新pdd订单：END：" + msg + "****************/");
        return AjaxResult.success(msg);
    }


    /**
     * 更新单个订单
     *
     * @param
     * @return
     * @throws
     */
//    @RequestMapping("/pull_order_detail")
//    @ResponseBody
//    public AjaxResult getOrderPullDetail(@RequestBody PullRequest req) throws Exception {
//        log.info("/**************主动更新pdd订单by number****************/");
//        if (req.getShopId() == null || req.getShopId() <= 0) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
//        }
//        if (req.getOrderId() !=null) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，缺少orderId");
//        }
//
//        var checkResult = apiCommon.checkBefore(req.getShopId());
//        if (checkResult.getCode() != HttpStatus.SUCCESS) {
//            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
//        }
//        String accessToken = checkResult.getData().getAccessToken();
//        String url = checkResult.getData().getServerUrl();
//        String appKey = checkResult.getData().getAppKey();
//        String appSecret = checkResult.getData().getAppSecret();
//
//
//        ApiResultVo<PddOrderResponse> resultVo = OrderApiHelper.pullOrderDetail(appKey, appSecret, accessToken,req.getOrderId());
//        if (resultVo.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
//            PddOrder pddOrder = new PddOrder();
//            BeanUtils.copyProperties(resultVo.getData(),pddOrder);
//            List<PddOrderItem> orderItemList = new ArrayList<>();
//            if(resultVo.getData().getItems()!=null&&resultVo.getData().getItems().size()>0){
//                for(var item:resultVo.getData().getItems()){
//                    PddOrderItem pddOrderItem = new PddOrderItem();
//                    BeanUtils.copyProperties(item,pddOrderItem);
//                    orderItemList.add(pddOrderItem);
//                }
//            }
//            pddOrder.setItems(orderItemList);
//            var result = orderService.saveOrder(req.getShopId(), pddOrder);
//            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
//                //已经存在
//                log.info("/**************主动更新PDD订单：开始更新数据库：" + resultVo.getData().getOrderSn() + "存在、更新****************/");
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.PDD, MqType.ORDER_MESSAGE,resultVo.getData().getOrderSn()));
//            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
//                log.info("/**************主动更新PDD订单：开始更新数据库：" + resultVo.getData().getOrderSn() + "不存在、新增****************/");
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.PDD,MqType.ORDER_MESSAGE,resultVo.getData().getOrderSn()));
//            }
//
//            return AjaxResult.success();
//        } else {
//            return AjaxResult.error(resultVo.getCode(), resultVo.getMsg());
//        }
//    }
}
