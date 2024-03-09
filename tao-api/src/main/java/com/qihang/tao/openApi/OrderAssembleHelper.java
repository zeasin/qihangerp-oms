package com.qihang.tao.openApi;

import com.qihang.tao.domain.TaoOrder;
import com.qihang.tao.domain.TaoOrderItem;
import com.taobao.api.domain.Trade;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class OrderAssembleHelper {
    /**
     * 组织订单
     * @param trade
     * @return
     */
    public static TaoOrder assembleOrder(Trade trade){
        try {
            TaoOrder order = new TaoOrder();
            order.setTid(trade.getTid());
            order.setTitle(trade.getTitle());
            order.setType(trade.getType());
            order.setSellerFlag(trade.getSellerFlag() + "");
            order.setHasBuyerMessage(trade.getHasBuyerMessage() + "");
            order.setCreditCardFee(trade.getCreditCardFee());
            order.setCreated(trade.getCreated());
            order.setModified(trade.getModified());
            order.setPayTime(trade.getPayTime());
//            order.setPrice(Double.parseDouble(trade.getPrice()));
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
            order.setSid(trade.getSid());
            order.setYfxFee(trade.getYfxFee());
            order.setHasYfx(trade.getHasYfx()+"");
//            order.setNumIid(trade.getNumIid() + "");
//            order.setNum(trade.getNum().intValue());
            order.setStatus(trade.getStatus());
            order.setConsignTime(trade.getConsignTime());
            order.setEndTime(trade.getEndTime());
            order.setOaid(trade.getOaid());
            List<TaoOrderItem> items = new ArrayList<>();
            for (var item : trade.getOrders()) {
                TaoOrderItem orderItem = new TaoOrderItem();
                orderItem.setTitle(item.getTitle());
                orderItem.setTid(trade.getTid());
                orderItem.setOid(item.getOid());
                orderItem.setTotalFee(BigDecimal.valueOf(Double.parseDouble(item.getTotalFee())));
                orderItem.setDiscountFee(BigDecimal.valueOf(Double.parseDouble(item.getDiscountFee())));
                orderItem.setAdjustFee(BigDecimal.valueOf(Double.parseDouble(item.getAdjustFee())));
                orderItem.setDivideOrderFee(Double.parseDouble(item.getDivideOrderFee()));
                orderItem.setPartMjzDiscount(Double.parseDouble(item.getPartMjzDiscount()));
                orderItem.setPayment(Double.parseDouble(item.getPayment()));
                orderItem.setPrice(BigDecimal.valueOf(Double.parseDouble(item.getPrice())));
                orderItem.setPicPath(item.getPicPath());
                orderItem.setNumIid(item.getNumIid());
                orderItem.setSkuId(item.getSkuId());
                orderItem.setOuterIid(item.getOuterIid());
                orderItem.setOuterSkuId(item.getOuterSkuId());
                orderItem.setSkuPropertiesName(item.getSkuPropertiesName());
                orderItem.setItemMealId(item.getItemMealId() == null ? "" : item.getItemMealId() + "");
                orderItem.setItemMealName(item.getItemMealName());
                orderItem.setNum(item.getNum().intValue());
                orderItem.setRefundStatus(item.getRefundStatus());
                orderItem.setStatus(item.getStatus());
                orderItem.setBuyerRate(item.getBuyerRate() + "");
                orderItem.setSellerRate(item.getSellerRate() + "");
                orderItem.setRefundId(item.getRefundId());
                orderItem.setSellerType(item.getSellerType());
                orderItem.setCid(item.getCid());
                orderItem.setEndTime(item.getEndTime());
                orderItem.setConsignTime(item.getConsignTime());
                orderItem.setShippingType(item.getShippingType());
                orderItem.setLogisticsCompany(item.getLogisticsCompany());
                orderItem.setInvoiceNo(item.getInvoiceNo());

                items.add(orderItem);
            }
            order.setItems(items);
            return order;
        }catch (Exception e){
            return null;
        }
    }
}
