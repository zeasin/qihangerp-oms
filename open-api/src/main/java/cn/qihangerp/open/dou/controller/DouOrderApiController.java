package cn.qihangerp.open.dou.controller;

import cn.qihangerp.open.domain.SysShopPullLasttime;
import cn.qihangerp.open.domain.SysShopPullLogs;
import cn.qihangerp.open.dou.DouOrderApiHelper;
import cn.qihangerp.open.dou.DouRequest;
import cn.qihangerp.open.dou.DouTokenApiHelper;
import cn.qihangerp.open.dou.common.ApiResultVo;
import cn.qihangerp.open.dou.domain.OmsDouOrder;
import cn.qihangerp.open.dou.domain.OmsDouOrderItem;
import cn.qihangerp.open.dou.model.Token;
import cn.qihangerp.open.dou.model.order.Order;
import cn.qihangerp.open.dou.service.OmsDouOrderService;
import cn.qihangerp.open.service.SysShopPullLasttimeService;
import cn.qihangerp.open.service.SysShopPullLogsService;
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

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 订单更新
 */
@AllArgsConstructor
@RestController
@RequestMapping("/dou/order")
public class DouOrderApiController {
    private static Logger log = LoggerFactory.getLogger(DouOrderApiController.class);

    private final OmsDouOrderService orderService;
    private final DouApiHelper douApiHelper;
//    private final MqUtils mqUtils;
    private final SysShopPullLogsService pullLogsService;
    private final SysShopPullLasttimeService pullLasttimeService;
    private final KafkaTemplate<String,Object> kafkaTemplate;
    /**
     * 增量更新订单
     * @param req
     * @
     * @throws
     */
    @PostMapping("/pull_order")
    @ResponseBody
    public AjaxResult pullOrder(@RequestBody DouRequest req) throws Exception {
        log.info("/**************增量拉取dou订单****************/");
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        Long currTimeMillis = System.currentTimeMillis();

        var checkResult = douApiHelper.checkBefore(req.getShopId());
        if (checkResult.getCode() != ResultVoEnum.SUCCESS.getIndex()) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }

        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
        Long douShopId = checkResult.getData().getSellerShopId();
        String accessToken = checkResult.getData().getAccessToken();

        // 获取最后更新时间
        LocalDateTime startTime = null;
        LocalDateTime  endTime = null;
        SysShopPullLasttime lasttime = pullLasttimeService.getLasttimeByShop(req.getShopId(), "ORDER");
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
        String startTimeStr = startTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String endTimeStr = endTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        Long startTimestamp = startTime.toEpochSecond(ZoneOffset.ofHours(8));
        Long endTimestamp = endTime.toEpochSecond(ZoneOffset.ofHours(8));

        String pullParams = "{startTime:"+startTimeStr+",endTime:"+endTimeStr+"}";
        ApiResultVo<Token> token = DouTokenApiHelper.getToken(appKey, appSecret,checkResult.getData().getSellerShopId());

        if(token.getCode()==0) {
            accessToken = token.getData().getAccessToken();
        }else{
            return AjaxResult.error(token.getMsg());
        }

        //获取
        ApiResultVo<Order> resultVo = DouOrderApiHelper.pullOrderList(startTimestamp, endTimestamp, 0, 20, appKey, appSecret, accessToken);

        if(resultVo.getCode() !=0 ){
            SysShopPullLogs logs = new SysShopPullLogs();
            logs.setShopId(req.getShopId());
            logs.setShopType(EnumShopType.DOU.getIndex());
            logs.setPullType("ORDER");
            logs.setPullWay("主动拉取订单");
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
        for (var gitem : resultVo.getList()) {
            OmsDouOrder douOrder = new OmsDouOrder();
            BeanUtils.copyProperties(gitem, douOrder);
            douOrder.setOrderPhaseList(JSONObject.toJSONString(gitem.getOrderPhaseList()));
            douOrder.setEncryptPostAddress(gitem.getPostAddr().getEncryptDetail());
            douOrder.setProvinceName(gitem.getPostAddr().getProvince().getName());
            douOrder.setProvinceId(gitem.getPostAddr().getProvince().getId());
            douOrder.setCityName(gitem.getPostAddr().getCity().getName());
            douOrder.setCityId(gitem.getPostAddr().getCity().getId());
            douOrder.setTownName(gitem.getPostAddr().getTown().getName());
            douOrder.setTownId(gitem.getPostAddr().getTown().getId());
            douOrder.setStreetName(gitem.getPostAddr().getStreet().getName());
            douOrder.setStreetId(gitem.getPostAddr().getStreet().getId());
            douOrder.setMaskPostAddress(gitem.getMaskPostAddr().getDetail());
            douOrder.setLogisticsInfo(JSONObject.toJSONString(gitem.getLogisticsInfo()));
            List<OmsDouOrderItem> items = new ArrayList<>();
            if (gitem.getSkuOrderList() != null) {
                for (var i : gitem.getSkuOrderList()) {
                    OmsDouOrderItem item = new OmsDouOrderItem();
                    BeanUtils.copyProperties(i, item);
                    item.setAfterSaleStatus(i.getAfterSaleInfo().getAfterSaleStatus());
                    item.setAfterSaleType(i.getAfterSaleInfo().getAfterSaleType());
                    item.setRefundStatus(i.getAfterSaleInfo().getRefundStatus());
                    item.setSpec(JSONObject.toJSONString(i.getSpec()));
                    items.add(item);
                }
                douOrder.setItems(items);
            }

            //插入订单数据
            var result = orderService.saveOrder(req.getShopId(), douOrder);
            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                //已经存在
                log.info("/**************主动更新dou订单：开始更新数据库：" + douOrder.getOrderId() + "存在、更新************开始通知****/");
                kafkaTemplate.send(MqType.ORDER_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.DOU, MqType.ORDER_MESSAGE,douOrder.getOrderId())));
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.DOU, MqType.ORDER_MESSAGE,douOrder.getOrderId()));
                hasExistOrder++;
            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                log.info("/**************主动更新dou订单：开始更新数据库：" + douOrder.getOrderId() + "不存在、新增************开始通知****/");
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.DOU,MqType.ORDER_MESSAGE,douOrder.getOrderId()));
                kafkaTemplate.send(MqType.ORDER_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.DOU, MqType.ORDER_MESSAGE,douOrder.getOrderId())));
                insertSuccess++;
            } else {
                log.info("/**************主动更新dou订单：开始更新数据库：" + douOrder.getOrderId() + "报错****************/");
                totalError++;
            }
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
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        SysShopPullLogs logs = new SysShopPullLogs();
        logs.setShopType(EnumShopType.DOU.getIndex());
        logs.setShopId(req.getShopId());
        logs.setPullType("ORDER");
        logs.setPullWay("主动拉取订单");
        logs.setPullParams(pullParams);
        logs.setPullResult("{insert:"+insertSuccess+",update:"+hasExistOrder+",fail:"+totalError+"}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - currTimeMillis);
        pullLogsService.save(logs);

        String msg = "成功{startTime:"+startTimeStr+",endTime:"+endTimeStr+"}总共找到：" + resultVo.getTotalRecords() + "条订单，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        log.info("/**************主动更新DOU订单：END：" + msg + "****************/");
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
//    public AjaxResult getOrderPullDetail(@RequestBody PullRequest req)  {
//        log.info("/**************主动更新dou订单by number****************/");
//        if (req.getShopId() == null || req.getShopId() <= 0) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
//        }
//        if (!StringUtils.hasText(req.getOrderId())) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，缺少orderId");
//        }
//
//        var checkResult = apiCommon.checkBefore(req.getShopId());
//        if (checkResult.getCode() != HttpStatus.SUCCESS) {
//            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
//        }
//
//        String appKey = checkResult.getData().getAppKey();
//        String appSecret = checkResult.getData().getAppSecret();
//        Long douShopId = checkResult.getData().getSellerId();
//
//        ResultVo<DouOrder> resultVo = OrderApiHelper.pullOrderDetail( appKey, appSecret, douShopId,req.getOrderId());
//        if (resultVo.getCode() == ResultVoEnum.SUCCESS.getIndex() && resultVo.getData()!=null) {
//            var result = orderService.saveOrder(req.getShopId(), resultVo.getData());
//            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
//                //已经存在
//                log.info("/**************主动更新dou订单：开始更新数据库：" + resultVo.getData().getId() + "存在、更新****************/");
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.DOU, MqType.ORDER_MESSAGE,resultVo.getData().getOrderId()));
//            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
//                log.info("/**************主动更新dou订单：开始更新数据库：" + resultVo.getData().getId() + "不存在、新增****************/");
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.DOU,MqType.ORDER_MESSAGE,resultVo.getData().getOrderId()));
//            }
//            return AjaxResult.success();
//        } else {
//            return AjaxResult.error(resultVo.getCode(), resultVo.getMsg());
//        }
//    }
}
