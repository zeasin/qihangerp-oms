//package com.qihang.jd.service.impl;
//
//import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
//import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
//import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
//import com.qihang.common.common.PageQuery;
//import com.qihang.common.common.PageResult;
//import com.qihang.common.common.ResultVo;
//import com.qihang.common.common.ResultVoEnum;
//import com.qihang.jd.domain.bo.JdOrderBo;
//import com.qihang.jd.service.JdOrderService;
//
//import lombok.AllArgsConstructor;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.transaction.interceptor.TransactionAspectSupport;
//import org.springframework.util.StringUtils;
//
//import java.util.Date;
//import java.util.List;
//
///**
//* @author qilip
//* @description 针对表【jd_order(京东订单表)】的数据库操作Service实现
//* @createDate 2024-03-09 11:29:59
//*/
//@AllArgsConstructor
//@Service
//public class JdOrderServiceImpl extends ServiceImpl<JdOrderMapper, JdOrder>
//    implements JdOrderService{
//    private final JdOrderMapper mapper;
//    private final JdOrderItemMapper itemMapper;
//
//    @Override
//    public PageResult<JdOrder> queryPageList(JdOrderBo bo, PageQuery pageQuery) {
//        LambdaQueryWrapper<JdOrder> queryWrapper = new LambdaQueryWrapper<JdOrder>()
//                .eq(bo.getShopId()!=null,JdOrder::getShopId,bo.getShopId())
//                .eq(StringUtils.hasText(bo.getOrderId()),JdOrder::getOrderId,bo.getOrderId())
//                ;
//
//        Page<JdOrder> taoGoodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
//        if(taoGoodsPage.getRecords()!=null){
//            for (var order:taoGoodsPage.getRecords()) {
//                order.setItems(itemMapper.selectList(new LambdaQueryWrapper<JdOrderItem>().eq(JdOrderItem::getOrderId,order.getId())));
//            }
//        }
//        return PageResult.build(taoGoodsPage);
//    }
//
//    @Transactional
//    @Override
//    public ResultVo<Integer> saveOrder(Integer shopId, JdOrder order) {
//        try {
//            List<JdOrder> jdOrders = mapper.selectList(new LambdaQueryWrapper<JdOrder>().eq(JdOrder::getOrderId, order.getOrderId()));
//            if (jdOrders != null && jdOrders.size() > 0) {
//                // 存在，修改
//                JdOrder update = new JdOrder();
//                update.setId(jdOrders.get(0).getId());
//                update.setOrderState(order.getOrderState());
//                update.setOrderStateRemark(order.getOrderStateRemark());
//                update.setInvoiceCode(order.getInvoiceCode());
//                update.setOrderEndTime(order.getOrderEndTime());
//                update.setModified(order.getModified());
//                update.setVenderRemark(order.getVenderRemark());
//                update.setReturnOrder(order.getReturnOrder());
//                update.setPaymentConfirmTime(order.getPaymentConfirmTime());
//                update.setWaybill(order.getWaybill());
//                update.setLogisticsId(order.getLogisticsId());
//                mapper.updateById(update);
//                // 更新item
//                for (var item : order.getItems()) {
//                    List<JdOrderItem> taoOrderItems = itemMapper.selectList(new LambdaQueryWrapper<JdOrderItem>().eq(JdOrderItem::getSkuId, item.getSkuId()));
//                    if (taoOrderItems != null && taoOrderItems.size() > 0) {
//                        // 不处理
//                    } else {
//                        // 新增
//                        item.setOrderId(update.getId());
//                        itemMapper.insert(item);
//                    }
//                }
//                return ResultVo.error(ResultVoEnum.DataExist, "订单已经存在，更新成功");
//            } else {
//                // 不存在，新增
//                order.setShopId(shopId);
//                order.setCreateTime(new Date());
//                mapper.insert(order);
//                // 添加item
//                for (var item : order.getItems()) {
//                    item.setOrderId(order.getId());
//                    itemMapper.insert(item);
//                }
//                return ResultVo.success();
//            }
//        } catch (Exception e) {
//            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//            return ResultVo.error(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
//        }
//    }
//}
//
//
//
//
