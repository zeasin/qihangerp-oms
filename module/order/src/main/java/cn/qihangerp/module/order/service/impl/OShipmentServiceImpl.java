package cn.qihangerp.module.order.service.impl;

import cn.qihangerp.module.order.domain.*;
import cn.qihangerp.module.order.domain.bo.OrderShipBo;
import cn.qihangerp.module.order.mapper.*;
import cn.qihangerp.module.order.service.OShipmentService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.EnumShopType;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
* @author qilip
* @description 针对表【o_order_shipping(发货记录表)】的数据库操作Service实现
* @createDate 2024-03-31 11:16:00
*/
@Log
@AllArgsConstructor
@Service
public class OShipmentServiceImpl extends ServiceImpl<OShipmentMapper, OShipment>
    implements OShipmentService {
    private final OShipmentMapper mapper;
    private final OShipmentItemMapper shippingItemMapper;
    private final OOrderMapper orderMapper;
    private final OOrderItemMapper itemMapper;
    private final OShipStockUpMapper shipStockUpMapper;

    /**
     * 查询发货记录
     * @param shipping
     * @param pageQuery
     * @return
     */
    @Override
    public PageResult<OShipment> queryPageList(OShipment shipping, PageQuery pageQuery) {
        LambdaQueryWrapper<OShipment> queryWrapper = new LambdaQueryWrapper<OShipment>()
                .likeRight(StringUtils.hasText(shipping.getOrderNums()), OShipment::getOrderNums, shipping.getOrderNums())
                .eq(StringUtils.hasText(shipping.getWaybillCode()), OShipment::getWaybillCode, shipping.getWaybillCode())
                .eq(shipping.getShopId() != null, OShipment::getShopId, shipping.getShopId());

        Page<OShipment> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    /**
     * 手动订单发货
     * @param shipBo
     * @return
     */
    @Transactional
    @Override
    public ResultVo<Integer> handOrderShip(OrderShipBo shipBo) {
        if(shipBo.getItemIds()==null || shipBo.getItemIds().length ==0) return  ResultVo.error(ResultVoEnum.ParamsError,"参数错误：缺失OrderItemId");
        List<OShipmentItem> shippingItemList = new ArrayList<>();
        List<String> orderNums = new ArrayList<>();
        List<String> subOrderNums = new ArrayList<>();
        for (var orderItemId:shipBo.getItemIds()) {
            // 查询子订单是否存在
            OOrderItem oOrderItem = itemMapper.selectById(orderItemId);
            if(oOrderItem==null ) return ResultVo.error(ResultVoEnum.NotFound, orderItemId + "子订单未找到");
            else if (oOrderItem.getRefundStatus()!=1) {
                return ResultVo.error(ResultVoEnum.StatusError, orderItemId + "子订单退款状态不允许发货");
            }

            // 查询子订单对应的主订单是否存在
            OOrder oOrder = orderMapper.selectById(oOrderItem.getOrderId());
            if (oOrder == null) {
                // 没有找到订单
                return ResultVo.error(ResultVoEnum.NotFound, orderItemId + "子订单对应的主订单未找到");
            }else if(oOrder.getOrderStatus() != 1){
                return ResultVo.error(ResultVoEnum.StatusError, orderItemId + "子订单对应的主订单状态不允许发货");
            }

            orderNums.add(oOrderItem.getOrderNum());
            subOrderNums.add(oOrderItem.getSubOrderNum());

            // 添加shipping_item
            OShipmentItem shippingItem = new OShipmentItem();
            shippingItem.setOrderId(oOrderItem.getOrderId());
            shippingItem.setOrderItemId(oOrderItem.getId());
            shippingItem.setOrderNum(oOrderItem.getOrderNum());
            shippingItem.setSubOrderNum(oOrderItem.getSubOrderNum());
            shippingItemList.add(shippingItem);
        }

        // 订单发货主表
        OShipment shipping = new OShipment();
        shipping.setShippingType(1);//订单发货
        shipping.setShopId(shipBo.getShopId());
        shipping.setOrderNums(String.join(", ", orderNums));
        shipping.setSubOrderNums(String.join(", ", subOrderNums));
        shipping.setReceiverName(shipBo.getReceiverName());
        shipping.setReceiverMobile(shipBo.getReceiverMobile());
        shipping.setProvince(shipBo.getProvince());
        shipping.setCity(shipBo.getCity());
        shipping.setTown(shipBo.getTown());
        shipping.setAddress(shipBo.getAddress());
        shipping.setLogisticsCompany(shipBo.getShipCompany());
        shipping.setLogisticsCompanyCode(shipBo.getShipCompany());
        shipping.setWaybillCode(shipBo.getShipCode());
        shipping.setShippingTime(new Date());
//            shipping.setRemark("手动发货");
        shipping.setCreateTime(new Date());
        mapper.insert(shipping);

        // 添加发货子表
        for (var item:shippingItemList) {
            item.setShippingId(shipping.getId());
            shippingItemMapper.insert(item);
        }
//        // 回写主订单状态
//        OOrder update = new OOrder();
//        update.setId(oOrders.get(0).getId());
//        update.setOrderStatus(2);//2已发货
//        update.setShippingTime(new Date());
//        update.setShippingCompany(shipping.getLogisticsCompanyCode());
//        update.setShippingNumber(shipping.getWaybillCode());
//        update.setShippingMan(shipping.getShippingOperator());
//        update.setUpdateTime(new Date());
//        update.setUpdateBy(shipping.getCreateBy());
//        orderMapper.updateById(update);

        return ResultVo.success();
    }

    /**
     * 订单备货（很多逻辑）
     * @param orderNum
     * @param shopType
     * @return
     */
    @Transactional
    @Override
    public ResultVo<Integer> shipStockup(String orderNum, EnumShopType shopType) {
        if(shopType.getIndex()==EnumShopType.OFFLINE.getIndex()){
            // OFFLINE 订单处理
            List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderNum).eq(OOrder::getShopType, shopType.getIndex()));
            if(oOrders == null || oOrders.size()==0){
                log.info("===========订单备货错误：OOrder表中没有找到订单数据====="+orderNum);
            }else {
                log.info("===========订单备货开始处理业务====="+orderNum);
                // 1、将order_item数据加入到备货清单中o_ship_stock_up
                // 查处item
                List<OOrderItem> items = itemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrders.get(0).getId()));
                if(items!=null&& items.size()>0){
                    for (var item:items) {
                        List<OShipStockUp> erpShipStockUps = shipStockUpMapper.selectList(new LambdaQueryWrapper<OShipStockUp>().eq(OShipStockUp::getSaleOrderItemId, item.getId()));
                        if(erpShipStockUps==null || erpShipStockUps.size()==0) {
                            OShipStockUp shipStockUp = new OShipStockUp();
                            shipStockUp.setShopId(oOrders.get(0).getShopId().longValue());
                            shipStockUp.setSaleOrderId(item.getOrderId());
                            shipStockUp.setSaleOrderItemId(item.getId());
                            shipStockUp.setOrderNum(oOrders.get(0).getOrderNum());
                            shipStockUp.setOriginalSkuId(item.getSkuId());
                            shipStockUp.setGoodsId(item.getGoodsId());
                            shipStockUp.setSpecId(item.getGoodsSkuId());
                            shipStockUp.setGoodsTitle(item.getGoodsTitle());
                            shipStockUp.setGoodsImg(item.getGoodsImg());
                            shipStockUp.setGoodsSpec(item.getGoodsSpec());
                            shipStockUp.setGoodsNum(item.getGoodsNum());
                            shipStockUp.setSpecNum(item.getSkuNum());
                            shipStockUp.setQuantity(item.getQuantity());
                            shipStockUp.setStatus(0);//状态0待备货1备货中2已出库3已发货
                            shipStockUp.setCreateBy("消息通知备货");
                            shipStockUp.setCreateTime(new Date());
                            shipStockUpMapper.insert(shipStockUp);
                        }
                    }
                }
            }
        }
        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> shipSendMessage(String orderNum, EnumShopType shopType,String logisticsCompany,String logisticsCode) {

        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderNum).eq(OOrder::getShopType, shopType.getIndex()));
        if(oOrders == null || oOrders.size()==0){
            log.info("===========订单发货错误：OOrder表中没有找到订单数据====="+orderNum);
        }else {
            log.info("===========订单发货开始处理业务====="+orderNum);
            // 更新erp sale order 订单表发货状态
            if(oOrders.get(0).getOrderStatus()!=3){
                //2是已发货
                OOrder update = new OOrder();
                update.setId(oOrders.get(0).getId());
                update.setOrderStatus(2);
                update.setShippingCompany(logisticsCompany);
                update.setShippingNumber(logisticsCode);
                update.setShippingCost(BigDecimal.ZERO);
                update.setShippingMan("消息通知发货完成");
                update.setShippingTime(new Date());
//                update.setShipStatus(3);

                update.setUpdateTime(new Date());
                update.setUpdateBy("消息通知发货完成");
                orderMapper.updateById(update);
            }
            // 更新备货表相关订单状态0_ship_stock_up
            OShipStockUp shipStockUp = new OShipStockUp();
            shipStockUp.setUpdateBy("消息通知发货完成");
            shipStockUp.setUpdateTime(new Date());
            shipStockUp.setStatus(3);//状态0待备货1备货中2已出库3已发货
            shipStockUpMapper.update(shipStockUp,new LambdaQueryWrapper<OShipStockUp>().eq(OShipStockUp::getSaleOrderId,oOrders.get(0).getId()));

            //插入发货表数据o_shipment & o_shipment_item
            List<OOrderItem> oOrderItems = itemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrders.get(0).getId()));
            List<String> orderNums = new ArrayList<>();
            List<String> subOrderNums = new ArrayList<>();
            List<OShipmentItem> shippingItemList = new ArrayList<>();
            for (var oOrderItem:oOrderItems) {
//                if (oOrderItem.getRefundStatus()!=1) {
//                    return ResultVo.error(ResultVoEnum.StatusError, orderItemId + "子订单退款状态不允许发货");
//                }

                orderNums.add(oOrderItem.getOrderNum());
                subOrderNums.add(oOrderItem.getSubOrderNum());

                // 添加shipping_item
                OShipmentItem shippingItem = new OShipmentItem();
                shippingItem.setOrderId(oOrderItem.getOrderId());
                shippingItem.setOrderItemId(oOrderItem.getId());
                shippingItem.setOrderNum(oOrderItem.getOrderNum());
                shippingItem.setSubOrderNum(oOrderItem.getSubOrderNum());
                shippingItemList.add(shippingItem);
            }

            // 订单发货主表
            OShipment shipping = new OShipment();
            shipping.setShippingType(1);//订单发货
            shipping.setShopId(oOrders.get(0).getShopId());
            shipping.setOrderNums(String.join(", ", orderNums));
            shipping.setSubOrderNums(String.join(", ", subOrderNums));
            shipping.setReceiverName(oOrders.get(0).getReceiverName());
            shipping.setReceiverMobile(oOrders.get(0).getReceiverMobile());
            shipping.setProvince(oOrders.get(0).getProvince());
            shipping.setCity(oOrders.get(0).getCity());
            shipping.setTown(oOrders.get(0).getTown());
            shipping.setAddress(oOrders.get(0).getAddress());
            shipping.setLogisticsCompany(logisticsCompany);
            shipping.setLogisticsCompanyCode(logisticsCompany);
            shipping.setWaybillCode(logisticsCode);
            shipping.setShippingTime(new Date());
//            shipping.setRemark("手动发货");
            shipping.setCreateTime(new Date());
            mapper.insert(shipping);

            // 添加发货子表
            for (var item:shippingItemList) {
                item.setShippingId(shipping.getId());
                shippingItemMapper.insert(item);
            }


        }

        return ResultVo.success();
    }
}




