package com.qihang.sys.api.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.R;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.JdOrderStateEnum;
import com.qihang.common.utils.DateUtils;
import com.qihang.common.utils.StringUtils;
import com.qihang.sys.api.domain.JdOrder;
import com.qihang.sys.api.domain.JdOrderItem;
import com.qihang.sys.api.domain.OOrder;
import com.qihang.sys.api.domain.OOrderItem;
import com.qihang.sys.api.mapper.JdOrderItemMapper;
import com.qihang.sys.api.mapper.JdOrderMapper;
import com.qihang.sys.api.mapper.OOrderItemMapper;
import com.qihang.sys.api.service.OOrderService;
import com.qihang.sys.api.mapper.OOrderMapper;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;

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
    implements OOrderService{

    private final OOrderMapper orderMapper;
    private final OOrderItemMapper orderItemMapper;
    private final JdOrderMapper jdOrderMapper;
    private final JdOrderItemMapper jdOrderItemMapper;
    @Override
    public ResultVo<Integer> jdOrderMessage(String orderId) {
         System.out.println("京东订单消息处理");
        log.info("京东订单消息处理"+orderId);
        List<JdOrder> jdOrders = jdOrderMapper.selectList(new LambdaQueryWrapper<JdOrder>().eq(JdOrder::getOrderId, orderId));
        if(jdOrders == null || jdOrders.size() == 0) {
            // 没有找到订单信息
            return new ResultVo<>(ResultVoEnum.NotFound,"没有找到京东订单："+orderId);
        }
        JdOrder jdOrder = jdOrders.get(0);

        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
        if(oOrders == null || oOrders.size() == 0) {
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
//            orderMapper.insert(insert);

            List<JdOrderItem> jdOrderItems = jdOrderItemMapper.selectList(new LambdaQueryWrapper<JdOrderItem>().eq(JdOrderItem::getOrderId, jdOrder.getId()));
            if(jdOrderItems!=null && jdOrderItems.size()>0) {
                for (var item : jdOrderItems){
                    OOrderItem orderItem = new OOrderItem();
                    orderItem.setOrderId(insert.getId());
                    // TODO：这里将订单商品skuid转换成erp系统的skuid
                }
            }
        }else{
            // 修改订单
        }
        return null;
    }
}




