package com.qihang.tao.controller;

import com.qihang.common.enums.HttpStatus;
import com.qihang.common.utils.DateUtils;


import com.qihang.tao.domain.TaoOrder;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.RefundsReceiveGetRequest;
import com.taobao.api.request.TradesSoldGetRequest;
import com.taobao.api.request.TradesSoldIncrementGetRequest;
import com.taobao.api.response.RefundsReceiveGetResponse;
import com.taobao.api.response.TradesSoldGetResponse;
import com.taobao.api.response.TradesSoldIncrementGetResponse;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TaoBaoOpenOrderUpdHelper {
    /**
     * 更新订单（循环分页）
     *
     * @param pageNo
     * @param pageSize
     * @param sessionKey
     * @return
     */
    public static TaoBaoOpenOrderUpdResult<TaoOrder> updTmallOrder(Long pageNo, Long pageSize, String url, String appKey, String appSecret, String sessionKey) throws ApiException {
        TaobaoClient client = new DefaultTaobaoClient(url, appKey, appSecret);

        TradesSoldGetRequest req = new TradesSoldGetRequest();
        req.setFields("tid,receiver_name,receiver_country,receiver_state,receiver_city,receiver_district,receiver_town,receiver_address,receiver_mobile," +
                "receiver_phone,title,seller_flag,has_buyer_message,credit_card_fee,mark_desc,consign_time,end_time" +
                ",type,status,orders,rx_audit_status,seller_memo,buyer_memo,buyer_message,pay_time,created,modified,buyer_nick,buyer_open_uid,alipay_no,buyer_alipay_no,buyer_email" +
                ",num_iid,num,price,total_fee,adjust_fee,post_fee,discount_fee,payment,received_payment,available_confirm_fee,commission_fee");
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
                return new TaoBaoOpenOrderUpdResult(HttpStatus.UNAUTHORIZED, "Token已过期，请重新授权");
            }
        }
        if (rsp.getTrades() == null) {
            //接口查询错误
            return new TaoBaoOpenOrderUpdResult(500, "接口调用错误：" + rsp.getMsg() + rsp.getSubMsg());
        }

        //组合的订单列表
        List<TaoOrder> orderList = new ArrayList<>();

        //有数据
        for (var trade : rsp.getTrades()) {
            try {
//                if(trade.getTid() == 770674433029365349L)
//                {
//                    String id = trade.getTid().toString();
//                }
                TaoOrder order = new TaoOrder();
                order.setTid(trade.getTid());
                order.setTitle(trade.getTitle());
                order.setType(trade.getType());
                order.setSellerFlag(trade.getSellerFlag()+"");
                order.setHasBuyerMessage(trade.getHasBuyerMessage()+"");
                order.setCreditCardFee(trade.getCreditCardFee());
                order.setCreated(trade.getCreated());
                order.setModified(trade.getModified());
                order.setPayTime(trade.getPayTime());
                order.setPrice(Double.parseDouble(trade.getPrice()));
                order.setTotalFee(Double.parseDouble(trade.getTotalFee()));
                order.setAdjustFee(Double.parseDouble(trade.getAdjustFee()));
                order.setPostFee(BigDecimal.valueOf(Double.parseDouble(trade.getPostFee())));
                order.setDiscountFee(BigDecimal.valueOf(Double.parseDouble(trade.getDiscountFee())));
                order.setPayment(BigDecimal.valueOf(Double.parseDouble(trade.getPayment())));
                order.setReceivedPayment(BigDecimal.valueOf(Double.parseDouble(trade.getReceivedPayment())));
                order.setBuyerNick(trade.getBuyerNick());
                order.setBuyerOpenUid(trade.getBuyerOpenUid());
                order.setAlipayNo(trade.getAlipayNo());
                order.setBuyerAlipayNo(trade.getBuyerAlipayNo());
                order.setBuyerEmail(trade.getBuyerEmail());
                order.setBuyerMemo(trade.getBuyerMemo());
                order.setBuyerMessage(trade.getBuyerMessage());
                order.setMarkDesc(trade.getMarkDesc());
                order.setSellerMemo(trade.getSellerMemo());
                order.setReceiverCountry(trade.getReceiverCountry());
                order.setReceiverState(trade.getReceiverState());
                order.setReceiverCity(trade.getReceiverCity());
                order.setReceiverDistrict(trade.getReceiverDistrict());
                order.setReceiverTown(trade.getReceiverTown());
                order.setReceiverAddress(trade.getReceiverAddress());
                order.setReceiverName(trade.getReceiverName());
                order.setReceiverMobile(trade.getReceiverMobile());
                order.setReceiverPhone(trade.getReceiverPhone());
                order.setNumIid(trade.getNumIid()+"");
                order.setNum(trade.getNum().intValue());
                order.setStatus(trade.getStatus());
                order.setConsignTime(trade.getConsignTime());
                order.setEndTime(trade.getEndTime());

                List<TaoOrderItem> items = new ArrayList<>();
                for (var item : trade.getOrders()) {
                    TaoOrderItem orderItem = new TaoOrderItem();
                    orderItem.setOrderId(order.getId());
                    orderItem.setSubItemId(item.getOid().toString());
                    Long refundStatus = -1L;
                    if(item.getRefundStatus().equals("NO_REFUND")){
                        refundStatus = 0L;
                    }else {
                        refundStatus = 1L;
                    }
                    orderItem.setRefundStatus(refundStatus);
                    orderItem.setProductId(item.getNumIid());
                    orderItem.setSkuId(Long.parseLong(item.getSkuId()));
                    orderItem.setSpecNumber(item.getOuterSkuId());
                    orderItem.setGoodsNumber(item.getOuterIid());
                    orderItem.setProductImgUrl(item.getPicPath());
                    orderItem.setGoodsTitle(item.getTitle());
                    orderItem.setPrice(BigDecimal.valueOf(Double.parseDouble(item.getPrice())));
                    orderItem.setQuantity(item.getNum());

                    orderItem.setSkuInfo(item.getSkuPropertiesName());
                    orderItem.setItemAmount(BigDecimal.valueOf(Double.parseDouble(item.getPayment())));
                    orderItem.setDiscountFee(new BigDecimal(item.getDiscountFee()));
                    orderItem.setAdjustFee(new BigDecimal(item.getAdjustFee()));

                    orderItem.setRefundStatusStr(item.getRefundStatus());

                    orderItem.setNewSpecId(0L);
                    orderItem.setIsGift(0);
                    orderItem.setIsSwap(0);
                    items.add(orderItem);
                }
                order.setTaoOrderItemList(items);

                orderList.add(order);
            } catch (Exception e) {
            }
        }

        return new TaoBaoOpenOrderUpdResult(rsp.getTotalResults().intValue(), orderList);
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
    public static TaoBaoOpenOrderUpdResult<TaoOrder> getIncrementTmallOrder(Long pageNo, Long pageSize,Date startTime, Date endTime,String url,String appKey,String appSecret, String sessionKey) throws ApiException {


        TaobaoClient client = new DefaultTaobaoClient(url, appKey, appSecret);

        TradesSoldIncrementGetRequest req = new TradesSoldIncrementGetRequest();
        req.setFields("tid,post_fee,receiver_name,receiver_state,receiver_city,receiver_district,receiver_address,receiver_mobile,receiver_phone,received_payment,num," +
                "type,status,payment,orders,rx_audit_status,sellerMemo,pay_time,created,buyer_nick");
        req.setStartModified(startTime);
        req.setEndModified(endTime);

        req.setType("fixed");//一口价
//        req.setExtType("service");
//        req.setRateStatus("RATE_UNBUYER");
//        req.setTag("time_card");
        req.setPageNo(pageNo);
        req.setPageSize(pageSize);
//        req.setUseHasNext(true);
//        req.setBuyerOpenId("AAHm5d-EAAeGwJedwSHpg8bT");
        TradesSoldIncrementGetResponse rsp = client.execute(req, sessionKey);
        System.out.println(rsp.getBody());

        if (rsp.getTrades() == null) {
            if (StringUtils.isEmpty(rsp.getErrorCode()) == false) {
                //接口查询错误
                return new TaoBaoOpenOrderUpdResult(500, "接口调用错误：" + rsp.getMsg() + rsp.getSubMsg());
            }
            if (rsp.getTotalResults() == 0) {
                return new TaoBaoOpenOrderUpdResult(rsp.getTotalResults().intValue(), new ArrayList<>());
            }
        }

        //组合的订单列表
        List<TaoOrder> orderList = new ArrayList<>();

        //有数据
        for (var trade : rsp.getTrades()) {
            try {
                TaoOrder order = new TaoOrder();
                order.setId(trade.getTid().toString());
                order.setOrderCreateTime(trade.getCreated());
                order.setOrderModifyTime(trade.getModified());
                order.setPayTime(trade.getPayTime());
                order.setTotalAmount(BigDecimal.valueOf(Double.parseDouble(trade.getPayment())));
                order.setShippingFee(BigDecimal.valueOf(Double.parseDouble(trade.getPostFee())));
                order.setPayAmount(BigDecimal.valueOf(Double.parseDouble(trade.getPayment())));
                order.setBuyerName(trade.getBuyerNick());
                order.setSellerMemo(trade.getSellerMemo());
                order.setProvince(trade.getReceiverState());
                order.setCity(trade.getReceiverCity());
                order.setDistrict(trade.getReceiverDistrict());
                order.setStatus(EnumTmallOrderStatus.getStatus(trade.getStatus()));
                order.setStatusStr(trade.getStatus());
                List<TaoOrderItem> items = new ArrayList<>();
                for (var item : trade.getOrders()) {
                    TaoOrderItem orderItem = new TaoOrderItem();
                    orderItem.setSpecNumber(item.getOuterSkuId());
                    orderItem.setGoodsNumber(item.getOuterIid());
                    orderItem.setProductImgUrl(item.getPicPath());
                    orderItem.setGoodsTitle(item.getTitle());
                    orderItem.setPrice(BigDecimal.valueOf(Double.parseDouble(item.getPayment())));
                    orderItem.setQuantity(item.getNum());
                    orderItem.setSubItemId(item.getOid().toString());
                    orderItem.setSkuInfo(item.getSkuPropertiesName());
                    orderItem.setItemAmount(BigDecimal.valueOf(Double.parseDouble(item.getPayment())));
                    orderItem.setRefundStatusStr(item.getRefundStatus());
                    items.add(orderItem);
                }
                order.setTaoOrderItemList(items);

                orderList.add(order);
            } catch (Exception e) {
            }
        }

        return new TaoBaoOpenOrderUpdResult(rsp.getTotalResults().intValue(), orderList);
    }

    /**
     * 拉取淘系退货订单
     * @param pageNo
     * @param pageSize
     * @param url
     * @param appKey
     * @param appSecret
     * @param sessionKey
     * @return
     * @throws ApiException
     */
    public static TaoBaoOpenOrderUpdResult<TaoOrderRefund> updTmallRefunOrder(Long pageNo, Long pageSize, String url, String appKey, String appSecret, String sessionKey) throws ApiException {
        TaobaoClient client = new DefaultTaobaoClient(url, appKey, appSecret);
        List<TaoOrderRefund> list = new ArrayList<>();

//        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
//        RefundGetRequest req1 = new RefundGetRequest();
//        req1.setFields("title,address,good_return_time,created");
//        req1.setRefundId(44929186648087305L);
//        RefundGetResponse rsp1 = client.execute(req1, sessionKey);
//        System.out.println(rsp1.getBody());
//        RefundsApplyGetRequest raReq = new RefundsApplyGetRequest();
//        raReq.setFields("refund_id, tid, title, buyer_nick, seller_nick, total_fee, status, created, refund_fee");
//        raReq.setPageNo(1L);
//        raReq.setPageSize(10L);
//////        raReq.setStatus("SUCCESS");
////
//        RefundsApplyGetResponse raRsp = client.execute(raReq,sessionKey);

        RefundsReceiveGetRequest req = new RefundsReceiveGetRequest();
        req.setFields("refund_id, tid, title, buyer_nick, seller_nick, total_fee, status, created,num, refund_fee, oid, good_status," +
                " company_name, sid, payment, reason, desc, has_good_return, modified, order_status,refund_phase,sku");
//        req.setStatus("WAIT_SELLER_AGREE");
//        req.setSellerNick("hz0799");
//        req.setBuyerNick("juan20108810");
//        req.setType("fixed");
//        req.setType("fixed");
        req.setPageNo(pageNo);
        req.setPageSize(pageSize);
        RefundsReceiveGetResponse rsp = client.execute(req, sessionKey);
        if (rsp.getTotalResults() > 0) {
            //查到了数据
            for (var item : rsp.getRefunds()) {
                //循环插入退货数据
                TaoOrderRefund tmallOrderRefund = new TaoOrderRefund();
//                tmallOrderRefund.setBuyer_nick(item.getBuyerNick());
                tmallOrderRefund.setCreated(DateUtil.dateToStamp(item.getCreated()));
                tmallOrderRefund.setRemark(item.getDesc());
                tmallOrderRefund.setGoodStatus(item.getGoodStatus());
                tmallOrderRefund.setHasGoodReturn(item.getHasGoodReturn() == true ? 1 : 0);
                tmallOrderRefund.setLogisticsCode(item.getSid());
                tmallOrderRefund.setLogisticsCompany(item.getCompanyName());
                tmallOrderRefund.setModified(DateUtils.dateToStamp(item.getModified()));
                tmallOrderRefund.setOid(item.getOid());
//                tmallOrderRefund.setOrderStatus(item.getOrderStatus());
                tmallOrderRefund.setReason(item.getReason());
                tmallOrderRefund.setRefundFee(BigDecimal.valueOf(Double.parseDouble(item.getRefundFee())));
                tmallOrderRefund.setRefundId(item.getRefundId());
                tmallOrderRefund.setStatus(item.getStatus());
                tmallOrderRefund.setTid(item.getTid());
//                tmallOrderRefund.setTotalFee(item.getTotalFee());
                tmallOrderRefund.setNum(item.getNum());
                tmallOrderRefund.setRefundPhase(item.getRefundPhase());
                list.add(tmallOrderRefund);
            }
        }
        return new TaoBaoOpenOrderUpdResult(rsp.getTotalResults().intValue(), list);
    }
}
