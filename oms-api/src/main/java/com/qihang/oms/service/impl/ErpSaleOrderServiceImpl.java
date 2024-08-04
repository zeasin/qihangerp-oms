package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.JdOrderStateEnum;
import com.qihang.common.enums.TaoOrderStateEnum;
import com.qihang.common.utils.DateUtils;
import com.qihang.common.utils.StringUtils;
import com.qihang.oms.domain.*;
import com.qihang.oms.mapper.*;
import com.qihang.oms.service.ErpSaleOrderService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【erp_sale_order(订单表)】的数据库操作Service实现
* @createDate 2024-05-09 17:34:42
*/
@Log
@AllArgsConstructor
@Service
public class ErpSaleOrderServiceImpl extends ServiceImpl<ErpSaleOrderMapper, ErpSaleOrder>
    implements ErpSaleOrderService{

    private final ErpSaleOrderMapper orderMapper;
    private final ErpSaleOrderItemMapper orderItemMapper;
    private final OmsJdOrderMapper jdOrderMapper;
    private final OmsJdOrderItemMapper jdOrderItemMapper;
    private final OmsJdGoodsSkuMapper jdGoodsSkuMapper;
    private final OmsTaoOrderMapper taoOrderMapper;
    private final OmsTaoOrderItemMapper taoOrderItemMapper;
    private final OmsTaoGoodsSkuMapper taoGoodsSkuMapper;
    private final OmsPddOrderMapper pddOrderMapper;
    private final OmsPddOrderItemMapper pddOrderItemMapper;
    private final OmsPddGoodsSkuMapper pddGoodsSkuMapper;
    private final OmsDouOrderMapper douOrderMapper;
    private final OmsDouOrderItemMapper douOrderItemMapper;
    private final OmsDouGoodsSkuMapper douGoodsSkuMapper;
    private final OmsWeiOrderMapper weiOrderMapper;
    private final OmsWeiOrderItemMapper weiOrderItemMapper;
    private final OmsWeiGoodsSkuMapper weiGoodsSkuMapper;

    // 备货
    private final ErpShipStockUpMapper shipStockUpMapper;

    @Transactional
    @Override
    public ResultVo<Integer> jdOrderMessage(String orderId) {
        log.info("京东订单消息处理"+orderId);
        List<OmsJdOrder> jdOrders = jdOrderMapper.selectList(new LambdaQueryWrapper<OmsJdOrder>().eq(OmsJdOrder::getOrderId, orderId));
        if(jdOrders == null || jdOrders.size() == 0) {
            // 没有找到订单信息
            return ResultVo.error(ResultVoEnum.NotFound,"没有找到JD订单："+orderId);
        }
        OmsJdOrder jdOrder = jdOrders.get(0);

        List<ErpSaleOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<ErpSaleOrder>().eq(ErpSaleOrder::getOrderNum, orderId));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            ErpSaleOrder insert = new ErpSaleOrder();
            insert.setOrderNum(orderId);
            insert.setShopType(EnumShopType.JD.getIndex());
            insert.setShopId(jdOrder.getShopId());
            insert.setBuyerMemo(jdOrder.getOrderRemark());
            insert.setSellerMemo(jdOrder.getVenderRemark());
            // 状态
            int orderStatus = JdOrderStateEnum.getIndex(jdOrder.getOrderState());
            if (orderStatus == 11) {
                insert.setRefundStatus(2);
            } else if (orderStatus == -1) {
                insert.setRefundStatus(-1);
            } else {
                insert.setRefundStatus(1);
            }
            insert.setOrderStatus(orderStatus);

            insert.setGoodsAmount(StringUtils.isEmpty(jdOrder.getOrderTotalPrice()) ? 0.0 : Double.parseDouble(jdOrder.getOrderTotalPrice()));
            double orderSellerPrice = StringUtils.isEmpty(jdOrder.getOrderSellerPrice()) ? 0.0 : Double.parseDouble(jdOrder.getOrderSellerPrice());
            double freightPrice = StringUtils.isEmpty(jdOrder.getFreightPrice()) ? 0.0 : Double.parseDouble(jdOrder.getFreightPrice());
            insert.setOrderAmount(orderSellerPrice + freightPrice);
            insert.setPostage(freightPrice);
            insert.setPlatformDiscount(0.0);
            try {
            insert.setSellerDiscount(org.springframework.util.StringUtils.hasText(jdOrder.getSellerDiscount())?Double.parseDouble(jdOrder.getSellerDiscount()):0.0);
            }catch (Exception e){
                insert.setSellerDiscount(0.0);
            }
            insert.setReceiverName(jdOrder.getFullname());
            insert.setReceiverPhone(jdOrder.getMobile());
            insert.setAddress(jdOrder.getFullAddress());
            insert.setProvince(jdOrder.getProvince());
            insert.setCity(jdOrder.getCity());
            insert.setTown(jdOrder.getCounty());
            insert.setOrderTime(DateUtils.parseDate(jdOrder.getOrderStartTime()));
//            insert.setShipType(0);
            insert.setShipStatus(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");
            orderMapper.insert(insert);

            List<OmsJdOrderItem> jdOrderItems = jdOrderItemMapper.selectList(
                    new LambdaQueryWrapper<OmsJdOrderItem>().eq(OmsJdOrderItem::getOrderId, jdOrder.getOrderId()));

            if(jdOrderItems!=null && jdOrderItems.size()>0) {
                for (var item : jdOrderItems) {
                    ErpSaleOrderItem orderItem = new ErpSaleOrderItem();
                    orderItem.setOrderId(Long.parseLong(insert.getId()));
                    orderItem.setOriginalOrderId(orderId);
                    orderItem.setOriginalOrderItemId(item.getId().toString());
                    orderItem.setOriginalSkuId(item.getSkuId());
                    // TODO：这里将订单商品skuid转换成erp系统的skuid
                    Long erpGoodsId = 0L;
                    Long erpSkuId = 0L;

                    List<OmsJdGoodsSku> jdGoodsSkus = jdGoodsSkuMapper.selectList(new LambdaQueryWrapper<OmsJdGoodsSku>().eq(OmsJdGoodsSku::getSkuId, item.getSkuId()));
                    if (jdGoodsSkus != null && !jdGoodsSkus.isEmpty()) {
                        erpGoodsId = jdGoodsSkus.get(0).getErpGoodsId();
                        erpSkuId = jdGoodsSkus.get(0).getErpGoodsSkuId();
                        orderItem.setGoodsImg(jdGoodsSkus.get(0).getLogo());
                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSaleAttrs());
                        orderItem.setSpecNum(jdGoodsSkus.get(0).getOuterId());
                    }
                    orderItem.setGoodsId(erpGoodsId);
                    orderItem.setSpecId(erpSkuId);

                    orderItem.setGoodsTitle(item.getSkuName());
                    orderItem.setGoodsPrice(StringUtils.isEmpty(item.getJdPrice())?0.0:Double.parseDouble(item.getJdPrice()));
                    Integer quantity = StringUtils.isEmpty(item.getItemTotal())?0: Integer.parseInt(item.getItemTotal());
                    orderItem.setItemAmount(orderItem.getGoodsPrice() *quantity);
                    orderItem.setQuantity(quantity);
                    if(orderStatus == 11){
                        orderItem.setRefundStatus(2);
                        orderItem.setRefundCount(quantity);
                    }else if (orderStatus == -1) {

                    }else{
                        orderItem.setRefundStatus(1);
                        orderItem.setRefundCount(0);
                    }
                    orderItem.setShopId(jdOrder.getShopId());
                    orderItem.setShipStatus(0);
                    orderItem.setCreateTime(new Date());
                    orderItem.setCreateBy("ORDER_MESSAGE");
                    orderItemMapper.insert(orderItem);
                }
            }
        }else{
            // 修改订单 (修改：)
            ErpSaleOrder update = new ErpSaleOrder();
            update.setId(oOrders.get(0).getId());
            // 状态
            int orderStatus = JdOrderStateEnum.getIndex(jdOrder.getOrderState());
            if (orderStatus == 11) {
                update.setRefundStatus(2);
            } else if (orderStatus == -1) {
                update.setRefundStatus(-1);
            } else {
                update.setRefundStatus(1);
            }
            update.setOrderStatus(orderStatus);
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);
        }
        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> taoOrderMessage(String orderId) {
        log.info("Tao订单消息处理"+orderId);
        List<OmsTaoOrder> taoOrders = taoOrderMapper.selectList(new LambdaQueryWrapper<OmsTaoOrder>().eq(OmsTaoOrder::getTid, orderId));

        if(taoOrders == null || taoOrders.size() == 0) {
            // 没有找到订单信息
            return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO订单："+orderId);
        }
        OmsTaoOrder taoOrder = taoOrders.get(0);
        List<ErpSaleOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<ErpSaleOrder>().eq(ErpSaleOrder::getOrderNum, orderId));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            ErpSaleOrder insert = new ErpSaleOrder();
            insert.setOrderNum(orderId);
            insert.setShopType(EnumShopType.TAO.getIndex());
            insert.setShopId(taoOrder.getShopId());
            String buyerMemo = "";
            if(org.springframework.util.StringUtils.hasText(taoOrder.getBuyerMessage())){
                buyerMemo += taoOrder.getBuyerMessage();
            }
            if(org.springframework.util.StringUtils.hasText(taoOrder.getBuyerMemo())){
                buyerMemo += taoOrder.getBuyerMemo();
            }
            insert.setBuyerMemo(buyerMemo);
            insert.setSellerMemo(taoOrder.getSellerMemo());
            // 状态
            int orderStatus = TaoOrderStateEnum.getIndex(taoOrder.getStatus());
            if (orderStatus == 11) {
                insert.setRefundStatus(2);
            } else if (orderStatus == -1) {
                insert.setRefundStatus(-1);
            } else {
                insert.setRefundStatus(1);
            }
            insert.setOrderStatus(orderStatus);

            insert.setGoodsAmount(taoOrder.getPrice()!=null?taoOrder.getPrice():0.0);
            insert.setPlatformDiscount(0.0);
            insert.setSellerDiscount(taoOrder.getDiscountFee()!=null?taoOrder.getDiscountFee().doubleValue():0.0);
            insert.setPayAmount(taoOrder.getPayment()!=null?taoOrder.getPayment().doubleValue():0.0);
            insert.setOrderAmount(taoOrder.getTotalFee()!=null?taoOrder.getTotalFee():0.0);
            insert.setPostage(taoOrder.getPostFee()!=null?taoOrder.getPostFee().doubleValue():0.0);

            insert.setReceiverName(taoOrder.getReceiverName());
            insert.setReceiverPhone(taoOrder.getReceiverMobile());
            insert.setAddress(taoOrder.getReceiverAddress());
            insert.setProvince(taoOrder.getReceiverState());
            insert.setCity(taoOrder.getReceiverCity());
            insert.setTown(taoOrder.getReceiverDistrict());
            insert.setOrderTime(taoOrder.getCreated() );
//            insert.setShipType(0);
            insert.setShipStatus(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");
            orderMapper.insert(insert);

            List<OmsTaoOrderItem> taoOrderItems = taoOrderItemMapper.selectList(
                    new LambdaQueryWrapper<OmsTaoOrderItem>().eq(OmsTaoOrderItem::getTid, taoOrder.getTid()));
            if(taoOrderItems!=null && taoOrderItems.size()>0) {
                for (var item : taoOrderItems) {
                    ErpSaleOrderItem orderItem = new ErpSaleOrderItem();
                    orderItem.setOrderId(Long.parseLong(insert.getId()));
                    orderItem.setOriginalOrderId(orderId);
                    orderItem.setOriginalOrderItemId(item.getId().toString());
                    orderItem.setOriginalSkuId(item.getSkuId());
                    orderItem.setShopId(taoOrder.getShopId());
                    orderItem.setShipStatus(0);
                    // TODO：这里将订单商品skuid转换成erp系统的skuid
                    Long erpGoodsId = 0L;
                    Long erpSkuId = 0L;

                    List<OmsTaoGoodsSku> taoGoodsSku = taoGoodsSkuMapper.selectList(new LambdaQueryWrapper<OmsTaoGoodsSku>().eq(OmsTaoGoodsSku::getSkuId, item.getSkuId()));
                    if (taoGoodsSku != null && !taoGoodsSku.isEmpty()) {
                        erpGoodsId = taoGoodsSku.get(0).getErpGoodsId();
                        erpSkuId = taoGoodsSku.get(0).getErpGoodsSkuId();
//                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
//                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
                        orderItem.setSpecNum(taoGoodsSku.get(0).getOuterId());
//                        orderItem.setGoodsSpec(taoGoodsSku.get(0).getProperties());
                    }
                    orderItem.setGoodsId(erpGoodsId);
                    orderItem.setSpecId(erpSkuId);
                    orderItem.setGoodsImg(item.getPicPath());
                    orderItem.setGoodsSpec(item.getSkuPropertiesName());
                    orderItem.setGoodsTitle(item.getTitle());
                    orderItem.setGoodsPrice(item.getPrice().doubleValue());
                    orderItem.setItemAmount(item.getPayment());
                    orderItem.setQuantity(item.getNum());
                    if(orderStatus == 11){
                        orderItem.setRefundStatus(2);
                        orderItem.setRefundCount(item.getNum());
                    }else if (orderStatus == -1) {

                    }else{
                        orderItem.setRefundStatus(1);
                        orderItem.setRefundCount(0);
                    }
                    orderItem.setCreateTime(new Date());
                    orderItem.setCreateBy("ORDER_MESSAGE");
                    orderItemMapper.insert(orderItem);
                }
            }

        }else{
            // 修改订单 (修改：)
            // 修改订单 (修改：)
            ErpSaleOrder update = new ErpSaleOrder();
            update.setId(oOrders.get(0).getId());
            // 状态
            int orderStatus = TaoOrderStateEnum.getIndex(taoOrder.getStatus());
            if (orderStatus == 11) {
                update.setRefundStatus(2);
            } else if (orderStatus == -1) {
                update.setRefundStatus(-1);
            } else {
                update.setRefundStatus(1);
            }
            update.setOrderStatus(orderStatus);
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);
        }
        return ResultVo.success();
    }


    @Transactional
    @Override
    public ResultVo<Integer> pddOrderMessage(String orderId) {
        log.info("PDD订单消息处理"+orderId);
        List<OmsPddOrder> originOrders = pddOrderMapper.selectList(new LambdaQueryWrapper<OmsPddOrder>().eq(OmsPddOrder::getOrderSn, orderId));

        if(originOrders == null || originOrders.size() == 0) {
            // 没有找到订单信息
            return ResultVo.error(ResultVoEnum.NotFound,"没有找到PDD原始订单："+orderId);
        }
        OmsPddOrder originOrder = originOrders.get(0);
        List<ErpSaleOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<ErpSaleOrder>().eq(ErpSaleOrder::getOrderNum, orderId));
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            ErpSaleOrder insert = new ErpSaleOrder();
            insert.setOrderNum(originOrder.getOrderSn());
            insert.setShopType(EnumShopType.PDD.getIndex());
            insert.setShopId(originOrder.getShopId());
            insert.setBuyerMemo(originOrder.getBuyerMemo());
            insert.setSellerMemo(originOrder.getRemark());
            // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除
            int orderStatus = -1;
            int refundStatus = -1;
            if(originOrder.getRefundStatus()==1){
                // 没有售后
                orderStatus = originOrder.getOrderStatus();
                refundStatus = 1;
            }else{
                if(originOrder.getRefundStatus()==4){
                    refundStatus=4;
                    orderStatus = 11;
                }else{
                    refundStatus=originOrder.getRefundStatus();
                    orderStatus = 12;
                }
            }
            insert.setRefundStatus(refundStatus);
            insert.setOrderStatus(orderStatus);


            insert.setGoodsAmount(originOrder.getGoodsAmount());
            insert.setPostage(originOrder.getPostage());
            insert.setPlatformDiscount(originOrder.getPlatformDiscount());
            insert.setSellerDiscount(originOrder.getSellerDiscount());
            Double orderAmount =originOrder.getPayAmount();
            if(originOrder.getPlatformDiscount()!=null){
                orderAmount += originOrder.getPlatformDiscount();
            }
            insert.setOrderAmount(orderAmount);
            insert.setPayAmount(originOrder.getPayAmount());

            insert.setReceiverName(originOrder.getReceiverNameMask());
            insert.setReceiverPhone(originOrder.getReceiverPhoneMask());
            insert.setAddress(originOrder.getReceiverAddressMask());
            insert.setProvince(originOrder.getProvince());
            insert.setCity(originOrder.getCity());
            insert.setTown(originOrder.getTown());
            insert.setOrderTime(DateUtils.parseDate(originOrder.getCreatedTime()));
            insert.setShipType(0);
            insert.setShipStatus(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);
            // 插入orderItem
            addPddOrderItem(insert.getId(),originOrder.getOrderSn(), insert.getShopId(), orderStatus,refundStatus);

        }else{
            // 修改订单 (修改：)
            ErpSaleOrder update = new ErpSaleOrder();
            update.setId(oOrders.get(0).getId());
            // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除
            int orderStatus = -1;
            int refundStatus = -1;
            if(originOrder.getRefundStatus()==1){
                // 没有售后
                orderStatus = originOrder.getOrderStatus();
                refundStatus = 1;
            }else{
                if(originOrder.getRefundStatus()==4){
                    refundStatus=4;
                    orderStatus = 11;
                }else{
                    refundStatus=originOrder.getRefundStatus();
                    orderStatus = 12;
                }
            }
            update.setRefundStatus(refundStatus);
            update.setOrderStatus(orderStatus);
//            update.setGoodsAmount(originOrder.getGoodsAmount());
//            update.setPostFee(originOrder.getPostage());
//            update.setAmount(originOrder.getPayAmount());
//            update.setPayment(originOrder.getPayAmount());
            update.setReceiverName(originOrder.getReceiverNameMask());
            update.setReceiverPhone(originOrder.getReceiverPhoneMask());
            update.setAddress(originOrder.getReceiverAddressMask());

            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 删除orderItem
            orderItemMapper.delete(new LambdaQueryWrapper<ErpSaleOrderItem>().eq(ErpSaleOrderItem::getOrderId,update.getId()));
            // 插入orderItem
            addPddOrderItem(update.getId(),originOrder.getOrderSn(), oOrders.get(0).getShopId(), orderStatus,refundStatus);
        }
        return ResultVo.success();
    }

    private void addPddOrderItem(String oOrderId,String orderSn,Integer shopId,Integer orderStatus,Integer refundStatus){
        List<OmsPddOrderItem> originOrderItems = pddOrderItemMapper.selectList(new LambdaQueryWrapper<OmsPddOrderItem>().eq(OmsPddOrderItem::getOrderSn, orderSn));
        if(originOrderItems!=null && originOrderItems.size()>0) {
            for (var item : originOrderItems) {
                ErpSaleOrderItem orderItem = new ErpSaleOrderItem();
                orderItem.setOrderId(Long.parseLong(oOrderId));
                orderItem.setOriginalOrderId(orderSn);
                orderItem.setOriginalOrderItemId(item.getId().toString());
                orderItem.setOriginalSkuId(item.getSkuId().toString());
                orderItem.setShopId(shopId);
                orderItem.setShipStatus(0);
                // 这里将订单商品skuid转换成erp系统的skuid
                Long erpGoodsId = 0L;
                Long erpSkuId = 0L;

                List<OmsPddGoodsSku> pddGoodsSku = pddGoodsSkuMapper.selectList(new LambdaQueryWrapper<OmsPddGoodsSku>().eq(OmsPddGoodsSku::getSkuId, item.getSkuId()));
                if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
                    erpGoodsId = pddGoodsSku.get(0).getErpGoodsId();
                    erpSkuId = pddGoodsSku.get(0).getErpGoodsSkuId();
//                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
//                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
//                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
                }
                orderItem.setGoodsId(erpGoodsId);
                orderItem.setSpecId(erpSkuId);
                orderItem.setGoodsImg(item.getGoodsImg());
                orderItem.setGoodsSpec(item.getGoodsSpec());
                orderItem.setGoodsTitle(item.getGoodsName());
                orderItem.setGoodsPrice(item.getGoodsPrice());
                orderItem.setItemAmount(item.getGoodsPrice());
                orderItem.setQuantity(item.getGoodsCount());
                orderItem.setOrderStatus(orderStatus);
                orderItem.setRefundStatus(refundStatus);
                orderItem.setRefundCount(0);
                orderItem.setCreateTime(new Date());
                orderItem.setCreateBy("ORDER_MESSAGE");
                orderItemMapper.insert(orderItem);
            }
        }
    }

    @Transactional
    @Override
    public ResultVo<Integer> douOrderMessage(String orderId) {
        log.info("Dou订单消息处理"+orderId);
        List<OmsDouOrder> originOrders = douOrderMapper.selectList(new LambdaQueryWrapper<OmsDouOrder>().eq(OmsDouOrder::getOrderId, orderId));

        if(originOrders == null || originOrders.size() == 0) {
            // 没有找到订单信息
            return ResultVo.error(ResultVoEnum.NotFound,"没有找到DOU原始订单："+orderId);
        }
        OmsDouOrder originOrder = originOrders.get(0);

        List<ErpSaleOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<ErpSaleOrder>().eq(ErpSaleOrder::getOrderNum, orderId));
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            ErpSaleOrder insert = new ErpSaleOrder();
            insert.setOrderNum(originOrder.getOrderId());
            insert.setShopType(EnumShopType.DOU.getIndex());
            insert.setShopId(originOrder.getShopId().intValue());
            insert.setBuyerMemo(originOrder.getBuyerWords());
            insert.setSellerMemo(originOrder.getSellerWords());
            // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货
            // 抖店订单状态 1 待确认/待支付（订单创建完毕）105 已支付 2 备货中 101 部分发货 3 已发货（全部发货）4 已取消 5 已完成（已收货）
            int orderStatus = -1;
            int refundStatus = -1;
            if(originOrder.getOrderStatus()==1){
                // 1待确认/待支付（订单创建完毕）
                orderStatus = 21;
                refundStatus = 1;
            }else if(originOrder.getOrderStatus()==105){
                // 105 已支付
                orderStatus = 0;
                refundStatus = 1;
            }else if(originOrder.getOrderStatus()==2){
                // 105 已支付
                orderStatus = 1;
                refundStatus = 1;
            }else if(originOrder.getOrderStatus()==101){
                // 101 部分发货
                orderStatus = 101;
                refundStatus = 1;
            }else if(originOrder.getOrderStatus()==3){
                //  3 已发货（全部发货）
                orderStatus = 2;
                refundStatus = 1;
            }else if(originOrder.getOrderStatus()==4){
                //  4 已取消
                orderStatus = 11;
                refundStatus = 1;
            }else if(originOrder.getOrderStatus()==5){
                //  5 已完成（已收货）
                orderStatus = 3;
                refundStatus = 1;
            }

            insert.setRefundStatus(refundStatus);
            insert.setOrderStatus(orderStatus);

            insert.setGoodsAmount(originOrder.getOrderAmount()!=null?originOrder.getOrderAmount().doubleValue()/100:0.0);
            insert.setPostage(originOrder.getPostAmount()!=null?originOrder.getPostAmount().doubleValue()/100:0.0);
            insert.setSellerDiscount(originOrder.getPromotionShopAmount()!=null?originOrder.getPromotionShopAmount().doubleValue()/100:0.0);
            insert.setPlatformDiscount(originOrder.getPromotionPlatformAmount()!=null?originOrder.getPromotionPlatformAmount().doubleValue()/100:0.0);
            insert.setOrderAmount(originOrder.getOrderAmount()!=null?originOrder.getOrderAmount().doubleValue()/100:0.0);
            insert.setPayAmount(originOrder.getPayAmount()!=null?originOrder.getPayAmount().doubleValue()/100:0.0);

            insert.setReceiverName(originOrder.getMaskPostReceiver());
            insert.setReceiverPhone(originOrder.getMaskPostTel());
            insert.setAddress(originOrder.getMaskPostAddress());
            insert.setProvince(originOrder.getProvinceName());
            insert.setCity(originOrder.getCityName());
            insert.setTown(originOrder.getTownName());
            long time = originOrder.getCreateTime().longValue() * 1000;
            insert.setOrderTime(new Date(time));
            insert.setShipType(0);
            insert.setShipStatus(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);
            // 插入orderItem
            addDouOrderItem(insert.getId(),originOrder.getOrderId(),insert.getShopId(),orderStatus,refundStatus);

        }else{
            // 修改订单 (修改：)
            ErpSaleOrder update = new ErpSaleOrder();
            update.setId(oOrders.get(0).getId());
            // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货
            // 抖店订单状态 1 待确认/待支付（订单创建完毕）105 已支付 2 备货中 101 部分发货 3 已发货（全部发货）4 已取消 5 已完成（已收货）
            int orderStatus = -1;
            int refundStatus = -1;
            if(originOrder.getOrderStatus()==1){
                // 1待确认/待支付（订单创建完毕）
                orderStatus = 21;
                refundStatus = 1;
            }else if(originOrder.getOrderStatus()==105){
                // 105 已支付
                orderStatus = 0;
                refundStatus = 1;
            }else if(originOrder.getOrderStatus()==2){
                // 105 已支付
                orderStatus = 1;
                refundStatus = 1;
            }else if(originOrder.getOrderStatus()==101){
                // 101 部分发货
                orderStatus = 101;
                refundStatus = 1;
            }else if(originOrder.getOrderStatus()==3){
                //  3 已发货（全部发货）
                orderStatus = 2;
                refundStatus = 1;
            }else if(originOrder.getOrderStatus()==4){
                //  4 已取消
                orderStatus = 11;
                refundStatus = 1;
            }else if(originOrder.getOrderStatus()==5){
                //  5 已完成（已收货）
                orderStatus = 3;
                refundStatus = 1;
            }
            update.setRefundStatus(refundStatus);
            update.setOrderStatus(orderStatus);
//            long time = originOrder.getCreateTime().longValue() * 1000;
//            update.setOrderTime(new Date(time));
//            update.setGoodsAmount(originOrder.getOrderAmount().doubleValue()/100);
//            update.setPostFee(originOrder.getPostAmount().doubleValue()/100);
//            update.setAmount(originOrder.getOrderAmount().doubleValue()/100);
//            update.setPayment(originOrder.getPayAmount().doubleValue()/100);
            update.setReceiverName(originOrder.getMaskPostReceiver());
            update.setReceiverPhone(originOrder.getMaskPostTel());
            update.setAddress(originOrder.getMaskPostAddress());


            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 删除orderItem
            orderItemMapper.delete(new LambdaQueryWrapper<ErpSaleOrderItem>().eq(ErpSaleOrderItem::getOrderId,update.getId()));
            // 插入orderItem
            addDouOrderItem(update.getId(),originOrder.getOrderId(),update.getShopId(),orderStatus,refundStatus);
        }
        return ResultVo.success();
    }
    private void addDouOrderItem(String oOrderId,String originOrderId,Integer shopId,Integer orderStatus,Integer refundStatus){
        List<OmsDouOrderItem> originOrderItems = douOrderItemMapper.selectList(new LambdaQueryWrapper<OmsDouOrderItem>().eq(OmsDouOrderItem::getParentOrderId, originOrderId));
        if(originOrderItems!=null && originOrderItems.size()>0) {
            for (var item : originOrderItems) {
//                OOrderItem orderItem = new OOrderItem();
//                orderItem.setOrderId(oOrderId);
//                orderItem.setOrderNum(item.getParentOrderId());
//                orderItem.setSubOrderNum(item.getOrderId());
                ErpSaleOrderItem orderItem = new ErpSaleOrderItem();
                orderItem.setOrderId(Long.parseLong(oOrderId));
                orderItem.setOriginalOrderId(item.getParentOrderId());
                orderItem.setOriginalOrderItemId(item.getOrderId());
                orderItem.setOriginalSkuId(item.getSkuId().toString());
                orderItem.setShopId(shopId);
                orderItem.setShipStatus(0);
                // 这里将订单商品skuid转换成erp系统的skuid
                Long erpGoodsId = 0L;
                Long erpSkuId = 0L;

                OmsDouGoodsSku douGoodsSku = douGoodsSkuMapper.selectById(item.getSkuId());
                if (douGoodsSku != null ) {
                    erpGoodsId = douGoodsSku.getErpGoodsId();
                    erpSkuId = douGoodsSku.getErpGoodsSkuId();
//                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
//                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
//                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
                }
//                List<DouGoodsSku> douGoodsSku = douGoodsSkuMapper.selectList(new LambdaQueryWrapper<DouGoodsSku>().eq(DouGoodsSku::getId, item.getSkuId()));
//                if (douGoodsSku != null && !douGoodsSku.isEmpty()) {
//                    erpGoodsId = douGoodsSku.get(0).getOGoodsId();
//                    erpSkuId = douGoodsSku.get(0).getOGoodsSkuId();
////                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
////                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
////                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
//                }

                orderItem.setGoodsId(erpGoodsId);
                orderItem.setSpecId(erpSkuId);
                orderItem.setGoodsImg(item.getProductPic());
                if(org.springframework.util.StringUtils.hasText(item.getSpec())) {
                    orderItem.setGoodsSpec(item.getSpec().length()>500?item.getSpec().substring(0,499):item.getSpec());
                }
                orderItem.setGoodsTitle(item.getProductName());
                orderItem.setGoodsPrice(item.getOriginAmount().doubleValue()/100);
                orderItem.setItemAmount(item.getOrderAmount().doubleValue()/100);
                orderItem.setQuantity(item.getItemNum());
                orderItem.setOrderStatus(orderStatus);
                orderItem.setRefundStatus(refundStatus);
                orderItem.setRefundCount(0);
                orderItem.setCreateTime(new Date());
                orderItem.setCreateBy("ORDER_MESSAGE");
                orderItemMapper.insert(orderItem);
            }
        }
    }


    @Transactional
    @Override
    public ResultVo<Integer> weiOrderMessage(String orderId) {
        log.info("Wei订单消息处理"+orderId);
        List<OmsWeiOrder> originOrders = weiOrderMapper.selectList(new LambdaQueryWrapper<OmsWeiOrder>().eq(OmsWeiOrder::getOrderId, orderId));

        if(originOrders == null || originOrders.size() == 0) {
            // 没有找到订单信息
            return ResultVo.error(ResultVoEnum.NotFound,"没有找到WEI原始订单："+orderId);
        }
        OmsWeiOrder originOrder = originOrders.get(0);

        List<ErpSaleOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<ErpSaleOrder>().eq(ErpSaleOrder::getOrderNum, orderId));
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            ErpSaleOrder insert = new ErpSaleOrder();
            insert.setOrderNum(originOrder.getOrderId());
            insert.setShopType(EnumShopType.WEI.getIndex());
            insert.setShopId(originOrder.getShopId());
            insert.setBuyerMemo("");
            insert.setSellerMemo("");
            // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货
            Integer orderStatus = null;
            Integer refundStatus = null;
            //状态 10	待付款；20	待发货；21	部分发货；30	待收货；100	完成；200	全部商品售后之后，订单取消；250	未付款用户主动取消或超时未付款订单自动取消；
            if(originOrder.getStatus() == 10){
                orderStatus = 21;
                refundStatus = 1;
            } else if (originOrder.getStatus() == 20 || originOrder.getStatus() == 21) {
                orderStatus = 1;
                refundStatus = 1;
            } else if (originOrder.getStatus() == 30) {
                orderStatus = 2;
                refundStatus = 1;
            } else if (originOrder.getStatus() == 100) {
                orderStatus = 3;
                refundStatus = 1;
            }else if (originOrder.getStatus() == 200 || originOrder.getStatus() == 250) {
                orderStatus = 11;
                refundStatus = 4;
            }

            insert.setRefundStatus(refundStatus);
            insert.setOrderStatus(orderStatus);

            insert.setGoodsAmount(originOrder.getProductPrice()!=null?originOrder.getProductPrice().doubleValue()/100:0.0);
            insert.setPostage(originOrder.getFreight()!=null?originOrder.getFreight().doubleValue()/100:0.0);
            insert.setSellerDiscount(originOrder.getDiscountedPrice()!=null?originOrder.getDiscountedPrice().doubleValue()/100:0.0);
            insert.setPlatformDiscount(0.0);
            insert.setOrderAmount(originOrder.getOrderPrice()!=null?originOrder.getOrderPrice().doubleValue()/100:0.0);
            insert.setPayAmount(originOrder.getOrderPrice()!=null?originOrder.getOrderPrice().doubleValue()/100:0.0);

            insert.setReceiverName(originOrder.getUserName());
            insert.setReceiverPhone(originOrder.getTelNumber());
            insert.setAddress(originOrder.getDetailInfo());
            insert.setProvince(originOrder.getProvinceName());
            insert.setCity(originOrder.getCityName());
            insert.setTown(originOrder.getCountyName());
            long time = originOrder.getCreateTime().longValue() * 1000;
            insert.setOrderTime(new Date(time));
            insert.setShipType(0);
            insert.setShipStatus(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);
            // 插入orderItem
            addWeiOrderItem(insert.getId(),originOrder.getOrderId(),originOrder.getShopId(),orderStatus,refundStatus);
        } else{
            // 修改订单 (修改：)
            ErpSaleOrder update = new ErpSaleOrder();
            update.setId(oOrders.get(0).getId());
            // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货
            Integer orderStatus = null;
            Integer refundStatus = null;
            //状态 10	待付款；20	待发货；21	部分发货；30	待收货；100	完成；200	全部商品售后之后，订单取消；250	未付款用户主动取消或超时未付款订单自动取消；
            if(originOrder.getStatus() == 10){
                orderStatus = 21;
                refundStatus = 1;
            } else if (originOrder.getStatus() == 20 || originOrder.getStatus() == 21) {
                orderStatus = 1;
                refundStatus = 1;
            } else if (originOrder.getStatus() == 30) {
                orderStatus = 2;
                refundStatus = 1;
            } else if (originOrder.getStatus() == 100) {
                orderStatus = 3;
                refundStatus = 1;
            }else if (originOrder.getStatus() == 200 || originOrder.getStatus() == 250) {
                orderStatus = 11;
                refundStatus = 4;
            }

            update.setRefundStatus(refundStatus);
            update.setOrderStatus(orderStatus);
//            long time = originOrder.getCreateTime().longValue() * 1000;
//            update.setOrderTime(new Date(time));
//            update.setGoodsAmount(originOrder.getOrderAmount().doubleValue()/100);
//            update.setPostFee(originOrder.getPostAmount().doubleValue()/100);
//            update.setAmount(originOrder.getOrderAmount().doubleValue()/100);
//            update.setPayment(originOrder.getPayAmount().doubleValue()/100);
            update.setReceiverName(originOrder.getUserName());
            update.setReceiverPhone(originOrder.getTelNumber());
            update.setAddress(originOrder.getDetailInfo());
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 删除orderItem
            orderItemMapper.delete(new LambdaQueryWrapper<ErpSaleOrderItem>().eq(ErpSaleOrderItem::getOrderId,update.getId()));
            // 插入orderItem
            addWeiOrderItem(update.getId(),originOrder.getOrderId(),update.getShopId(),orderStatus,refundStatus);
        }
        return ResultVo.success();
    }

    private void addWeiOrderItem(String oOrderId,String originOrderId,Integer shopId,Integer orderStatus,Integer refundStatus){
        List<OmsWeiOrderItem> originOrderItems = weiOrderItemMapper.selectList(new LambdaQueryWrapper<OmsWeiOrderItem>().eq(OmsWeiOrderItem::getOrderId, originOrderId));
        if(originOrderItems!=null && originOrderItems.size()>0) {
            for (var item : originOrderItems) {
//                OOrderItem orderItem = new OOrderItem();
//                orderItem.setOrderId(oOrderId);
//                orderItem.setOrderNum(item.getParentOrderId());
//                orderItem.setSubOrderNum(item.getOrderId());
                ErpSaleOrderItem orderItem = new ErpSaleOrderItem();
                orderItem.setOrderId(Long.parseLong(oOrderId));
                orderItem.setOriginalOrderId(item.getOrderId());
                orderItem.setOriginalOrderItemId(item.getId().toString());
                orderItem.setOriginalSkuId(item.getSkuId().toString());
                orderItem.setShopId(shopId);
                orderItem.setShipStatus(0);
                // 这里将订单商品skuid转换成erp系统的skuid
                Long erpGoodsId = 0L;
                Long erpSkuId = 0L;
                String skuAttr = "";
                List<OmsWeiGoodsSku> weiGoodsSkuList = weiGoodsSkuMapper.selectList(new LambdaQueryWrapper<OmsWeiGoodsSku>().eq(OmsWeiGoodsSku::getSkuId,item.getSkuId()));
                if (weiGoodsSkuList != null && weiGoodsSkuList.size()>0) {
                    erpGoodsId = weiGoodsSkuList.get(0).getErpGoodsId();
                    erpSkuId = weiGoodsSkuList.get(0).getErpGoodsSkuId();
                    skuAttr = weiGoodsSkuList.get(0).getSkuAttr();
//                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
//                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
//                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
                }

                orderItem.setGoodsId(erpGoodsId);
                orderItem.setSpecId(erpSkuId);
                orderItem.setGoodsImg(item.getThumbImg());
                orderItem.setGoodsSpec(org.springframework.util.StringUtils.hasText(skuAttr)?skuAttr:item.getSkuAttrs());

                orderItem.setGoodsTitle(item.getTitle());
                orderItem.setGoodsPrice(item.getSalePrice()!=null?item.getSalePrice().doubleValue()/100:0.0);
                orderItem.setItemAmount(item.getSalePrice()!=null?item.getSalePrice().doubleValue()/100:0.0);
                orderItem.setQuantity(item.getSkuCnt());
                orderItem.setOrderStatus(orderStatus);
                orderItem.setRefundStatus(refundStatus);
                orderItem.setRefundCount(0);
                orderItem.setCreateTime(new Date());
                orderItem.setCreateBy("ORDER_MESSAGE");
                orderItemMapper.insert(orderItem);
            }
        }
    }

    @Override
    public List<ErpSaleOrder> getList(ErpSaleOrder order) {
        return orderMapper.selectList(new LambdaQueryWrapper<>());
    }

    @Override
    public PageResult<ErpSaleOrder> queryPageList(ErpSaleOrder bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpSaleOrder> queryWrapper = new LambdaQueryWrapper<ErpSaleOrder>()
                .eq(bo.getShopId()!=null,ErpSaleOrder::getShopId,bo.getShopId())
                .eq(org.springframework.util.StringUtils.hasText(bo.getOrderNum()),ErpSaleOrder::getOrderNum,bo.getOrderNum())
                .eq(org.springframework.util.StringUtils.hasText(bo.getShippingNumber()),ErpSaleOrder::getShippingNumber,bo.getShippingNumber())
                .eq(org.springframework.util.StringUtils.hasText(bo.getReceiverName()),ErpSaleOrder::getReceiverName,bo.getReceiverName())
                .like(org.springframework.util.StringUtils.hasText(bo.getReceiverPhone()),ErpSaleOrder::getReceiverPhone,bo.getReceiverPhone())
                ;
        Page<ErpSaleOrder> pages = orderMapper.selectPage(pageQuery.build(), queryWrapper);

        // 查询子订单
        if(pages.getRecords()!=null){
            for (var order:pages.getRecords()) {
                order.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<ErpSaleOrderItem>().eq(ErpSaleOrderItem::getOrderId, order.getId())));
            }
        }

        return PageResult.build(pages);
    }

    @Override
    public ErpSaleOrder queryDetailById(Long id) {
        ErpSaleOrder erpSaleOrder = orderMapper.selectById(id);
        if(erpSaleOrder!=null){
            erpSaleOrder.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<ErpSaleOrderItem>().eq(ErpSaleOrderItem::getOrderId, id)));
        }
        return erpSaleOrder;
    }




    @Transactional
    @Override
    public ResultVo<Integer> orderSendConfirm(Long shopId, String orderId,String logisticsCompanyCode,String waybillCode) {
        List<ErpSaleOrder> erpSaleOrders = orderMapper.selectList(new LambdaQueryWrapper<ErpSaleOrder>().eq(ErpSaleOrder::getShopId, shopId).eq(ErpSaleOrder::getOrderNum, orderId));
        if(erpSaleOrders!=null && erpSaleOrders.size()>0){
            // 更新erp sale order 订单表发货状态
            if(erpSaleOrders.get(0).getShipStatus()!=3){
                //2是已发货
                ErpSaleOrder update = new ErpSaleOrder();
                update.setId(erpSaleOrders.get(0).getId());
                update.setOrderStatus(2);
                update.setShippingCompany(logisticsCompanyCode);
                update.setShippingNumber(waybillCode);
                update.setShippingCost(BigDecimal.ZERO);
                update.setShippingMan("消息通知发货完成");
                update.setShippingTime(new Date());
                update.setShipStatus(3);

                update.setUpdateTime(new Date());
                update.setUpdateBy("消息通知发货完成");
                orderMapper.updateById(update);
            }
            // 更新备货表相关订单状态erp_ship_stock_up
            ErpShipStockUp shipStockUp = new ErpShipStockUp();
            shipStockUp.setUpdateBy("消息通知发货完成");
            shipStockUp.setUpdateTime(new Date());
            shipStockUp.setStatus(3);//状态0待备货1备货中2已出库3已发货
            shipStockUpMapper.update(shipStockUp,new LambdaQueryWrapper<ErpShipStockUp>().eq(ErpShipStockUp::getSaleOrderId,erpSaleOrders.get(0).getId()));

        }

        return ResultVo.success();
    }

    /**
     * 订单备货
     *
     * @param shopId
     * @param orderId
     * @return
     */
    @Override
    public ResultVo<Integer> orderShipStockUp(Long shopId, String orderId) {
        List<ErpSaleOrder> erpSaleOrders = orderMapper.selectList(new LambdaQueryWrapper<ErpSaleOrder>().eq(ErpSaleOrder::getShopId, shopId).eq(ErpSaleOrder::getOrderNum, orderId));
        if(erpSaleOrders!=null && erpSaleOrders.size()>0){
            // 查处item
            List<ErpSaleOrderItem> items = orderItemMapper.selectList(new LambdaQueryWrapper<ErpSaleOrderItem>().eq(ErpSaleOrderItem::getOrderId, erpSaleOrders.get(0).getId()));
            if(items!=null&& items.size()>0){
                for (var item:items) {
                    List<ErpShipStockUp> erpShipStockUps = shipStockUpMapper.selectList(new LambdaQueryWrapper<ErpShipStockUp>().eq(ErpShipStockUp::getSaleOrderItemId, item.getId()));
                    if(erpShipStockUps==null || erpShipStockUps.size()==0) {
                        ErpShipStockUp shipStockUp = new ErpShipStockUp();
                        shipStockUp.setShopId(erpSaleOrders.get(0).getShopId().longValue());
                        shipStockUp.setSaleOrderId(item.getOrderId());
                        shipStockUp.setSaleOrderItemId(item.getId());
                        shipStockUp.setOrderNum(erpSaleOrders.get(0).getOrderNum());
                        shipStockUp.setOriginalSkuId(item.getOriginalSkuId());
                        shipStockUp.setGoodsId(item.getGoodsId());
                        shipStockUp.setSpecId(item.getSpecId());
                        shipStockUp.setGoodsTitle(item.getGoodsTitle());
                        shipStockUp.setGoodsImg(item.getGoodsImg());
                        shipStockUp.setGoodsSpec(item.getGoodsSpec());
                        shipStockUp.setGoodsNum(item.getGoodsNum());
                        shipStockUp.setSpecNum(item.getSpecNum());
                        shipStockUp.setQuantity(item.getQuantity());
                        shipStockUp.setStatus(0);//状态0待备货1备货中2已出库3已发货
                        shipStockUp.setCreateBy("消息通知备货");
                        shipStockUp.setCreateTime(new Date());
                        shipStockUpMapper.insert(shipStockUp);
                    }
                }
            }
        }
        return ResultVo.success();
    }
}




