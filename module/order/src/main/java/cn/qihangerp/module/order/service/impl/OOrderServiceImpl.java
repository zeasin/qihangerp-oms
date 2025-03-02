package cn.qihangerp.module.order.service.impl;


import cn.qihangerp.module.order.domain.OOrder;
import cn.qihangerp.module.order.domain.OOrderItem;
import cn.qihangerp.module.order.domain.OfflineOrder;
import cn.qihangerp.module.order.domain.OfflineOrderItem;
import cn.qihangerp.module.order.domain.vo.OrderDiscountVo;
import cn.qihangerp.module.order.domain.vo.SalesDailyVo;
import cn.qihangerp.module.order.mapper.OOrderItemMapper;
import cn.qihangerp.module.order.mapper.OOrderMapper;
import cn.qihangerp.module.order.mapper.OfflineOrderItemMapper;
import cn.qihangerp.module.order.mapper.OfflineOrderMapper;
import cn.qihangerp.module.order.service.OOrderService;
import cn.qihangerp.request.OrderSearchRequest;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.enums.JdOrderStateEnum;
import cn.qihangerp.common.enums.TaoOrderStateEnum;
import cn.qihangerp.common.utils.DateUtils;
import cn.qihangerp.common.utils.StringUtils;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    private final OfflineOrderMapper offlineOrderMapper;
    private final OfflineOrderItemMapper offlineOrderItemMapper;

//    private final PddApiService pddApiService;
//    private final TaoApiService taoApiService;
//    private final JdApiService jdApiService;
//    private final DouApiService douApiService;
//    private final WeiApiService weiApiService;


    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);
    @Transactional
    @Override
    public ResultVo<Integer> jdOrderMessage(String orderId,JSONObject orderDetail) {
        log.info("京东订单消息处理"+orderId);
//        JSONObject jsonObject = jdApiService.getOrderDetail(Long.parseLong(orderId),0);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====jdpop order message===没有找到订单");
//            return ResultVo.error(404,"没有找到订单");
//        }

//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====jdpop order message===订单:"+JSONObject.toJSONString(orderDetail));

        JSONArray itemArray = orderDetail.getJSONArray("items");
        if (itemArray.isEmpty()) {
//            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            log.info("=====jdpop order message===没有items====事务回滚=======");
        }

//        List<JdOrder> jdOrders = jdOrderMapper.selectList(new LambdaQueryWrapper<JdOrder>().eq(JdOrder::getOrderId, orderId));
//        if(jdOrders == null || jdOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到JD订单："+orderId);
//        }
//        JdOrder jdOrder = jdOrders.get(0);
        // 状态
        int orderStatus = JdOrderStateEnum.getIndex(orderDetail.getString("orderState"));
        Integer refundStatus=-1;
        if (orderStatus == 11) {
            //已取消的订单
            refundStatus=4;
        } else if (orderStatus == -1) {
            refundStatus=-1;
        } else {
            refundStatus=1;
        }
        // 价格
        double orderSellerPrice = 0.0;
        try{
            orderSellerPrice = StringUtils.isEmpty(orderDetail.getString("orderSellerPrice")) ? 0.0 : Double.parseDouble(orderDetail.getString("orderSellerPrice"));
        }catch (Exception e){}
        double freightPrice =0.0;
        try{
            freightPrice = StringUtils.isEmpty(orderDetail.getString("freightPrice")) ? 0.0 : Double.parseDouble(orderDetail.getString("freightPrice"));
        }catch (Exception e){}
        double orderPayment = 0.0;
        try {
            orderPayment = StringUtils.isEmpty(orderDetail.getString("orderPayment")) ? 0.0 : Double.parseDouble(orderDetail.getString("orderPayment"));
        }catch (Exception e){
        }
        double sellerDiscount= 0.0;
        try {
            sellerDiscount = StringUtils.isEmpty(orderDetail.getString("sellerDiscount")) ? 0.0 : Double.parseDouble(orderDetail.getString("sellerDiscount"));
        }catch (Exception e){
        }
        if(orderSellerPrice == 0.0) orderSellerPrice = orderPayment;
        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单 12
            OOrder insert = new OOrder();
            insert.setOrderNum(orderId);
            insert.setShopType(EnumShopType.JD.getIndex());
            insert.setShopId(orderDetail.getLong("shopId"));
            insert.setBuyerMemo(orderDetail.getString("orderRemark"));
            insert.setSellerMemo(orderDetail.getString("venderRemark"));
            insert.setRefundStatus(refundStatus);
            insert.setOrderStatus(orderStatus);
            // 价格
            insert.setGoodsAmount(orderSellerPrice);
            insert.setPayment(orderPayment);
            insert.setAmount(orderSellerPrice);
            insert.setPostFee(freightPrice);
            insert.setPlatformDiscount(0.0);
            insert.setSellerDiscount(sellerDiscount);

            insert.setReceiverName(orderDetail.getString("fullname"));
            insert.setReceiverMobile(orderDetail.getString("mobile"));
            insert.setAddress(orderDetail.getString("fullAddress"));
            insert.setProvince(orderDetail.getString("province"));
            insert.setCity(orderDetail.getString("city"));
            insert.setTown(orderDetail.getString("county"));
            insert.setOrderTime(DateUtils.parseDate(orderDetail.getString("orderStartTime")));
            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);

            // 添加orderItem
            addJdOrderItem(orderId,insert.getId(),orderStatus,orderSellerPrice,orderPayment,itemArray);
        }else{
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
            // 价格
            update.setGoodsAmount(orderSellerPrice);
            update.setPayment(orderPayment);
            update.setAmount(orderSellerPrice);
            update.setPostFee(freightPrice);
            update.setPlatformDiscount(0.0);
            update.setSellerDiscount(sellerDiscount);
            update.setRefundStatus(refundStatus);
            update.setOrderStatus(orderStatus);
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 删除orderItem
            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,update.getId()));
            // 插入orderItem
            addJdOrderItem(orderId,update.getId(),orderStatus,orderSellerPrice,orderPayment,itemArray);

        }
        return ResultVo.success();
    }

    private void addJdOrderItem(String orderId,String oOrderId,Integer orderStatus,Double orderSellerPrice,Double orderPayment,JSONArray itemArray ) {
        Double payedItemAmount = 0.0;//已付金额
        for (int i =0;i<itemArray.size();i++) {
            JSONObject itemObject =itemArray.getJSONObject(i);

            OOrderItem orderItem = new OOrderItem();
            orderItem.setOrderId(oOrderId);
            orderItem.setOrderNum(orderId);
            orderItem.setSubOrderNum(orderId+"-"+itemObject.getString("skuId"));
            // TODO：这里将订单商品skuid转换成erp系统的skuid
//            Long erpGoodsId = 0L;
//            String erpSkuId = "0";
//
//            List<JdGoodsSku> jdGoodsSkus = jdGoodsSkuMapper.selectList(new LambdaQueryWrapper<JdGoodsSku>().eq(JdGoodsSku::getSkuId, item.getSkuId()));
//            if (jdGoodsSkus != null && !jdGoodsSkus.isEmpty()) {
//                erpGoodsId = jdGoodsSkus.get(0).getOGoodsId();
//                erpSkuId = jdGoodsSkus.get(0).getOGoodsSkuId();
//                orderItem.setGoodsImg(jdGoodsSkus.get(0).getLogo());
//                orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
//                orderItem.setSkuNum(jdGoodsSkus.get(0).getOuterId());
//            }
            orderItem.setSkuNum(itemObject.getString("outerSkuId"));
            orderItem.setSkuId(itemObject.getString("skuId"));
            orderItem.setGoodsId(itemObject.getLong("oGoodsId"));
            orderItem.setGoodsSkuId(itemObject.getString("oGoodsSkuId"));
            orderItem.setGoodsTitle(itemObject.getString("skuName"));
            orderItem.setGoodsPrice(StringUtils.isEmpty(itemObject.getString("jdPrice")) ? 0.0 : Double.parseDouble(itemObject.getString("jdPrice")));
            Integer quantity = itemObject.getInteger("itemTotal");

            // TODO:计算子订单价格 计算公式不对
//            Double orderTotalPrice = Double.parseDouble(jdOrder.getOrderTotalPrice()) * 100;
//            Double orderPayment = Double.parseDouble(jdOrder.getOrderPayment()) * 100;
//            // 折扣比例
//            Double rate = orderPayment / orderTotalPrice;
//
//            // 折扣计算后的价格
//            if ((i+1) != itemArray.size()) {
//                Double itemAmountTmp = orderItem.getGoodsPrice() * rate * quantity;
//                double itemAmount = BigDecimal.valueOf(itemAmountTmp).setScale(2, RoundingMode.HALF_UP).doubleValue();
//                orderItem.setItemAmount(itemAmount);
//                orderItem.setPayment(itemAmount);
//                payedItemAmount += itemAmount;
////                    availableItemAmount = Double.parseDouble(jdOrder.getOrderPayment()) - availableItemAmount;
//            } else {
//                payedItemAmount = Double.parseDouble(jdOrder.getOrderPayment()) - payedItemAmount;
//                orderItem.setItemAmount(payedItemAmount);
//                orderItem.setPayment(payedItemAmount);
//            }

//                    orderItem.setItemAmount(orderItem.getGoodsPrice() *quantity);

            orderItem.setQuantity(quantity);
            if (orderStatus == 11) {
                orderItem.setRefundStatus(4);
                orderItem.setRefundCount(quantity);
            } else if (orderStatus == -1) {
                orderItem.setRefundStatus(-1);
            } else {
                orderItem.setRefundStatus(1);
                orderItem.setRefundCount(0);
            }
            orderItem.setCreateTime(new Date());
            orderItem.setCreateBy("ORDER_MESSAGE");
            orderItemMapper.insert(orderItem);
        }

    }

    @Transactional
    @Override
    public ResultVo<Integer> jdvcOrderMessage(String customOrderId,JSONObject orderDetail ) {
        log.info("接收jdvc订单消息："+customOrderId);
//        JSONObject jsonObject = jdApiService.getOrderDetail(Long.parseLong(customOrderId),1);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====jdvc order message===没有找到订单");
//            return ResultVo.error(404,"没有找到订单");
//        }
//
//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====jdvc order message===订单:"+JSONObject.toJSONString(orderDetail));

        JSONArray itemArray = orderDetail.getJSONArray("items");
        if (itemArray.isEmpty()) {
//            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            log.info("=====jdvc order message===没有items====事务回滚=======");
        }


//        List<JdVcOrder> jdVcOrders = jdVcOrderMapper.selectList(new LambdaQueryWrapper<JdVcOrder>().eq(JdVcOrder::getCustomOrderId, customOrderId));
//        if(jdVcOrders == null || jdVcOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO订单："+customOrderId);
//        }
//        JdVcOrder jdVcOrder = jdVcOrders.get(0);
        // 状态
        Integer orderStatus = null;
        Integer refundStatus = null;
        // 订单状态:7 新订单；10等待发货；16等待确认收货；19订单完成；22锁定，29删除
        Integer orderState = orderDetail.getInteger("orderState");
        if(orderState==7){
            //7 新订单；
            orderStatus = 1;
            refundStatus =1;

        }else if(orderState==10){
            //10等待发货；
            orderStatus = 1;
            refundStatus=1;
        }else if(orderState==16){
            //16等待确认收货；
            orderStatus = 2;
            refundStatus=1;
        }else if(orderState==19){
            //19订单完成；
            orderStatus = 3;
            refundStatus=1;
        }else if(orderState==22){
            //22锁定；
            orderStatus = 22;
            refundStatus = 1;
        }else if(orderState==29) {
            //29删除；
            orderStatus = 29;
            refundStatus = 1;
        }

        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, customOrderId));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            // 新增订单
            OOrder insert = new OOrder();
            insert.setOrderNum(customOrderId);
            insert.setShopType(EnumShopType.JDVC.getIndex());
            insert.setShopId(orderDetail.getLong("shopId"));
            insert.setBuyerMemo(orderDetail.getString("orderRemark"));
            insert.setSellerMemo(orderDetail.getString("memoByVendor"));

            insert.setOrderStatus(orderStatus);
            insert.setRefundStatus(refundStatus);
            insert.setGoodsAmount(orderDetail.getDouble("jdPrice"));
            insert.setPostFee(orderDetail.getDouble("totalCarriage"));
            insert.setAmount(orderDetail.getDouble("cost"));
            insert.setPayment(orderDetail.getDouble("cost"));
            insert.setPlatformDiscount(0.0);
            insert.setSellerDiscount(0.0);

            insert.setReceiverName(orderDetail.getString("consigneeName"));
            insert.setReceiverMobile(orderDetail.getString("phone"));
            insert.setAddress(orderDetail.getString("address"));
            insert.setProvince(orderDetail.getString("provinceName"));
            insert.setCity(orderDetail.getString("cityName"));
            insert.setTown(orderDetail.getString("countyName"));
            insert.setOrderTime(orderDetail.getDate("orderCreateDate"));
            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);
            // 插入orderItem
            addJdVcOrderItem(insert.getId(),customOrderId,orderStatus,orderDetail.getJSONArray("items"));
        }else {
            //修改
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
            update.setOrderStatus(orderStatus);
            update.setRefundStatus(refundStatus);
            update.setGoodsAmount(orderDetail.getDouble("jdPrice"));
            update.setPostFee(orderDetail.getDouble("totalCarriage"));
            update.setAmount(orderDetail.getDouble("cost"));
            update.setPayment(orderDetail.getDouble("cost"));
            update.setPlatformDiscount(0.0);
            update.setSellerDiscount(0.0);
            update.setPlatformDiscount(0.0);
            update.setSellerDiscount(0.0);

            update.setReceiverName(orderDetail.getString("consigneeName"));
            update.setReceiverMobile(orderDetail.getString("phone"));
            update.setAddress(orderDetail.getString("address"));
            update.setProvince(orderDetail.getString("provinceName"));
            update.setCity(orderDetail.getString("cityName"));
            update.setTown(orderDetail.getString("countyName"));
//            update.setOrderTime(jdVcOrder.getOrderCreateDate() );
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 删除orderItem
            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,update.getId()));

            // 插入orderItem
            addJdVcOrderItem(update.getId(),customOrderId,orderStatus,orderDetail.getJSONArray("items"));
        }
        return ResultVo.success();
    }

    private void addJdVcOrderItem(String oOrderId,String customOrderId,Integer orderStatus,JSONArray orderItems){

        if(orderItems!=null && orderItems.size()>0) {
            for (int i =0;i<orderItems.size();i++) {
                JSONObject itemObject =orderItems.getJSONObject(i);

                OOrderItem orderItem = new OOrderItem();
                orderItem.setOrderId(oOrderId);
                orderItem.setOrderNum(customOrderId);
                orderItem.setSubOrderNum(customOrderId+"-"+itemObject.getString("sku"));
                orderItem.setSkuNum(itemObject.getString("sku"));
                orderItem.setSkuId(itemObject.getString("sku"));
                orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
                orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
                orderItem.setGoodsImg("");
                orderItem.setGoodsSpec(itemObject.getString("wareName"));
                orderItem.setGoodsTitle(itemObject.getString("wareName"));
                orderItem.setGoodsPrice(itemObject.getDouble("jdPrice"));
                orderItem.setItemAmount(itemObject.getDouble("cost"));
                orderItem.setPayment(itemObject.getDouble("cost"));
                orderItem.setQuantity(itemObject.getInteger("wareNum"));
                orderItem.setRefundStatus(1);
                orderItem.setRefundCount(0);
                // 状态
                orderItem.setOrderStatus(orderStatus);
                orderItem.setCreateTime(new Date());
                orderItem.setCreateBy("ORDER_MESSAGE");
                orderItemMapper.insert(orderItem);
            }
        }
    }

//    @Override
//    public ResultVo<Integer> jdvcOrderMessage(String orderId) {
//        log.info("接收jdvc订单消息："+orderId);
//        List<JdVcPurchaseOrder> jdVcOrders = jdVcOrderMapper.selectList(new LambdaQueryWrapper<JdVcPurchaseOrder>().eq(JdVcPurchaseOrder::getOrderId, orderId));
//        if(jdVcOrders == null || jdVcOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO订单："+orderId);
//        }
//        JdVcPurchaseOrder jdVcOrder = jdVcOrders.get(0);
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
//        if(oOrders == null || oOrders.isEmpty()) {
//            // 新增订单
//            OOrder insert = new OOrder();
//            insert.setOrderNum(orderId);
//            insert.setShopType(EnumShopType.JDVC.getIndex());
//            insert.setShopId(jdVcOrder.getShopId().intValue());
//            insert.setBuyerMemo("");
//            insert.setSellerMemo("");
//            // 状态
//            insert.setOrderStatus(jdVcOrder.getState());
//            insert.setRefundStatus(1);
//
//            insert.setGoodsAmount(jdVcOrder.getTotalPrice());
//            insert.setPostFee(0.0);
//            insert.setAmount(jdVcOrder.getTotalPrice());
//            insert.setPayment(jdVcOrder.getTotalPrice());
//            insert.setReceiverName(jdVcOrder.getReceiverName());
//            insert.setReceiverMobile(jdVcOrder.getWarehousePhone());
//            insert.setAddress(jdVcOrder.getAddress());
//            insert.setProvince("");
//            insert.setCity("");
//            insert.setTown("");
//            insert.setOrderTime(jdVcOrder.getCreatedDate() );
//            insert.setShipType(0);
//            insert.setCreateTime(new Date());
//            insert.setCreateBy("ORDER_MESSAGE");
//
//            orderMapper.insert(insert);
//            // 插入orderItem
//            addJdVcOrderItem(insert.getId(),orderId,jdVcOrder.getState());
//        }else {
//            //修改
//            // 修改订单 (修改：)
//            OOrder update = new OOrder();
//            update.setId(oOrders.get(0).getId());
//            update.setOrderStatus(jdVcOrder.getState());
//            update.setGoodsAmount(jdVcOrder.getTotalPrice());
//            update.setPostFee(0.0);
//            update.setAmount(jdVcOrder.getTotalPrice());
//            update.setPayment(jdVcOrder.getTotalPrice());
//            update.setReceiverName(jdVcOrder.getReceiverName());
//            update.setReceiverMobile(jdVcOrder.getWarehousePhone());
//            update.setAddress(jdVcOrder.getAddress());
//            update.setUpdateTime(new Date());
//            update.setUpdateBy("ORDER_MESSAGE");
//            orderMapper.updateById(update);
//
//            // 删除orderItem
//            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,update.getId()));
//
//            // 插入orderItem
//            addJdVcOrderItem(update.getId(),orderId,jdVcOrder.getState());
//        }
//        return ResultVo.success();
//    }
//
//    private void addJdVcOrderItem(String oOrderId,String orderId,Integer orderStatus){
//        List<JdVcPurchaseOrderItem> originOrderItems = jdVcOrderItemMapper.selectList(new LambdaQueryWrapper<JdVcPurchaseOrderItem>().eq(JdVcPurchaseOrderItem::getOrderId, orderId));
//        if(originOrderItems!=null && originOrderItems.size()>0) {
//            for (var item : originOrderItems) {
//                OOrderItem orderItem = new OOrderItem();
//                orderItem.setOrderId(oOrderId);
//                orderItem.setOrderNum(item.getOrderId().toString());
//                orderItem.setSubOrderNum(item.getId().toString());
//                // 这里将订单商品skuid转换成erp系统的skuid
//                Long erpGoodsId = 0L;
//                Long erpSkuId = 0L;
//
//                List<JdVcGoods> shopGoods = jdVcGoodsMapper.selectList(new LambdaQueryWrapper<JdVcGoods>().eq(JdVcGoods::getWareId, item.getWareId()));
//                if (shopGoods != null && !shopGoods.isEmpty()) {
//                    erpGoodsId = shopGoods.get(0).getOGoodsId();
//                    erpSkuId = shopGoods.get(0).getOGoodsSkuId();
////                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
////                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
////                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
//                }
//                orderItem.setSkuNum("");
//                orderItem.setSkuId(item.getWareId().toString());
//                orderItem.setGoodsId(erpGoodsId);
//                orderItem.setGoodsSkuId(erpSkuId);
//                orderItem.setGoodsImg("");
//                orderItem.setGoodsSpec(item.getWareName());
//                orderItem.setGoodsTitle(item.getWareName());
//                orderItem.setGoodsPrice(item.getTotoalPrice());
//                orderItem.setItemAmount(item.getPurchasePrice());
//                orderItem.setPayment(item.getPurchasePrice());
//                orderItem.setQuantity(item.getOriginalNum());
//                orderItem.setRefundStatus(1);
//                orderItem.setRefundCount(0);
//                // 状态
//                orderItem.setOrderStatus(orderStatus);
//                orderItem.setCreateTime(new Date());
//                orderItem.setCreateBy("ORDER_MESSAGE");
//                orderItemMapper.insert(orderItem);
//            }
//        }
//    }

    @Transactional
    @Override
    public ResultVo<Integer> taoOrderMessage(String tid,JSONObject orderDetail ) {
        log.info("Tao订单消息处理"+tid);
//        JSONObject jsonObject = taoApiService.getOrderDetail(tid);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====tao order message===没有找到订单");
//            return ResultVo.error(404,"没有找到订单");
//        }
//
//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====tao order message===订单:"+JSONObject.toJSONString(orderDetail));

        JSONArray itemArray = orderDetail.getJSONArray("items");
        if (itemArray.isEmpty()) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            log.info("=====tao order message===没有items====事务回滚=======");
        }
//        List<TaoOrder> taoOrders = taoOrderMapper.selectList(new LambdaQueryWrapper<TaoOrder>().eq(TaoOrder::getTid, tid));
//
//        if(taoOrders == null || taoOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO订单："+tid);
//        }
//        TaoOrder taoOrder = taoOrders.get(0);
        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, tid));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            OOrder insert = new OOrder();
            insert.setOrderNum(tid);
            insert.setShopType(EnumShopType.TAO.getIndex());
            insert.setShopId(orderDetail.getLong("shopId"));
            String buyerMemo = "";
            if(org.springframework.util.StringUtils.hasText(orderDetail.getString("buyerMessage"))){
                buyerMemo += orderDetail.getString("buyerMessage");
            }
            if(org.springframework.util.StringUtils.hasText(orderDetail.getString("buyerMemo"))){
                buyerMemo += orderDetail.getString("buyerMemo");
            }
            insert.setBuyerMemo(buyerMemo);
            insert.setSellerMemo(orderDetail.getString("sellerMemo"));
            // 状态
            int orderStatus = TaoOrderStateEnum.getIndex(orderDetail.getString("status"));
            if (orderStatus == 11) {
                insert.setRefundStatus(4);
            } else if (orderStatus == -1) {
                insert.setRefundStatus(-1);
            } else {
                insert.setRefundStatus(1);
            }
            insert.setOrderStatus(orderStatus);
            Double goodsAmount  = orderDetail.getDouble("totalFee");
            Double postFee = orderDetail.getDouble("postFee");
            Double payment = orderDetail.getDouble("payment");
            insert.setGoodsAmount(goodsAmount);
            insert.setPostFee(postFee);
            insert.setAmount(payment);
            insert.setPayment(payment);
            insert.setPlatformDiscount(0.0);
            insert.setSellerDiscount(goodsAmount+postFee-payment);
            insert.setReceiverName(orderDetail.getString("receiverName"));
            insert.setReceiverMobile(orderDetail.getString("receiverMobile"));
            insert.setAddress(orderDetail.getString("receiverAddress"));
            insert.setProvince(orderDetail.getString("receiverState"));
            insert.setCity(orderDetail.getString("receiverCity"));
            insert.setTown(orderDetail.getString("receiverDistrict"));
            insert.setOrderTime(orderDetail.getDate("created"));
            // 计算商家优惠
//            Double sellerDiscount = 0.0;
//            List<TaoOrderPromotion> taoOrderPromotions = taoOrderPromotionMapper.selectList(new LambdaQueryWrapper<TaoOrderPromotion>().eq(TaoOrderPromotion::getId, taoOrder.getTid()));
//            if(taoOrderPromotions!=null){
//                for (var it:taoOrderPromotions) {
//                    if(org.springframework.util.StringUtils.hasText(it.getKdDiscountFee())){
//                        try {
//                            sellerDiscount += Double.parseDouble(it.getKdDiscountFee());
//                        }catch (Exception e){}
//                    } else if (org.springframework.util.StringUtils.hasText(it.getDiscountFee())) {
//                        try {
//                            sellerDiscount += Double.parseDouble(it.getDiscountFee());
//                        }catch (Exception e){}
//                    }
//                }
//            }
//            insert.setSellerDiscount(sellerDiscount);


            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);

            // 插入orderItem
            addTaoOrderItem(insert.getId(),tid,itemArray);

        }else{
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
            String buyerMemo = "";
            if(org.springframework.util.StringUtils.hasText(orderDetail.getString("buyerMessage"))){
                buyerMemo += orderDetail.getString("buyerMessage");
            }
            if(org.springframework.util.StringUtils.hasText(orderDetail.getString("buyerMemo"))){
                buyerMemo += orderDetail.getString("buyerMemo");
            }
            update.setBuyerMemo(buyerMemo);
            update.setSellerMemo(orderDetail.getString("sellerMemo"));
            // 状态
            int orderStatus = TaoOrderStateEnum.getIndex(orderDetail.getString("status"));
            if (orderStatus == 11) {
                update.setRefundStatus(4);
            } else if (orderStatus == -1) {
                update.setRefundStatus(-1);
            } else {
                update.setRefundStatus(1);
            }
            update.setOrderStatus(orderStatus);

            Double goodsAmount  = orderDetail.getDouble("totalFee");
            Double postFee = orderDetail.getDouble("postFee");
            Double payment = orderDetail.getDouble("payment");
            update.setGoodsAmount(goodsAmount);
            update.setPostFee(postFee);
            update.setAmount(payment);
            update.setPayment(payment);
            update.setPlatformDiscount(0.0);
            update.setSellerDiscount(goodsAmount+postFee-payment);
            update.setReceiverName(orderDetail.getString("receiverName"));
            update.setReceiverMobile(orderDetail.getString("receiverMobile"));
            update.setAddress(orderDetail.getString("receiverAddress"));
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 删除orderItem
            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,update.getId()));
            // 插入orderItem
            addTaoOrderItem(update.getId(),tid,itemArray);


        }
        return ResultVo.success();
    }

    private void addTaoOrderItem(String oOrderId,String tid, JSONArray itemArray) {
        for (int i = 0; i < itemArray.size(); i++) {
            JSONObject itemObject = itemArray.getJSONObject(i);

            OOrderItem orderItem = new OOrderItem();
            orderItem.setOrderId(oOrderId);
            orderItem.setOrderNum(tid);
            orderItem.setSubOrderNum(itemObject.getString("oid"));
            orderItem.setSkuNum(itemObject.getString("outerSkuId"));
            orderItem.setSkuId(itemObject.getString("skuId"));
            orderItem.setGoodsId(itemObject.getLong("oGoodsId"));
            orderItem.setGoodsSkuId(itemObject.getString("oGoodsSkuId"));
            orderItem.setGoodsImg(itemObject.getString("picPath"));
            orderItem.setGoodsSpec(itemObject.getString("skuPropertiesName"));
            orderItem.setGoodsTitle(itemObject.getString("title"));
            orderItem.setGoodsPrice(itemObject.getDouble("price"));
            orderItem.setItemAmount(itemObject.getDouble("totalFee"));
            orderItem.setDiscountAmount(itemObject.getDouble("partMjzDiscount"));
            orderItem.setPayment(itemObject.getDouble("payment"));
            orderItem.setQuantity(itemObject.getInteger("num"));
            // 退款状态。退款状态。可选值 WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意)
            // WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货)
            // WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货)
            // SELLER_REFUSE_BUYER(卖家拒绝退款)
            // CLOSED(退款关闭)
            // SUCCESS(退款成功)
            if (itemObject.getString("refundStatus").equals("WAIT_SELLER_AGREE")
                    || itemObject.getString("refundStatus").equals("WAIT_BUYER_RETURN_GOODS")
                    || itemObject.getString("refundStatus").equals("WAIT_SELLER_CONFIRM_GOODS")
                    || itemObject.getString("refundStatus").equals("SELLER_REFUSE_BUYER")) {
                orderItem.setRefundStatus(2);
                orderItem.setRefundCount(itemObject.getInteger("num"));
            } else if (itemObject.getString("refundStatus").equals("SUCCESS")) {
                orderItem.setRefundCount(itemObject.getInteger("num"));
                orderItem.setRefundStatus(4);
            } else if (itemObject.getString("refundStatus").equals("CLOSED") || itemObject.getString("refundStatus").equals("NO_REFUND")) {
                orderItem.setRefundStatus(1);
                orderItem.setRefundCount(0);
            }
            // 状态
            int orderStatus = TaoOrderStateEnum.getIndex(itemObject.getString("status"));
            orderItem.setOrderStatus(orderStatus);
            orderItem.setCreateTime(new Date());
            orderItem.setCreateBy("ORDER_MESSAGE");
            orderItemMapper.insert(orderItem);
        }

    }

    @Transactional
    @Override
    public ResultVo<Integer> pddOrderMessage(String orderSn,JSONObject orderDetail ) {
        log.info("=====pdd order message===订单号{}==="+orderSn);
//        JSONObject jsonObject = pddApiService.getOrderDetail(orderSn);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====pdd order message===没有找到订单");
//            return ResultVo.error(404,"没有找到订单");
//        }
//
//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====pdd order message===订单:"+JSONObject.toJSONString(orderDetail));
        if(orderDetail == null) return ResultVo.error(404,"没有找到订单");
//        List<PddOrder> originOrders = pddOrderMapper.selectList(new LambdaQueryWrapper<PddOrder>().eq(PddOrder::getOrderSn, orderSn));
//
//        if(originOrders == null || originOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到PDD原始订单："+orderSn);
//        }
//        PddOrder originOrder = originOrders.get(0);
//        PddOrder originOrder = new PddOrder();

        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderSn));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            OOrder insert = new OOrder();
            insert.setOrderNum(orderSn);
            insert.setShopType(EnumShopType.PDD.getIndex());
            insert.setShopId(orderDetail.getLong("shopId"));
            insert.setBuyerMemo(orderDetail.getString("buyerMemo"));
            insert.setSellerMemo(orderDetail.getString("remark"));
            Integer originOrderStatus = orderDetail.getInteger("orderStatus");
            Integer originRefundStatus = orderDetail.getInteger("refundStatus");
            // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除
            int orderStatus = -1;
            int refundStatus = -1;
            if (originRefundStatus == 1) {
                // 没有售后
                orderStatus = originOrderStatus;
                refundStatus = 1;
            } else {
                if (originRefundStatus == 4) {
                    refundStatus = 4;
                    orderStatus = 11;
                } else {
                    refundStatus = originRefundStatus;
                    orderStatus = 12;
                }
            }
            insert.setRefundStatus(refundStatus);
            insert.setOrderStatus(orderStatus);
            // 价格
            insert.setGoodsAmount(orderDetail.getDouble("goodsAmount"));//.getGoodsAmount());
            insert.setPostFee(orderDetail.getDouble("postage"));
            insert.setAmount(orderDetail.getDouble("payAmount"));
            insert.setPayment(orderDetail.getDouble("payAmount"));
//            double platformDiscount = originOrder.getPlatformDiscount()!=null?originOrder.getPlatformDiscount():0.0;
            insert.setPlatformDiscount(orderDetail.getDouble("platformDiscount"));
//            double sellerDiscount = originOrder.getSellerDiscount()!=null?originOrder.getSellerDiscount():0.0;
            insert.setSellerDiscount(orderDetail.getDouble("sellerDiscount"));

            insert.setReceiverName(orderDetail.getString("receiverNameMask"));
            insert.setReceiverMobile(orderDetail.getString("receiverPhoneMask"));
            insert.setAddress(orderDetail.getString("addressMask"));
            insert.setProvince(orderDetail.getString("province"));
            insert.setCity(orderDetail.getString("city"));
            insert.setTown(orderDetail.getString("town"));
            insert.setOrderTime(DateUtils.parseDate(orderDetail.getString("createdTime")));
            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);
            // 插入orderItem
//            addPddOrderItem(insert.getId(),originOrder.getOrderSn(),orderStatus,refundStatus,platformDiscount,sellerDiscount);
            JSONArray itemArray = orderDetail.getJSONArray("items");
            if (itemArray.isEmpty()) {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                log.info("=====pdd order message===没有items====事务回滚=======");
            }


            for (int i =0;i<itemArray.size();i++) {
                JSONObject itemObject =itemArray.getJSONObject(i);
//                Map<String,Object> itemObject = (Map<String, Object>) itemArray.get(i);
//                JSONObject itemObject = (JSONObject) item;

                OOrderItem orderItem = new OOrderItem();
                orderItem.setOrderId(insert.getId());
                orderItem.setOrderNum(orderSn);
                orderItem.setSubOrderNum(orderSn+"-"+itemObject.getString("skuId"));
                // 这里将订单商品skuid转换成erp系统的skuid
//                Long erpGoodsId = 0L;
//                String erpSkuId = "0";
//
//                List<PddGoodsSku> pddGoodsSku = pddGoodsSkuMapper.selectList(new LambdaQueryWrapper<PddGoodsSku>().eq(PddGoodsSku::getSkuId, item.getSkuId()));
//                if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
//                    erpGoodsId = pddGoodsSku.get(0).getOGoodsId();
//                    erpSkuId = pddGoodsSku.get(0).getOGoodsSkuId();
////                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
////                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
////                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
//                }
                orderItem.setSkuNum(itemObject.getString("outerId"));
                orderItem.setSkuId(itemObject.getString("skuId"));
                orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
                orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
                orderItem.setGoodsImg(itemObject.getString("goodsImg"));
                orderItem.setGoodsSpec(itemObject.getString("goodsSpec"));
                orderItem.setGoodsTitle(itemObject.getString("goodsName"));
                orderItem.setGoodsPrice(itemObject.getDouble("goodsPrice"));
                orderItem.setQuantity(itemObject.getInteger("goodsCount"));
                if (i == 0) {
                    Double itemAmount = orderItem.getGoodsPrice() * orderItem.getQuantity() - insert.getPlatformDiscount() - insert.getSellerDiscount();
                    orderItem.setItemAmount(itemAmount);
                    orderItem.setPayment(itemAmount);
                } else {
                    orderItem.setItemAmount(orderItem.getGoodsPrice()* orderItem.getQuantity());
                    orderItem.setPayment(orderItem.getGoodsPrice()* orderItem.getQuantity());
                }
//                orderItem.setPayment(item.getGoodsPrice());

                orderItem.setOrderStatus(orderStatus);
                orderItem.setRefundStatus(refundStatus);
                orderItem.setRefundCount(0);
                orderItem.setCreateTime(new Date());
                orderItem.setCreateBy("ORDER_MESSAGE");
                orderItemMapper.insert(orderItem);
            }


        }else{
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
            Integer originOrderStatus = orderDetail.getInteger("orderStatus");
            Integer originRefundStatus = orderDetail.getInteger("refundStatus");
            // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除
            int orderStatus = -1;
            int refundStatus = -1;
            if (originRefundStatus == 1) {
                // 没有售后
                orderStatus = originOrderStatus;
                refundStatus = 1;
            } else {
                if (originRefundStatus == 4) {
                    refundStatus = 4;
                    orderStatus = 11;
                } else {
                    refundStatus = originRefundStatus;
                    orderStatus = 12;
                }
            }
            update.setRefundStatus(refundStatus);
            update.setOrderStatus(orderStatus);

            // 价格
            update.setGoodsAmount(orderDetail.getDouble("goodsAmount"));//.getGoodsAmount());
            update.setPostFee(orderDetail.getDouble("postage"));
            update.setAmount(orderDetail.getDouble("payAmount"));
            update.setPayment(orderDetail.getDouble("payAmount"));
//            double platformDiscount = originOrder.getPlatformDiscount()!=null?originOrder.getPlatformDiscount():0.0;
            update.setPlatformDiscount(orderDetail.getDouble("platformDiscount"));
//            double sellerDiscount = originOrder.getSellerDiscount()!=null?originOrder.getSellerDiscount():0.0;
            update.setSellerDiscount(orderDetail.getDouble("sellerDiscount"));

            if(orderStatus==1 && refundStatus==1) {
                if (StringUtils.isNotBlank(orderDetail.getString("receiverNameMask"))) {
                    update.setReceiverName(orderDetail.getString("receiverNameMask"));
                }
                if (StringUtils.isNotBlank(orderDetail.getString("receiverPhoneMask"))) {
                    update.setReceiverMobile(orderDetail.getString("receiverPhoneMask"));
                }
                if (StringUtils.isNotBlank(orderDetail.getString("addressMask"))) {
                    update.setAddress(orderDetail.getString("addressMask"));
                }
            }

            if(StringUtils.isNotBlank(orderDetail.getString("province"))){
                update.setProvince(orderDetail.getString("province"));
            }
            if(StringUtils.isNotBlank(orderDetail.getString("city"))){
                update.setCity(orderDetail.getString("city"));
            }
            if(StringUtils.isNotBlank(orderDetail.getString("town"))){
                update.setTown(orderDetail.getString("town"));
            }
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 删除orderItem
            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,update.getId()));
//            // 插入orderItem
//            addPddOrderItem(update.getId(),originOrder.getOrderSn(),orderStatus,refundStatus,platformDiscount,sellerDiscount);

            JSONArray itemArray = orderDetail.getJSONArray("items");
            if (itemArray.isEmpty()) {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                log.info("=====pdd order message===没有items====事务回滚=======");
            }


            for (int i =0;i<itemArray.size();i++) {
                JSONObject itemObject =itemArray.getJSONObject(i);
//                List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrders.get(0).getId()).eq(OOrderItem::getSkuId, itemObject.getString("skuId")));
//                if(oOrderItems.isEmpty()) {
                    // 新增item
                    OOrderItem orderItem = new OOrderItem();
                    orderItem.setOrderId(oOrders.get(0).getId());
                    orderItem.setOrderNum(orderSn);
                    orderItem.setSubOrderNum(orderSn + "-" + itemObject.getString("skuId"));
                    orderItem.setSkuNum(itemObject.getString("outerId"));
                    orderItem.setSkuId(itemObject.getString("skuId"));
                    orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
                    orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
                    orderItem.setGoodsImg(itemObject.getString("goodsImg"));
                    orderItem.setGoodsSpec(itemObject.getString("goodsSpec"));
                    orderItem.setGoodsTitle(itemObject.getString("goodsName"));
                    orderItem.setGoodsPrice(itemObject.getDouble("goodsPrice"));
                    orderItem.setQuantity(itemObject.getInteger("goodsCount"));
                    if (i == 0) {
                        Double itemAmount = orderItem.getGoodsPrice() * orderItem.getQuantity() - oOrders.get(0).getPlatformDiscount() - oOrders.get(0).getSellerDiscount();
                        orderItem.setItemAmount(itemAmount);
                        orderItem.setPayment(itemAmount);
                    } else {
                        orderItem.setItemAmount(orderItem.getGoodsPrice() * orderItem.getQuantity());
                        orderItem.setPayment(orderItem.getGoodsPrice() * orderItem.getQuantity());
                    }
                    orderItem.setOrderStatus(orderStatus);
                    orderItem.setRefundStatus(refundStatus);
                    orderItem.setRefundCount(0);
                    orderItem.setCreateTime(new Date());
                    orderItem.setCreateBy("ORDER_MESSAGE");
                    orderItemMapper.insert(orderItem);
//                }
//                else{
//                    // 修改、
//                    OOrderItem orderItem = new OOrderItem();
//                    orderItem.setId(oOrderItems.get(0).getId());
//
//                    orderItem.setSkuNum(itemObject.getString("outerId"));
//                    orderItem.setSkuId(itemObject.getString("skuId"));
//                    orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
//                    orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
//                    orderItem.setGoodsImg(itemObject.getString("goodsImg"));
//                    orderItem.setGoodsSpec(itemObject.getString("goodsSpec"));
//                    orderItem.setGoodsTitle(itemObject.getString("goodsName"));
//                    orderItem.setGoodsPrice(itemObject.getDouble("goodsPrice"));
//                    orderItem.setQuantity(itemObject.getInteger("goodsCount"));
//                    if (i == 0) {
//                        Double itemAmount = orderItem.getGoodsPrice() * orderItem.getQuantity() - oOrders.get(0).getPlatformDiscount() - oOrders.get(0).getSellerDiscount();
//                        orderItem.setItemAmount(itemAmount);
//                        orderItem.setPayment(itemAmount);
//                    } else {
//                        orderItem.setItemAmount(orderItem.getGoodsPrice() * orderItem.getQuantity());
//                        orderItem.setPayment(orderItem.getGoodsPrice() * orderItem.getQuantity());
//                    }
//                    orderItem.setOrderStatus(orderStatus);
//                    orderItem.setRefundStatus(refundStatus);
//                    orderItem.setRefundCount(0);
//                    orderItem.setUpdateTime(new Date());
//                    orderItem.setUpdateBy("ORDER_MESSAGE");
//                    orderItemMapper.updateById(orderItem);
//                }
            }
        }
        return ResultVo.success();
    }

//    private void addPddOrderItem(String oOrderId,String orderSn,Integer orderStatus,Integer refundStatus,double platformDiscount,double sellerDiscount){
//        List<PddOrderItem> originOrderItems = pddOrderItemMapper.selectList(new LambdaQueryWrapper<PddOrderItem>().eq(PddOrderItem::getOrderSn, orderSn));
//        if(originOrderItems!=null && originOrderItems.size()>0) {
//            int i = 0;
//            for (var item : originOrderItems) {
//                OOrderItem orderItem = new OOrderItem();
//                orderItem.setOrderId(oOrderId);
//                orderItem.setOrderNum(item.getOrderSn());
//                orderItem.setSubOrderNum(item.getId().toString());
//                // 这里将订单商品skuid转换成erp系统的skuid
//                Long erpGoodsId = 0L;
//                String erpSkuId = "0";
//
//                List<PddGoodsSku> pddGoodsSku = pddGoodsSkuMapper.selectList(new LambdaQueryWrapper<PddGoodsSku>().eq(PddGoodsSku::getSkuId, item.getSkuId()));
//                if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
//                    erpGoodsId = pddGoodsSku.get(0).getOGoodsId();
//                    erpSkuId = pddGoodsSku.get(0).getOGoodsSkuId();
////                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
////                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
////                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
//                }
//                orderItem.setSkuNum(item.getOuterId());
//                orderItem.setSkuId(item.getSkuId());
//                orderItem.setGoodsId(erpGoodsId);
//                orderItem.setGoodsSkuId(erpSkuId);
//                orderItem.setGoodsImg(item.getGoodsImg());
//                orderItem.setGoodsSpec(item.getGoodsSpec());
//                orderItem.setGoodsTitle(item.getGoodsName());
//                orderItem.setGoodsPrice(item.getGoodsPrice());
//                if(i==0) {
//                    Double itemAmount = item.getGoodsPrice() * item.getGoodsCount() - platformDiscount - sellerDiscount;
//                    orderItem.setItemAmount(itemAmount);
//                    orderItem.setPayment(itemAmount);
//                }else {
//                    orderItem.setItemAmount(item.getGoodsPrice());
//                    orderItem.setPayment(item.getGoodsPrice());
//                }
////                orderItem.setPayment(item.getGoodsPrice());
//                orderItem.setQuantity(item.getGoodsCount());
//                orderItem.setOrderStatus(orderStatus);
//                orderItem.setRefundStatus(refundStatus);
//                orderItem.setRefundCount(0);
//                orderItem.setCreateTime(new Date());
//                orderItem.setCreateBy("ORDER_MESSAGE");
//                orderItemMapper.insert(orderItem);
//                i++;
//            }
//        }
//    }

    @Transactional
    @Override
    public ResultVo<Integer> douOrderMessage(String orderId,JSONObject orderDetail ) {
        log.info("Dou订单消息处理" + orderId);
//        JSONObject jsonObject = douApiService.getOrderDetail(orderId);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====dou order message===没有找到订单");
//            return ResultVo.error(404,"没有找到订单");
//        }
//
//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====dou order message===订单:"+JSONObject.toJSONString(orderDetail));
        if(orderDetail == null) return ResultVo.error(404,"没有找到订单");
        // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货
        // 抖店订单状态 1 待确认/待支付（订单创建完毕）105 已支付 2 备货中 101 部分发货 3 已发货（全部发货）4 已取消 5 已完成（已收货）
        int orderStatus = -1;
        int refundStatus = -1;
        if (orderDetail.getInteger("orderStatus") == 1) {
            // 1待确认/待支付（订单创建完毕）
            orderStatus = 21;
            refundStatus = 1;
        } else if (orderDetail.getInteger("orderStatus") == 105) {
            // 105 已支付
            orderStatus = 0;
            refundStatus = 1;
        } else if (orderDetail.getInteger("orderStatus") == 2) {
            // 105 已支付
            orderStatus = 1;
            refundStatus = 1;
        } else if (orderDetail.getInteger("orderStatus") == 101) {
            // 101 部分发货
            orderStatus = 101;
            refundStatus = 1;
        } else if (orderDetail.getInteger("orderStatus") == 3) {
            //  3 已发货（全部发货）
            orderStatus = 2;
            refundStatus = 1;
        } else if (orderDetail.getInteger("orderStatus") == 4) {
            //  4 已取消
            orderStatus = 11;
            refundStatus = 1;
        } else if (orderDetail.getInteger("orderStatus") == 5) {
            //  5 已完成（已收货）
            orderStatus = 3;
            refundStatus = 1;
        }

//        List<DouOrder> originOrders = douOrderMapper.selectList(new LambdaQueryWrapper<DouOrder>().eq(DouOrder::getOrderId, orderId));
//
//        if (originOrders == null || originOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound, "没有找到DOU原始订单：" + orderId);
//        }
//        DouOrder originOrder = originOrders.get(0);

        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
        if (oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            OOrder insert = new OOrder();
            insert.setOrderNum(orderId);
            insert.setShopType(EnumShopType.DOU.getIndex());
            insert.setShopId(orderDetail.getLong("shopId"));
            insert.setBuyerMemo(orderDetail.getString("buyerWords"));
            insert.setSellerMemo(orderDetail.getString("sellerWords"));
            insert.setRefundStatus(refundStatus);
            insert.setOrderStatus(orderStatus);
            insert.setGoodsAmount(orderDetail.getDouble("orderAmount")  / 100 );
            insert.setPostFee(orderDetail.getDouble("postAmount") / 100);
            insert.setAmount(orderDetail.getDouble("orderAmount")  / 100);
            insert.setPayment(orderDetail.getDouble("payAmount")  / 100);
            insert.setPlatformDiscount(orderDetail.getDouble("promotionPlatformAmount") / 100);
            insert.setSellerDiscount(orderDetail.getDouble("promotionShopAmount") / 100);

            insert.setReceiverName(orderDetail.getString("maskPostReceiver"));
            insert.setReceiverMobile(orderDetail.getString("maskPostTel"));
            insert.setAddress(orderDetail.getString("maskPostAddress"));
            insert.setProvince(orderDetail.getString("provinceName"));
            insert.setCity(orderDetail.getString("cityName"));
            insert.setTown(orderDetail.getString("townName"));
            long time = orderDetail.getLong("createTime") * 1000;
            insert.setOrderTime(new Date(time));
            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);
            // 插入orderItem
            addDouOrderItem(insert.getId(), orderId, orderStatus, refundStatus,orderDetail.getJSONArray("items"));

        } else {
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
            update.setRefundStatus(refundStatus);
            update.setOrderStatus(orderStatus);
            update.setGoodsAmount(orderDetail.getDouble("orderAmount")  / 100 );
            update.setPostFee(orderDetail.getDouble("postAmount") / 100);
            update.setAmount(orderDetail.getDouble("orderAmount")  / 100);
            update.setPayment(orderDetail.getDouble("payAmount")  / 100);
            update.setPlatformDiscount(orderDetail.getDouble("promotionPlatformAmount") / 100);
            update.setSellerDiscount(orderDetail.getDouble("promotionShopAmount") / 100);

            update.setReceiverName(orderDetail.getString("maskPostReceiver"));
            update.setReceiverMobile(orderDetail.getString("maskPostTel"));
            update.setAddress(orderDetail.getString("maskPostAddress"));


            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 删除orderItem
            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, update.getId()));
            // 插入orderItem
            addDouOrderItem(update.getId(), orderId, orderStatus, refundStatus,orderDetail.getJSONArray("items"));
        }
        return ResultVo.success();
    }
    private void addDouOrderItem(String oOrderId,String originOrderId,Integer orderStatus,Integer refundStatus,JSONArray itemArray){

        if(itemArray!=null && itemArray.size()>0) {
            for (int i = 0; i < itemArray.size(); i++) {
                JSONObject itemObject = itemArray.getJSONObject(i);

                OOrderItem orderItem = new OOrderItem();
                orderItem.setOrderId(oOrderId);
                orderItem.setOrderNum(itemObject.getString("parentOrderId"));
                orderItem.setSubOrderNum(itemObject.getString("orderId"));
                orderItem.setSkuNum(itemObject.getString("outSkuId"));
                orderItem.setSkuId(itemObject.getString("skuId"));
                orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
                orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
                orderItem.setGoodsImg(itemObject.getString("productPic"));

//                if(org.springframework.util.StringUtils.hasText(item.getSpec())) {
//                    orderItem.setGoodsSpec(item.getSpec().length()>500?item.getSpec().substring(0,499):item.getSpec());
//                }
                orderItem.setGoodsTitle(itemObject.getString("productName"));
                orderItem.setGoodsSpec(itemObject.getString("spec"));

                orderItem.setGoodsPrice(itemObject.getDouble("goodsPrice")/100);
                orderItem.setItemAmount(itemObject.getDouble("orderAmount")/100);
                orderItem.setPayment(itemObject.getDouble("payAmount")/100);
                orderItem.setQuantity(itemObject.getInteger("itemNum"));
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
    public ResultVo<Integer> weiOrderMessage(String orderId,JSONObject orderDetail ) {
        log.info("WEI订单消息处理" + orderId);
//        JSONObject jsonObject = weiApiService.getOrderDetail(orderId);
//        if (jsonObject.getInteger("code") != 200 || jsonObject.getJSONObject("data") == null) {
//            log.info("=====wei order message===没有找到订单");
//            return ResultVo.error(404, "没有找到订单");
//        }

//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====wei order message===订单:" + JSONObject.toJSONString(orderDetail));
        if (orderDetail == null) return ResultVo.error(404, "没有找到订单");


        return ResultVo.success();
    }
    /**
     * 线下订单通知
     * @param orderId
     * @return
     */
    @Transactional
    @Override
    public ResultVo<Integer> offlineOrderMessage(String orderNum) {
        log.info("Offline订单消息处理" + orderNum);
        List<OfflineOrder> originOrders = offlineOrderMapper.selectList(new LambdaQueryWrapper<OfflineOrder>().eq(OfflineOrder::getOrderNum, orderNum));

        if (originOrders == null || originOrders.size() == 0) {
            // 没有找到订单信息
            return ResultVo.error(ResultVoEnum.NotFound, "没有找到OFFLINE原始订单：" + orderNum);
        }
        OfflineOrder originOrder = originOrders.get(0);

        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderNum));
        if (oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            OOrder insert = new OOrder();
            insert.setOrderNum(originOrder.getOrderNum());
            insert.setShopType(EnumShopType.OFFLINE.getIndex());
            insert.setShopId(originOrder.getShopId());
            insert.setBuyerMemo(originOrder.getBuyerMemo());
            insert.setSellerMemo(originOrder.getSellerMemo());
            insert.setRefundStatus(originOrder.getRefundStatus());
            insert.setOrderStatus(originOrder.getOrderStatus());

            insert.setGoodsAmount(originOrder.getGoodsAmount());
            insert.setPostFee(originOrder.getPostFee());
            insert.setAmount(originOrder.getAmount());
            insert.setPayment(originOrder.getPayment());
            insert.setPlatformDiscount(originOrder.getPlatformDiscount());
            insert.setSellerDiscount(originOrder.getSellerDiscount());

            insert.setReceiverName(originOrder.getReceiverName());
            insert.setReceiverMobile(originOrder.getReceiverMobile());
            insert.setAddress(originOrder.getAddress());
            insert.setProvince(originOrder.getProvince());
            insert.setCity(originOrder.getCity());
            insert.setTown(originOrder.getTown());
            insert.setOrderTime(originOrder.getOrderTime());
            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);
            // 插入orderItem
            addOfflineOrderItem(insert.getId(), originOrder.getOrderNum(), originOrder.getOrderStatus(), originOrder.getRefundStatus());

            //更新推送状态
            OfflineOrder offlineUpdate = new OfflineOrder();
            offlineUpdate.setId(originOrder.getId());
            offlineUpdate.setOmsPushStatus(1);
            offlineUpdate.setUpdateTime(new Date());
            offlineUpdate.setUpdateBy("推送状态更新");
            offlineOrderMapper.updateById(offlineUpdate);
        } else {
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
            update.setRefundStatus(originOrder.getRefundStatus());
            update.setOrderStatus(originOrder.getOrderStatus());
            update.setReceiverName(originOrder.getReceiverName());
            update.setReceiverMobile(originOrder.getReceiverMobile());
            update.setAddress(originOrder.getAddress());
            update.setProvince(originOrder.getProvince());
            update.setCity(originOrder.getCity());
            update.setTown(originOrder.getTown());
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);
        }
        return ResultVo.success();
    }
    private void addOfflineOrderItem(String oOrderId,String originOrderNum,Integer orderStatus,Integer refundStatus){
        List<OfflineOrderItem> originOrderItems = offlineOrderItemMapper.selectList(new LambdaQueryWrapper<OfflineOrderItem>().eq(OfflineOrderItem::getOrderNum, originOrderNum));
        if(originOrderItems!=null && originOrderItems.size()>0) {
            for (var item : originOrderItems) {
                OOrderItem orderItem = new OOrderItem();
                orderItem.setOrderId(oOrderId);
                orderItem.setOrderNum(originOrderNum);
                orderItem.setSubOrderNum(item.getSubOrderNum());
                // 这里将订单商品skuid转换成erp系统的skuid
                Long erpGoodsId = 0L;
                String erpSkuId = "0";

//                DouGoodsSku douGoodsSku = douGoodsSkuMapper.selectById(item.getSkuId());
//                if (douGoodsSku != null ) {
//                    erpGoodsId = douGoodsSku.getOGoodsId();
//                    erpSkuId = douGoodsSku.getOGoodsSkuId();
////                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
////                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
////                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
//                }
//                List<DouGoodsSku> douGoodsSku = douGoodsSkuMapper.selectList(new LambdaQueryWrapper<DouGoodsSku>().eq(DouGoodsSku::getId, item.getSkuId()));
//                if (douGoodsSku != null && !douGoodsSku.isEmpty()) {
//                    erpGoodsId = douGoodsSku.get(0).getOGoodsId();
//                    erpSkuId = douGoodsSku.get(0).getOGoodsSkuId();
////                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
////                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
////                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
//                }
                orderItem.setSkuNum(item.getSkuNum());
                orderItem.setSkuId(item.getSkuId());
                orderItem.setGoodsId(item.getGoodsId());
                orderItem.setGoodsSkuId(item.getGoodsSkuId()+"");
                orderItem.setGoodsImg(item.getGoodsImg());
                orderItem.setGoodsSpec(item.getGoodsSpec());
                orderItem.setGoodsTitle(item.getGoodsTitle());
                orderItem.setGoodsPrice(item.getGoodsPrice());
                orderItem.setItemAmount(item.getItemAmount());
                orderItem.setPayment(item.getPayment());
                orderItem.setQuantity(item.getQuantity());
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
    public List<OOrder> getList(OOrder order) {
        return orderMapper.selectList(new LambdaQueryWrapper<>());
    }

    @Override
    public PageResult<OOrder> queryPageList(OrderSearchRequest bo, PageQuery pageQuery) {
        if(org.springframework.util.StringUtils.hasText(bo.getStartTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getStartTime());
            boolean b = matcher.find();
            if(b){
                bo.setStartTime(bo.getStartTime()+" 00:00:00");
            }
        }
        if(org.springframework.util.StringUtils.hasText(bo.getEndTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getEndTime());
            boolean b = matcher.find();
            if(b){
                bo.setEndTime(bo.getEndTime()+" 23:59:59");
            }
        }

        LambdaQueryWrapper<OOrder> queryWrapper = new LambdaQueryWrapper<OOrder>()
                .eq(bo.getShopId()!=null,OOrder::getShopId,bo.getShopId())
                .eq(org.springframework.util.StringUtils.hasText(bo.getOrderNum()),OOrder::getOrderNum,bo.getOrderNum())
                .eq(bo.getOrderStatus()!=null,OOrder::getOrderStatus,bo.getOrderStatus())
                .ge(org.springframework.util.StringUtils.hasText(bo.getStartTime()),OOrder::getOrderTime,bo.getStartTime()+" 00:00:00")
                .le(org.springframework.util.StringUtils.hasText(bo.getEndTime()),OOrder::getOrderTime,bo.getEndTime()+" 23:59:59")
                .eq(bo.getErpPushStatus()!=null && bo.getErpPushStatus() == 0,OOrder::getErpPushStatus,0)
                .eq(bo.getErpPushStatus()!=null && bo.getErpPushStatus() == 100,OOrder::getErpPushStatus,100)
                .eq(bo.getErpPushStatus()!=null && bo.getErpPushStatus() == 200,OOrder::getErpPushStatus,200)
                .gt(bo.getErpPushStatus()!=null && bo.getErpPushStatus() == 500,OOrder::getErpPushStatus,200)
//                .eq(org.springframework.util.StringUtils.hasText(bo.getReceiverName()),OOrder::getReceiverName,bo.getReceiverName())
//                .like(org.springframework.util.StringUtils.hasText(bo.getReceiverMobile()),OOrder::getReceiverMobile,bo.getReceiverMobile())
                ;
//        if(bo.getErpPushStatus()!=null) {
//            if (bo.getErpPushStatus() == 0) {
//                // 未推送
//                queryWrapper.eq(OOrder::getErpPushResult, 0);
//            } else if (bo.getErpPushStatus() == 200) {
//                // 推送成功
//                queryWrapper.eq(OOrder::getErpPushResult, 200);
//            } else if (bo.getErpPushStatus() == 500) {
//                // 推送失败
//                queryWrapper.gt(OOrder::getErpPushResult, 200);
//            }
//        }
        pageQuery.setOrderByColumn("order_time");
        pageQuery.setIsAsc("desc");
        Page<OOrder> pages = orderMapper.selectPage(pageQuery.build(), queryWrapper);

        // 查询子订单
        if(pages.getRecords()!=null){
            for (var order:pages.getRecords()) {
//                order.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, order.getId())));
                order.setItemVoList(orderItemMapper.selectOrderItemListByOrderId(Long.parseLong(order.getId())));
            }
        }

        return PageResult.build(pages);
    }

    @Override
    public OOrder queryDetailById(Long id) {
        OOrder oOrder = orderMapper.selectById(id);
        if(oOrder!=null) {
//           oOrder.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrder.getId())));
            oOrder.setItemVoList(orderItemMapper.selectOrderItemListByOrderId(id));
            // 获取优惠信息
            if(oOrder.getShopType()==EnumShopType.TAO.getIndex()){
                oOrder.setDiscounts(orderMapper.getTaoOrderDiscount(oOrder.getOrderNum()));
            } else if (oOrder.getShopType()==EnumShopType.JD.getIndex()) {
                oOrder.setDiscounts(orderMapper.getJdOrderDiscount(oOrder.getOrderNum()));
            }else if (oOrder.getShopType()==EnumShopType.PDD.getIndex()) {
                List<OrderDiscountVo> discountVoList = new ArrayList<>();
                if(oOrder.getPlatformDiscount()!=null&& oOrder.getPlatformDiscount()>0){
                    OrderDiscountVo vo = new OrderDiscountVo();
                    vo.setName("平台优惠");
                    vo.setDiscountAmount(oOrder.getPlatformDiscount().toString());
                    vo.setDescription("平台优惠");
                    discountVoList.add(vo);
                    oOrder.setDiscounts(discountVoList);
                }
            }else if (oOrder.getShopType()==EnumShopType.DOU.getIndex()) {
                List<OrderDiscountVo> discountVoList = new ArrayList<>();
                if(oOrder.getPlatformDiscount()!=null&& oOrder.getPlatformDiscount()>0){
                    OrderDiscountVo vo = new OrderDiscountVo();
                    vo.setName("平台优惠");
                    vo.setDiscountAmount(oOrder.getPlatformDiscount().toString());
                    vo.setDescription("平台优惠");
                    discountVoList.add(vo);
                    oOrder.setDiscounts(discountVoList);
                }
            }
        }

        return oOrder;
    }

    @Override
    public List<OOrder> searchOrderConsignee(String consignee) {
        LambdaQueryWrapper<OOrder> qw = new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderStatus,1).likeRight(OOrder::getReceiverName,consignee);
        return orderMapper.selectList(qw);
    }

    @Override
    public List<OOrderItem> searchOrderItemByReceiverMobile(String receiverMobile) {
        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderStatus, 1).eq(OOrder::getReceiverMobile, receiverMobile));
        List<OOrderItem> orderItemList = new ArrayList<>();
        if(oOrders!=null){
            for (var order:oOrders) {
                orderItemList.addAll(orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,order.getId())));
            }
        }
        return orderItemList;
    }

    @Override
    public List<SalesDailyVo> salesDaily() {
        return orderMapper.salesDaily();
    }
    @Override
    public SalesDailyVo getTodaySalesDaily() {
        return orderMapper.getTodaySalesDaily();
    }

//    /**
//     * 新增订单
//     *
//     * @param bo 订单
//     * @return 结果
//     */
//    @Transactional
//    @Override
//    public int insertErpOrder(OrderCreateBo bo,String createBy)
//    {
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, bo.getOrderNum()));
//
//        if (oOrders!=null&& oOrders.size()>0) return -1;// 订单号已存在
////        erpOrder.setCreateTime(DateUtils.getNowDate());
////        int rows = erpOrderMapper.insertErpOrder(erpOrder);
////        insertErpOrderItem(erpOrder);
////        return rows;
//        if(bo.getItemList() == null || bo.getItemList().size() == 0) return -2;
//        else{
//            // 循环查找是否缺少specId
//            for (OrderCreateItemBo itemBo : bo.getItemList()) {
//                if(itemBo.getSkuId()==null || itemBo.getQuantity()<=0) return -3;
//            }
//        }
//
//        OShop shop = shopMapper.selectById(bo.getShopId());
//        Integer shopType = 0;
//        if(shop!=null){
//            shopType = shop.getType();
//        }else return -4;
//
//        // 开始组合订单信息
//        OOrder order = new OOrder();
//        order.setOrderNum(bo.getOrderNum());
//        order.setShopId(bo.getShopId());
//        order.setShopType(shopType);
//        order.setBuyerMemo(bo.getBuyerMemo());
//        order.setRemark(bo.getRemark());
//        order.setRefundStatus(1);
//        order.setOrderStatus(1);
//        order.setGoodsAmount(bo.getGoodsAmount());
//        order.setPostFee(bo.getPostage());
//        order.setAmount(bo.getGoodsAmount()+bo.getPostage());
//        order.setSellerDiscount(bo.getSellerDiscount());
//        order.setPlatformDiscount(0.0);
//        order.setPayment(bo.getGoodsAmount()+bo.getPostage()-bo.getSellerDiscount());
//        order.setReceiverName(bo.getReceiverName());
//        order.setReceiverMobile(bo.getReceiverPhone());
//        order.setProvince(bo.getProvince());
//        order.setCity(bo.getCity());
//        order.setTown(bo.getTown());
//        order.setAddress(bo.getAddress());
//        order.setOrderTime(new Date());
//
//        order.setCreateTime(new Date());
//        order.setShipType(0);
//        order.setErpPushStatus(0);
//        order.setCreateBy(createBy);
//
//        orderMapper.insert(order);
//
////        List<OOrderItem> itemList = new ArrayList<OOrderItem>();
//        for (int i = 0; i < bo.getItemList().size(); i++) {
//            OrderCreateItemBo itemBo = bo.getItemList().get(i);
//            OOrderItem orderItem = new OOrderItem();
//
//            orderItem.setOrderId(order.getId());
//            orderItem.setOrderNum(bo.getOrderNum());
//            if(bo.getItemList().size()==1) {
//                orderItem.setSubOrderNum(bo.getOrderNum());
//            }else{
//                orderItem.setSubOrderNum(bo.getOrderNum()+(i+1));
//            }
//            orderItem.setSkuId(itemBo.getSkuId());
//            orderItem.setGoodsId(0L);
//            orderItem.setGoodsSkuId(Long.parseLong(itemBo.getSkuId()));
//            orderItem.setGoodsTitle(itemBo.getGoodsName());
//            orderItem.setGoodsImg(itemBo.getGoodsImg());
//            orderItem.setGoodsSpec(itemBo.getSkuName());
//            orderItem.setSkuNum(itemBo.getSkuCode());
//            orderItem.setGoodsPrice(itemBo.getGoodsPrice().doubleValue());
//            orderItem.setItemAmount(itemBo.getItemAmount().doubleValue());
//            orderItem.setPayment(itemBo.getItemAmount().doubleValue());
//            orderItem.setQuantity(itemBo.getQuantity());
//            orderItem.setRefundCount(0);
//            orderItem.setRefundStatus(1);
//            orderItem.setOrderStatus(order.getOrderStatus());
//            orderItem.setHasPushErp(0);
//            orderItem.setCreateTime(new Date());
//            orderItem.setCreateBy(createBy);
//            orderItemMapper.insert(orderItem);
////            itemList.add(orderItem);
//        }
//
//        return 1;
//    }
}




