package cn.qihangerp.open.jd.service.impl;

import cn.qihangerp.open.jd.domain.OmsJdOrder;
import cn.qihangerp.open.jd.domain.OmsJdOrderItem;
import cn.qihangerp.open.jd.domain.bo.JdOrderBo;
import cn.qihangerp.open.jd.mapper.OmsJdGoodsSkuMapper;
import cn.qihangerp.open.jd.mapper.OmsJdOrderItemMapper;
import cn.qihangerp.open.jd.mapper.OmsJdOrderMapper;
import cn.qihangerp.open.jd.service.OmsJdOrderService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【oms_jd_order(京东订单表)】的数据库操作Service实现
* @createDate 2024-05-10 10:54:06
*/
@AllArgsConstructor
@Service
public class OmsJdOrderServiceImpl extends ServiceImpl<OmsJdOrderMapper, OmsJdOrder>
    implements OmsJdOrderService {
    private final OmsJdOrderMapper mapper;
    private final OmsJdGoodsSkuMapper jdGoodsSkuMapper;
    private final OmsJdOrderItemMapper itemMapper;

    @Override
    public PageResult<OmsJdOrder> queryPageList(JdOrderBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OmsJdOrder> queryWrapper = new LambdaQueryWrapper<OmsJdOrder>()
                .eq(bo.getShopId()!=null,OmsJdOrder::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderId()),OmsJdOrder::getOrderId,bo.getOrderId())
                .eq(StringUtils.hasText(bo.getOrderState()),OmsJdOrder::getOrderState,bo.getOrderState())
                ;
        if(bo.getErpSendStatus()!=null){
            if(bo.getErpSendStatus()==-1) {
                queryWrapper.lt(OmsJdOrder::getErpSendStatus,3);
            }else {
                queryWrapper.eq(OmsJdOrder::getErpSendStatus, bo.getErpSendStatus());
            }
        }

        Page<OmsJdOrder> page = mapper.selectPage(pageQuery.build(), queryWrapper);
        if(page.getRecords()!=null){
            for (var order:page.getRecords()) {
                order.setItemList(itemMapper.selectList(new LambdaQueryWrapper<OmsJdOrderItem>().eq(OmsJdOrderItem::getOrderId,order.getOrderId())));
            }
        }
        return PageResult.build(page);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveOrder(Long shopId, OmsJdOrder order) {
        try {
            List<OmsJdOrder> jdOrders = mapper.selectList(new LambdaQueryWrapper<OmsJdOrder>().eq(OmsJdOrder::getOrderId, order.getOrderId()));
            if (jdOrders != null && jdOrders.size() > 0) {
                // 存在，修改
                OmsJdOrder update = new OmsJdOrder();
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

                //临时
                update.setFullname(order.getFullname());
                update.setFullAddress(order.getFullAddress());
                update.setProvince(order.getProvince());
                update.setCity(order.getCity());
                update.setTown(order.getTown());
                update.setMobile(order.getMobile());
                update.setTelephone(order.getTelephone());

                mapper.updateById(update);
                // 更新item
                for (var item : order.getItemList()) {
                    List<OmsJdOrderItem> taoOrderItems = itemMapper.selectList(new LambdaQueryWrapper<OmsJdOrderItem>().eq(OmsJdOrderItem::getSkuId, item.getSkuId()));
                    if (taoOrderItems != null && taoOrderItems.size() > 0) {
                        // 不处理
                    } else {
                        // 新增
                        item.setOrderId(jdOrders.get(0).getOrderId());
                        itemMapper.insert(item);
                    }
                }
                return ResultVo.error(ResultVoEnum.DataExist, "订单已经存在，更新成功");
            } else {
                // 不存在，新增
                order.setShopId(shopId);
                order.setCreateTime(new Date());
                mapper.insert(order);
                // 添加item
                for (var item : order.getItemList()) {
                    item.setOrderId(order.getOrderId());
                    itemMapper.insert(item);
                }

                // 添加优惠信息
//                if(order.getCoupons()!= null){
//                    for (var coupon:order.getCoupons()) {
//                        if(coupon.getOrderId()==null){
//                            coupon.setOrderId(Long.parseLong(order.getOrderId()));
//                        }
//                        couponMapper.insert(coupon);
//                    }
//                }
                return ResultVo.success();
            }
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();
            return ResultVo.error(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
        }
    }

    @Override
    public OmsJdOrder queryDetailById(Long id) {
        OmsJdOrder orderDetail = mapper.selectById(id);
        orderDetail.setItemList(itemMapper.selectList(new LambdaQueryWrapper<OmsJdOrderItem>().eq(OmsJdOrderItem::getOrderId,orderDetail.getOrderId())));
        return orderDetail;
    }

}




