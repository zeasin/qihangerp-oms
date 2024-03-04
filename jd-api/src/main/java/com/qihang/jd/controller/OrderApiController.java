package com.qihang.jd.controller;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.request.order.PopOrderEnSearchRequest;
import com.jd.open.api.sdk.request.refundapply.PopAfsRefundapplyQuerylistRequest;
import com.jd.open.api.sdk.request.ware.SkuReadSearchSkuListRequest;
import com.jd.open.api.sdk.request.ware.WareReadSearchWare4ValidRequest;
import com.jd.open.api.sdk.response.order.PopOrderEnSearchResponse;
import com.jd.open.api.sdk.response.refundapply.PopAfsRefundapplyQuerylistResponse;
import com.jd.open.api.sdk.response.ware.SkuReadSearchSkuListResponse;
import com.jd.open.api.sdk.response.ware.WareReadSearchWare4ValidResponse;
import com.qihang.common.common.ApiResult;
import com.qihang.common.enums.HttpStatus;
import com.qihang.jd.common.ApiCommon;
import com.qihang.jd.common.PullRequest;
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
    @RequestMapping(value = "/pull_order", method = RequestMethod.POST)
    public Object pullGoodsList(@RequestBody PullRequest params) throws Exception {
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

        PopOrderEnSearchRequest request =new PopOrderEnSearchRequest();
        request.setStartDate("2020-04-04 00:20:35");
        request.setEndDate("2020-04-04 00:20:35");
        request.setOrderState("21");
//        request.setOptionalFields("orderId,venderId");
//        request.setSourceId("JOS");
        request.setOptionalFields("itemInfoList,orderId,isShipmenttype,scDT,idSopShipmenttype,orderStartTime,consigneeInfo");
        request.setPage("1");
        request.setPageSize("10");
        request.setSortType(1);
        request.setDateType(0);
        PopOrderEnSearchResponse response=client.execute(request);

        return response;
    }
}
