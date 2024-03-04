package com.qihang.jd.controller;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.JdException;
import com.jd.open.api.sdk.request.order.OrderGetRequest;
import com.jd.open.api.sdk.request.order.PopOrderSearchRequest;
import com.jd.open.api.sdk.response.order.OrderGetResponse;
import com.jd.open.api.sdk.response.order.PopOrderSearchResponse;
import com.qihang.common.enums.HttpStatus;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/goods")
@RestController
@AllArgsConstructor
public class GoodsApiController {
    private final String SERVER_URL = "https://api.jd.com/routerjson";
    @RequestMapping(value = "/pull_goods", method = RequestMethod.POST)
    public Integer pullGoodsList() throws Exception {
        String accessToken = "8abd974c62c34778935b34b5952e6f68izdk";
        String appKey="FB4CC3688E6F9065D4FF510A53BB60FF";
        String appSecret="40e8c8b2427f4e6db8f4a39af27d719e";
        JdClient client=new DefaultJdClient(SERVER_URL,accessToken,appKey,appSecret);

        PopOrderSearchRequest request=new PopOrderSearchRequest();
        request.setStartDate("2024-2-14 10:00:00");
        request.setEndDate("2024-3-4 12:00:00");
        request.setOrderState("TRADE_CANCELED");
        request.setOptionalFields("itemInfoList,orderId,isShipmenttype,scDT,idSopShipmenttype,orderStartTime");
        request.setPage("1");
        request.setPageSize("20");
        request.setSortType(1);
        request.setDateType(0);
        PopOrderSearchResponse response=client.execute(request);
//        PopOrderEnSearchRequest request=new PopOrderEnSearchRequest();
//        request.setStartDate("2020-04-04 00:20:35");
//        request.setEndDate("2020-04-04 00:20:35");
//        request.setOrderState("21");
//        request.setOptionalFields("orderId,venderId");
//        request.setSourceId("JOS");
//        request.setPage("1");
//        request.setPageSize("10");
//        request.setSortType(1);
//        request.setDateType(0);
//        PopOrderEnSearchResponse response=client.execute(request);


//        SpuGetModelOrItemNumListRequest request=new SpuGetModelOrItemNumListRequest();
//        request.setUniqueCodeType(1);
//        request.setCategoryId(1233);
//        request.setPageNo(1);
//        request.setPageSize(10);
//        request.setBrandId(1122);
//        request.setAppId("1784");
//        request.setAppName("app名称");
//        request.setBusinessIdentity("JOS");
//        request.setIp("192.168.1.1");
//        request.setUserAgent("zhangsan");
//        SpuGetModelOrItemNumListResponse response=client.execute(request);
        return 1;
    }
}
