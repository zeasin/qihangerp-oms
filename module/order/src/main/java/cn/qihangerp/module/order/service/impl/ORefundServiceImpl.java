package cn.qihangerp.module.order.service.impl;





import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.module.goods.domain.OGoodsSku;
import cn.qihangerp.module.goods.mapper.OGoodsSkuMapper;
import cn.qihangerp.module.order.domain.OAfterSale;
import cn.qihangerp.module.order.domain.OOrder;
import cn.qihangerp.module.order.domain.OOrderItem;
import cn.qihangerp.module.order.domain.ORefund;
import cn.qihangerp.module.order.domain.bo.RefundProcessingBo;
import cn.qihangerp.module.order.domain.bo.RefundSearchBo;
import cn.qihangerp.module.order.mapper.OAfterSaleMapper;
import cn.qihangerp.module.order.mapper.OOrderItemMapper;
import cn.qihangerp.module.order.mapper.OOrderMapper;
import cn.qihangerp.module.order.mapper.ORefundMapper;
import cn.qihangerp.module.order.service.ORefundService;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.enums.EnumShopType;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

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
    private final OAfterSaleMapper afterSaleMapper;
    private final OOrderItemMapper orderItemMapper;
    private final OOrderMapper orderMapper;
    private final OGoodsSkuMapper goodsSkuMapper;

//    private final PddApiService pddApiService;
//    private final TaoApiService taoApiService;
//    private final JdApiService jdApiService;
//    private final DouApiService douApiService;
//    private final WeiApiService weiApiService;

    @Transactional
    @Override
    public ResultVo<Integer> jdRefundMessage(String serviceId, JSONObject refundDetail) {
        log.info("京东退款消息处理"+serviceId);
//        log.info("=====jd refund message===消息处理" + serviceId);
//        JSONObject jsonObject = jdApiService.getRefundDetail(Long.parseLong(serviceId),0);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====jd refund message===没有找到退款单");
//            return ResultVo.error(404,"没有找到退款单");
//        }
//
//        JSONObject refundDetail = jsonObject.getJSONObject("data");
        log.info("=====jd refund message===退款单:"+JSONObject.toJSONString(refundDetail));
        // TODO:业务问题：一个订单退款单是否包含多个商品；一个京东订单是否包含多个ITEM
//        List<JdAfterSale> afterList = jdAfterSaleMapper.selectList(new LambdaQueryWrapper<JdAfterSale>().eq(JdAfterSale::getServiceId, serviceId));
//        if(afterList == null || afterList.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到京东售后单："+serviceId);
//        }
//        JdAfterSale jdAfter = null;//afterList.get(0);
//        // 查询ERP订单
//        OOrder order = null;
//        OOrderItem orderItem = null;
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>()
//                .eq(OOrder::getOrderNum, jdAfter.getOrderId())
//                .eq(OOrder::getShopId, jdAfter.getShopId()));
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

        List<ORefund> oRefunds = mapper.selectList(new LambdaQueryWrapper<ORefund>()
                .eq(ORefund::getRefundNum, serviceId));
        if(oRefunds == null || oRefunds.isEmpty()) {
            // 新增
            ORefund insert = new ORefund();
            insert.setRefundNum(refundDetail.getString("serviceId"));
            insert.setRefundType(refundDetail.getInteger("customerExpect"));
            insert.setShopId(refundDetail.getLong("shopId"));
            insert.setShopType(EnumShopType.JD.getIndex());
            insert.setOrderNum(refundDetail.getString("orderId"));
            insert.setSkuId(refundDetail.getLong("skuId"));
            if(refundDetail.getInteger("customerExpect")==1) {
                List<OOrderItem> oOrderItems = orderItemMapper.selectList(
                        new LambdaQueryWrapper<OOrderItem>()
                                .eq(OOrderItem::getOrderNum, insert.getOrderNum())
                                .eq(OOrderItem::getSkuId, insert.getSkuId())
                );
                insert.setOrderItemNum(oOrderItems.isEmpty() ? insert.getOrderNum() : oOrderItems.get(0).getSubOrderNum());
            }


            insert.setGoodsId(refundDetail.getLong("ogoodsId"));
            insert.setGoodsSkuId(refundDetail.getString("ogoodsSkuId"));
//            insert.setSkuNum(orderItem.getSkuNum());
            insert.setGoodsName(refundDetail.getString("wareName"));
//            insert.setGoodsSku(orderItem.getGoodsSpec());
//            insert.setGoodsImage(orderItem.getGoodsImg());
            insert.setQuantity(refundDetail.getLong("serviceCount"));
//            insert.setContactperson(jdAfter.getCustomerName());
//            insert.setMobile(jdAfter.getCustomerTel());
//            insert.setAddress(jdAfter.getPickwareAddress());
            insert.setRefundFee(refundDetail.getDouble("applyRefundSum")!=null?refundDetail.getDouble("applyRefundSum")/100:0.0);
            // 类型不同处理
            if(refundDetail.getInteger("customerExpect") == 1){
                // 售前退款，状态处理
                Integer status = null;
                // refund_status
                //退款申请单状态 0、未审核 1、审核通过2、审核不通过  4、京东财务审核不通过
                // 5、人工审核通过
                // 3、京东财务审核通过 6、京东拦截并退款 9、强制关单并退款
                // 7、青龙拦截成功 8、青龙拦截失败 10、物流待跟进(线下拦截)
                // 11、用户撤销 18、协商关闭
                // 16、拒收后退款 17、协商退货退款 19、纠纷介入 27、京东承诺拦截。不传是查询全部状态
                if(refundDetail.getInteger("refundStatus")  == 0){
                    // 10001-待审核
                    status = 10001;
                }
                else if(refundDetail.getInteger("refundStatus") == 1 || refundDetail.getInteger("refundStatus") == 5){
                    // 10003-审核通过 等待平台审核
                    status = 10003;
                }
                else if(refundDetail.getInteger("refundStatus") == 3 || refundDetail.getInteger("refundStatus") == 6 || refundDetail.getInteger("refundStatus") == 9){
                    // 10010-退款成功（完成）
                    status = 10010;
                }
                else if(refundDetail.getInteger("refundStatus") == 2){
                    // 14000-卖家拒绝退款
                    status = 14000;
                }
                else if(refundDetail.getInteger("refundStatus") == 4){
                    // 10011-退款关闭（取消）
                    status = 10011;
                }else if(refundDetail.getInteger("refundStatus") == 11 || refundDetail.getInteger("refundStatus") == 18){
                    // 10011-退款关闭（取消）
                    status = 10011;
                }else {
                    status = -100;
                }

                insert.setRefundReason(refundDetail.getString("refundReason"));
                insert.setStatus(status);

            }else{
                //服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭 10005-待收货 10006-待处理领取 10007-待处理
                // 10009-待用户确认 10010-完成 10011-取消 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单
                // 12000-上门维修中 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）
                insert.setStatus(refundDetail.getInteger("serviceStatus"));
                insert.setRefundReason(refundDetail.getString("questionDesc"));
            }
            insert.setCreateTime(new Date());
            insert.setCreateBy("REFUND_MESSAGE");
            mapper.insert(insert);
        }else{
            // 修改
            ORefund update = new ORefund();
            update.setId(oRefunds.get(0).getId());
            if(refundDetail.getInteger("customerExpect")==1) {
                List<OOrderItem> oOrderItems = orderItemMapper.selectList(
                        new LambdaQueryWrapper<OOrderItem>()
                                .eq(OOrderItem::getOrderNum, oRefunds.get(0).getOrderNum())
                                .eq(OOrderItem::getSkuId, oRefunds.get(0).getSkuId())
                );
                update.setOrderItemNum(oOrderItems.isEmpty() ? oRefunds.get(0).getOrderNum() : oOrderItems.get(0).getSubOrderNum());
            }
            update.setRefundFee(refundDetail.getDouble("applyRefundSum")!=null?refundDetail.getDouble("applyRefundSum")/100:0.0);
            // 类型不同处理
            if(refundDetail.getInteger("customerExpect") == 1){
                // 售前退款，状态处理
                Integer status = null;
                if(refundDetail.getInteger("refundStatus")  == 0){
                    // 10001-待审核
                    status = 10001;
                }
                else if(refundDetail.getInteger("refundStatus") == 1 || refundDetail.getInteger("refundStatus") == 5){
                    // 10003-审核通过 等待平台审核
                    status = 10003;
                }
                else if(refundDetail.getInteger("refundStatus") == 3 || refundDetail.getInteger("refundStatus") == 6 || refundDetail.getInteger("refundStatus") == 9){
                    // 10010-退款成功（完成）
                    status = 10010;
                }
                else if(refundDetail.getInteger("refundStatus") == 2){
                    // 14000-卖家拒绝退款
                    status = 14000;
                }
                else if(refundDetail.getInteger("refundStatus") == 4){
                    // 10011-退款关闭（取消）
                    status = 10011;
                }else if(refundDetail.getInteger("refundStatus") == 11 || refundDetail.getInteger("refundStatus") == 18){
                    // 10011-退款关闭（取消）
                    status = 10011;
                }else {
                    status = -100;
                }
                update.setRefundReason(refundDetail.getString("refundReason"));
                update.setStatus(status);

            }else{
                //服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭 10005-待收货 10006-待处理领取 10007-待处理
                // 10009-待用户确认 10010-完成 10011-取消 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单
                // 12000-上门维修中 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）
                update.setStatus(refundDetail.getInteger("serviceStatus"));
                update.setRefundReason(refundDetail.getString("questionDesc"));
            }
            update.setUpdateTime(new Date());
            update.setUpdateBy("REFUND_MESSAGE");
            mapper.updateById(update);
        }
        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> jdvcRefundMessage(String returnId,JSONObject refundDetail) {
        log.info("京东VC退货消息处理" + returnId);
//        log.info("=====jdvc refund message===消息处理" + returnId);
//        JSONObject jsonObject = jdApiService.getRefundDetail(Long.parseLong(returnId),1);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====jdvc refund message===没有找到退款单");
//            return ResultVo.error(404,"没有找到退款单");
//        }
//
//        JSONObject refundDetail = jsonObject.getJSONObject("data");
        log.info("=====jdvc refund message===退款单:"+JSONObject.toJSONString(refundDetail));



//        List<JdVcRefund> returnList = jdVcRefundMapper.selectList(new LambdaQueryWrapper<JdVcRefund>().eq(JdVcRefund::getId, returnId));
//        if (returnList == null || returnList.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound, "没有找到京东VC退货单：" + returnId);
//        }
//        JdVcRefund jdVcRefund = returnList.get(0);
        // 对JSON做处理
//        JSONArray jsonArray = JSONArray.parseArray(jdVcRefund.getOrderDetailList());

        //类型(10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)
        Integer refundType=null;
        Integer hasReturnGoods = null;
        if(refundDetail.getInteger("orderState")==29 ) {
            if (refundDetail.getInteger("operatorState") == 5 || refundDetail.getInteger("operatorState") == 10) {
                refundType = 11;//这是没有发货的退货
                hasReturnGoods = 0;
            } else if (refundDetail.getInteger("operatorState") == 16) {
                refundType = 10;//这是发货了的退款
                hasReturnGoods = 1;
            }
        }
        Integer status=10010;
        //审核状态0未审核 1审核通过 2审核不通过
        if(refundDetail.getInteger("approvalState")==0){
            // 10001-待审核
            status = 10001;
        }else if(refundDetail.getInteger("approvalState")==1){
            status = 10010;
        }else if(refundDetail.getInteger("approvalState")==2){
            status = 14000;
        }


        List<ORefund> oRefunds = mapper.selectList(new LambdaQueryWrapper<ORefund>().eq(ORefund::getRefundNum, returnId));

        if (oRefunds == null || oRefunds.isEmpty()) {
            // 新增
            ORefund insert = new ORefund();
            insert.setRefundNum(refundDetail.getString("id"));
            insert.setRefundType(refundType);
            insert.setHasGoodReturn(hasReturnGoods);
            insert.setShopId(refundDetail.getLong("shopId"));
            insert.setShopType(EnumShopType.JDVC.getIndex());

            // 查询ERP订单
//            OOrder order = null;
//            OOrderItem orderItem = null;
//            List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, jdVcRefund.getCustomOrderId()).eq(OOrder::getShopId, jdVcRefund.getShopId()));
//            if(oOrders!=null && oOrders.size()>0){
//                order = oOrders.get(0);
//                List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrders.get(0).getId()).eq(OOrderItem::getSkuId, jdVcRefund.getSkuId()));
//                if(oOrderItems!=null && oOrderItems.size()>0){
//                    orderItem = oOrderItems.get(0);
//                }else{
//                    log.info("没有找到TAO子订单erp信息：");
//                    return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO子订单erp信息：");
//                }
//            }else{
//                log.info("没有找到TAO订单erp信息："+jdVcRefund.getCustomOrderId());
//                return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO订单erp信息："+jdVcRefund.getCustomOrderId());
//            }

            insert.setOrderNum(refundDetail.getString("customOrderId"));
            insert.setOrderItemNum(refundDetail.getString("customOrderId")+"-"+refundDetail.getString("skuId"));
            insert.setSkuId(refundDetail.getLong("skuId"));
            insert.setGoodsId(refundDetail.getLong("ogoodsId"));
            insert.setGoodsSkuId(refundDetail.getString("ogoodsSkuId"));
            insert.setSkuNum(refundDetail.getString("skuId"));
            insert.setGoodsName(refundDetail.getString("commodityName"));
            insert.setGoodsSku("");
            insert.setGoodsImage("");
            insert.setQuantity(refundDetail.getLong("commodityNum"));

            insert.setRefundReason(refundDetail.getString("roReason"));
            insert.setStatus(status);
            insert.setRefundFee(refundDetail.getDouble("roApplyFee"));
            // todo:少了一個退款申請時間
            insert.setCreateTime(new Date());
            insert.setCreateBy("REFUND_MESSAGE");
            mapper.insert(insert);
        } else {
            // 修改
            ORefund update = new ORefund();
            update.setId(oRefunds.get(0).getId());
            update.setRefundType(refundType);
            update.setHasGoodReturn(hasReturnGoods);
            update.setGoodsId(refundDetail.getLong("ogoodsId"));
            update.setGoodsSkuId(refundDetail.getString("ogoodsSkuId"));
            update.setRefundFee(refundDetail.getDouble("roApplyFee"));
            update.setStatus(status);
//                update.setStatus(jdAfter.getServiceStatus());
            update.setUpdateTime(new Date());
            update.setUpdateBy("REFUND_MESSAGE");
            mapper.updateById(update);
        }


        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> taoRefundMessage(String refundId,JSONObject refundDetail) {
        log.info("TAO退款消息处理" + refundId);
//        log.info("=====tao refund message===消息处理" + refundId);
//        JSONObject jsonObject = taoApiService.getRefundDetail(Long.parseLong(refundId));
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====tao refund message===没有找到退款单");
//            return ResultVo.error(404,"没有找到退款单");
//        }
//
//        JSONObject refundDetail = jsonObject.getJSONObject("data");
        log.info("=====tao refund message===退款单:"+JSONObject.toJSONString(refundDetail));
//        List<TaoRefund> refundList = taoRefundMapper.selectList(new LambdaQueryWrapper<TaoRefund>().eq(TaoRefund::getRefundId, refundId));
//        if (refundList == null || refundList.size() == 0) {
//            // 没有找到订单信息
//            log.info("没有找到TAO售后单："+refundId);
//            return ResultVo.error(ResultVoEnum.NotFound, "没有找到TAO售后单：" + refundId);
//        }
//        TaoRefund taoRefund = refundList.get(0);
//        List<TaoOrderItem> taoOrderItems = taoOrderItemMapper.selectList(new LambdaQueryWrapper<TaoOrderItem>().eq(TaoOrderItem::getOid, taoRefund.getOid()));
//        if(taoOrderItems == null || taoOrderItems.size()==0) {
//            log.info("没有找到TAO子订单："+taoRefund.getOid());
//            return ResultVo.error(ResultVoEnum.NotFound, "没有找到TAO子订单：" + taoRefund.getOid());
//        }
        // 查询ERP订单
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

        List<ORefund> oRefunds = mapper.selectList(new LambdaQueryWrapper<ORefund>().eq(ORefund::getRefundNum, refundId));
        Integer status= null;
        //退款状态。WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货)
        // SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)
        if(refundDetail.getString("status").equals("WAIT_SELLER_AGREE")){
            // 10001-待审核
            status = 10001;
        }else if(refundDetail.getString("status").equals("WAIT_BUYER_RETURN_GOODS")){
            // 10002-等待买家退货(待客户反馈)
            status = 10002;
        }else if(refundDetail.getString("status").equals("WAIT_SELLER_CONFIRM_GOODS")){
            // 10005-等待卖家确认收货(待收货)
            status = 10005;
        }else if(refundDetail.getString("status").equals("SELLER_REFUSE_BUYER")){
            // 14000-卖家拒绝退款
            status = 14000;
        }else if(refundDetail.getString("status").equals("CLOSED")){
            // 10011-退款关闭（取消）
            status = 10011;
        }else if(refundDetail.getString("status").equals("SUCCESS")){
            // 10010-退款成功（完成）
            status = 10010;
        }
        if (oRefunds == null || oRefunds.isEmpty()) {
            // 新增
            ORefund insert = new ORefund();
            insert.setRefundNum(refundId);
            // (1-售前退款 10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)
            Integer refundType = null;
            // REFUND(仅退款),REFUND_AND_RETURN(退货退款),TMALL_EXCHANGE(天猫换货),TAOBAO_EXCHANGE(淘宝换货),REPAIR(维修),RESHIPPING(补寄),OTHERS(其他)
            if (refundDetail.getString("disputeType").equals("REFUND")) {
                refundType = 11;
            } else if (refundDetail.getString("disputeType").equals("REFUND_AND_RETURN")) {
                refundType = 10;
            } else if (refundDetail.getString("disputeType").equals("TMALL_EXCHANGE") || refundDetail.getString("disputeType").equals("TAOBAO_EXCHANGE")) {
                refundType = 20;
            } else if (refundDetail.getString("disputeType").equals("REPAIR")) {
                refundType = 30;
            } else if (refundDetail.getString("disputeType").equals("RESHIPPING")) {
                refundType = 80;
            } else if (refundDetail.getString("disputeType").equals("OTHERS")) {
                refundType = 0;
            }
            insert.setRefundType(refundType);
            insert.setHasGoodReturn(refundDetail.getInteger("hasGoodReturn"));
            insert.setShopId(refundDetail.getLong("shopId"));
            insert.setShopType(EnumShopType.TAO.getIndex());
            insert.setOrderNum(refundDetail.getString("tid"));
            insert.setOrderItemNum(refundDetail.getString("oid"));
            insert.setSkuId(refundDetail.getLong("skuId"));
            insert.setGoodsId(refundDetail.getLong("ogoodsId"));
            insert.setGoodsSkuId(refundDetail.getString("ogoodsSkuId"));
            insert.setSkuNum(refundDetail.getString("outerId"));
            insert.setGoodsName(refundDetail.getString("title"));
            insert.setGoodsSku(refundDetail.getString("sku"));
//            insert.setGoodsImage(refundDetail.getString("oGoodsSkuId"));
            insert.setQuantity(refundDetail.getLong("num"));
            insert.setStatus(status);
            insert.setRefundFee(refundDetail.getDouble("refundFee"));
            insert.setOrderAmount(refundDetail.getDouble("totalFee"));
            insert.setRefundReason(refundDetail.getString("reason"));
            insert.setRemark(refundDetail.getString("desc1"));
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
            update.setHasGoodReturn(refundDetail.getInteger("hasGoodReturn"));
//            Integer status= null;
//            //退款状态。WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货)
//            // SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)
//            if(taoRefund.getStatus().equals("WAIT_SELLER_AGREE")){
//                // 10001-待审核
//                status = 10001;
//            }else if(taoRefund.getStatus().equals("WAIT_BUYER_RETURN_GOODS")){
//                // 10002-等待买家退货(待客户反馈)
//                status = 10002;
//            }else if(taoRefund.getStatus().equals("WAIT_SELLER_CONFIRM_GOODS")){
//                // 10005-等待卖家确认收货(待收货)
//                status = 10005;
//            }else if(taoRefund.getStatus().equals("SELLER_REFUSE_BUYER")){
//                // 14000-卖家拒绝退款
//                status = 14000;
//            }else if(taoRefund.getStatus().equals("CLOSED")){
//                // 10011-退款关闭（取消）
//                status = 10011;
//            }else if(taoRefund.getStatus().equals("SUCCESS")){
//                // 10010-退款成功（完成）
//                status = 10010;
//            }
            update.setSkuId(refundDetail.getLong("skuId"));
            update.setGoodsId(refundDetail.getLong("ogoodsId"));
            update.setGoodsSkuId(refundDetail.getString("ogoodsSkuId"));
            update.setSkuNum(refundDetail.getString("outerId"));
            update.setRefundFee(refundDetail.getDouble("refundFee"));
            update.setOrderAmount(refundDetail.getDouble("totalFee"));
            update.setStatus(status);
            update.setUpdateTime(new Date());
            update.setUpdateBy("REFUND_MESSAGE");
            mapper.updateById(update);
        }
        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> pddRefundMessage(String refundId,JSONObject refundDetail) {
        log.info("=====pdd refund message===消息处理" + refundId);
//        JSONObject jsonObject = pddApiService.getRefundDetail(Long.parseLong(refundId));
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====pdd refund message===没有找到退款单");
//            return ResultVo.error(404,"没有找到退款单");
//        }
//
//        JSONObject refundDetail = jsonObject.getJSONObject("data");
        log.info("=====pdd refund message===退款单:"+JSONObject.toJSONString(refundDetail));

//        List<PddRefund> refundList = pddRefundMapper.selectList(new LambdaQueryWrapper<PddRefund>().eq(PddRefund::getId, refundId));
//        if (refundList == null || refundList.size() == 0) {
//            // 没有找到订单信息
//            log.info("没有找到PDD售后单："+refundId);
//            return ResultVo.error(ResultVoEnum.NotFound, "没有找到PDD售后单：" + refundId);
//        }
//        PddRefund originRefund = refundList.get(0);

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
//                            .eq(OOrderItem::getOrderNum, oOrders.get(0).getId())
//                            .eq(OOrderItem::getSkuId, originRefund.getSkuId())
//            );

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

        Integer status= null;
        //退款状态O_Refund
        // 状态（10001待审核 10002等待买家退货 10003等待平台审核 10004待买家处理 10005等待卖家处理 10006等待卖家发货 14000拒绝退款 10011退款关闭 10010退款完成 10090退款中 10091换货成功 10092换货失败 10093维修关闭 10094维修成功 ）

        // PDD 售后状态
        // (10001) 2：买家申请退款，待商家处理 3：退货退款，待商家处理
        // (10090) 4：商家同意退款，退款中 5：平台同意退款，退款中
        // (10004) 6：驳回退款，待买家处理
        // (10002) 7：已同意退货退款,待用户发货
        // (10003) 8：平台处理中
        // (10011) 9：平台拒绝退款，退款关闭
        // (10010) 10：退款成功
        // (10011) 11：买家撤销  12：买家逾期未处理，退款失败 13：买家逾期，超过有效期
        // (10005) 14：换货补寄待商家处理  21：待商家同意维修 33：待商家召回
        // (10004) 15：换货补寄待用户处理 18：换货补寄待用户确认完成  27：待用户确认收货 22：待用户确认发货  31：已同意拒收退款，待用户拒收
        // (10091) 16：换货补寄成功
        // (10092) 17：换货补寄失败
        // (10093) 24：维修关闭
        // (10094) 25：维修成功
        // (10006) 32：补寄待商家发货
        Integer afterSalesStatus = refundDetail.getInteger("afterSalesStatus");
        if(afterSalesStatus== 2 ||afterSalesStatus== 3){
            // 10001-待审核(待商家处理)
            status = 10001;
        }else if(afterSalesStatus==4 ||afterSalesStatus== 5){
            // 10090退款中
            status = 10090;
        }else if(afterSalesStatus == 6 ){
            // 10004 驳回退款，待买家处理
            status = 10004;
        }else if(afterSalesStatus == 7 ){
            // 10002等待买家退货
            status = 10002;
        }else if(afterSalesStatus == 8 ){
            // 10003等待平台审核
            status = 10003;
        }else if(afterSalesStatus == 9 ||afterSalesStatus == 11||afterSalesStatus == 12||afterSalesStatus == 13){
            // 10011退款关闭
            status = 10011;
        }else if(afterSalesStatus == 10 ){
            // 10010退款完成
            status = 10010;
        }else if(afterSalesStatus == 14 ||afterSalesStatus == 21||afterSalesStatus== 33){
            // 10005等待卖家处理
            status = 10005;
        }else if(afterSalesStatus == 15 ||afterSalesStatus== 18||afterSalesStatus == 22||afterSalesStatus == 27||afterSalesStatus == 31){
            // 10004待买家处理
            status = 10004;
        }else if(afterSalesStatus == 32 ){
            // 10006等待卖家发货
            status = 10006;
        }else if(afterSalesStatus == 16 ){
            // 10091换货成功
            status = 10091;
        }else if(afterSalesStatus == 17 ){
            // 10092换货失败
            status = 10092;
        }else if(afterSalesStatus == 24 ){
            // 10093维修关闭
            status = 10093;
        }else if(afterSalesStatus == 25 ){
            // 10094维修成功
            status = 10094;
        }

        List<ORefund> oRefunds = mapper.selectList(new LambdaQueryWrapper<ORefund>().eq(ORefund::getRefundNum, refundId));
        if (oRefunds == null || oRefunds.isEmpty()) {
            // 新增
            ORefund insert = new ORefund();
            insert.setRefundNum(refundId);
            // O_Refund (类型(1-售前退款 10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)
            Integer hasGoodReturn = 0;
            Integer refundType = null;
            // PDD 售后类型 1：全部 2：仅退款 3：退货退款 4：换货 5：缺货补寄 6：维修
            if (refundDetail.getInteger("afterSalesType")==2) {
                refundType = 11;
            } else if (refundDetail.getInteger("afterSalesType")==3) {
                refundType = 10;
                if(refundDetail.getInteger("afterSalesType")==2){
                    hasGoodReturn = 1;
                }
            } else if (refundDetail.getInteger("afterSalesType")==4) {
                refundType = 20;
                hasGoodReturn = 1;
            } else if (refundDetail.getInteger("afterSalesType")==6) {
                refundType = 30;
            } else if (refundDetail.getInteger("afterSalesType")==5) {
                refundType = 80;
            }
            insert.setRefundType(refundType);
            insert.setHasGoodReturn(hasGoodReturn);
            insert.setShopId(refundDetail.getLong("shopId"));
            insert.setShopType(EnumShopType.PDD.getIndex());
            insert.setOrderNum(refundDetail.getString("orderSn"));
            insert.setSkuId(refundDetail.getLong("skuId"));
            List<OOrderItem> oOrderItems = orderItemMapper.selectList(
                    new LambdaQueryWrapper<OOrderItem>()
                            .eq(OOrderItem::getOrderNum, insert.getOrderNum())
                            .eq(OOrderItem::getSkuId, insert.getSkuId())
            );

            insert.setOrderItemNum(oOrderItems.isEmpty()?insert.getOrderNum():oOrderItems.get(0).getSubOrderNum());

            insert.setGoodsId(refundDetail.getLong("ogoodsId"));
            insert.setGoodsSkuId(refundDetail.getString("ogoodsSkuId"));
            insert.setSkuNum(refundDetail.getString("outerId"));
            insert.setGoodsName(refundDetail.getString("goodsName"));
            insert.setGoodsSku(refundDetail.getString("goodsSpec"));
            insert.setGoodsImage(refundDetail.getString("goodsImage"));
            insert.setQuantity(refundDetail.getLong("goodsNumber"));
            insert.setOrderAmount(refundDetail.getDouble("orderAmount"));
            insert.setReturnLogisticsCode(refundDetail.getString("trackingNumber"));
            insert.setStatus(status);
            insert.setRefundFee(refundDetail.getDouble("refundAmount"));
            insert.setRefundReason(refundDetail.getString("afterSaleReason"));
            insert.setRemark("");
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
            List<OOrderItem> oOrderItems = orderItemMapper.selectList(
                    new LambdaQueryWrapper<OOrderItem>()
                            .eq(OOrderItem::getOrderNum, oRefunds.get(0).getOrderNum())
                            .eq(OOrderItem::getSkuId, oRefunds.get(0).getSkuId())
            );

            update.setOrderItemNum(oOrderItems.isEmpty()?update.getOrderNum():oOrderItems.get(0).getSubOrderNum());

            update.setGoodsId(refundDetail.getLong("ogoodsId"));
            update.setGoodsSkuId(refundDetail.getString("ogoodsSkuId"));
            update.setStatus(status);
            update.setUpdateTime(new Date());
            update.setUpdateBy("REFUND_MESSAGE");
            mapper.updateById(update);
        }
        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> douRefundMessage(String refundId,JSONObject refundDetail) {
        log.info("DOU退款消息处理" + refundId);
//        JSONObject jsonObject = douApiService.getRefundDetail(refundId);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====dou refund message===没有找到退款单");
//            return ResultVo.error(404,"没有找到退款单");
//        }
//
//        JSONObject refundDetail = jsonObject.getJSONObject("data");
        log.info("=====dou refund message===退款单:"+JSONObject.toJSONString(refundDetail));

//        List<DouRefund> refundList = douRefundMapper.selectList(new LambdaQueryWrapper<DouRefund>().eq(DouRefund::getAftersaleId, refundId));
//        if (refundList == null || refundList.size() == 0) {
//            // 没有找到订单信息
//            log.info("没有找到DOU售后单："+refundId);
//            return ResultVo.error(ResultVoEnum.NotFound, "没有找到DOU售后单：" + refundId);
//        }
//        DouRefund originRefund = refundList.get(0);

        // 查询ERP订单
//        OOrder order = null;
//        OOrderItem orderItem = null;
//        List<OOrder> oOrders = orderMapper.selectList(
//                new LambdaQueryWrapper<OOrder>()
//                        .eq(OOrder::getOrderNum, originRefund.getRelatedId())
//                        .eq(OOrder::getShopId, originRefund.getShopId()));
//
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
        //退款状态O_Refund
        // 状态（10001待审核 10002等待买家退货 10003等待平台审核 10004待买家处理 10005等待卖家处理 10006等待卖家发货 14000拒绝退款 10011退款关闭 10010退款完成 10020售后成功 10021售后失败 10090退款中 10091换货成功 10092换货失败 10093维修关闭 10094维修成功 ）

        Integer status= null;
        //DOU退款状态。3-换货待买家收货；6-待商家同意；7-待买家退货；8-待商家发货；11-待商家二次同意；12-售后成功；14-换货成功；27-商家一次拒绝；28-售后失败；29-商家二次拒绝；

        if(refundDetail.getInteger("aftersaleStatus")==3){
            // 10004待买家处理
            status = 10004;
        }else if(refundDetail.getInteger("aftersaleStatus")==6||refundDetail.getInteger("aftersaleStatus")==11){
            // 10005等待卖家处理
            status = 10005;
        }else if(refundDetail.getInteger("aftersaleStatus")==7){
            // 10002等待买家退货
            status = 10002;
        }else if(refundDetail.getInteger("aftersaleStatus")==8){
            // 10006等待卖家发货
            status = 10006;
        }else if(refundDetail.getInteger("aftersaleStatus")==12){
            // 10020售后成功
            status = 10020;
        }else if(refundDetail.getInteger("aftersaleStatus")==14){
            // 10091换货成功
            status = 10091;
        }else if(refundDetail.getInteger("aftersaleStatus")==28){
            // 10021售后失败
            status = 10021;
        }else if(refundDetail.getInteger("aftersaleStatus")==27||refundDetail.getInteger("aftersaleStatus")==29){
            // 14000拒绝退款
            status = 14000;
        }
        // O_Refund(类型(1-售前退款 10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款))
        Integer refundType = null;
        Integer hasGoodReturn = 0;
        // dou_refund售后类型；0-退货退款；1-已发货仅退款；2-未发货仅退款；3-换货；6-价保；7-补寄；8-维修
        if (refundDetail.getInteger("aftersaleType")==0) {
            refundType = 10;
            if(refundDetail.getInteger("gotPkg")==1) {
                hasGoodReturn = 1;
            }
        } else if (refundDetail.getInteger("aftersaleType")==1) {
            refundType = 11;
            if(refundDetail.getInteger("gotPkg")==1) {
                hasGoodReturn = 1;
            }
        } else if (refundDetail.getInteger("aftersaleType")==2) {
            refundType = 1;
        } else if (refundDetail.getInteger("aftersaleType")==3) {
            refundType = 20;
            hasGoodReturn = 1;
        } else if (refundDetail.getInteger("aftersaleType")==7) {
            refundType = 80;
        } else if (refundDetail.getInteger("aftersaleType")==8) {
            refundType = 30;
        }else if (refundDetail.getInteger("aftersaleType")==6) {
            refundType = 0;
        }
        List<ORefund> oRefunds = mapper.selectList(new LambdaQueryWrapper<ORefund>().eq(ORefund::getRefundNum, refundId));
        if (oRefunds == null || oRefunds.isEmpty()) {
            // 新增
            ORefund insert = new ORefund();
            insert.setRefundNum(refundId);
            insert.setRefundType(refundType);
            insert.setHasGoodReturn(hasGoodReturn);
            insert.setShopId(refundDetail.getLong("shopId"));
            insert.setShopType(EnumShopType.DOU.getIndex());
            insert.setOrderNum(refundDetail.getString("relatedId"));
            insert.setOrderItemNum(refundDetail.getString("orderSkuOrderId"));
            insert.setSkuId(refundDetail.getLong("skuId"));
            insert.setGoodsId(refundDetail.getLong("ogoodsId"));
            insert.setGoodsSkuId(refundDetail.getString("ogoodsSkuId"));
            insert.setSkuNum(refundDetail.getString("outSkuId"));
            insert.setGoodsName(refundDetail.getString("orderProductName"));
            insert.setGoodsSku(refundDetail.getString("orderSkuSpec"));
            insert.setGoodsImage(refundDetail.getString("orderProductImage"));
            insert.setQuantity(refundDetail.getLong("aftersaleNum"));

            insert.setStatus(status);
            insert.setRefundFee(refundDetail.getDouble("refundAmount")/100);
            insert.setRefundReason("");
            insert.setRemark("");
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
            update.setRefundType(refundType);
            update.setHasGoodReturn(hasGoodReturn);
            update.setGoodsId(refundDetail.getLong("ogoodsId"));
            update.setGoodsSkuId(refundDetail.getString("ogoodsSkuId"));
            update.setStatus(status);
            update.setUpdateTime(new Date());
            update.setUpdateBy("REFUND_MESSAGE");
            mapper.updateById(update);
        }
        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> weiRefundMessage(String refundId,JSONObject refundDetail) {
        log.info("WEI退款消息处理" + refundId);
//        JSONObject jsonObject = weiApiService.getRefundDetail(refundId);
//        if (jsonObject.getInteger("code") != 200 || jsonObject.getJSONObject("data") == null) {
//            log.info("=====wei refund message===没有找到退款单");
//            return ResultVo.error(404, "没有找到退款单");
//        }
//
//        JSONObject refundDetail = jsonObject.getJSONObject("data");
        log.info("=====wei refund message===退款单:" + JSONObject.toJSONString(refundDetail));
        return ResultVo.success();
    }

        @Override
    public List<ORefund> selectList(ORefund refund) {
        List<ORefund> list = mapper.selectList(new LambdaQueryWrapper<>());
        return list;
    }

    @Override
    public PageResult<ORefund> queryPageList(RefundSearchBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ORefund> queryWrapper = new LambdaQueryWrapper<ORefund>()
                .eq(StringUtils.hasText(bo.getRefundNum()),ORefund::getRefundNum,bo.getRefundNum())
                .eq(StringUtils.hasText(bo.getOrderNum()),ORefund::getOrderNum,bo.getOrderNum())
                .eq(bo.getRefundType()!=null,ORefund::getRefundType,bo.getRefundType())
                .eq(bo.getShopId()!=null,ORefund::getShopId,bo.getShopId())
                .eq(bo.getHasProcessing()!=null,ORefund::getHasProcessing,bo.getHasProcessing())
                .eq(bo.getErpPushStatus()!=null && bo.getErpPushStatus() == 0,ORefund::getErpPushStatus,0)
                .eq(bo.getErpPushStatus()!=null && bo.getErpPushStatus() == 200,ORefund::getErpPushStatus,200)
                .gt(bo.getErpPushStatus()!=null && bo.getErpPushStatus() == 500,ORefund::getErpPushStatus,200)
                ;
        if(bo.getRefundType()== null){
//            LambdaQueryWrapper<ORefund> typeOr = new LambdaQueryWrapper<ORefund>();
//            typeOr.eq(ORefund::getRefundType,11);
//            typeOr.or().eq(ORefund::getRefundType,10);
//            typeOr.or().eq(ORefund::getRefundType,20);
            queryWrapper.and(x->x.eq(ORefund::getRefundType,11)
                    .or().eq(ORefund::getRefundType,20)
                    .or().eq(ORefund::getRefundType,10)
                    .or().eq(ORefund::getRefundType,1)
            );
        }

        Page<ORefund> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    @Override
    public PageResult<ORefund> queryPageWaitPushErpList(PageQuery pageQuery) {
        LambdaQueryWrapper<ORefund> queryWrapper = new LambdaQueryWrapper<ORefund>()
                .and(x->x.eq(ORefund::getRefundType,11).or().eq(ORefund::getRefundType,20).or().eq(ORefund::getRefundType,10)
                );


        Page<ORefund> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    @Override
    public ORefund selectById(Long id) {
        return mapper.selectById(id);
    }

    /**
     * 售后处理
     * @param processingBo
     * @return
     */
    @Transactional
    @Override
    public ResultVo<Long> refundProcessing(RefundProcessingBo processingBo, String createBy) {
        if (processingBo.getRefundId() == null) return ResultVo.error(500, "缺少参数refundId");

        ORefund refund = mapper.selectById(processingBo.getRefundId());
        if (refund == null) return ResultVo.error(500,"没有找到退款单");
        else if (refund.getHasProcessing() == 1) {
            return ResultVo.error(500,"已经处理过了");
        }

        // 查询相关订单
        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, refund.getOrderNum()));
        List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderNum, refund.getOrderNum()).eq(OOrderItem::getSkuId, refund.getSkuId()));
        List<OGoodsSku> oGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getSkuCode, refund.getSkuNum()));
        // 保存售后结果
        OAfterSale afterSale = new OAfterSale();
        afterSale.setRefundNum(refund.getRefundNum());
        afterSale.setRefundId(processingBo.getRefundId().toString());
        afterSale.setType(processingBo.getType());
        afterSale.setShopId(refund.getShopId());
        afterSale.setShopType(refund.getShopType());
        afterSale.setOrderNum(refund.getOrderNum());
        afterSale.setSubOrderNum(refund.getOrderItemNum());
        afterSale.setOOrderId(oOrders.isEmpty()?"0":oOrders.get(0).getId());
        afterSale.setOOrderItemId(oOrderItems.isEmpty()?"0":oOrderItems.get(0).getId());
        afterSale.setSkuId(refund.getSkuId());
        afterSale.setQuantity(refund.getQuantity().intValue());
        afterSale.setTitle(refund.getGoodsName());
        afterSale.setImg(refund.getGoodsImage());
        afterSale.setSkuInfo(refund.getGoodsSku());
        afterSale.setSkuCode(refund.getSkuNum());
        afterSale.setOGoodsId(oGoodsSkus.isEmpty()?"0":oGoodsSkus.get(0).getGoodsId().toString());
        afterSale.setOGoodsSkuId(oGoodsSkus.isEmpty()?"0":oGoodsSkus.get(0).getId().toString());
        afterSale.setHasGoodsSend(processingBo.getHasGoodsSend());
        afterSale.setSendLogisticsCode(processingBo.getSendLogisticsCode());
        afterSale.setReturnLogisticsCode(processingBo.getReturnLogisticsCode());
        afterSale.setReceiverName(processingBo.getReceiverName());
        afterSale.setReceiverTel(processingBo.getReceiverTel());
        afterSale.setReceiverAddress(processingBo.getReceiverAddress());
        afterSale.setReissueLogisticsCode(processingBo.getReissueLogisticsCode());
        afterSale.setRemark(processingBo.getRemark());
        afterSale.setStatus(processingBo.getType() == 0?10:0);
        afterSale.setCreateTime(new Date());
        afterSale.setCreateBy(createBy);

        afterSaleMapper.insert(afterSale);


        // 更新ORefund
        ORefund update = new ORefund();
        update.setId(refund.getId());
        update.setUpdateBy(createBy+"操作售后处理");
        update.setUpdateTime(new Date());
        update.setHasProcessing(1);
        update.setAfterSaleId(afterSale.getId());
        mapper.updateById(update);

        return ResultVo.success();
    }
}




