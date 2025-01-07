package cn.qihangerp.open.jd.controller;

import cn.qihangerp.open.domain.SysShopPullLasttime;
import cn.qihangerp.open.domain.SysShopPullLogs;
import cn.qihangerp.open.jd.JdApiCommon;
import cn.qihangerp.open.jd.OrderApiHelper;
import cn.qihangerp.open.jd.JdPullRequest;
import cn.qihangerp.open.jd.common.ApiResultVo;
import cn.qihangerp.open.jd.domain.OmsJdOrder;
import cn.qihangerp.open.jd.domain.OmsJdOrderItem;
import cn.qihangerp.open.jd.model.OrderInfo;
import cn.qihangerp.open.jd.service.OmsJdOrderService;
import cn.qihangerp.open.service.SysShopPullLasttimeService;
import cn.qihangerp.open.service.SysShopPullLogsService;
import com.alibaba.fastjson2.JSONObject;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/jd/order")
@RestController
@AllArgsConstructor
public class JdOrderApiController {
    private final JdApiCommon jdApiCommon;
//    private final RedisCache redisCache;
//    private final MqUtils mqUtils;
    private final OmsJdOrderService orderService;
    private final SysShopPullLasttimeService pullLasttimeService;
    private final SysShopPullLogsService pullLogsService;
    private final KafkaTemplate<String,Object> kafkaTemplate;

    @RequestMapping(value = "/pull_order_jd", method = RequestMethod.POST)
    public AjaxResult pullList(@RequestBody JdPullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }

        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();

        var checkResult = jdApiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
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
        //获取
        ApiResultVo<OrderInfo> upResult = OrderApiHelper.pullOrder(startTime,endTime,appKey,appSecret,accessToken);
        if(upResult.getCode()!=0) return AjaxResult.error(upResult.getMsg());

        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数
        //循环插入订单数据到数据库
        for (var orderInfo : upResult.getList()) {
            //插入订单数据
            OmsJdOrder order = new OmsJdOrder();
            BeanUtils.copyProperties(orderInfo, order);
            order.setFullname(orderInfo.getConsigneeInfo().getFullname());
            order.setFullAddress(orderInfo.getConsigneeInfo().getFullAddress());
            order.setTelephone(orderInfo.getConsigneeInfo().getTelephone());
            order.setMobile(orderInfo.getConsigneeInfo().getMobile());
            order.setProvince(orderInfo.getConsigneeInfo().getProvince());
            order.setProvinceId(orderInfo.getConsigneeInfo().getProvinceId());
            order.setCity(orderInfo.getConsigneeInfo().getCity());
            order.setCityId(orderInfo.getConsigneeInfo().getCityId());
            order.setTown(orderInfo.getConsigneeInfo().getTown());
            order.setTownId(orderInfo.getConsigneeInfo().getTownId());
            List<OmsJdOrderItem> itemList = new ArrayList<>();
            for(var orderInfoItem :orderInfo.getItemInfoList()) {
                OmsJdOrderItem jdOrderItem = new OmsJdOrderItem();
                BeanUtils.copyProperties(orderInfoItem, jdOrderItem);
                itemList.add(jdOrderItem);
            }
            order.setItemList(itemList);
            //插入订单数据
            var result = orderService.saveOrder(params.getShopId(), order);
            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                //已经存在
                hasExistOrder++;
                kafkaTemplate.send(MqType.ORDER_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.JD, MqType.ORDER_MESSAGE,order.getOrderId())));
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD,MqType.ORDER_MESSAGE,order.getOrderId()));
            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                insertSuccess++;
                kafkaTemplate.send(MqType.ORDER_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.JD, MqType.ORDER_MESSAGE,order.getOrderId())));
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD,MqType.ORDER_MESSAGE,order.getOrderId()));
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


