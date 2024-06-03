package com.qihang.dou.controller;

import com.doudian.open.api.order_searchList.OrderSearchListRequest;
import com.doudian.open.api.order_searchList.OrderSearchListResponse;
import com.doudian.open.api.order_searchList.param.OrderSearchListParam;
import com.doudian.open.api.token_create.TokenCreateRequest;
import com.doudian.open.api.token_create.TokenCreateResponse;
import com.doudian.open.api.token_create.param.TokenCreateParam;
import com.doudian.open.core.AccessToken;
import com.doudian.open.core.AccessTokenBuilder;
import com.doudian.open.core.GlobalConfig;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
public class HomeController {
    @GetMapping("/")
    public String home() {
        //设置appKey和appSecret，全局设置一次
        String appkey = "7005157746437834253";
        String appSecret = "8104c8b8-9085-4a80-9248-629759b4f1a3";
        appkey = "7344938657423296019";
        appSecret = "4e704882-832a-42e5-845f-6af991ce0ce2";
        GlobalConfig.initAppKey(appkey);
        GlobalConfig.initAppSecret(appSecret);
        //获取access_token方法
        AccessToken accessToken = AccessTokenBuilder.build(90158786L); //入参为shopId 4463798L

        if ("50002".equals(accessToken.getCode())) {
            return accessToken.getSubMsg();
        }

        OrderSearchListRequest request = new OrderSearchListRequest();
        OrderSearchListParam param = request.getParam();
        param.setProduct("3473196049974326153");
        param.setBType(2L);
        param.setAfterSaleStatusDesc("refund_success");
        param.setTrackingNo("435435");
        param.setPresellType(1L);
        param.setOrderType(1L);
//        param.setCreateTimeStart(1617355413L);
//        param.setCreateTimeEnd(1617355413L);
        param.setAbnormalOrder(1L);
        param.setTradeType(1L);
        param.setUpdateTimeStart(1709222400L);
        param.setUpdateTimeEnd(System.currentTimeMillis()/1000);
        param.setSize(20L);
        param.setPage(0L);
        param.setOrderBy("create_time");
        param.setOrderAsc(false);
        param.setFulfilStatus("no_accept");
        OrderSearchListResponse response = request.execute(accessToken);
        return "{'code':0,'msg':'dou-api请通过api访问'}";
    }
}
