package cn.qihangerp.module.open.pdd.service.impl;


import cn.qihangerp.module.open.pdd.domain.PddGoodsSku;
import cn.qihangerp.module.open.pdd.domain.PddOrder;
import cn.qihangerp.module.open.pdd.domain.PddOrderItem;
import cn.qihangerp.module.open.pdd.domain.bo.PddOrderBo;
import cn.qihangerp.module.open.pdd.mapper.PddGoodsSkuMapper;
import cn.qihangerp.module.open.pdd.mapper.PddOrderItemMapper;
import cn.qihangerp.module.open.pdd.mapper.PddOrderMapper;
import cn.qihangerp.module.open.pdd.service.PddOrderService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
* @author TW
* @description 针对表【pdd_order(拼多多订单表)】的数据库操作Service实现
* @createDate 2024-06-05 10:58:43
*/
@Log
@AllArgsConstructor
@Service
public class PddOrderServiceImpl extends ServiceImpl<PddOrderMapper, PddOrder>
    implements PddOrderService {
    private final PddOrderMapper mapper;
    private final PddOrderItemMapper itemMapper;
    private final PddGoodsSkuMapper goodsSkuMapper;
    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);
    @Override
    public PageResult<PddOrder> queryPageList(PddOrderBo bo, PageQuery pageQuery) {
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

        LambdaQueryWrapper<PddOrder> queryWrapper = new LambdaQueryWrapper<PddOrder>()
                .eq(bo.getShopId()!=null,PddOrder::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderSn()),PddOrder::getOrderSn,bo.getOrderSn())
                .eq(StringUtils.hasText(bo.getOrderStatus()),PddOrder::getOrderStatus,bo.getOrderStatus())
                .ge(StringUtils.hasText(bo.getStartTime()),PddOrder::getCreateTime,bo.getStartTime())
                .le(StringUtils.hasText(bo.getEndTime()),PddOrder::getCreateTime,bo.getEndTime())
                ;
        pageQuery.setOrderByColumn("created_time");
        pageQuery.setIsAsc("desc");
        Page<PddOrder> taoGoodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
        if(taoGoodsPage.getRecords()!=null){
            for (var order:taoGoodsPage.getRecords()) {
                order.setItems(itemMapper.selectList(new LambdaQueryWrapper<PddOrderItem>().eq(PddOrderItem::getOrderSn,order.getOrderSn())));
            }
        }
        return PageResult.build(taoGoodsPage);
    }

    @Override
    public PddOrder queryDetailById(Long id) {
        PddOrder pddOrder = mapper.selectById(id);
        if(pddOrder!=null) {
            pddOrder.setItems(itemMapper.selectList(new LambdaQueryWrapper<PddOrderItem>().eq(PddOrderItem::getOrderSn,pddOrder.getOrderSn())));
        }
        return pddOrder;
    }

    @Override
    public PddOrder queryDetailBySn(String orderSn) {
        List<PddOrder> pddOrders = mapper.selectList(new LambdaQueryWrapper<PddOrder>().eq(PddOrder::getOrderSn,orderSn));
        if(!pddOrders.isEmpty()) {
            pddOrders.get(0).setItems(itemMapper.selectList(new LambdaQueryWrapper<PddOrderItem>().eq(PddOrderItem::getOrderSn,pddOrders.get(0).getOrderSn())));
            return pddOrders.get(0);
        }else
            return null;
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveOrder(Long shopId, PddOrder order) {
        if(order == null ) return ResultVo.error(ResultVoEnum.SystemException);
        try {
            List<PddOrder> pddOrders = mapper.selectList(new LambdaQueryWrapper<PddOrder>().eq(PddOrder::getOrderSn, order.getOrderSn()));
            if (pddOrders != null && pddOrders.size() > 0) {
                // 存在，修改
                PddOrder update = new PddOrder();
                update.setId(pddOrders.get(0).getId());
                update.setGroupStatus(order.getGroupStatus());
                update.setConfirmStatus(order.getConfirmStatus());
                update.setOrderStatus(order.getOrderStatus());
                update.setRefundStatus(order.getRefundStatus());
                update.setPayAmount(order.getPayAmount());
                update.setDuoDuoPayReduction(order.getDuoDuoPayReduction());
                update.setRemark(order.getRemark());
                update.setRemarkTag(order.getRemarkTag());
                update.setRemarkTagName(order.getRemarkTagName());
                update.setBuyerMemo(order.getBuyerMemo());
                update.setUpdatedAt(order.getUpdatedAt());
                update.setShippingTime(order.getShippingTime());
                update.setTrackingNumber(order.getTrackingNumber());
                update.setTrackingCompany(order.getTrackingCompany());
                update.setPayType(order.getPayType());
                update.setPayNo(order.getPayNo());
                if(order.getOrderStatus()==1&&order.getRefundStatus()==1) {
                    // 待发货订单才更新收货地址信息
                    if(StringUtils.hasText(order.getAddress())) {
                        update.setAddress(order.getAddress());
                    }
                    if(StringUtils.hasText(order.getReceiverAddress())) {
                        update.setReceiverAddress(order.getReceiverAddress());
                    }
                    if(StringUtils.hasText(order.getReceiverName())) {
                        update.setReceiverName(order.getReceiverName());
                    }
                    if(StringUtils.hasText(order.getReceiverPhone())) {
                        update.setReceiverPhone(order.getReceiverPhone());
                    }
                    if(StringUtils.hasText(order.getReceiverAddressMask())) {
                        update.setReceiverAddressMask(order.getReceiverAddressMask());
                    }
                    if(StringUtils.hasText(order.getReceiverNameMask())) {
                        update.setReceiverNameMask(order.getReceiverNameMask());
                    }
                    if(StringUtils.hasText(order.getReceiverPhoneMask())) {
                        update.setReceiverPhoneMask(order.getReceiverPhoneMask());
                    }
                    if(StringUtils.hasText(order.getAddressMask())) {
                        update.setAddressMask(order.getAddressMask());
                    }
                }
                if(!StringUtils.hasText(pddOrders.get(0).getProvince()) && StringUtils.hasText(order.getProvince())){
                    update.setProvinceId(order.getProvinceId());
                    update.setProvince(order.getProvince());
                }
                if(!StringUtils.hasText(pddOrders.get(0).getCity()) && StringUtils.hasText(order.getCity())){
                    update.setCityId(order.getCityId());
                    update.setCity(order.getCity());
                }
                if(!StringUtils.hasText(pddOrders.get(0).getTown()) && StringUtils.hasText(order.getTown())){
                    update.setTownId(order.getTownId());
                    update.setTown(order.getTown());
                }
                update.setCreatedTime(order.getCreatedTime());
                update.setPayTime(order.getPayTime());
                update.setConfirmTime(order.getConfirmTime());
                update.setReceiveTime(order.getReceiveTime());
                update.setAfterSalesStatus(order.getAfterSalesStatus());
                update.setLastShipTime(order.getLastShipTime());
                update.setIsStockOut(order.getIsStockOut());
                update.setLogisticsId(order.getLogisticsId());
                update.setOrderChangeAmount(order.getOrderChangeAmount());
                update.setRiskControlStatus(order.getRiskControlStatus());
                update.setUrgeShippingTime(order.getUrgeShippingTime());
                update.setAuditStatus(0);
                update.setUpdateTime(new Date());

                mapper.updateById(update);
                // 删除item
                itemMapper.delete(new LambdaQueryWrapper<PddOrderItem>().eq(PddOrderItem::getOrderSn,order.getOrderSn()));

                // 添加item
                for (var item : order.getItems()) {
                    List<PddGoodsSku> pddGoodsSku = goodsSkuMapper.selectList(new LambdaQueryWrapper<PddGoodsSku>().eq(PddGoodsSku::getSkuId, item.getSkuId()));
                    if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
                        item.setOGoodsId(pddGoodsSku.get(0).getOGoodsId());
                        item.setOGoodsSkuId(pddGoodsSku.get(0).getOGoodsSkuId());
                    }
                    item.setOrderSn(order.getOrderSn());
                    itemMapper.insert(item);
                }
                return ResultVo.error(ResultVoEnum.DataExist, "订单已经存在，更新成功");
            } else {
                // 不存在，新增
                order.setShopId(shopId);
                order.setCreateTime(new Date());
                mapper.insert(order);
                // 添加item
                for (var item : order.getItems()) {
                    List<PddGoodsSku> pddGoodsSku = goodsSkuMapper.selectList(new LambdaQueryWrapper<PddGoodsSku>().eq(PddGoodsSku::getSkuId, item.getSkuId()));
                    if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
                        item.setOGoodsId(pddGoodsSku.get(0).getOGoodsId());
                        item.setOGoodsSkuId(pddGoodsSku.get(0).getOGoodsSkuId());
                    }
                    item.setOrderSn(order.getOrderSn());
                    itemMapper.insert(item);
                }

                return ResultVo.success();
            }
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();
            log.info("保存订单数据错误："+e.getMessage());
            return ResultVo.error(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
        }
    }

}




