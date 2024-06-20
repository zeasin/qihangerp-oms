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
import com.qihang.oms.service.ErpSaleAfterRefundService;
import com.qihang.oms.service.OmsWeiRefundService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【erp_sale_after_refund(售后退款表)】的数据库操作Service实现
* @createDate 2024-06-19 17:59:48
*/
@Log
@AllArgsConstructor
@Service
public class ErpSaleAfterRefundServiceImpl extends ServiceImpl<ErpSaleAfterRefundMapper, ErpSaleAfterRefund>
    implements ErpSaleAfterRefundService{
    private final ErpSaleAfterRefundMapper mapper;
    private final ErpSaleOrderItemMapper orderItemMapper;
    private final OmsJdAfterSaleMapper jdAfterSaleMapper;
    private final OmsTaoRefundMapper taoRefundMapper;
    private final OmsPddRefundMapper pddRefundMapper;
    private final OmsDouRefundMapper douRefundMapper;
    private final OmsWeiRefundMapper weiRefundMapper;

    @Override
    public PageResult<ErpSaleAfterRefund> queryPageList(ErpSaleAfterRefund bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpSaleAfterRefund> queryWrapper = new LambdaQueryWrapper<ErpSaleAfterRefund>()
                .eq(bo.getShopId()!=null,ErpSaleAfterRefund::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getRefundNum()),ErpSaleAfterRefund::getRefundNum,bo.getRefundNum())
                .eq(StringUtils.hasText(bo.getOriginalOrderId()),ErpSaleAfterRefund::getOriginalOrderId,bo.getOriginalOrderId())
                ;
        Page<ErpSaleAfterRefund> pages = mapper.selectPage(pageQuery.build(), queryWrapper);



        return PageResult.build(pages);
    }


    @Transactional
    @Override
    public ResultVo<Integer> jdRefundMessage(String serviceId) {
        log.info("京东退款消息处理"+serviceId);
        // TODO:业务问题：一个订单退款单是否包含多个商品；一个京东订单是否包含多个ITEM
        List<OmsJdAfterSale> afterList = jdAfterSaleMapper.selectList(new LambdaQueryWrapper<OmsJdAfterSale>().eq(OmsJdAfterSale::getServiceId, serviceId));
        if(afterList == null || afterList.size() == 0) {
            // 没有找到订单信息
            return ResultVo.error(ResultVoEnum.NotFound,"没有找到京东售后单："+serviceId);
        }
        OmsJdAfterSale jdAfter = afterList.get(0);
        // 查询ERP订单
        Long erpGoodsId = 0L;
        Long erpGoodsSkuId = 0L;
        String specNum = "";
        String goodsSpec = "";
        String goodsImage = "";
        List<ErpSaleOrderItem> orderItems = orderItemMapper.selectList(new LambdaQueryWrapper<ErpSaleOrderItem>()
                .eq(ErpSaleOrderItem::getOriginalOrderId,jdAfter.getOrderId())
                .eq(ErpSaleOrderItem::getOriginalSkuId,jdAfter.getSkuId()));
        if(orderItems!=null && orderItems.size()>0){
            erpGoodsId = orderItems.get(0).getGoodsId();
            erpGoodsSkuId = orderItems.get(0).getSpecId();
            specNum = orderItems.get(0).getSpecNum();
            goodsSpec = orderItems.get(0).getGoodsSpec();
            goodsImage = orderItems.get(0).getGoodsImg();
        }
//        OOrder order = null;
//        OOrderItem orderItem = null;
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, jdAfter.getOrderId()).eq(OOrder::getShopId, jdAfter.getShopId()));
//        if(oOrders!=null && oOrders.size()>0){
//            order = oOrders.get(0);
//            List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrders.get(0).getId()).eq(OOrderItem::getSkuId, jdAfter.getSkuId()));
//            if(oOrderItems!=null && oOrderItems.size()>0){
//                orderItem = oOrderItems.get(0);
//            }else{
//                return ResultVo.error(ResultVoEnum.NotFound,"没有找到京东子订单erp信息："+jdAfter.getOrderId()+",SKU:"+jdAfter.getSkuId());
//            }
//        }else{
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到京东订单erp信息："+jdAfter.getOrderId());
//        }

        List<ErpSaleAfterRefund> refunds = mapper.selectList(new LambdaQueryWrapper<ErpSaleAfterRefund>().eq(ErpSaleAfterRefund::getRefundNum, jdAfter.getServiceId()));
        if(refunds == null || refunds.isEmpty()) {
            // 新增
            ErpSaleAfterRefund insert = new ErpSaleAfterRefund();
            insert.setRefundNum(jdAfter.getServiceId().toString());

            insert.setShopId(jdAfter.getShopId());
            insert.setShopType(EnumShopType.JD.getIndex());
            insert.setOriginalOrderId(jdAfter.getOrderId().toString());
//            insert.setOrderItemNum(orderItem.getSubOrderNum());
            insert.setOriginalSkuId(jdAfter.getSkuId().toString());
            insert.setErpGoodsId(erpGoodsId);
            insert.setErpGoodsSkuId(erpGoodsSkuId);
            insert.setSpecNum(specNum);
            insert.setGoodsName(jdAfter.getWareName());
            insert.setGoodsSku(goodsSpec);
            insert.setGoodsImage(goodsImage);
            insert.setQuantity(jdAfter.getServiceCount().longValue());

            // 售后类型：1-售前退款 2-退货退款 3-换货 4-维修 5-补发 9-仅退款 10其他
            Integer refundType=null;
            //买家是否需要退货。1(是),0(否)
            Integer hasReturnGoods = null;
            //状态（10001待审核10002等待买家退货10003待客户反馈 10005等待卖家收货10007待商家处理10008商家处理中14000拒绝退款10011退款关闭10010退款完成）
            Integer status = null;

            //客户期望(1-售前退款 10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)
            if(jdAfter.getCustomerExpect() == 1){
                hasReturnGoods = 0;
                refundType=1;
                // refund_status 退款审核状态: 0代表未审核， 1代表审核通过 2代表审核不通过 3代表京东财务审核通过；4代表京东财务审核不通过
                if(jdAfter.getRefundStatus() == 0){
                    // 10001-待审核
                    status = 10001;
                }
                else if(jdAfter.getRefundStatus() == 1){
                    // 10003-审核通过 等待平台审核
                    status = 10003;
                }
                else if(jdAfter.getRefundStatus() == 3){
                    // 10010-退款成功（完成）
                    status = 10010;
                }
                else if(jdAfter.getRefundStatus() == 2){
                    // 14000-卖家拒绝退款
                    status = 14000;
                }
                else if(jdAfter.getRefundStatus() == 4){
                    // 10011-退款关闭（取消）
                    status = 10011;
                }
                insert.setRefundReason(jdAfter.getRefundReason());
                insert.setRefundFee(jdAfter.getApplyRefundSum()!=null?jdAfter.getApplyRefundSum()/100:0.0);
            }else{
                insert.setRefundFee(0.0);
                //服务单状态（10000-待审核领取 10001-待审核
                // 10002-待客户反馈 10009-待用户确认  10006-待处理领取 10013-待审核和待客户反馈 13000-商家催收待处理
                // 10004-审核关闭 10011-取消
                // 10005-待收货
                // 10010-完成
                // 10007-待处理 10012-客户已反馈  10041-提交退款申请 1100-待下发维修中心接单 13000-未收货，待收款 13000-已收货，待收款
                // 12000-上门维修中 14000-上门检测中
//                insert.setStatus(jdAfter.getServiceStatus());
                if(jdAfter.getServiceStatus() == 10000||jdAfter.getServiceStatus() == 10001){
                    //状态（10001待审核10002等待买家退货10003待客户反馈 10005等待卖家收货10007待商家处理10008商家处理中14000拒绝退款10011退款关闭10010退款完成）
                    status=10001;
                }else if(jdAfter.getServiceStatus() == 10002||jdAfter.getServiceStatus() == 10009 ||jdAfter.getServiceStatus() == 10006||jdAfter.getServiceStatus() == 10013||jdAfter.getServiceStatus() == 13000){
                    status=10003;//待客户反馈
                }else if(jdAfter.getServiceStatus() == 10004||jdAfter.getServiceStatus() == 10011){
                    status = 10011;
                }else if(jdAfter.getServiceStatus() == 10005){
                    status = 10005;
                }else if(jdAfter.getServiceStatus() == 10010){
                    status = 10010;
                }else if(jdAfter.getServiceStatus() == 10007||jdAfter.getServiceStatus() == 10012||jdAfter.getServiceStatus() == 10041||jdAfter.getServiceStatus() == 1100||jdAfter.getServiceStatus() == 13000){
                    status = 10007;
                }else if(jdAfter.getServiceStatus() == 12000||jdAfter.getServiceStatus() == 14000){
                    status = 10008;
                }
                //客户期望(1-售前退款 10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)
                 if(jdAfter.getCustomerExpect() == 11){
                    hasReturnGoods = 0;
                    // 售后类型：1-售前退款 2-退货退款 3-换货 4-维修 5-补发 6-上门服务 8-退差价 9-仅退款 10其他
                    refundType=9;
                }else if(jdAfter.getCustomerExpect() == 10){
                    hasReturnGoods = 1;
                    refundType=2;
                }else if(jdAfter.getCustomerExpect() == 20){
                    hasReturnGoods = 1;
                    refundType=3;
                } else if(jdAfter.getCustomerExpect() == 30){
                     hasReturnGoods = 0;
                     refundType=4;
                 }else if(jdAfter.getCustomerExpect() == 40||jdAfter.getCustomerExpect() == 50||jdAfter.getCustomerExpect() == 60||jdAfter.getCustomerExpect() == 70){
                     hasReturnGoods = 0;
                     refundType=6;
                 }else if(jdAfter.getCustomerExpect() == 90){
                     hasReturnGoods = 0;
                     refundType=8;
                 }else if(jdAfter.getCustomerExpect() == 80){
                     hasReturnGoods = 0;
                     refundType=5;
                 }else if(jdAfter.getCustomerExpect() == 100){
                     hasReturnGoods = 1;
                     refundType=10;
                 }
            }

            insert.setRefundType(refundType);
            insert.setHasGoodReturn(hasReturnGoods);
            insert.setStatus(status);
            insert.setCreateTime(new Date());
            insert.setCreateBy("REFUND_MESSAGE");
            mapper.insert(insert);
        }else{
            // 修改
            Integer status = null;
            if(jdAfter.getCustomerExpect() == 1){
                // refund_status 退款审核状态: 0代表未审核， 1代表审核通过 2代表审核不通过 3代表京东财务审核通过；4代表京东财务审核不通过
                if(jdAfter.getRefundStatus() == 0){
                    // 10001-待审核
                    status = 10001;
                }
                else if(jdAfter.getRefundStatus() == 1){
                    // 10003-审核通过 等待平台审核
                    status = 10003;
                }
                else if(jdAfter.getRefundStatus() == 3){
                    // 10010-退款成功（完成）
                    status = 10010;
                }
                else if(jdAfter.getRefundStatus() == 2){
                    // 14000-卖家拒绝退款
                    status = 14000;
                }
                else if(jdAfter.getRefundStatus() == 4){
                    // 10011-退款关闭（取消）
                    status = 10011;
                }
            }else{
                //服务单状态（10000-待审核领取 10001-待审核
                // 10002-待客户反馈 10009-待用户确认  10006-待处理领取 10013-待审核和待客户反馈 13000-商家催收待处理
                // 10004-审核关闭 10011-取消
                // 10005-待收货
                // 10010-完成
                // 10007-待处理 10012-客户已反馈  10041-提交退款申请 1100-待下发维修中心接单 13000-未收货，待收款 13000-已收货，待收款
                // 12000-上门维修中 14000-上门检测中
//                insert.setStatus(jdAfter.getServiceStatus());
                if(jdAfter.getServiceStatus() == 10000||jdAfter.getServiceStatus() == 10001){
                    //状态（10001待审核10002等待买家退货10003待客户反馈 10005等待卖家收货10007待商家处理10008商家处理中14000拒绝退款10011退款关闭10010退款完成）
                    status=10001;
                }else if(jdAfter.getServiceStatus() == 10002||jdAfter.getServiceStatus() == 10009 ||jdAfter.getServiceStatus() == 10006||jdAfter.getServiceStatus() == 10013||jdAfter.getServiceStatus() == 13000){
                    status=10003;//待客户反馈
                }else if(jdAfter.getServiceStatus() == 10004||jdAfter.getServiceStatus() == 10011){
                    status = 10011;
                }else if(jdAfter.getServiceStatus() == 10005){
                    status = 10005;
                }else if(jdAfter.getServiceStatus() == 10010){
                    status = 10010;
                }else if(jdAfter.getServiceStatus() == 10007||jdAfter.getServiceStatus() == 10012||jdAfter.getServiceStatus() == 10041||jdAfter.getServiceStatus() == 1100||jdAfter.getServiceStatus() == 13000){
                    status = 10007;
                }else if(jdAfter.getServiceStatus() == 12000||jdAfter.getServiceStatus() == 14000){
                    status = 10008;
                }
            }
            ErpSaleAfterRefund update = new ErpSaleAfterRefund();
            update.setId(refunds.get(0).getId());
            update.setStatus(status);
            update.setUpdateTime(new Date());
            update.setUpdateBy("REFUND_MESSAGE");
            mapper.updateById(update);
        }
        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> weiRefundMessage(String afterSaleOrderId) {
        log.info("wei售后消息处理" + afterSaleOrderId);
        List<OmsWeiRefund> returnList = weiRefundMapper.selectList(new LambdaQueryWrapper<OmsWeiRefund>().eq(OmsWeiRefund::getAfterSaleOrderId, afterSaleOrderId));
        if (returnList == null || returnList.size() == 0) {
            // 没有找到订单信息
            return ResultVo.error(ResultVoEnum.NotFound, "没有找到wei售后：" + afterSaleOrderId);
        }
        OmsWeiRefund refund = returnList.get(0);

        //查询ERP goods
        // 查询ERP订单
        Long erpGoodsId = 0L;
        Long erpGoodsSkuId = 0L;
        String specNum = "";
        String goodsSpec = "";
        String goodsImage = "";
        String goodsName = "";
        List<ErpSaleOrderItem> orderItems = orderItemMapper.selectList(new LambdaQueryWrapper<ErpSaleOrderItem>()
                .eq(ErpSaleOrderItem::getOriginalOrderId,refund.getOrderId())
                .eq(ErpSaleOrderItem::getOriginalSkuId,refund.getSkuId()));
        if(orderItems!=null && orderItems.size()>0){
            erpGoodsId = orderItems.get(0).getGoodsId();
            erpGoodsSkuId = orderItems.get(0).getSpecId();
            specNum = orderItems.get(0).getSpecNum();
            goodsSpec = orderItems.get(0).getGoodsSpec();
            goodsImage = orderItems.get(0).getGoodsImg();
            goodsName = orderItems.get(0).getGoodsTitle();
        }

        List<ErpSaleAfterRefund> refunds = mapper.selectList(new LambdaQueryWrapper<ErpSaleAfterRefund>().eq(ErpSaleAfterRefund::getRefundNum, refund.getAfterSaleOrderId()));
        if (refunds == null || refunds.isEmpty()) {
            // 新增
            ErpSaleAfterRefund insert = new ErpSaleAfterRefund();
            insert.setRefundNum(refund.getAfterSaleOrderId());
            insert.setShopId(refund.getShopId());
            insert.setShopType(EnumShopType.WEI.getIndex());
            insert.setOriginalOrderId(refund.getOrderId());
            insert.setOriginalSkuId(refund.getSkuId());
            insert.setErpGoodsId(erpGoodsId);
            insert.setErpGoodsSkuId(erpGoodsSkuId);
            insert.setSpecNum(specNum);
            insert.setGoodsName(goodsName);
            insert.setGoodsSku(goodsSpec);
            insert.setGoodsImage(goodsImage);
            insert.setQuantity(refund.getCount().longValue());
            insert.setRefundReason(refund.getReasonText());
            try {
                insert.setRefundFee(refund.getRefundAmount().doubleValue() / 100);
            }catch (Exception e){
                insert.setRefundFee(0.0);
            }
            //类型 type REFUND:退款；RETURN:退货退款。
            //refund_type 售后类型：1-售前退款 2-退货退款 3-换货 4-维修 5-补发 6-上门服务 8-退差价 9-仅退款 10其他
            Integer refundType=null;
            //买家是否需要退货。1(是),0(否)
            Integer hasReturnGoods = null;
            //状态（10001-待审核 10002-等待买家退货 10003-待客户反馈 10005-等待卖家收货 10007-待商家处理 10008-商家处理中 14000-拒绝退款 10011-退款关闭 10010-退款完成 10020-平台处理中 10021-平台处理失败）
            Integer status = null;
            if(refund.equals("REFUND")){
                refundType = 9;
                hasReturnGoods = 0;
            }else if(refund.equals("RETURN")){
                refundType = 2;
                hasReturnGoods = 1;
            }


            //AfterSaleStatus
            /**
             * USER_CANCELD	用户取消申请 10011
             * MERCHANT_PROCESSING	商家受理中  10007
             * MERCHANT_REJECT_REFUND	商家拒绝退款 14000
             * MERCHANT_REJECT_RETURN	商家拒绝退货退款 14000
             * USER_WAIT_RETURN	待买家退货 10002
             * RETURN_CLOSED	退货退款关闭  10011
             * MERCHANT_WAIT_RECEIPT	待商家收货  10005
             * MERCHANT_OVERDUE_REFUND	商家逾期未退款 10007
             * MERCHANT_REFUND_SUCCESS	退款完成  10010
             * MERCHANT_RETURN_SUCCESS	退货退款完成 10010
             * PLATFORM_REFUNDING	平台退款中  10020
             * PLATFORM_REFUND_FAIL	平台退款失败 10021
             * USER_WAIT_CONFIRM	待用户确认 10003
             * MERCHANT_REFUND_RETRY_FAIL	商家打款失败，客服关闭售后 10021
             * MERCHANT_FAIL	售后关闭 10011
             * USER_WAIT_CONFIRM_UPDATE	待用户处理商家协商 10003
             * USER_WAIT_HANDLE_MERCHANT_AFTER_SALE	待用户处理商家代发起的售后申请 10003
             */
            if(refund.getStatus().equals("USER_CANCELD")||refund.getStatus().equals("MERCHANT_FAIL")){
                status = 10011;
            }else if(refund.getStatus().equals("MERCHANT_PROCESSING")||refund.getStatus().equals("MERCHANT_OVERDUE_REFUND")){
                status = 10007;
            }else if(refund.getStatus().equals("MERCHANT_REJECT_REFUND")||refund.getStatus().equals("MERCHANT_REJECT_RETURN")){
                status = 14000;
            }else if(refund.getStatus().equals("USER_WAIT_RETURN")){
                status = 10002;
            }else if(refund.getStatus().equals("RETURN_CLOSED")){
                status = 10011;
            }else if(refund.getStatus().equals("MERCHANT_WAIT_RECEIPT")){
                status = 10005;
            }else if(refund.getStatus().equals("MERCHANT_REFUND_SUCCESS")||refund.getStatus().equals("MERCHANT_RETURN_SUCCESS")){
                status = 10010;
            }else if(refund.getStatus().equals("PLATFORM_REFUNDING")){
                status = 10020;
            }else if(refund.getStatus().equals("PLATFORM_REFUND_FAIL")||refund.getStatus().equals("MERCHANT_REFUND_RETRY_FAIL")){
                status = 10021;
            }else if(refund.getStatus().equals("USER_WAIT_CONFIRM")||refund.getStatus().equals("USER_WAIT_CONFIRM_UPDATE")||refund.getStatus().equals("USER_WAIT_HANDLE_MERCHANT_AFTER_SALE")){
                status = 10003;
            }

            insert.setHasGoodReturn(hasReturnGoods);
            insert.setRefundType(refundType);
            insert.setStatus(status);
            insert.setCreateTime(new Date());
            insert.setCreateBy("REFUND_MESSAGE");
            mapper.insert(insert);
        } else {
            // 修改
            Integer status = null;
            if (refund.getStatus().equals("USER_CANCELD") || refund.getStatus().equals("MERCHANT_FAIL")) {
                status = 10011;
            } else if (refund.getStatus().equals("MERCHANT_PROCESSING") || refund.getStatus().equals("MERCHANT_OVERDUE_REFUND")) {
                status = 10007;
            } else if (refund.getStatus().equals("MERCHANT_REJECT_REFUND") || refund.getStatus().equals("MERCHANT_REJECT_RETURN")) {
                status = 14000;
            } else if (refund.getStatus().equals("USER_WAIT_RETURN")) {
                status = 10002;
            } else if (refund.getStatus().equals("RETURN_CLOSED")) {
                status = 10011;
            } else if (refund.getStatus().equals("MERCHANT_WAIT_RECEIPT")) {
                status = 10005;
            } else if (refund.getStatus().equals("MERCHANT_REFUND_SUCCESS") || refund.getStatus().equals("MERCHANT_RETURN_SUCCESS")) {
                status = 10010;
            } else if (refund.getStatus().equals("PLATFORM_REFUNDING")) {
                status = 10020;
            } else if (refund.getStatus().equals("PLATFORM_REFUND_FAIL") || refund.getStatus().equals("MERCHANT_REFUND_RETRY_FAIL")) {
                status = 10021;
            } else if (refund.getStatus().equals("USER_WAIT_CONFIRM") || refund.getStatus().equals("USER_WAIT_CONFIRM_UPDATE") || refund.getStatus().equals("USER_WAIT_HANDLE_MERCHANT_AFTER_SALE")) {
                status = 10003;
            }

            ErpSaleAfterRefund update = new ErpSaleAfterRefund();
            update.setId(refunds.get(0).getId());
            update.setStatus(status);
            update.setUpdateTime(new Date());
            update.setUpdateBy("REFUND_MESSAGE");
            mapper.updateById(update);
        }


        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> taoRefundMessage(String refundId) {
        log.info("TAO退款消息处理" + refundId);
        List<OmsTaoRefund> refundList = taoRefundMapper.selectList(new LambdaQueryWrapper<OmsTaoRefund>().eq(OmsTaoRefund::getRefundId, refundId));
        if (refundList == null || refundList.size() == 0) {
            // 没有找到订单信息
            log.info("没有找到TAO售后单："+refundId);
            return ResultVo.error(ResultVoEnum.NotFound, "没有找到TAO售后单：" + refundId);
        }
        OmsTaoRefund taoRefund = refundList.get(0);

//        List<TaoOrderItem> taoOrderItems = taoOrderItemMapper.selectList(new LambdaQueryWrapper<TaoOrderItem>().eq(TaoOrderItem::getOid, taoRefund.getOid()));
//        if(taoOrderItems == null || taoOrderItems.size()==0) {
//            log.info("没有找到TAO子订单："+taoRefund.getOid());
//            return ResultVo.error(ResultVoEnum.NotFound, "没有找到TAO子订单：" + taoRefund.getOid());
//        }
//        // 查询ERP订单
//        OOrder order = null;
//        OOrderItem orderItem = null;
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, taoRefund.getTid()).eq(OOrder::getShopId, taoRefund.getShopId()));
//        if(oOrders!=null && oOrders.size()>0){
//            order = oOrders.get(0);
//            List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrders.get(0).getId()).eq(OOrderItem::getSubOrderNum, taoRefund.getOid()));
//            if(oOrderItems!=null && oOrderItems.size()>0){
//                orderItem = oOrderItems.get(0);
//            }else{
//                log.info("没有找到TAO子订单erp信息："+taoRefund.getOid());
//                return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO子订单erp信息："+taoRefund.getOid());
//            }
//        }else{
//            log.info("没有找到TAO订单erp信息："+taoRefund.getOid());
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO订单erp信息："+taoRefund.getTid());
//        }
        //查询ERP goods
        // 查询ERP订单
        Long erpGoodsId = 0L;
        Long erpGoodsSkuId = 0L;
        String originSkuId = "0";
        String specNum = "";
        String goodsSpec = "";
        String goodsImage = "";
//        String goodsName = "";
        List<ErpSaleOrderItem> orderItems = orderItemMapper.selectList(new LambdaQueryWrapper<ErpSaleOrderItem>()
                .eq(ErpSaleOrderItem::getOriginalOrderId,taoRefund.getTid())
                .eq(ErpSaleOrderItem::getOriginalOrderItemId,taoRefund.getOid()));
        if(orderItems!=null && orderItems.size()>0){
            erpGoodsId = orderItems.get(0).getGoodsId();
            erpGoodsSkuId = orderItems.get(0).getSpecId();
            originSkuId = orderItems.get(0).getOriginalSkuId();
            specNum = orderItems.get(0).getSpecNum();
            goodsSpec = orderItems.get(0).getGoodsSpec();
            goodsImage = orderItems.get(0).getGoodsImg();
//            goodsName = orderItems.get(0).getGoodsTitle();
        }

        List<ErpSaleAfterRefund> refunds = mapper.selectList(new LambdaQueryWrapper<ErpSaleAfterRefund>().eq(ErpSaleAfterRefund::getRefundNum, taoRefund.getRefundId()));
        if (refunds == null || refunds.isEmpty()) {
            // 新增
            ErpSaleAfterRefund insert = new ErpSaleAfterRefund();
            insert.setRefundNum(taoRefund.getRefundId());
            insert.setShopId(taoRefund.getShopId());
            insert.setShopType(EnumShopType.TAO.getIndex());
            insert.setOriginalOrderId(taoRefund.getTid().toString());
//            insert.setOriginalOrderItemId(taoRefund.getOid().toString());
            insert.setOriginalSkuId(originSkuId);
            insert.setErpGoodsId(erpGoodsId);
            insert.setErpGoodsSkuId(erpGoodsSkuId);
            insert.setSpecNum(specNum);
            insert.setGoodsName(taoRefund.getTitle());
            insert.setGoodsSku(goodsSpec);
            insert.setGoodsImage(goodsImage);
            insert.setQuantity(taoRefund.getNum());
            // 售后类型：1-售前退款 2-退货退款 3-换货 4-维修 5-补发 6-上门服务 8-退差价 9-仅退款 10其他
            Integer refundType = null;
            // REFUND(仅退款),REFUND_AND_RETURN(退货退款),TMALL_EXCHANGE(天猫换货),TAOBAO_EXCHANGE(淘宝换货),REPAIR(维修),RESHIPPING(补寄),OTHERS(其他)
            if (taoRefund.getDisputeType().equals("REFUND")) {
                refundType = 9;
            } else if (taoRefund.getDisputeType().equals("REFUND_AND_RETURN")) {
                refundType = 2;
            } else if (taoRefund.getDisputeType().equals("TMALL_EXCHANGE") || taoRefund.getDisputeType().equals("TAOBAO_EXCHANGE")) {
                refundType = 3;
            } else if (taoRefund.getDisputeType().equals("REPAIR")) {
                refundType = 4;
            } else if (taoRefund.getDisputeType().equals("RESHIPPING")) {
                refundType = 5;
            } else if (taoRefund.getDisputeType().equals("OTHERS")) {
                refundType = 10;
            }
            insert.setRefundType(refundType);
            insert.setHasGoodReturn(taoRefund.getHasGoodReturn());
            Integer status= null;
            //退款状态。WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货)
            // SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)

            //状态（10001-待审核 10002-等待买家退货 10003-待客户反馈 10005-等待卖家收货 10007-待商家处理 10008-商家处理中 14000-拒绝退款 10011-退款关闭 10010-退款完成 10020-平台处理中 10021-平台处理失败）
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

            insert.setCreateTime(new Date());
            insert.setCreateBy("REFUND_MESSAGE");
            mapper.insert(insert);
        } else {
            // 修改
            ErpSaleAfterRefund update = new ErpSaleAfterRefund();
            update.setId(taoRefund.getId());
            update.setHasGoodReturn(taoRefund.getHasGoodReturn());
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
    public ResultVo<Integer> pddRefundMessage(String refundId) {
        log.info("PDD退款消息处理" + refundId);
        List<OmsPddRefund> refundList = pddRefundMapper.selectList(new LambdaQueryWrapper<OmsPddRefund>().eq(OmsPddRefund::getId, refundId));
        if (refundList == null || refundList.size() == 0) {
            // 没有找到订单信息
            log.info("没有找到PDD售后单："+refundId);
            return ResultVo.error(ResultVoEnum.NotFound, "没有找到PDD售后单：" + refundId);
        }
        OmsPddRefund originRefund = refundList.get(0);

        // 查询ERP订单
//        OOrder order = null;
//        OOrderItem orderItem = null;
//        List<OOrder> oOrders = orderMapper.selectList(
//                new LambdaQueryWrapper<OOrder>()
//                        .eq(OOrder::getOrderNum, originRefund.getOrderSn())
//                        .eq(OOrder::getShopId, originRefund.getShopId())
//        );
//
//        if(oOrders!=null && oOrders.size()>0){
//            order = oOrders.get(0);
//            List<OOrderItem> oOrderItems = orderItemMapper.selectList(
//                    new LambdaQueryWrapper<OOrderItem>()
//                            .eq(OOrderItem::getOrderId, oOrders.get(0).getId())
//                            .eq(OOrderItem::getSkuId, originRefund.getSkuId())
//            );
//
//            if(oOrderItems!=null && oOrderItems.size()>0){
//                orderItem = oOrderItems.get(0);
//            }else{
//                log.info("没有找到PDD子订单erp信息："+originRefund.getOrderSn()+"===="+originRefund.getSkuId());
//                return ResultVo.error(ResultVoEnum.NotFound,"没有找到PDD子订单erp信息："+originRefund.getOrderSn()+"===="+originRefund.getSkuId());
//            }
//        }else{
//            log.info("没有找到PDD订单erp信息："+originRefund.getOrderSn());
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到PDD订单erp信息："+originRefund.getOrderSn());
//        }

        //查询ERP goods
        // 查询ERP订单
        Long erpGoodsId = 0L;
        Long erpGoodsSkuId = 0L;
        String specNum = "";
        String goodsSpec = "";
        String goodsImage = "";
        String goodsName = "";
        List<ErpSaleOrderItem> orderItems = orderItemMapper.selectList(new LambdaQueryWrapper<ErpSaleOrderItem>()
                .eq(ErpSaleOrderItem::getOriginalOrderId,originRefund.getOrderSn())
                .eq(ErpSaleOrderItem::getOriginalSkuId,originRefund.getSkuId()));
        if(orderItems!=null && orderItems.size()>0){
            erpGoodsId = orderItems.get(0).getGoodsId();
            erpGoodsSkuId = orderItems.get(0).getSpecId();
            specNum = orderItems.get(0).getSpecNum();
            goodsSpec = orderItems.get(0).getGoodsSpec();
            goodsImage = orderItems.get(0).getGoodsImg();
            goodsName = orderItems.get(0).getGoodsTitle();
        }

        List<ErpSaleAfterRefund> refunds = mapper.selectList(new LambdaQueryWrapper<ErpSaleAfterRefund>().eq(ErpSaleAfterRefund::getRefundNum, originRefund.getId()));

        if (refunds == null || refunds.isEmpty()) {
            // 新增
            ErpSaleAfterRefund insert = new ErpSaleAfterRefund();
            insert.setRefundNum(originRefund.getId().toString());

            Integer hasGoodReturn = 0;
            // 售后类型：1-售前退款 2-退货退款 3-换货 4-维修 5-补发 6-上门服务 8-退差价 9-仅退款 10其他
            Integer refundType = null;
            // PDD 售后类型 2：仅退款 3：退货退款 4：换货 5：缺货补寄 6：维修
            if (originRefund.getAfterSalesType()==2) {
                refundType = 9;
            } else if (originRefund.getAfterSalesType()==3) {
                refundType = 2;
                if(originRefund.getUserShippingStatus()==2){
                    hasGoodReturn = 1;
                }
            } else if (originRefund.getAfterSalesType()==4) {
                refundType = 3;
                hasGoodReturn = 1;
            } else if (originRefund.getAfterSalesType()==6) {
                refundType = 4;
            } else if (originRefund.getAfterSalesType()==5) {
                refundType = 5;
            }
            insert.setRefundType(refundType);
            insert.setHasGoodReturn(hasGoodReturn);
            insert.setShopId(originRefund.getShopId());
            insert.setShopType(EnumShopType.PDD.getIndex());
            insert.setOriginalSkuId(originRefund.getOrderSn());
//            insert.setOrderItemNum(orderItem.getId());
            insert.setOriginalSkuId(originRefund.getSkuId().toString());
            insert.setErpGoodsId(erpGoodsId);
            insert.setErpGoodsSkuId(erpGoodsSkuId);
            insert.setSpecNum(specNum);
//            insert.setSpecNum(originRefund.getOuterId());
            insert.setGoodsName(originRefund.getGoodsName());
            insert.setGoodsSku(originRefund.getGoodsSpec());
            insert.setGoodsImage(originRefund.getGoodsImage());
            insert.setQuantity(originRefund.getGoodsNumber().longValue());
            Integer status= null;
            //退款状态O_Refund
            // 状态（10001-待审核 10002-等待买家退货 10003-待客户反馈 10005-等待卖家收货 10006-补寄待商家发货 10007-待商家处理 10008-商家处理中 14000-拒绝退款 10011-退款关闭 10010-退款完成 10020-平台处理中 10021-平台处理失败）

            // PDD 售后状态
            // (10001) 2：买家申请退款，待商家处理 3：退货退款，待商家处理
            // (10020) 4：商家同意退款，退款中 5：平台同意退款，退款中
            // (10003) 6：驳回退款，待买家处理
            // (10002) 7：已同意退货退款,待用户发货
            // (10020) 8：平台处理中
            // (10011) 9：平台拒绝退款，退款关闭
            // (10010) 10：退款成功
            // (10011) 11：买家撤销  12：买家逾期未处理，退款失败 13：买家逾期，超过有效期
            // (10005) 14：换货补寄待商家处理  21：待商家同意维修 33：待商家召回
            // (10003) 15：换货补寄待用户处理 18：换货补寄待用户确认完成  27：待用户确认收货 22：待用户确认发货  31：已同意拒收退款，待用户拒收
            // (10091) 16：换货补寄成功
            // (10092) 17：换货补寄失败
            // (10093) 24：维修关闭
            // (10094) 25：维修成功
            // (10006) 32：补寄待商家发货
            if(originRefund.getAfterSalesStatus()== 2 ||originRefund.getAfterSalesStatus()== 3){
                // 10001-待审核(待商家处理)
                status = 10001;
            }else if(originRefund.getAfterSalesStatus()==4 ||originRefund.getAfterSalesStatus()== 5){
                // 10090退款中
                status = 10020;
            }else if(originRefund.getAfterSalesStatus() == 6 ){
                // 10004 驳回退款，待买家处理
                status = 10003;
            }else if(originRefund.getAfterSalesStatus() == 7 ){
                // 10002等待买家退货
                status = 10002;
            }else if(originRefund.getAfterSalesStatus() == 8 ){
                // 10003等待平台审核
                status = 10020;
            }else if(originRefund.getAfterSalesStatus() == 9 ||originRefund.getAfterSalesStatus() == 11||originRefund.getAfterSalesStatus() == 12||originRefund.getAfterSalesStatus() == 13){
                // 10011退款关闭
                status = 10011;
            }else if(originRefund.getAfterSalesStatus() == 10 ){
                // 10010退款完成
                status = 10010;
            }else if(originRefund.getAfterSalesStatus() == 14 ||originRefund.getAfterSalesStatus() == 21||originRefund.getAfterSalesStatus() == 33){
                // 10005等待卖家处理
                status = 10005;
            }else if(originRefund.getAfterSalesStatus() == 15 ||originRefund.getAfterSalesStatus() == 18||originRefund.getAfterSalesStatus() == 22||originRefund.getAfterSalesStatus() == 27||originRefund.getAfterSalesStatus() == 31){
                // 10004待买家处理
                status = 10003;
            }else if(originRefund.getAfterSalesStatus() == 32 ){
                // 10006等待卖家发货
                status = 10006;
            }else if(originRefund.getAfterSalesStatus() == 16 ){
                // 10091换货成功
                status = 10091;
            }else if(originRefund.getAfterSalesStatus() == 17 ){
                // 10092换货失败
                status = 10092;
            }else if(originRefund.getAfterSalesStatus() == 24 ){
                // 10093维修关闭
                status = 10093;
            }else if(originRefund.getAfterSalesStatus() == 25 ){
                // 10094维修成功
                status = 10094;
            }

            insert.setStatus(status);
            insert.setRefundFee(originRefund.getRefundAmount());
            insert.setRefundReason(originRefund.getAfterSaleReason());
            insert.setRemark("");
            insert.setCreateTime(new Date());
            insert.setCreateBy("REFUND_MESSAGE");
            mapper.insert(insert);
        } else {
            // 修改
            ErpSaleAfterRefund update = new ErpSaleAfterRefund();
            update.setId(originRefund.getId());
            Integer status= null;
            //退款状态O_Refund
            // 状态（10001-待审核 10002-等待买家退货 10003-待客户反馈 10005-等待卖家收货 10006-补寄待商家发货 10007-待商家处理 10008-商家处理中 14000-拒绝退款 10011-退款关闭 10010-退款完成 10020-平台处理中 10021-平台处理失败）

            // PDD 售后状态
            // (10001) 2：买家申请退款，待商家处理 3：退货退款，待商家处理
            // (10020) 4：商家同意退款，退款中 5：平台同意退款，退款中
            // (10003) 6：驳回退款，待买家处理
            // (10002) 7：已同意退货退款,待用户发货
            // (10020) 8：平台处理中
            // (10011) 9：平台拒绝退款，退款关闭
            // (10010) 10：退款成功
            // (10011) 11：买家撤销  12：买家逾期未处理，退款失败 13：买家逾期，超过有效期
            // (10005) 14：换货补寄待商家处理  21：待商家同意维修 33：待商家召回
            // (10003) 15：换货补寄待用户处理 18：换货补寄待用户确认完成  27：待用户确认收货 22：待用户确认发货  31：已同意拒收退款，待用户拒收
            // (10091) 16：换货补寄成功
            // (10092) 17：换货补寄失败
            // (10093) 24：维修关闭
            // (10094) 25：维修成功
            // (10006) 32：补寄待商家发货
            if(originRefund.getAfterSalesStatus()== 2 ||originRefund.getAfterSalesStatus()== 3){
                // 10001-待审核(待商家处理)
                status = 10001;
            }else if(originRefund.getAfterSalesStatus()==4 ||originRefund.getAfterSalesStatus()== 5){
                // 10090退款中
                status = 10020;
            }else if(originRefund.getAfterSalesStatus() == 6 ){
                // 10004 驳回退款，待买家处理
                status = 10003;
            }else if(originRefund.getAfterSalesStatus() == 7 ){
                // 10002等待买家退货
                status = 10002;
            }else if(originRefund.getAfterSalesStatus() == 8 ){
                // 10003等待平台审核
                status = 10020;
            }else if(originRefund.getAfterSalesStatus() == 9 ||originRefund.getAfterSalesStatus() == 11||originRefund.getAfterSalesStatus() == 12||originRefund.getAfterSalesStatus() == 13){
                // 10011退款关闭
                status = 10011;
            }else if(originRefund.getAfterSalesStatus() == 10 ){
                // 10010退款完成
                status = 10010;
            }else if(originRefund.getAfterSalesStatus() == 14 ||originRefund.getAfterSalesStatus() == 21||originRefund.getAfterSalesStatus() == 33){
                // 10005等待卖家处理
                status = 10005;
            }else if(originRefund.getAfterSalesStatus() == 15 ||originRefund.getAfterSalesStatus() == 18||originRefund.getAfterSalesStatus() == 22||originRefund.getAfterSalesStatus() == 27||originRefund.getAfterSalesStatus() == 31){
                // 10004待买家处理
                status = 10003;
            }else if(originRefund.getAfterSalesStatus() == 32 ){
                // 10006等待卖家发货
                status = 10006;
            }else if(originRefund.getAfterSalesStatus() == 16 ){
                // 10091换货成功
                status = 10091;
            }else if(originRefund.getAfterSalesStatus() == 17 ){
                // 10092换货失败
                status = 10092;
            }else if(originRefund.getAfterSalesStatus() == 24 ){
                // 10093维修关闭
                status = 10093;
            }else if(originRefund.getAfterSalesStatus() == 25 ){
                // 10094维修成功
                status = 10094;
            }
            update.setStatus(status);
            update.setUpdateTime(new Date());
            update.setUpdateBy("REFUND_MESSAGE");
            mapper.updateById(update);
        }
        return ResultVo.success();
    }

    @Override
    public ResultVo<Integer> douRefundMessage(String refundId) {
        log.info("DOU退款消息处理" + refundId);
        List<OmsDouRefund> refundList = douRefundMapper.selectList(new LambdaQueryWrapper<OmsDouRefund>().eq(OmsDouRefund::getAftersaleId, refundId));
        if (refundList == null || refundList.size() == 0) {
            // 没有找到订单信息
            log.info("没有找到DOU售后单："+refundId);
            return ResultVo.error(ResultVoEnum.NotFound, "没有找到DOU售后单：" + refundId);
        }
        OmsDouRefund originRefund = refundList.get(0);

        // 查询ERP订单
//        OOrder order = null;
//        OOrderItem orderItem = null;
//        List<OOrder> oOrders = orderMapper.selectList(
//                new LambdaQueryWrapper<OOrder>()
//                        .eq(OOrder::getOrderNum, originRefund.getRelatedId())
//                        .eq(OOrder::getShopId, originRefund.getShopId()));
//        if(oOrders!=null && oOrders.size()>0){
//            order = oOrders.get(0);
//            List<OOrderItem> oOrderItems = orderItemMapper.selectList(
//                    new LambdaQueryWrapper<OOrderItem>()
//                            .eq(OOrderItem::getOrderId, oOrders.get(0).getId())
//                            .eq(OOrderItem::getSubOrderNum, originRefund.getOrderSkuOrderId())
//            );
//            if(oOrderItems!=null && oOrderItems.size()>0){
//                orderItem = oOrderItems.get(0);
//            }else{
//                log.info("没有找到DOU子订单erp信息："+ originRefund.getAftersaleId());
//                return ResultVo.error(ResultVoEnum.NotFound,"没有找到DOU子订单erp信息："+originRefund.getAftersaleId());
//            }
//        }else{
//            log.info("没有找到DOU订单erp信息："+originRefund.getAftersaleId());
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到DOU订单erp信息："+originRefund.getAftersaleId());
//        }

        //查询ERP goods
        // 查询ERP订单
        Long erpGoodsId = 0L;
        Long erpGoodsSkuId = 0L;
        String originalSkuId ="";
        String specNum = "";
        String goodsSpec = "";
        String goodsImage = "";
        String goodsName = "";

        List<ErpSaleOrderItem> orderItems = orderItemMapper.selectList(new LambdaQueryWrapper<ErpSaleOrderItem>()
                .eq(ErpSaleOrderItem::getOriginalOrderId,originRefund.getRelatedId())
                .eq(ErpSaleOrderItem::getOriginalOrderItemId,originRefund.getOrderSkuOrderId()));
        if(orderItems!=null && orderItems.size()>0){
            erpGoodsId = orderItems.get(0).getGoodsId();
            erpGoodsSkuId = orderItems.get(0).getSpecId();
            specNum = orderItems.get(0).getSpecNum();
            goodsSpec = orderItems.get(0).getGoodsSpec();
            goodsImage = orderItems.get(0).getGoodsImg();
            goodsName = orderItems.get(0).getGoodsTitle();
            originalSkuId = orderItems.get(0).getOriginalSkuId();
        }

        List<ErpSaleAfterRefund> refunds = mapper.selectList(new LambdaQueryWrapper<ErpSaleAfterRefund>().eq(ErpSaleAfterRefund::getRefundNum, originRefund.getAftersaleId()));

        if (refunds == null || refunds.isEmpty()) {
            // 新增
            ErpSaleAfterRefund insert = new ErpSaleAfterRefund();
            insert.setRefundNum(originRefund.getAftersaleId().toString());
            //  售后类型：1-售前退款 2-退货退款 3-换货 4-维修 5-补发 6-上门服务 8-退差价 9-仅退款 10其他
            Integer refundType = null;
            Integer hasGoodReturn = 0;
            // dou_refund售后类型；0-退货退款；1-已发货仅退款；2-未发货仅退款；3-换货；6-价保；7-补寄；8-维修
            if (originRefund.getAftersaleType()==0) {
                refundType = 2;
                if(originRefund.getGotPkg()==1) {
                    hasGoodReturn = 1;
                }
            } else if (originRefund.getAftersaleType()==1) {
                refundType = 9;
                if(originRefund.getGotPkg()==1) {
                    hasGoodReturn = 1;
                }
            } else if (originRefund.getAftersaleType()==2) {
                refundType = 1;
                hasGoodReturn = 0;
            } else if (originRefund.getAftersaleType()==3) {
                refundType = 3;
                hasGoodReturn = 1;
            } else if (originRefund.getAftersaleType()==7) {
                refundType = 5;
            } else if (originRefund.getAftersaleType()==8) {
                refundType = 4;
            }else if (originRefund.getAftersaleType()==6) {
                refundType = 8;
            }
            insert.setRefundType(refundType);
            insert.setHasGoodReturn(hasGoodReturn);
            insert.setShopId(originRefund.getShopId().intValue());
            insert.setShopType(EnumShopType.DOU.getIndex());
            insert.setOriginalOrderId(originRefund.getRelatedId());
//            insert.setOrderItemNum(originRefund.getOrderSkuOrderId());
            insert.setOriginalSkuId(originalSkuId);
            insert.setErpGoodsId(erpGoodsId);
            insert.setErpGoodsSkuId(erpGoodsSkuId);
            insert.setSpecNum(originRefund.getOrderShopSkuCode());
            insert.setGoodsName(originRefund.getOrderProductName());
            insert.setGoodsSku(originRefund.getOrderSkuSpec());
            insert.setGoodsImage(originRefund.getOrderProductImage());
            insert.setQuantity(originRefund.getAftersaleNum());
            //退款状态O_Refund
            //状态（10001-待审核 10002-等待买家退货 10003-待买家处理 10005-等待卖家收货 10006-补寄待商家发货 10007-待商家处理 10008-商家处理中 14000-拒绝退款 10011-退款关闭 10010-退款完成 10020-平台处理中 10021-平台处理失败 10030-售后成功 10031-售后失败 10091-换货成功）
            Integer status= null;
            //DOU退款状态。3-换货待买家收货；6-待商家同意；7-待买家退货；8-待商家发货；11-待商家二次同意；12-售后成功；14-换货成功；27-商家一次拒绝；28-售后失败；29-商家二次拒绝；

            if(originRefund.getAftersaleStatus()==3){
                // 10004待买家处理
                status = 10003;
            }else if(originRefund.getAftersaleStatus()==6||originRefund.getAftersaleStatus()==11){
                // 10007等待卖家处理
                status = 10007;
            }else if(originRefund.getAftersaleStatus()==7){
                // 10002等待买家退货
                status = 10002;
            }else if(originRefund.getAftersaleStatus()==8){
                // 10006等待卖家发货
                status = 10006;
            }else if(originRefund.getAftersaleStatus()==12){
                // 10030售后成功
                status = 10030;
            }else if(originRefund.getAftersaleStatus()==14){
                // 10091换货成功
                status = 10091;
            }else if(originRefund.getAftersaleStatus()==28){
                // 10031售后失败
                status = 10031;
            }else if(originRefund.getAftersaleStatus()==27||originRefund.getAftersaleStatus()==29){
                // 14000拒绝退款
                status = 14000;
            }
            insert.setStatus(status);
            insert.setRefundFee(originRefund.getRefundAmount().doubleValue()/100);
            insert.setRefundReason("");
            insert.setRemark("");
            insert.setCreateTime(new Date());
            insert.setCreateBy("REFUND_MESSAGE");
            mapper.insert(insert);
        } else {
            // 修改
            ErpSaleAfterRefund update = new ErpSaleAfterRefund();
            update.setId(originRefund.getId());

            //状态（10001-待审核 10002-等待买家退货 10003-待买家处理 10005-等待卖家收货 10006-补寄待商家发货 10007-待商家处理 10008-商家处理中 14000-拒绝退款 10011-退款关闭 10010-退款完成 10020-平台处理中 10021-平台处理失败 10030-售后成功 10031-售后失败 10091-换货成功）
            Integer status= null;
            //DOU退款状态。3-换货待买家收货；6-待商家同意；7-待买家退货；8-待商家发货；11-待商家二次同意；12-售后成功；14-换货成功；27-商家一次拒绝；28-售后失败；29-商家二次拒绝；

            if(originRefund.getAftersaleStatus()==3){
                // 10004待买家处理
                status = 10003;
            }else if(originRefund.getAftersaleStatus()==6||originRefund.getAftersaleStatus()==11){
                // 10007等待卖家处理
                status = 10007;
            }else if(originRefund.getAftersaleStatus()==7){
                // 10002等待买家退货
                status = 10002;
            }else if(originRefund.getAftersaleStatus()==8){
                // 10006等待卖家发货
                status = 10006;
            }else if(originRefund.getAftersaleStatus()==12){
                // 10030售后成功
                status = 10030;
            }else if(originRefund.getAftersaleStatus()==14){
                // 10091换货成功
                status = 10091;
            }else if(originRefund.getAftersaleStatus()==28){
                // 10031售后失败
                status = 10031;
            }else if(originRefund.getAftersaleStatus()==27||originRefund.getAftersaleStatus()==29){
                // 14000拒绝退款
                status = 14000;
            }
            update.setStatus(status);
            update.setUpdateTime(new Date());
            update.setUpdateBy("REFUND_MESSAGE");
            mapper.updateById(update);
        }
        return ResultVo.success();
    }

}




