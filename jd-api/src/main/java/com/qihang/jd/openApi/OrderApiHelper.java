package com.qihang.jd.openApi;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.request.order.PopOrderEnSearchRequest;
import com.jd.open.api.sdk.response.order.PopOrderEnSearchResponse;
import com.qihang.common.common.ApiResult;
import com.qihang.common.enums.HttpStatus;
import com.qihang.jd.domain.JdOrder;
import com.qihang.jd.domain.JdOrderItem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderApiHelper {
    private static Logger log = LoggerFactory.getLogger(OrderApiHelper.class);

    private static final String ORDER_FIELDS = "venderId,orderId,orderType,payType,orderTotalPrice,orderSellerPrice,orderPayment,freightPrice,sellerDiscount,orderState,orderStateRemark,deliveryType,invoiceCode,orderRemark,orderStartTime,orderEndTime,venderRemark,balanceUsed,pin,returnOrder,paymentConfirmTime,waybill,logisticsId,modified,directParentOrderId,parentOrderId,orderSource,storeOrder,realPin,open_id,open_id_buyer,invoiceInfo,invoiceEasyInfo,itemInfoList,isShipmenttype,scDT,idSopShipmenttype,orderStartTime,consigneeInfo,orderMarkDesc";

    /**
     * 更新订单（循环分页）
     *
     * @param pageNo
     * @param pageSize
     * @param accessToken
     * @return
     */
    public static ApiResult<JdOrder> pullOrder(Long pageNo, Long pageSize, String serverUrl, String appKey, String appSecret, String accessToken) throws Exception {
        log.info("=======开始全量拉取订单{}=========",LocalDateTime.now());
        JdClient client=new DefaultJdClient(serverUrl,accessToken,appKey,appSecret);
        PopOrderEnSearchRequest request =new PopOrderEnSearchRequest();
        request.setStartDate("2024-02-06 00:20:35");
        request.setEndDate("2024-03-05 15:20:35");
//        request.setOrderState("WAIT_SELLER_STOCK_OUT,WAIT_GOODS_RECEIVE_CONFIRM,WAIT_SELLER_DELIVERY,PAUSE,FINISHED_L,TRADE_CANCELED,LOCKED,POP_ORDER_PAUSE");
//        request.setOrderState("");
        request.setOrderState("ALL");
//        request.setOptionalFields("orderId,venderId");
//        request.setSourceId("JOS");
        request.setOptionalFields(ORDER_FIELDS);
        request.setPage(pageNo.toString());
        request.setPageSize(pageSize.toString());
        request.setSortType(1);
        request.setDateType(0);
        PopOrderEnSearchResponse response=client.execute(request);
        if(response.getSearchorderinfoResult() == null || response.getSearchorderinfoResult().getApiResult() == null) {
            return ApiResult.build(HttpStatus.ERROR, "接口调用错误" );
        }
        if(!response.getSearchorderinfoResult().getApiResult().getSuccess()){
            return ApiResult.build(HttpStatus.ERROR, "接口调用错误:"+ response.getSearchorderinfoResult().getApiResult().getChineseErrCode());
        }
        if(response.getSearchorderinfoResult().getOrderTotal() == 0){
            return  ApiResult.build(0, new ArrayList<>());
        }
        //组合的订单列表
        List<JdOrder> orderList = new ArrayList<>();

        for (var trade : response.getSearchorderinfoResult().getOrderInfoList()) {
            //组装订单
//            var order = OrderAssembleHelper.assembleOrder(trade);
            JdOrder order = new JdOrder();
            BeanUtils.copyProperties(trade,order);
            order.setProvince(trade.getConsigneeInfo().getProvince());
            order.setProvinceId(trade.getConsigneeInfo().getProvinceId());
            order.setCity(trade.getConsigneeInfo().getCity());
            order.setCityId(trade.getConsigneeInfo().getCityId());
            order.setCounty(trade.getConsigneeInfo().getCounty());
            order.setCountyId(trade.getConsigneeInfo().getCountyId());
            order.setTown(trade.getConsigneeInfo().getTown());
            order.setTownId(trade.getConsigneeInfo().getTownId());
            order.setFullAddress(trade.getConsigneeInfo().getFullAddress());
            order.setFullname(trade.getConsigneeInfo().getFullname());
            order.setTelephone(trade.getConsigneeInfo().getTelephone());
            order.setMobile(trade.getConsigneeInfo().getMobile());
            List<JdOrderItem> items = new ArrayList<>();
            for (var item : trade.getItemInfoList()) {
                JdOrderItem it  = new JdOrderItem();
                BeanUtils.copyProperties(item,it);
                items.add(it);
            }
            order.setItems(items);
//            order.setOrderId(trade.getOrderId());
//            order.setVenderId(trade.getVenderId());
//            order.setOrderType(trade.getOrderType());
//            order.setPayType(trade.getPayType());
//            order.setOrderTotalPrice(trade.getOrderTotalPrice());
//            order.setOrderSellerPrice(trade.getOrderSellerPrice());
//            order.setOrderPayment(trade.getOrderPayment());
//            order.setFreightPrice(trade.getFreightPrice());


            orderList.add(order);
        }

        return ApiResult.build(response.getSearchorderinfoResult().getOrderTotal(), orderList);


//        TradesSoldGetRequest req = new TradesSoldGetRequest();
//        req.setFields(ORDER_FIELDS);
////        req.setStartCreated(DateUtil.stringtoDate("2019-11-27 00:00:00"));
////        req.setEndCreated(DateUtil.stringtoDate("2019-12-04 23:59:59"));
////        req.setStatus("WAIT_SELLER_SEND_GOODS");
////        req.setBuyerNick("美丽的你美丽的我");
//        req.setType("fixed");//一口价
////        req.setExtType("service");
////        req.setRateStatus("RATE_UNBUYER");
////        req.setTag("time_card");
//        req.setPageNo(pageNo);
//        req.setPageSize(pageSize);
////        req.setUseHasNext(true);
////        req.setBuyerOpenId("AAHm5d-EAAeGwJedwSHpg8bT");
//        TradesSoldGetResponse rsp = client.execute(req, sessionKey);
////        System.out.println(rsp.getBody());
//        if(StringUtils.hasText(rsp.getErrorCode())){
//            if(rsp.getErrorCode().equals("27")){
////                return new ApiResult(HttpStatus.UNAUTHORIZED, "Token已过期，请重新授权");
//                return ApiResult.build(HttpStatus.UNAUTHORIZED, "Token已过期，请重新授权");
//            }
//        }
//        if (rsp.getTrades() == null) {
//            //接口查询错误
////            return new ApiResult(500, "接口调用错误：" + rsp.getMsg() + rsp.getSubMsg());
//            return ApiResult.build(HttpStatus.ERROR, "接口调用错误：" + rsp.getMsg() + rsp.getSubMsg());
//        }
//
//        //组合的订单列表
//        List<TaoOrder> orderList = new ArrayList<>();
//
//        //有数据
//        for (var trade : rsp.getTrades()) {
//            try {
//                //组装订单
//                var order = OrderAssembleHelper.assembleOrder(trade);
//
////                TopOaidDecryptRequest req1 = new TopOaidDecryptRequest();
////                List<TopOaidDecryptRequest.ReceiverQuery> list2 = new ArrayList<TopOaidDecryptRequest.ReceiverQuery>();
////
////                TopOaidDecryptRequest.ReceiverQuery obj3 = new TopOaidDecryptRequest.ReceiverQuery();
////                list2.add(obj3);
////                obj3.setOaid("1bhibPTekQ9Vico6BCjHicSUS6j5e9RRZkeyPzqeo41ibibkp5UTVZQC2wdLEQ0BssjpbscJyZy");
////                obj3.setTid("3796207345637527441");
////                obj3.setScene("1006");
////                obj3.setSecretNoDays(15L);
////
////                req1.setQueryList(list2);
////                TopOaidDecryptResponse rsp1 = client.execute(req1, sessionKey);
////                System.out.println(rsp1.getBody());
//
//                orderList.add(order);
//
//            } catch (Exception e) {
//            }
//        }

//        return new ApiResult(rsp.getTotalResults().intValue(), orderList);
//        return  ApiResult.build(0, new ArrayList<>());
    }



    /**
     * 增量获取淘宝开放平台天猫订单
     *
     * @param pageNo
     * @param pageSize
     * @param sessionKey
     * @return
     * @throws ApiException
     */
//    public static ApiResult<TaoOrder> pullIncrementOrder(Long pageNo, Long pageSize, String url, String appKey, String appSecret, String sessionKey) throws ApiException {
//        log.info("=======开增量拉取订单{}=========",LocalDateTime.now());
//        // 取当前时间30分钟前
//        LocalDateTime endTime = LocalDateTime.now();
//        LocalDateTime startTime = endTime.minus(60*24, ChronoUnit.MINUTES);
//
//
//        TaobaoClient client = new DefaultTaobaoClient(url, appKey, appSecret);
//        TradesSoldIncrementGetRequest req = new TradesSoldIncrementGetRequest();
//        req.setFields(ORDER_FIELDS);
//
//        req.setStartModified(Date.from(startTime.toInstant(ZoneOffset.UTC)));
//        req.setEndModified(Date.from(endTime.toInstant(ZoneOffset.UTC)));
//        req.setType("fixed");//一口价
////        req.setExtType("service");
////        req.setRateStatus("RATE_UNBUYER");
////        req.setTag("time_card");
//        req.setPageNo(pageNo);
//        req.setPageSize(pageSize);
//        req.setUseHasNext(true);
////        req.setUseHasNext(true);
////        req.setBuyerOpenId("AAHm5d-EAAeGwJedwSHpg8bT");
//        TradesSoldIncrementGetResponse rsp = client.execute(req, sessionKey);
//
//
//        if (rsp.getTrades() == null) {
//            if (!StringUtils.isEmpty(rsp.getErrorCode())) {
//                //接口查询错误
////                return new ApiResult(500, "接口调用错误：" + rsp.getMsg() + rsp.getSubMsg());
//                return ApiResult.build(HttpStatus.ERROR,"接口调用错误：" + rsp.getMsg() + rsp.getSubMsg());
//            }
//            log.info("========增量拉取订单：无订单,{}==========",LocalDateTime.now());
////            return new ApiResult(0, new ArrayList());
//            return ApiResult.build(0,new ArrayList<>());
//        }
//
//        //组合的订单列表
//        List<TaoOrder> orderList = new ArrayList<>();
//        //有数据
//        for (var trade : rsp.getTrades()) {
//            //组装订单
//            orderList.add(OrderAssembleHelper.assembleOrder(trade));
//        }
//        // 有分页，继续拉取
//        while (rsp.getHasNext()) {
//            pageNo++;
//            req.setPageNo(pageNo);
//            rsp = client.execute(req, sessionKey);
//            //有数据
//            for (var trade : rsp.getTrades()) {
//                //组装订单
//                orderList.add(OrderAssembleHelper.assembleOrder(trade));
//            }
//        }
////        return new ApiResult(orderList.size(), orderList);
//        return ApiResult.build(orderList.size(),orderList);
//    }

   }
