package com.qihang.wei.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.wei.bo.WeiOrderConfirmBo;
import com.qihang.wei.domain.OmsWeiOrder;
import com.qihang.wei.domain.OmsWeiOrderItem;
import com.qihang.wei.mapper.OmsWeiGoodsSkuMapper;
import com.qihang.wei.mapper.OmsWeiOrderItemMapper;
import com.qihang.wei.service.OmsWeiOrderService;
import com.qihang.wei.mapper.OmsWeiOrderMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【oms_wei_order】的数据库操作Service实现
* @createDate 2024-06-03 16:48:31
*/
@AllArgsConstructor
@Service
public class OmsWeiOrderServiceImpl extends ServiceImpl<OmsWeiOrderMapper, OmsWeiOrder>
    implements OmsWeiOrderService{
    private final OmsWeiOrderMapper mapper;
    private final OmsWeiOrderItemMapper itemMapper;
    private final OmsWeiGoodsSkuMapper goodsSkuMapper;
//    private final MQClientService mqClientService;

    @Override
    public PageResult<OmsWeiOrder> queryPageList(OmsWeiOrder bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OmsWeiOrder> queryWrapper = new LambdaQueryWrapper<OmsWeiOrder>()
                .eq(bo.getShopId()!=null,OmsWeiOrder::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderId()),OmsWeiOrder::getOrderId,bo.getOrderId())
                ;

        Page<OmsWeiOrder> page = mapper.selectPage(pageQuery.build(), queryWrapper);
        if(page.getRecords()!=null){
            for (var order:page.getRecords()) {
                order.setItems(itemMapper.selectList(new LambdaQueryWrapper<OmsWeiOrderItem>().eq(OmsWeiOrderItem::getOrderId,order.getOrderId())));
            }
        }
        return PageResult.build(page);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveOrder(Long shopId, OmsWeiOrder order) {
        try {
            List<OmsWeiOrder> orders = mapper.selectList(new LambdaQueryWrapper<OmsWeiOrder>().eq(OmsWeiOrder::getOrderId, order.getOrderId()));
            if (orders != null && orders.size() > 0) {
                // 存在，修改
                OmsWeiOrder update = new OmsWeiOrder();
                update.setId(orders.get(0).getId());
                update.setOrderId(order.getOrderId());
                update.setStatus(order.getStatus());
                update.setUpdateTime(order.getUpdateTime());
                update.setPayInfo(order.getPayInfo());
                update.setAftersaleDetail(order.getAftersaleDetail());
                update.setDeliveryProductInfo(order.getDeliveryProductInfo());

                mapper.updateById(update);
                // 更新item
                for (var item : order.getItems()) {
                    List<OmsWeiOrderItem> taoOrderItems = itemMapper.selectList(
                            new LambdaQueryWrapper<OmsWeiOrderItem>().eq(OmsWeiOrderItem::getSkuId, item.getSkuId()).eq(OmsWeiOrderItem::getOrderId,order.getOrderId())
                    );

                    if (taoOrderItems != null && taoOrderItems.size() > 0) {
                        // 不处理
                    } else {
                        // 新增
                        item.setShopId(shopId);
                        item.setOrderId(order.getOrderId());
                        itemMapper.insert(item);
                    }
                }
                return ResultVo.error(ResultVoEnum.DataExist, "订单已经存在，更新成功");
            } else {
                // 不存在，新增
                order.setShopId(shopId);
                mapper.insert(order);
                // 添加item
                for (var item : order.getItems()) {
                    item.setShopId(shopId);
                    item.setOrderId(order.getOrderId());
                    itemMapper.insert(item);
                }
                return ResultVo.success();
            }
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return ResultVo.error(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
        }
    }


    @Override
    public OmsWeiOrder queryDetailById(Long id) {
        OmsWeiOrder weiOrder = mapper.selectById(id);
        if(weiOrder!=null){
            weiOrder.setItems(itemMapper.selectList(new LambdaQueryWrapper<OmsWeiOrderItem>().eq(OmsWeiOrderItem::getOrderId,weiOrder.getOrderId())));
        }
        return weiOrder;
    }

    @Transactional
    @Override
    public int confirmOrder(WeiOrderConfirmBo bo) throws InterruptedException {
        OmsWeiOrder original = mapper.selectById(bo.getId());;
        if(original.getAuditStatus()!=null &&  original.getAuditStatus() != 0) return -1;//无需审核


//        // 新增ErpOrder
//        // 确认订单（操作：插入数据到s_shop_order、s_shop_order_item）
//        ErpOrder so = new ErpOrder();
//        so.setOrderNum(original.getOrderId());
//        so.setOrderTime(DateUtil.stampToDateTime(original.getCreateTime().longValue()));
//        so.setShopId(original.getShopId());
//        so.setShopType(EnumShopType.WEI.getIndex());
////        so.setRemark(original.getRemark());
////        so.setBuyerMemo(original.getBuyerFeedback());
////        so.setTag(original.getTag());
//        Integer orderStatus = null;
//        Integer refundStatus = null;
//        //状态 10	待付款；20	待发货；21	部分发货；30	待收货；100	完成；200	全部商品售后之后，订单取消；250	未付款用户主动取消或超时未付款订单自动取消；
//        if(original.getStatus() == 10){
//            so.setRefundStatus(1);
//            so.setOrderStatus(21);//订单状态1：待发货，2：已发货，3：已完成，11已取消；21待付款
//            orderStatus = 21;
//            refundStatus = 1;
//        } else if (original.getStatus() == 20 || original.getStatus() == 21) {
//            so.setRefundStatus(1);
//            so.setOrderStatus(1);
//            orderStatus = 1;
//            refundStatus = 1;
//        } else if (original.getStatus() == 30) {
//            so.setRefundStatus(1);
//            so.setOrderStatus(2);
//            orderStatus = 2;
//            refundStatus = 1;
//        } else if (original.getStatus() == 100) {
//            so.setRefundStatus(1);
//            so.setOrderStatus(3);
//            orderStatus = 3;
//            refundStatus = 1;
//        }else if (original.getStatus() == 200 || original.getStatus() == 250) {
//            so.setRefundStatus(4);
//            so.setOrderStatus(11);
//            orderStatus = 11;
//            refundStatus = 4;
//        }
//
//        so.setShipStatus(0);
////        so.setShipType(bo.getShipType());
//        so.setGoodsAmount(original.getProductPrice().doubleValue() /100);
//        if(original.getDiscountedPrice()!=null) {
//            so.setDiscountAmount(BigDecimal.valueOf(original.getDiscountedPrice().doubleValue() / 100));
//        }else{
//            so.setDiscountAmount(BigDecimal.ZERO);
//        }
//        so.setAmount(original.getOrderPrice().doubleValue()/100);
//        so.setPostage(BigDecimal.valueOf(original.getFreight()/100));
//
////        so.setPayTime(original.getPayTime());
//        so.setConfirmTime(new Date());
//        so.setCreateTime(new Date());
//        so.setCreateBy("确认订单");
//        so.setReceiverName(bo.getUserName());
//        so.setReceiverPhone(bo.getTelNumber());
//        so.setAddress(bo.getDetailInfo());
//        so.setCountry("中国");
//        so.setProvince(original.getProvinceName());
//        so.setCity(original.getCityName());
//        so.setTown(original.getCountyName());
//
//        // 新增ErpOrderItem
//        List<OmsWeiOrderItem> weiOrderItems = itemMapper.selectList(new LambdaQueryWrapper<OmsWeiOrderItem>().eq(OmsWeiOrderItem::getOrderId, original.getOrderId()));
//
//        if(weiOrderItems!=null && weiOrderItems.size()>0) {
//            List<ErpOrderItem> items = new ArrayList<>();
//
//            for (var i : weiOrderItems) {
////            if(com.qihang.common.utils.StringUtils.isEmpty(i.getSkuCode())) {
////                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
////                return -11;
////            }
////            GoodsSpec spec = goodsSpecMapper.selectGoodsSpecBySpecNum(i.getSpecNumber());
////            if (spec == null) {
////                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
////                return -11;
////            }
////            Goods goods = goodsMapper.selectGoodsById(spec.getGoodsId());
////            if(goods == null){
////                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
////                return -12;
////            }
//
//                ErpOrderItem item = new ErpOrderItem();
//                item.setShipStatus(0);
////            item.setShipType(bo.getShipType());
//                item.setShopId(original.getShopId());
//                item.setOrderId(so.getId());
//                item.setOriginalOrderId(original.getOrderId());
//                item.setOriginalOrderItemId(i.getId().toString());
//                item.setOriginalSkuId(i.getSkuId());
//
//                Long erpGoodsId = 0L;
//                Long erpSkuId = 0L;
//
//                List<OmsWeiGoodsSku> weiGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OmsWeiGoodsSku>().eq(OmsWeiGoodsSku::getSkuId, i.getSkuId()));
//                if (weiGoodsSkus != null && !weiGoodsSkus.isEmpty()) {
//                    erpGoodsId = weiGoodsSkus.get(0).getErpGoodsId();
//                    erpSkuId = weiGoodsSkus.get(0).getErpGoodsSkuId();
//                }
//                item.setGoodsId(erpGoodsId);
//                item.setSpecId(erpSkuId);
//                item.setGoodsTitle(i.getTitle());
//                item.setGoodsImg(i.getThumbImg());
//                item.setGoodsNum(i.getProductId());
//                item.setSpecNum(i.getSkuCode());
//                item.setGoodsSpec(i.getSkuAttrs());
//                item.setGoodsPrice(i.getSalePrice().doubleValue() / 100);
////            item.setGoodsPurPrice(spec.getPurPrice());
//                item.setItemAmount(i.getRealPrice().doubleValue() / 100);
//                item.setQuantity(i.getSkuCnt());
//                item.setIsGift(0);
//                item.setRefundCount(0);
//                item.setRefundStatus(refundStatus);
//                item.setOrderStatus(orderStatus);
//                item.setCreateBy("确认订单");
//                item.setCreateTime(new Date());
//                items.add(item);
//            }
//            so.setItemList(items);
//        }
////        // 添加了赠品
//////        if(taoOrder.getTaoOrderItemList()!=null && !taoOrder.getTaoOrderItemList().isEmpty()){
//////            for (var g:taoOrder.getTaoOrderItemList()) {
//////                if(com.qihang.common.utils.StringUtils.isEmpty(g.getSpecNumber())) {
//////                    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//////                    return -11;
//////                }
//////                GoodsSpec spec = goodsSpecMapper.selectGoodsSpecBySpecNum(g.getSpecNumber());
//////                if (spec == null) {
//////                    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//////                    return -11;
//////                }
//////                Goods goods = goodsMapper.selectGoodsById(spec.getGoodsId());
//////                if(goods == null) {
//////                    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//////                    return -12;
//////                }
//////
//////                ErpOrderItem item = new ErpOrderItem();
//////                item.setShipStatus(0);
//////                item.setShipType(taoOrder.getShipType());
//////                item.setShopId(original.getShopId().intValue());
//////                item.setOrderId(so.getId());
//////                item.setOrderNum(original.getId());
//////                item.setOrderItemNum(original.getId()+"_");
//////                item.setSupplierId(goods.getSupplierId().intValue());
//////                item.setGoodsId(spec.getGoodsId());
//////                item.setSpecId(spec.getId());
//////                item.setGoodsTitle(g.getGoodsTitle());
//////                item.setGoodsImg(g.getProductImgUrl());
//////                item.setGoodsNum(g.getGoodsNumber());
//////                item.setSpecNum(g.getSpecNumber());
//////                item.setGoodsSpec(g.getSkuInfo());
//////                item.setGoodsPrice(g.getPrice().doubleValue());
////////                item.setGoodsPurPrice(spec.getPurPrice());
//////                item.setItemAmount(g.getItemAmount().doubleValue());
//////                item.setQuantity(g.getQuantity().intValue());
//////                item.setIsGift(1);
//////                item.setRefundCount(0);
//////                item.setRefundStatus(1);
//////                item.setCreateBy(taoOrder.getUpdateBy());
//////                item.setCreateTime(new Date());
//////                items.add(item);
//////            }
//////        }
////        erpOrderMapper.batchErpOrderItem(items);
//        // 远程调用
//        MQRequest<ErpOrder> req = new MQRequest<>();
//        req.setMqRequestType(MQRequestType.ORDER_CONFIRM);
//        req.setData(so);
//        ApiResult s = mqClientService.confirmOrder(req);
//        if(s.getResult()==ApiResultEnum.SUCCESS.getIndex()) {
//            //更新自己
//            OmsWeiOrder update = new OmsWeiOrder();
//            update.setId(original.getId());
//            update.setAuditStatus(1);
//            update.setAuditTime(new Date());
//            update.setUserName(bo.getUserName());
//            update.setTelNumber(bo.getTelNumber());
//            update.setDetailInfo(bo.getDetailInfo());
//            Long ut = (System.currentTimeMillis() / 1000);
//            update.setUpdateTime(ut.intValue());
//            mapper.updateById(update);
//        }
        return 1;
    }
}




