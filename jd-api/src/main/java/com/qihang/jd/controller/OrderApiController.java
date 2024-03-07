package com.qihang.jd.controller;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.request.order.PopOrderEnSearchRequest;
import com.jd.open.api.sdk.response.order.PopOrderEnSearchResponse;
import com.qihang.common.common.ApiResult;
import com.qihang.common.enums.HttpStatus;
import com.qihang.jd.common.ApiCommon;
import com.qihang.jd.common.PullRequest;
import com.qihang.jd.mq.MqMessage;
import com.qihang.jd.mq.MqUtils;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/order")
@RestController
@AllArgsConstructor
public class OrderApiController {
    private final ApiCommon apiCommon;
//    private final RedisCache redisCache;
    private final MqUtils mqUtils;


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
//        String accessToken = "8abd974c62c34778935b34b5952e6f68izdk";
//        String appKey="FB4CC3688E6F9065D4FF510A53BB60FF";
//        String appSecret="40e8c8b2427f4e6db8f4a39af27d719e";

        JdClient client=new DefaultJdClient(serverUrl,accessToken,appKey,appSecret);
        //https://open.jd.com/home/home/#/doc/api?apiCateId=55&apiId=4246&apiName=jingdong.pop.order.search
//        PopOrderSearchRequest request=new PopOrderSearchRequest();
//        request.setStartDate("2024-2-14 10:00:00");
//        request.setEndDate("2024-3-4 12:00:00");
//        request.setOrderState("TRADE_CANCELED");
//        request.setOptionalFields("itemInfoList,orderId,isShipmenttype,scDT,idSopShipmenttype,orderStartTime,consigneeInfo");
//        request.setPage("1");
//        request.setPageSize("20");
//        request.setSortType(1);
//        request.setDateType(0);
//        PopOrderSearchResponse response=client.execute(request);
//        System.out.println(response);

        //https://open.jd.com/home/home/#/doc/api?apiCateId=55&apiId=2388&apiName=jingdong.pop.order.enSearch
        PopOrderEnSearchRequest request =new PopOrderEnSearchRequest();
        request.setStartDate("2024-02-06 00:20:35");
        request.setEndDate("2024-03-05 15:20:35");
//        request.setOrderState("WAIT_SELLER_STOCK_OUT,WAIT_GOODS_RECEIVE_CONFIRM,WAIT_SELLER_DELIVERY,PAUSE,FINISHED_L,TRADE_CANCELED,LOCKED,POP_ORDER_PAUSE");
        request.setOrderState("");
//        request.setOrderState("ALL");
//        request.setOptionalFields("orderId,venderId");
//        request.setSourceId("JOS");
        request.setOptionalFields("venderId,orderId,orderType,payType,orderTotalPrice,orderSellerPrice,orderPayment,freightPrice,sellerDiscount,orderState" +
                ",orderStateRemark,deliveryType,invoiceCode,orderRemark,orderStartTime,orderEndTime,venderRemark,balanceUsed,pin,returnOrder,paymentConfirmTime,waybill,logisticsId,modified" +
                ",directParentOrderId,parentOrderId,orderSource,storeOrder,realPin,open_id,open_id_buyer" +
                ",invoiceInfo,invoiceEasyInfo,itemInfoList,isShipmenttype,scDT,idSopShipmenttype,orderStartTime,consigneeInfo,orderMarkDesc");
        request.setPage("1");
        request.setPageSize("100");
        request.setSortType(1);
        request.setDateType(0);
        PopOrderEnSearchResponse response=client.execute(request);
        MqMessage mqVo = MqMessage.build(1,"52332555000");
        mqUtils.sendApiMessage(mqVo);
        return response;
    }
}


