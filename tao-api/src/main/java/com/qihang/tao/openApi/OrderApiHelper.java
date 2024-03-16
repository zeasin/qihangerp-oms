package com.qihang.tao.openApi;

import com.qihang.common.common.ApiResult;
import com.qihang.common.enums.HttpStatus;


//import com.qihang.tao.api.ApiResult;
import com.qihang.tao.domain.TaoOrder;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.TopOaidDecryptRequest;
import com.taobao.api.request.TradesSoldGetRequest;
import com.taobao.api.request.TradesSoldIncrementGetRequest;
import com.taobao.api.response.TopOaidDecryptResponse;
import com.taobao.api.response.TradesSoldGetResponse;
import com.taobao.api.response.TradesSoldIncrementGetResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderApiHelper {
    private static Logger log = LoggerFactory.getLogger(OrderApiHelper.class);

    private static final String ORDER_FIELDS = "tid,receiver_name,receiver_country,receiver_state,receiver_city,receiver_district,receiver_town,receiver_address," +
            "receiver_mobile,receiver_phone,title,seller_flag,has_buyer_message,credit_card_fee,mark_desc,consign_time,end_time,sid,yfx_fee,has_yfx" +
            ",type,status,orders,rx_audit_status,seller_memo,buyer_memo,buyer_message,pay_time,created,modified,buyer_nick,buyer_open_uid" +
            ",alipay_no,buyer_alipay_no,buyer_email,num_iid,num,price,total_fee,adjust_fee,post_fee,discount_fee,payment,received_payment" +
            ",available_confirm_fee,commission_fee,oaid";

    /**
     * 更新订单（循环分页）
     *
     * @param pageNo
     * @param pageSize
     * @param sessionKey
     * @return
     */
    public static ApiResult<TaoOrder> pullOrder(Long pageNo, Long pageSize, String url, String appKey, String appSecret, String sessionKey) throws ApiException {
        log.info("=======开始全量拉取订单{}=========",LocalDateTime.now());
        TaobaoClient client = new DefaultTaobaoClient(url, appKey, appSecret);

        TradesSoldGetRequest req = new TradesSoldGetRequest();
        req.setFields(ORDER_FIELDS);
//        req.setStartCreated(DateUtil.stringtoDate("2019-11-27 00:00:00"));
//        req.setEndCreated(DateUtil.stringtoDate("2019-12-04 23:59:59"));
//        req.setStatus("WAIT_SELLER_SEND_GOODS");
//        req.setBuyerNick("美丽的你美丽的我");
        req.setType("fixed");//一口价
//        req.setExtType("service");
//        req.setRateStatus("RATE_UNBUYER");
//        req.setTag("time_card");
        req.setPageNo(pageNo);
        req.setPageSize(pageSize);
//        req.setUseHasNext(true);
//        req.setBuyerOpenId("AAHm5d-EAAeGwJedwSHpg8bT");
        TradesSoldGetResponse rsp = client.execute(req, sessionKey);
//        System.out.println(rsp.getBody());
        if(StringUtils.hasText(rsp.getErrorCode())){
            if(rsp.getErrorCode().equals("27")){
//                return new ApiResult(HttpStatus.UNAUTHORIZED, "Token已过期，请重新授权");
                return ApiResult.build(HttpStatus.UNAUTHORIZED, "Token已过期，请重新授权");
            }
        }
        if (rsp.getTrades() == null) {
            //接口查询错误
//            return new ApiResult(500, "接口调用错误：" + rsp.getMsg() + rsp.getSubMsg());
            return ApiResult.build(HttpStatus.ERROR, "接口调用错误：" + rsp.getMsg() + rsp.getSubMsg());
        }

        //组合的订单列表
        List<TaoOrder> orderList = new ArrayList<>();

        //有数据
        for (var trade : rsp.getTrades()) {
            try {
                //组装订单
                var order = OrderAssembleHelper.assembleOrder(trade);

//                TopOaidDecryptRequest req1 = new TopOaidDecryptRequest();
//                List<TopOaidDecryptRequest.ReceiverQuery> list2 = new ArrayList<TopOaidDecryptRequest.ReceiverQuery>();
//
//                TopOaidDecryptRequest.ReceiverQuery obj3 = new TopOaidDecryptRequest.ReceiverQuery();
//                list2.add(obj3);
//                obj3.setOaid("1bhibPTekQ9Vico6BCjHicSUS6j5e9RRZkeyPzqeo41ibibkp5UTVZQC2wdLEQ0BssjpbscJyZy");
//                obj3.setTid("3796207345637527441");
//                obj3.setScene("1006");
//                obj3.setSecretNoDays(15L);
//
//                req1.setQueryList(list2);
//                TopOaidDecryptResponse rsp1 = client.execute(req1, sessionKey);
//                System.out.println(rsp1.getBody());

                orderList.add(order);

            } catch (Exception e) {
            }
        }

//        return new ApiResult(rsp.getTotalResults().intValue(), orderList);
        return  ApiResult.build(rsp.getTotalResults().intValue(), orderList);
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
    public static ApiResult<TaoOrder> pullIncrementOrder(Long pageNo, Long pageSize, String url, String appKey, String appSecret, String sessionKey) throws ApiException {
        log.info("=======开增量拉取订单{}=========",LocalDateTime.now());
        // 取当前时间30分钟前
        LocalDateTime endTime = LocalDateTime.now();
        LocalDateTime startTime = endTime.minus(60*24, ChronoUnit.MINUTES);


        TaobaoClient client = new DefaultTaobaoClient(url, appKey, appSecret);
        TradesSoldIncrementGetRequest req = new TradesSoldIncrementGetRequest();
        req.setFields(ORDER_FIELDS);

        req.setStartModified(Date.from(startTime.toInstant(ZoneOffset.UTC)));
        req.setEndModified(Date.from(endTime.toInstant(ZoneOffset.UTC)));
        req.setType("fixed");//一口价
//        req.setExtType("service");
//        req.setRateStatus("RATE_UNBUYER");
//        req.setTag("time_card");
        req.setPageNo(pageNo);
        req.setPageSize(pageSize);
        req.setUseHasNext(true);
//        req.setUseHasNext(true);
//        req.setBuyerOpenId("AAHm5d-EAAeGwJedwSHpg8bT");
        TradesSoldIncrementGetResponse rsp = client.execute(req, sessionKey);


        if (rsp.getTrades() == null) {
            if (!StringUtils.isEmpty(rsp.getErrorCode())) {
                //接口查询错误
//                return new ApiResult(500, "接口调用错误：" + rsp.getMsg() + rsp.getSubMsg());
                return ApiResult.build(HttpStatus.ERROR,"接口调用错误：" + rsp.getMsg() + rsp.getSubMsg());
            }
            log.info("========增量拉取订单：无订单,{}==========",LocalDateTime.now());
//            return new ApiResult(0, new ArrayList());
            return ApiResult.build(0,new ArrayList<>());
        }

        //组合的订单列表
        List<TaoOrder> orderList = new ArrayList<>();
        if(rsp.getTrades()!=null && !rsp.getTrades().isEmpty()) {
            TopOaidDecryptRequest req2 = new TopOaidDecryptRequest();
            List<TopOaidDecryptRequest.ReceiverQuery> list2 = new ArrayList<TopOaidDecryptRequest.ReceiverQuery>();
            TopOaidDecryptRequest.ReceiverQuery obj2 = new TopOaidDecryptRequest.ReceiverQuery();
            list2.add(obj2);
            obj2.setScene("1005");
            obj2.setSecretNoDays(15L);

            //有数据
            for (var trade : rsp.getTrades()) {
                //组装订单
                TaoOrder taoOrder = OrderAssembleHelper.assembleOrder(trade);

                obj2.setOaid(trade.getOaid());
                obj2.setTid(trade.getTid().toString());
                req2.setQueryList(list2);
                TopOaidDecryptResponse rsp2 = client.execute(req2, sessionKey);
//                System.out.println(rsp2.getBody());
                if (rsp2.getReceiverList() != null && !rsp2.getReceiverList().isEmpty()) {
                    taoOrder.setReceiverName(rsp2.getReceiverList().get(0).getName());
                    taoOrder.setReceiverAddress(rsp2.getReceiverList().get(0).getAddressDetail());
                    taoOrder.setReceiverMobile(rsp2.getReceiverList().get(0).getMobile());
                }
                orderList.add(taoOrder);
            }
        }
        // 有分页，继续拉取
        while (rsp.getHasNext()) {
            pageNo++;
            req.setPageNo(pageNo);
            rsp = client.execute(req, sessionKey);
            if(rsp.getTrades()!=null && !rsp.getTrades().isEmpty()) {
                TopOaidDecryptRequest req2 = new TopOaidDecryptRequest();
                List<TopOaidDecryptRequest.ReceiverQuery> list2 = new ArrayList<TopOaidDecryptRequest.ReceiverQuery>();
                TopOaidDecryptRequest.ReceiverQuery obj2 = new TopOaidDecryptRequest.ReceiverQuery();
                list2.add(obj2);
                obj2.setScene("1005");
                obj2.setSecretNoDays(15L);
                //有数据
                for (var trade : rsp.getTrades()) {
                    //组装订单
                    TaoOrder taoOrder = OrderAssembleHelper.assembleOrder(trade);

                    obj2.setOaid(trade.getOaid());
                    obj2.setTid(trade.getTid().toString());
                    req2.setQueryList(list2);
                    TopOaidDecryptResponse rsp2 = client.execute(req2, sessionKey);
//                System.out.println(rsp2.getBody());
                    if (rsp2.getReceiverList() != null && !rsp2.getReceiverList().isEmpty()) {
                        taoOrder.setReceiverName(rsp2.getReceiverList().get(0).getName());
                        taoOrder.setReceiverAddress(rsp2.getReceiverList().get(0).getAddressDetail());
                        taoOrder.setReceiverMobile(rsp2.getReceiverList().get(0).getMobile());
                    }
                    orderList.add(taoOrder);
                }
            }
        }
//        return new ApiResult(orderList.size(), orderList);
        return ApiResult.build(orderList.size(),orderList);
    }

   }
