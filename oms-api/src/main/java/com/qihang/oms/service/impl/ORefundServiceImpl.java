package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.oms.domain.*;
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
    private final TaoRefundMapper taoRefundMapper;
    private final TaoOrderItemMapper taoOrderItemMapper;
    @Transactional
    @Override
    public ResultVo<Integer> jdRefundMessage(String refundId) {
        log.info("京东退款消息处理"+refundId);
        // TODO:业务问题：一个订单退款单是否包含多个商品；一个京东订单是否包含多个ITEM
        List<JdOrderAfter> afterList = jdOrderAfterMapper.selectList(new LambdaQueryWrapper<JdOrderAfter>().eq(JdOrderAfter::getServiceId, refundId));
        if(afterList == null || afterList.size() == 0) {
            // 没有找到订单信息
            return ResultVo.error(ResultVoEnum.NotFound,"没有找到京东售后单："+refundId);
        }
        JdOrderAfter jdAfter = afterList.get(0);
        // 查询ERP订单
        OOrder order = null;
        OOrderItem orderItem = null;
        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, jdAfter.getOrderId()).eq(OOrder::getShopId, jdAfter.getShopId()));
        if(oOrders!=null && oOrders.size()>0){
            order = oOrders.get(0);
            List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrders.get(0).getId()).eq(OOrderItem::getSkuId, jdAfter.getSkuId()));
            if(oOrderItems!=null && oOrderItems.size()>0){
                orderItem = oOrderItems.get(0);
            }else{
                return ResultVo.error(ResultVoEnum.NotFound,"没有找到京东子订单erp信息："+jdAfter.getOrderId()+",SKU:"+jdAfter.getSkuId());
            }
        }else{
            return ResultVo.error(ResultVoEnum.NotFound,"没有找到京东订单erp信息："+jdAfter.getOrderId());
        }

        List<ORefund> oRefunds = mapper.selectList(new LambdaQueryWrapper<ORefund>().eq(ORefund::getRefundNum, jdAfter.getServiceId()));
        if(oRefunds == null || oRefunds.isEmpty()) {
            // 新增
            ORefund insert = new ORefund();
            insert.setRefundNum(jdAfter.getServiceId().toString());
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
            Integer status = null;
            //服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭 10005-待收货 10006-待处理领取 10007-待处理
            // 10009-待用户确认 10010-完成 10011-取消 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单
            // 12000-上门维修中 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）
            insert.setStatus(jdAfter.getServiceStatus());
//            insert.setRefundFee(jdAfter.getr);
//            insert.setRefundReason();
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
        return ResultVo.success();
    }

    @Override
    public ResultVo<Integer> taoRefundMessage(String refundId) {
        log.info("TAO退款消息处理" + refundId);
        List<TaoRefund> refundList = taoRefundMapper.selectList(new LambdaQueryWrapper<TaoRefund>().eq(TaoRefund::getRefundId, refundId));
        if (refundList == null || refundList.size() == 0) {
            // 没有找到订单信息
            return ResultVo.error(ResultVoEnum.NotFound, "没有找到TAO售后单：" + refundId);
        }
        TaoRefund taoRefund = refundList.get(0);
        List<TaoOrderItem> taoOrderItems = taoOrderItemMapper.selectList(new LambdaQueryWrapper<TaoOrderItem>().eq(TaoOrderItem::getOid, taoRefund.getOid()));
        if(taoOrderItems == null || taoOrderItems.size()==0) {
            return ResultVo.error(ResultVoEnum.NotFound, "没有找到TAO子订单：" + taoRefund.getOid());
        }
        // 查询ERP订单
        OOrder order = null;
        OOrderItem orderItem = null;
        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, taoRefund.getTid()).eq(OOrder::getShopId, taoRefund.getShopId()));
        if(oOrders!=null && oOrders.size()>0){
            order = oOrders.get(0);
            List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrders.get(0).getId()).eq(OOrderItem::getSubOrderNum, taoRefund.getOid()));
            if(oOrderItems!=null && oOrderItems.size()>0){
                orderItem = oOrderItems.get(0);
            }else{
                return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO子订单erp信息："+taoRefund.getOid());
            }
        }else{
            return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO订单erp信息："+taoRefund.getTid());
        }

        List<ORefund> oRefunds = mapper.selectList(new LambdaQueryWrapper<ORefund>().eq(ORefund::getRefundNum, refundId));
        if (oRefunds == null || oRefunds.isEmpty()) {
            // 新增
            ORefund insert = new ORefund();
            insert.setRefundNum(taoRefund.getRefundId());
            // (10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)
            Integer refundType = null;
            // REFUND(仅退款),REFUND_AND_RETURN(退货退款),TMALL_EXCHANGE(天猫换货),TAOBAO_EXCHANGE(淘宝换货),REPAIR(维修),RESHIPPING(补寄),OTHERS(其他)
            if (taoRefund.getDisputeType().equals("REFUND")) {
                refundType = 11;
            } else if (taoRefund.getDisputeType().equals("REFUND_AND_RETURN")) {
                refundType = 10;
            } else if (taoRefund.getDisputeType().equals("TMALL_EXCHANGE") || taoRefund.getDisputeType().equals("TAOBAO_EXCHANGE")) {
                refundType = 20;
            } else if (taoRefund.getDisputeType().equals("REPAIR")) {
                refundType = 30;
            } else if (taoRefund.getDisputeType().equals("RESHIPPING")) {
                refundType = 80;
            } else if (taoRefund.getDisputeType().equals("OTHERS")) {
                refundType = 0;
            }
            insert.setRefundType(refundType);
            insert.setShopId(taoRefund.getShopId());
            insert.setShopType(EnumShopType.TAO.getIndex());
            insert.setOrderNum(taoRefund.getTid().toString());
            insert.setOrderItemNum(taoRefund.getOid().toString());
            insert.setSkuId(Long.parseLong(taoOrderItems.get(0).getSkuId()));
            insert.setErpGoodsId(orderItem.getErpGoodsId());
            insert.setErpSkuId(orderItem.getErpSkuId());
            insert.setSkuNum(orderItem.getSkuNum());
            insert.setGoodsName(orderItem.getGoodsTitle());
            insert.setGoodsSku(orderItem.getGoodsSpec());
            insert.setGoodsImage(orderItem.getGoodsImg());
            insert.setQuantity(taoRefund.getNum());
            Integer status= null;
            //退款状态。WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货)
            // SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)
            if(taoRefund.getStatus().equals("WAIT_SELLER_AGREE")){
                // 10001-待审核
                status = 10001;
            }else if(taoRefund.getStatus().equals("WAIT_BUYER_RETURN_GOODS")){
                // 10002-等待买家退货(待客户反馈)
                status = 10002;
            }else if(taoRefund.getStatus().equals("WAIT_SELLER_CONFIRM_GOODS")){
                // 10005-等待卖家确认收货(待收货)
                status = 10005;
            }else if(taoRefund.getStatus().equals("SELLER_REFUSE_BUYER")){
                // 14000-卖家拒绝退款
                status = 14000;
            }else if(taoRefund.getStatus().equals("CLOSED")){
                // 10011-退款关闭（取消）
                status = 10011;
            }else if(taoRefund.getStatus().equals("SUCCESS")){
                // 10010-退款成功（完成）
                status = 10010;
            }
            insert.setStatus(status);
            insert.setRefundFee(taoRefund.getRefundFee());
            insert.setRefundReason(taoRefund.getReason());
            insert.setRemark(taoRefund.getDesc1());
//            insert.setContactperson(taoRefund.getCustomerName());
//            insert.setMobile(taoRefund.getCustomerTel());
//            insert.setAddress(taoRefund.getPickwareAddress());

            insert.setCreateTime(new Date());
            insert.setCreateBy("REFUND_MESSAGE");
            mapper.insert(insert);
        } else {
            // 修改
            ORefund update = new ORefund();
            update.setId(oRefunds.get(0).getId());
            Integer status= null;
            //退款状态。WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货)
            // SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)
            if(taoRefund.getStatus().equals("WAIT_SELLER_AGREE")){
                // 10001-待审核
                status = 10001;
            }else if(taoRefund.getStatus().equals("WAIT_BUYER_RETURN_GOODS")){
                // 10002-等待买家退货(待客户反馈)
                status = 10002;
            }else if(taoRefund.getStatus().equals("WAIT_SELLER_CONFIRM_GOODS")){
                // 10005-等待卖家确认收货(待收货)
                status = 10005;
            }else if(taoRefund.getStatus().equals("SELLER_REFUSE_BUYER")){
                // 14000-卖家拒绝退款
                status = 14000;
            }else if(taoRefund.getStatus().equals("CLOSED")){
                // 10011-退款关闭（取消）
                status = 10011;
            }else if(taoRefund.getStatus().equals("SUCCESS")){
                // 10010-退款成功（完成）
                status = 10010;
            }
            update.setStatus(status);
            update.setUpdateTime(new Date());
            update.setUpdateBy("REFUND_MESSAGE");
            mapper.updateById(update);
        }
        return ResultVo.success();
    }

    @Override
    public List<ORefund> selectList(ORefund refund) {
        List<ORefund> list = mapper.selectList(new LambdaQueryWrapper<>());
        return list;
    }

    @Override
    public PageResult<ORefund> queryPageList(ORefund bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ORefund> queryWrapper = new LambdaQueryWrapper<ORefund>();
        Page<ORefund> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    @Override
    public ORefund selectById(Long id) {
        return mapper.selectById(id);
    }
}




