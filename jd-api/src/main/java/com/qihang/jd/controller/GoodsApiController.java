package com.qihang.jd.controller;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.JdException;
import com.jd.open.api.sdk.request.order.OrderGetRequest;
import com.jd.open.api.sdk.request.order.PopOrderEnSearchRequest;
import com.jd.open.api.sdk.request.order.PopOrderSearchRequest;
import com.jd.open.api.sdk.request.refundapply.PopAfsRefundapplyQuerybyidRequest;
import com.jd.open.api.sdk.request.refundapply.PopAfsRefundapplyQuerylistRequest;
import com.jd.open.api.sdk.request.ware.SkuReadSearchSkuListRequest;
import com.jd.open.api.sdk.request.ware.WareReadSearchWare4ValidRequest;
import com.jd.open.api.sdk.response.order.OrderGetResponse;
import com.jd.open.api.sdk.response.order.PopOrderEnSearchResponse;
import com.jd.open.api.sdk.response.order.PopOrderSearchResponse;
import com.jd.open.api.sdk.response.refundapply.PopAfsRefundapplyQuerybyidResponse;
import com.jd.open.api.sdk.response.refundapply.PopAfsRefundapplyQuerylistResponse;
import com.jd.open.api.sdk.response.ware.SkuReadSearchSkuListResponse;
import com.jd.open.api.sdk.response.ware.WareReadSearchWare4ValidResponse;
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
    @RequestMapping(value = "/pull_list", method = RequestMethod.POST)
    public Object pullList() throws Exception {
        String accessToken = "8abd974c62c34778935b34b5952e6f68izdk";
        String appKey="FB4CC3688E6F9065D4FF510A53BB60FF";
        String appSecret="40e8c8b2427f4e6db8f4a39af27d719e";
        JdClient client=new DefaultJdClient(SERVER_URL,accessToken,appKey,appSecret);
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
//        PopOrderEnSearchRequest request=new PopOrderEnSearchRequest();
//        request.setStartDate("2020-04-04 00:20:35");
//        request.setEndDate("2020-04-04 00:20:35");
//        request.setOrderState("21");
////        request.setOptionalFields("orderId,venderId");
////        request.setSourceId("JOS");
//        request.setOptionalFields("itemInfoList,orderId,isShipmenttype,scDT,idSopShipmenttype,orderStartTime,consigneeInfo");
//        request.setPage("1");
//        request.setPageSize("10");
//        request.setSortType(1);
//        request.setDateType(0);
//        PopOrderEnSearchResponse response=client.execute(request);

        //https://open.jd.com/home/home/#/doc/api?apiCateId=48&apiId=1587&apiName=jingdong.ware.read.searchWare4Valid
        WareReadSearchWare4ValidRequest request=new WareReadSearchWare4ValidRequest();
        request.setField("jdPrice,wareId,title,spuId,images,shopId,itemNum,outerId,logo");
        request.setWareStatusValue("8");
//        request.setSearchField("[title]");

        WareReadSearchWare4ValidResponse response=client.execute(request);

        //https://open.jd.com/home/home/#/doc/api?apiCateId=48&apiId=1227&apiName=jingdong.sku.read.searchSkuList
        SkuReadSearchSkuListRequest request1=new SkuReadSearchSkuListRequest();

//        request1.setWareId("10223753529");
        request1.setField("skuId,categoryId,stockNum,wareTitle,status,multiCateProps,outerId,jdPrice,logo,skuName,parentId,modified,created,saleAttrs,imgTag,currencySpuId");
        SkuReadSearchSkuListResponse response1=client.execute(request1);
        System.out.println(response1);
//        SpuGetModelOrItemNumListRequest  request=new SpuGetModelOrItemNumListRequest();
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

//        //https://open.jd.com/home/home/#/doc/api?apiCateId=71&apiId=307&apiName=jingdong.pop.afs.refundapply.querylist
//        PopAfsRefundapplyQuerylistRequest request2=new PopAfsRefundapplyQuerylistRequest();
////        request2.setStatus("1");
////        request2.setId("111");
////        request2.setOrderId("1234");
////        request2.setBuyerId("abc");
////        request2.setBuyerName("abc");
////        request2.setApplyTimeStart("2023-12-01 16:11:40");
////        request2.setApplyTimeEnd("2023-12-31 16:11:40");
////        request2.setCheckTimeStart("2023-12-01 16:11:40");
////        request2.setCheckTimeEnd("2023-12-31 16:11:40");
//        request2.setPageIndex(1);
//        request2.setPageSize(10);
//        PopAfsRefundapplyQuerylistResponse response2=client.execute(request2);
//        System.out.println(request2);

//        PopAfsRefundapplyQuerybyidRequest request3=new PopAfsRefundapplyQuerybyidRequest();
//        request3.setRaId(23454754437L);
//        PopAfsRefundapplyQuerybyidResponse response3=client.execute(request3);
        return response;
    }
}
