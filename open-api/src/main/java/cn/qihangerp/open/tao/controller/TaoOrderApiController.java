package cn.qihangerp.open.tao.controller;

import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.domain.SysShopPullLasttime;
import cn.qihangerp.open.domain.SysShopPullLogs;
import cn.qihangerp.open.service.SysShopPullLasttimeService;
import cn.qihangerp.open.service.SysShopPullLogsService;
import cn.qihangerp.open.tao.OrderAssembleHelper;
import cn.qihangerp.open.tao.TaoApiCommon;
import cn.qihangerp.open.tao.TaoOrderApiHelper;
import cn.qihangerp.open.tao.TaoRequest;
import cn.qihangerp.open.tao.domain.OmsTaoOrder;
import cn.qihangerp.open.tao.response.TaoOrderDetailResponse;
import cn.qihangerp.open.tao.response.TaoOrderListResponse;
import cn.qihangerp.open.tao.service.OmsTaoOrderService;
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
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * 淘系订单更新
 */
@AllArgsConstructor
@RestController
@RequestMapping("/tao/order")
public class TaoOrderApiController {
    private static Logger log = LoggerFactory.getLogger(TaoOrderApiController.class);
    private final TaoApiCommon taoApiCommon;
    private final SysShopPullLogsService pullLogsService;
    private final SysShopPullLasttimeService pullLasttimeService;
    private final OmsTaoOrderService orderService;
    private final KafkaTemplate<String,Object> kafkaTemplate;
    /**
     * 增量更新订单
     * @param req
     * @return
     * @throws
     */
    @PostMapping("/pull_order_tao")
    @ResponseBody
    public AjaxResult pullIncrementOrder(@RequestBody TaoRequest req){
        log.info("/**************增量拉取tao订单****************/");
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();

        var checkResult = taoApiCommon.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }
        String sessionKey = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getServerUrl();
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
//        ApiResultVo<TaoOrder> resultVo = orderApiService.pullOrderList(startTime, endTime,  req.getShopId(), url, appKey, appSecret, sessionKey);
//
//        if (resultVo.getCode() !=  ResultVoEnum.SUCCESS.getIndex()) {
//            log.info("/**************主动更新tao订单：第一次获取结果失败：" + resultVo.getMsg() + "****************/");
//            if(resultVo.getCode() == HttpStatus.UNAUTHORIZED){
//                return AjaxResult.error(HttpStatus.UNAUTHORIZED, "Token已过期，请重新授权",checkResult.getData());
//            }
//            return AjaxResult.error(HttpStatus.SYSTEM_EXCEPTION, resultVo.getMsg());
//        }


        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数
        ApiResultVo<TaoOrderListResponse> tradeBeanApiResultVo = TaoOrderApiHelper.pullTradeList(startTime,endTime,appKey, appSecret, sessionKey);
//        ApiResultVo<TradeList> tradeBeanApiResultVo = OrderApiHelper.pullTradeList(startTime,endTime,appKey, appSecret, sessionKey);
        if (tradeBeanApiResultVo.getCode()== ResultVoEnum.SUCCESS.getIndex()){
            //循环插入订单数据到数据库
            for (var trade : tradeBeanApiResultVo.getList()) {
                OmsTaoOrder order = OrderAssembleHelper.assembleOrder(trade);
                // 发送消息通知
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.ORDER_MESSAGE,order.getTid()));
                //插入o_order订单数据
                var result = orderService.saveOrder(req.getShopId(), order);
                if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                    //已经存在
                    log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "存在、更新****************/");
                    kafkaTemplate.send(MqType.ORDER_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.TAO, MqType.ORDER_MESSAGE,order.getTid())));
//                    mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.ORDER_MESSAGE,order.getTid().toString()));
                    hasExistOrder++;
                } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                    log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "不存在、新增****************/");
                    kafkaTemplate.send(MqType.ORDER_MQ,JSONObject.toJSONString(MqMessage.build(EnumShopType.TAO, MqType.ORDER_MESSAGE,order.getTid())));
//                    mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO,MqType.ORDER_MESSAGE,order.getTid().toString()));
                    insertSuccess++;
                } else {
                    log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "报错****************/");
                    totalError++;
                }
            }
        }else{
            return AjaxResult.error(tradeBeanApiResultVo.getCode(),tradeBeanApiResultVo.getMsg());
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

        String msg = "成功，总共找到：" + tradeBeanApiResultVo.getTotalRecords() + "条订单，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        log.info("/**************主动更新tao订单：END：" + msg + "****************/");
        return AjaxResult.success(msg);
    }

    /**
     * 更新单个订单
     *
     * @param taoRequest
     * @return
     * @throws
     */
    @RequestMapping("/pull_order_detail")
    @ResponseBody
    public AjaxResult getOrderPullDetail(@RequestBody TaoRequest taoRequest){
        log.info("/**************主动更新tao订单by number****************/");
        if (taoRequest.getShopId() == null || taoRequest.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        if (taoRequest.getOrderId() == null || taoRequest.getOrderId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，缺少orderId");
        }

        var checkResult = taoApiCommon.checkBefore(taoRequest.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String sessionKey = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();

        ApiResultVo<TaoOrderDetailResponse> apiResultVo = TaoOrderApiHelper.pullOrderDetail(taoRequest.getOrderId(), appKey, appSecret, sessionKey);



//        ApiResultVo<TaoOrder> resultVo = orderApiService.pullOrderDetail(taoRequest.getShopId(), taoRequest.getOrderId(), url, appKey, appSecret, sessionKey);
        if (apiResultVo.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
//            mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO,MqType.ORDER_MESSAGE,resultVo.getData().getTid()));
            OmsTaoOrder order = new OmsTaoOrder();
//            OmsTaoOrder order = OrderAssembleHelper.assembleOrder(trade);
            // TODO:这里将获取到的TAO订单详情转换成数据库实体，未经过测试
            BeanUtils.copyProperties(apiResultVo.getData(),order);
            var result = orderService.updateOrderStatus(order);
            if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "不存在、新增****************/");
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO,MqType.ORDER_MESSAGE,order.getTid()));
                kafkaTemplate.send(MqType.ORDER_MQ,JSONObject.toJSONString(MqMessage.build(EnumShopType.TAO, MqType.ORDER_MESSAGE,order.getTid())));
            }

            return AjaxResult.success();
        } else {
            return AjaxResult.error(apiResultVo.getCode(), apiResultVo.getMsg());
        }
    }


}
