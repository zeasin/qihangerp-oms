package com.qihang.jd.controller;

import com.qihang.common.common.ApiResult;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.common.mq.MqType;
import com.qihang.jd.domain.JdOrder;
import com.qihang.jd.openApi.ApiCommon;
import com.qihang.jd.openApi.OrderApiHelper;
import com.qihang.jd.openApi.PullRequest;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqUtils;
import com.qihang.jd.service.JdOrderService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/order")
@RestController
@AllArgsConstructor
public class OrderApiController {
    private final ApiCommon apiCommon;
//    private final RedisCache redisCache;
    private final MqUtils mqUtils;
    private final JdOrderService orderService;


    @RequestMapping(value = "/pull_list", method = RequestMethod.POST)
    public Object pullList(@RequestBody PullRequest params) throws Exception {
//        Object cacheObject = redisCache.getCacheObject("jdorder");

        if (params.getShopId() == null || params.getShopId() <= 0) {
//            return ApiResul new ApiResult(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
            return ApiResult.build(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return ApiResult.build(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String serverUrl = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
        //第一次获取
        ApiResult<JdOrder> upResult = OrderApiHelper.pullOrder(1L,100L,serverUrl,appKey,appSecret,accessToken);
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
        return upResult;
    }
}


