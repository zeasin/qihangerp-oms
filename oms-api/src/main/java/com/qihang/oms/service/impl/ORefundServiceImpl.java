package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.oms.domain.JdOrderAfter;
import com.qihang.oms.domain.OOrder;
import com.qihang.oms.domain.OOrderItem;
import com.qihang.oms.domain.ORefund;
import com.qihang.oms.mapper.*;
import com.qihang.oms.service.ORefundService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
* @author qilip
* @description 针对表【o_refund(退换货表)】的数据库操作Service实现
* @createDate 2024-03-10 16:23:12
*/
@Log
@AllArgsConstructor
@Service
public class ORefundServiceImpl extends ServiceImpl<ORefundMapper, ORefund>
    implements ORefundService {
    private final ORefundMapper mapper;
    private final JdOrderAfterMapper jdOrderAfterMapper;
    private final OOrderItemMapper orderItemMapper;
    private final OOrderMapper orderMapper;
    private final JdOrderMapper jdOrderMapper;
    private final JdOrderItemMapper jdOrderItemMapper;
    @Transactional
    @Override
    public ResultVo<Integer> jdRefundMessage(String refundId) {
        log.info("京东退款消息处理"+refundId);
        // TODO:业务问题：一个订单退款单是否包含多个商品；一个京东订单是否包含多个ITEM
        List<JdOrderAfter> afterList = jdOrderAfterMapper.selectList(new LambdaQueryWrapper<JdOrderAfter>().eq(JdOrderAfter::getApplyId, refundId));
        if(afterList == null || afterList.size() == 0) {
            // 没有找到订单信息
            return new ResultVo<>(ResultVoEnum.NotFound,"没有找到京东售后单："+refundId);
        }
        JdOrderAfter jdAfter = afterList.get(0);
        // 查询子订单
        OOrder order = null;
        OOrderItem orderItem = null;
        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, jdAfter.getOrderId()).eq(OOrder::getShopId, jdAfter.getShopId()));
        if(oOrders!=null && oOrders.size()>0){
            order = oOrders.get(0);
            List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrders.get(0).getId()).eq(OOrderItem::getSkuId, jdAfter.getSkuId()));
            if(oOrderItems!=null && oOrderItems.size()>0){
                orderItem = oOrderItems.get(0);
            }else{
                return new ResultVo<>(ResultVoEnum.NotFound,"没有找到京东子订单信息："+jdAfter.getOrderId()+",SKU:"+jdAfter.getSkuId());
            }
        }else{
            return new ResultVo<>(ResultVoEnum.NotFound,"没有找到京东订单信息："+jdAfter.getOrderId());
        }

        List<ORefund> oRefunds = mapper.selectList(new LambdaQueryWrapper<ORefund>().eq(ORefund::getRefundNum, jdAfter.getApplyId()));
        if(oRefunds == null || oRefunds.isEmpty()) {
            // 新增
            ORefund insert = new ORefund();
            insert.setRefundNum(jdAfter.getApplyId().toString());
            insert.setRefundType(jdAfter.getCustomerExpect());
            insert.setShopId(jdAfter.getShopId());
            insert.setShopType(EnumShopType.JD.getIndex());
            insert.setOrderNum(jdAfter.getOrderId().toString());
            insert.setOrderItemNum(orderItem.getSubOrderNum());
            insert.setSkuId(jdAfter.getSkuId());
            insert.setErpGoodsId(orderItem.getErpGoodsId());
            insert.setErpSkuId(orderItem.getErpSkuId());
            insert.setSkuNum(orderItem.getSkuNum());
            insert.setGoodsName(orderItem.getGoodsTitle());
            insert.setGoodsSku(orderItem.getGoodsSpec());
            insert.setGoodsImage(orderItem.getGoodsImg());
            insert.setQuantity(jdAfter.getServiceCount().longValue());
            insert.setContactperson(jdAfter.getCustomerName());
            insert.setMobile(jdAfter.getCustomerTel());
            insert.setAddress(jdAfter.getPickwareAddress());
            insert.setStatus(jdAfter.getServiceStatus());
            insert.setCreateTime(new Date());
            insert.setCreateBy("REFUND_MESSAGE");
            mapper.insert(insert);
        }else{
            // 修改
            ORefund update = new ORefund();
            update.setId(oRefunds.get(0).getId());
            update.setStatus(jdAfter.getServiceStatus());
            update.setUpdateTime(new Date());
            update.setUpdateBy("REFUND_MESSAGE");
            mapper.updateById(update);
        }
        return null;
    }

    @Override
    public ResultVo<Integer> taoRefundMessage(String refundId) {
        return null;
    }

    @Override
    public List<ORefund> selectList(ORefund refund) {
        List<ORefund> list = mapper.selectList(new LambdaQueryWrapper<>());
        return list;
    }

    @Override
    public ORefund selectById(Long id) {
        return mapper.selectById(id);
    }
}




