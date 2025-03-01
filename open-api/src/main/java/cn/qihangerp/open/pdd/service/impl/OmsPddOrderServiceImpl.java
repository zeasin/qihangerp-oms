package cn.qihangerp.open.pdd.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.open.pdd.domain.OmsPddOrder;
import cn.qihangerp.open.pdd.domain.OmsPddOrderItem;
import cn.qihangerp.open.pdd.mapper.OmsPddOrderItemMapper;
import cn.qihangerp.open.pdd.mapper.OmsPddOrderMapper;
import cn.qihangerp.open.pdd.service.OmsPddOrderService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【oms_pdd_order(拼多多订单表)】的数据库操作Service实现
* @createDate 2024-06-13 16:54:36
*/
@AllArgsConstructor
@Service
public class OmsPddOrderServiceImpl extends ServiceImpl<OmsPddOrderMapper, OmsPddOrder>
    implements OmsPddOrderService{
    private final OmsPddOrderMapper orderMapper;
    private final OmsPddOrderItemMapper orderItemMapper;

    @Override
    public PageResult<OmsPddOrder> queryPageList(OmsPddOrder bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OmsPddOrder> queryWrapper = new LambdaQueryWrapper<OmsPddOrder>()
                .eq(bo.getShopId() != null, OmsPddOrder::getShopId, bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderSn()), OmsPddOrder::getOrderSn, bo.getOrderSn())
                .eq(bo.getOrderStatus() != null, OmsPddOrder::getOrderStatus, bo.getOrderStatus())
                .eq(bo.getRefundStatus() != null, OmsPddOrder::getRefundStatus, bo.getRefundStatus())
        ;
        if(bo.getErpSendStatus()!=null){
            if(bo.getErpSendStatus()==-1) {
                queryWrapper.lt(OmsPddOrder::getErpSendStatus,3);
            }else {
                queryWrapper.eq(OmsPddOrder::getErpSendStatus, bo.getErpSendStatus());
            }
        }

        Page<OmsPddOrder> goodsPage = orderMapper.selectPage(pageQuery.build(), queryWrapper);
        if (goodsPage.getRecords() != null) {
            for (var o : goodsPage.getRecords()) {
                o.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<OmsPddOrderItem>().eq(OmsPddOrderItem::getOrderSn, o.getOrderSn())));
            }
        }
        return PageResult.build(goodsPage);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveOrder(Long shopId, OmsPddOrder order) {
        if(order == null ) return ResultVo.error(ResultVoEnum.SystemException);
        try {
            List<OmsPddOrder> taoOrders = orderMapper.selectList(new LambdaQueryWrapper<OmsPddOrder>().eq(OmsPddOrder::getOrderSn, order.getOrderSn()));
            if (taoOrders != null && taoOrders.size() > 0) {
                // 存在，修改
                OmsPddOrder update = new OmsPddOrder();
                update.setId(taoOrders.get(0).getId());
                if(StringUtils.hasText(order.getReceiverName())){
                    update.setReceiverName(order.getReceiverName());
                }
                if(StringUtils.hasText(order.getReceiverPhone())){
                    update.setReceiverPhone(order.getReceiverPhone());
                }
                if(StringUtils.hasText(order.getReceiverAddress())){
                    update.setReceiverAddress(order.getReceiverAddress());
                }
                if(StringUtils.hasText(order.getAddress())){
                    update.setAddress(order.getAddress());
                }
                update.setReceiverNameMask(order.getReceiverNameMask());
                update.setReceiverPhoneMask(order.getReceiverPhoneMask());
                update.setReceiverAddressMask(order.getReceiverAddressMask());
                update.setAddressMask(order.getAddressMask());

                update.setGroupStatus(order.getGroupStatus());
                update.setConfirmStatus(order.getConfirmStatus());
                update.setOrderStatus(order.getOrderStatus());
                update.setRefundStatus(order.getRefundStatus());
                update.setCapitalFreeDiscount(order.getCapitalFreeDiscount());
                update.setSellerDiscount(order.getSellerDiscount());
                update.setPlatformDiscount(order.getPlatformDiscount());
                update.setGoodsAmount(order.getGoodsAmount());
                update.setDiscountAmount(order.getDiscountAmount());
                update.setPayAmount(order.getPayAmount());
                update.setPostage(order.getPostage());
                update.setOrderChangeAmount(order.getOrderChangeAmount());
                update.setRemark(order.getRemark());
                update.setRemarkTag(order.getRemarkTag());
                update.setRemarkTagName(order.getRemarkTagName());
                update.setBuyerMemo(order.getBuyerMemo());
                update.setUpdatedAt(order.getUpdatedAt());
                update.setShippingTime(order.getShippingTime());
                update.setTrackingNumber(order.getTrackingNumber());
                update.setPayType(order.getPayType());
                update.setPayNo(order.getPayNo());
                update.setPayTime(order.getPayTime());
                update.setConfirmTime(order.getConfirmTime());
                update.setReceiveTime(order.getReceiveTime());
                update.setAfterSalesStatus(order.getAfterSalesStatus());

                update.setLastShipTime(order.getLastShipTime());
                update.setLogisticsId(order.getLogisticsId());
                update.setRiskControlStatus(order.getRiskControlStatus());
                update.setUrgeShippingTime(order.getUrgeShippingTime());
                update.setUpdateTime(new Date());
                orderMapper.updateById(update);
                // 更新item
                for (var item : order.getItemList()) {
                    List<OmsPddOrderItem> taoOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OmsPddOrderItem>().eq(OmsPddOrderItem::getOrderSn, order.getOrderSn()).eq(OmsPddOrderItem::getSkuId,item.getSkuId()));
                    if (taoOrderItems != null && taoOrderItems.size() > 0) {
                        // 存在，不操作
                    } else {
                        // 新增
                        // TODO:子订单价格计算
                        item.setIsGift(0);
                        item.setRefundCount(0);
                        item.setRefundStatus(1);
                        item.setShopId(shopId);
                        item.setOrderSn(order.getOrderSn());
                        item.setOrderId(update.getId());
                        item.setCreateTime(new Date());
                        orderItemMapper.insert(item);
                    }
                }
                return ResultVo.error(ResultVoEnum.DataExist, "订单已经存在，更新成功");
            } else {
                // 不存在，新增
                order.setShopId(shopId);
                order.setAuditStatus(0);
                order.setCreateTime(new Date());
                orderMapper.insert(order);
                // 添加item
                for (var item : order.getItemList()) {
                    // 新增
                    // TODO:子订单价格计算
                    item.setIsGift(0);
                    item.setRefundCount(0);
                    item.setRefundStatus(1);
                    item.setShopId(shopId);
                    item.setOrderSn(order.getOrderSn());
                    item.setOrderId(order.getId());
                    item.setCreateTime(new Date());
                    orderItemMapper.insert(item);
                }
                return ResultVo.success();
            }
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();
            System.out.println("保存订单数据错误："+e.getMessage());
            return ResultVo.error(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
        }

    }

    @Override
    public OmsPddOrder queryDetailByOrderSn(String orderSn) {
        List<OmsPddOrder> omsTaoOrders = orderMapper.selectList(new LambdaQueryWrapper<OmsPddOrder>().eq(OmsPddOrder::getOrderSn, orderSn));
        if(omsTaoOrders == null) return null;

        OmsPddOrder order = omsTaoOrders.get(0);
        order.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<OmsPddOrderItem>().eq(OmsPddOrderItem::getOrderSn,orderSn)));
        return order;
    }
}




