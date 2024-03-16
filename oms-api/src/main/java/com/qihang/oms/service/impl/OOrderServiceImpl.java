package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.JdOrderStateEnum;
import com.qihang.common.utils.DateUtils;
import com.qihang.common.utils.StringUtils;
import com.qihang.oms.domain.*;
import com.qihang.oms.mapper.*;
import com.qihang.oms.service.OOrderService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
* @author qilip
* @description 针对表【o_order(订单表)】的数据库操作Service实现
* @createDate 2024-03-09 13:15:57
*/
@Log
@AllArgsConstructor
@Service
public class OOrderServiceImpl extends ServiceImpl<OOrderMapper, OOrder>
    implements OOrderService {

    private final OOrderMapper orderMapper;
    private final OOrderItemMapper orderItemMapper;
    private final JdOrderMapper jdOrderMapper;
    private final JdOrderItemMapper jdOrderItemMapper;
    private final JdGoodsSkuMapper jdGoodsSkuMapper;
    private final TaoOrderMapper taoOrderMapper;
    private final TaoOrderItemMapper taoOrderItemMapper;
    private final TaoGoodsSkuMapper taoGoodsSkuMapper;

    @Transactional
    @Override
    public ResultVo<Integer> jdOrderMessage(String orderId) {
        log.info("京东订单消息处理"+orderId);
        List<JdOrder> jdOrders = jdOrderMapper.selectList(new LambdaQueryWrapper<JdOrder>().eq(JdOrder::getOrderId, orderId));
        if(jdOrders == null || jdOrders.size() == 0) {
            // 没有找到订单信息
            return new ResultVo<>(ResultVoEnum.NotFound,"没有找到JD订单："+orderId);
        }
        JdOrder jdOrder = jdOrders.get(0);

        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            OOrder insert = new OOrder();
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
            insert.setAmount(orderSellerPrice + freightPrice);
            insert.setReceiverName(jdOrder.getFullname());
            insert.setReceiverMobile(jdOrder.getMobile());
            insert.setAddress(jdOrder.getFullAddress());
            insert.setProvince(jdOrder.getProvince());
            insert.setCity(jdOrder.getCity());
            insert.setTown(jdOrder.getCounty());
            insert.setOrderTime(DateUtils.parseDate(jdOrder.getOrderStartTime()));
            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");
            orderMapper.insert(insert);

            List<JdOrderItem> jdOrderItems = jdOrderItemMapper.selectList(new LambdaQueryWrapper<JdOrderItem>().eq(JdOrderItem::getOrderId, jdOrder.getId()));
            if(jdOrderItems!=null && jdOrderItems.size()>0) {
                for (var item : jdOrderItems) {
                    OOrderItem orderItem = new OOrderItem();
                    orderItem.setOrderId(insert.getId());
                    orderItem.setSubOrderNum(item.getId().toString());
                    // TODO：这里将订单商品skuid转换成erp系统的skuid
                    Long erpGoodsId = 0L;
                    Long erpSkuId = 0L;

                    List<JdGoodsSku> jdGoodsSkus = jdGoodsSkuMapper.selectList(new LambdaQueryWrapper<JdGoodsSku>().eq(JdGoodsSku::getSkuId, item.getSkuId()));
                    if (jdGoodsSkus != null && !jdGoodsSkus.isEmpty()) {
                        erpGoodsId = jdGoodsSkus.get(0).getErpGoodsId();
                        erpSkuId = jdGoodsSkus.get(0).getErpSkuId();
                        orderItem.setGoodsImg(jdGoodsSkus.get(0).getLogo());
                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
                        orderItem.setSkuNum(jdGoodsSkus.get(0).getOuterId());
                    }
                    orderItem.setSkuId(item.getSkuId());
                    orderItem.setErpGoodsId(erpGoodsId);
                    orderItem.setErpSkuId(erpSkuId);
//                    orderItem.setGoodsId(erpGoodsId);
//                    orderItem.setSkuId(erpSkuId);
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
                    orderItem.setCreateTime(new Date());
                    orderItem.setCreateBy("ORDER_MESSAGE");
                    orderItemMapper.insert(orderItem);
                }
            }
        }else{
            // 修改订单 (修改：)
            OOrder update = new OOrder();
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
        return null;
    }

    @Override
    public ResultVo<Integer> taoOrderMessage(String orderId) {
        log.info("Tao订单消息处理"+orderId);
        List<TaoOrder> taoOrders = taoOrderMapper.selectList(new LambdaQueryWrapper<TaoOrder>().eq(TaoOrder::getTid, orderId));

        if(taoOrders == null || taoOrders.size() == 0) {
            // 没有找到订单信息
            return new ResultVo<>(ResultVoEnum.NotFound,"没有找到TAO订单："+orderId);
        }
        TaoOrder taoOrder = taoOrders.get(0);
        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            OOrder insert = new OOrder();

            List<TaoOrderItem> taoOrderItems = taoOrderItemMapper.selectList(new LambdaQueryWrapper<TaoOrderItem>().eq(TaoOrderItem::getTid, taoOrder.getTid()));
            if(taoOrderItems!=null && taoOrderItems.size()>0) {
                for (var item : taoOrderItems) {
                    OOrderItem orderItem = new OOrderItem();
                    orderItem.setOrderId(insert.getId());
                    orderItem.setSubOrderNum(item.getTid().toString());
                    // TODO：这里将订单商品skuid转换成erp系统的skuid
                    Long erpGoodsId = 0L;
                    Long erpSkuId = 0L;

                    List<TaoGoodsSku> taoGoodsSku = taoGoodsSkuMapper.selectList(new LambdaQueryWrapper<TaoGoodsSku>().eq(TaoGoodsSku::getSkuId, item.getSkuId()));
                    if (taoGoodsSku != null && !taoGoodsSku.isEmpty()) {
                        erpGoodsId = taoGoodsSku.get(0).getErpGoodsId();
                        erpSkuId = taoGoodsSku.get(0).getErpGoodsSkuId();
//                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
//                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
                        orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
                    }
                }
            }

        }else{
            // 修改订单 (修改：)
        }
        return null;
    }
}




