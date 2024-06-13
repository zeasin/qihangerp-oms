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
    private final JdOrderMapper jdOrderMapper;
    private final JdOrderItemMapper jdOrderItemMapper;
    private final JdGoodsSkuMapper jdGoodsSkuMapper;
    private final OmsTaoOrderMapper taoOrderMapper;
    private final OmsTaoOrderItemMapper taoOrderItemMapper;
    private final OmsTaoGoodsSkuMapper taoGoodsSkuMapper;

    @Transactional
    @Override
    public ResultVo<Integer> jdOrderMessage(String orderId) {
        log.info("京东订单消息处理"+orderId);
        List<JdOrder> jdOrders = jdOrderMapper.selectList(new LambdaQueryWrapper<JdOrder>().eq(JdOrder::getOrderId, orderId));
        if(jdOrders == null || jdOrders.size() == 0) {
            // 没有找到订单信息
            return ResultVo.error(ResultVoEnum.NotFound,"没有找到JD订单："+orderId);
        }
        JdOrder jdOrder = jdOrders.get(0);

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
            insert.setAmount(orderSellerPrice + freightPrice);
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

            List<JdOrderItem> jdOrderItems = jdOrderItemMapper.selectList(new LambdaQueryWrapper<JdOrderItem>().eq(JdOrderItem::getOrderId, jdOrder.getId()));
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

                    List<JdGoodsSku> jdGoodsSkus = jdGoodsSkuMapper.selectList(new LambdaQueryWrapper<JdGoodsSku>().eq(JdGoodsSku::getSkuId, item.getSkuId()));
                    if (jdGoodsSkus != null && !jdGoodsSkus.isEmpty()) {
                        erpGoodsId = jdGoodsSkus.get(0).getErpGoodsId();
                        erpSkuId = jdGoodsSkus.get(0).getErpSkuId();
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
            insert.setGoodsAmount(taoOrder.getTotalFee());
            insert.setAmount(taoOrder.getPayment().doubleValue());
            insert.setDiscountAmount(taoOrder.getDiscountFee().doubleValue());
            insert.setPostage(taoOrder.getPostFee().doubleValue());
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
}




