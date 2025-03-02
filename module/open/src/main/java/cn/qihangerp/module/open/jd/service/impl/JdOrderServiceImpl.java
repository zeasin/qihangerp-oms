package cn.qihangerp.module.open.jd.service.impl;

import cn.qihangerp.module.open.jd.domain.JdGoodsSku;
import cn.qihangerp.module.open.jd.domain.JdOrder;
import cn.qihangerp.module.open.jd.domain.JdOrderCoupon;
import cn.qihangerp.module.open.jd.mapper.JdGoodsSkuMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.module.open.jd.domain.JdOrderItem;
import cn.qihangerp.module.open.jd.domain.bo.JdOrderBo;
import cn.qihangerp.module.open.jd.mapper.JdOrderCouponMapper;
import cn.qihangerp.module.open.jd.mapper.JdOrderItemMapper;
import cn.qihangerp.module.open.jd.service.JdOrderService;
import cn.qihangerp.module.open.jd.mapper.JdOrderMapper;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
* @author qilip
* @description 针对表【jd_order(京东订单表)】的数据库操作Service实现
* @createDate 2024-03-09 11:29:59
*/
@AllArgsConstructor
@Service
public class JdOrderServiceImpl extends ServiceImpl<JdOrderMapper, JdOrder>
    implements JdOrderService{
    private final JdOrderMapper mapper;
    private final JdOrderItemMapper itemMapper;
    private final JdOrderCouponMapper couponMapper;
    private final JdGoodsSkuMapper goodsSkuMapper;
    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);

    @Override
    public PageResult<JdOrder> queryPageList(JdOrderBo bo, PageQuery pageQuery) {
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

        LambdaQueryWrapper<JdOrder> queryWrapper = new LambdaQueryWrapper<JdOrder>()
                .eq(bo.getShopId()!=null,JdOrder::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderId()),JdOrder::getOrderId,bo.getOrderId())
                .eq(StringUtils.hasText(bo.getOrderState()),JdOrder::getOrderState,bo.getOrderState())
                .ge(org.springframework.util.StringUtils.hasText(bo.getStartTime()),JdOrder::getOrderStartTime,bo.getStartTime())
                .le(org.springframework.util.StringUtils.hasText(bo.getEndTime()),JdOrder::getOrderStartTime,bo.getEndTime())
                ;

        pageQuery.setOrderByColumn("order_start_time");
        pageQuery.setIsAsc("desc");
        Page<JdOrder> taoGoodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
        if(taoGoodsPage.getRecords()!=null){
            for (var order:taoGoodsPage.getRecords()) {
                order.setItems(itemMapper.selectList(new LambdaQueryWrapper<JdOrderItem>().eq(JdOrderItem::getOrderId,order.getId())));
            }
        }
        return PageResult.build(taoGoodsPage);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveOrder(Long shopId, JdOrder order) {
        try {
            List<JdOrder> jdOrders = mapper.selectList(new LambdaQueryWrapper<JdOrder>().eq(JdOrder::getOrderId, order.getOrderId()));
            if (jdOrders != null && jdOrders.size() > 0) {
                // 存在，修改
                JdOrder update = new JdOrder();
                update.setId(jdOrders.get(0).getId());
                update.setOrderState(order.getOrderState());
                update.setOrderStateRemark(order.getOrderStateRemark());
                update.setInvoiceCode(order.getInvoiceCode());
                update.setOrderEndTime(order.getOrderEndTime());
                update.setModified(order.getModified());
                update.setVenderRemark(order.getVenderRemark());
                update.setReturnOrder(order.getReturnOrder());
                update.setPaymentConfirmTime(order.getPaymentConfirmTime());
                update.setWaybill(order.getWaybill());
                update.setLogisticsId(order.getLogisticsId());
                update.setOrderTotalPrice(order.getOrderTotalPrice());
                update.setOrderSellerPrice(order.getOrderSellerPrice());
                update.setOrderPayment(order.getOrderPayment());
                update.setFreightPrice(order.getFreightPrice());
                update.setSellerDiscount(order.getSellerDiscount());
              
                mapper.updateById(update);
                // 删除item
                itemMapper.delete(new LambdaQueryWrapper<JdOrderItem>().eq(JdOrderItem::getOrderId,jdOrders.get(0).getId()));

                // 添加item
                for (var item : order.getItems()) {
                    List<JdGoodsSku> pddGoodsSku = goodsSkuMapper.selectList(new LambdaQueryWrapper<JdGoodsSku>().eq(JdGoodsSku::getSkuId, item.getSkuId()));
                    if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
                        item.setoGoodsId(pddGoodsSku.get(0).getOGoodsId());
                        item.setoGoodsSkuId(pddGoodsSku.get(0).getOGoodsSkuId());
                    }
                    item.setOrderId(jdOrders.get(0).getId());
                    itemMapper.insert(item);
                }
                // 更新item
//                for (var item : order.getItems()) {
//                    List<JdOrderItem> taoOrderItems = itemMapper.selectList(
//                            new LambdaQueryWrapper<JdOrderItem>().eq(JdOrderItem::getSkuId, item.getSkuId()).eq(JdOrderItem::getOrderId,jdOrders.get(0).getId())
//                    );
//                    if (taoOrderItems != null && taoOrderItems.size() > 0) {
//                        // 不处理
//                    } else {
//                        // 新增
//                        item.setOrderId(update.getId());
//                        itemMapper.insert(item);
//                    }
//                }
                // 删除优惠信息
                couponMapper.delete(new LambdaQueryWrapper<JdOrderCoupon>().eq(JdOrderCoupon::getOrderId,jdOrders.get(0).getOrderId()));

                // 添加优惠信息
                if(order.getCoupons()!= null){
                    for (var coupon:order.getCoupons()) {
                        if(coupon.getOrderId()==null){
                            coupon.setOrderId(Long.parseLong(jdOrders.get(0).getOrderId()));
                        }
                        couponMapper.insert(coupon);
                    }
                }

                return ResultVo.error(ResultVoEnum.DataExist, "订单已经存在，更新成功");
            } else {
                // 不存在，新增

                order.setShopId(shopId);
                order.setCreateTime(new Date());
                mapper.insert(order);
                // 添加item
                for (var item : order.getItems()) {
                    List<JdGoodsSku> pddGoodsSku = goodsSkuMapper.selectList(new LambdaQueryWrapper<JdGoodsSku>().eq(JdGoodsSku::getSkuId, item.getSkuId()));
                    if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
                        item.setoGoodsId(pddGoodsSku.get(0).getOGoodsId());
                        item.setoGoodsSkuId(pddGoodsSku.get(0).getOGoodsSkuId());
                    }
                    item.setOrderId(order.getId());
                    itemMapper.insert(item);
                }

                // 添加优惠信息
                if(order.getCoupons()!= null){
                    for (var coupon:order.getCoupons()) {
                        if(coupon.getOrderId()==null){
                            coupon.setOrderId(Long.parseLong(order.getOrderId()));
                        }
                        couponMapper.insert(coupon);
                    }
                }
                return ResultVo.success();
            }
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();
            return ResultVo.error(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
        }
    }

    @Override
    public JdOrder queryDetailByOrderId(Long orderId) {
        LambdaQueryWrapper<JdOrder> queryWrapper = new LambdaQueryWrapper<JdOrder>().eq(JdOrder::getOrderId,orderId);
        List<JdOrder> jdOrders = mapper.selectList(queryWrapper);
        if(jdOrders.isEmpty()) return null;
        else{
            jdOrders.get(0).setItems(itemMapper.selectList(new LambdaQueryWrapper<JdOrderItem>().eq(JdOrderItem::getOrderId,jdOrders.get(0).getId())));
            return jdOrders.get(0);
        }
    }
}




