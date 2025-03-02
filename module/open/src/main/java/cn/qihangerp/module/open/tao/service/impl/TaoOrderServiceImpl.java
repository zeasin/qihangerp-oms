package cn.qihangerp.module.open.tao.service.impl;


import cn.qihangerp.module.open.tao.domain.bo.TaoOrderBo;
import cn.qihangerp.module.open.tao.mapper.TaoOrderItemMapper;
import cn.qihangerp.module.open.tao.mapper.TaoOrderMapper;
import cn.qihangerp.module.open.tao.mapper.TaoOrderPromotionMapper;
import cn.qihangerp.module.open.tao.service.TaoGoodsSkuService;
import cn.qihangerp.module.open.tao.service.TaoOrderService;
import cn.qihangerp.module.open.tao.domain.TaoGoodsSku;
import cn.qihangerp.module.open.tao.domain.TaoOrder;
import cn.qihangerp.module.open.tao.domain.TaoOrderItem;
import cn.qihangerp.module.open.tao.domain.TaoOrderPromotion;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.ResultVo;

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
* @description 针对表【tao_order(淘宝订单表)】的数据库操作Service实现
* @createDate 2024-02-29 19:01:11
*/
@Log
@AllArgsConstructor
@Service
public class TaoOrderServiceImpl extends ServiceImpl<TaoOrderMapper, TaoOrder>
    implements TaoOrderService {
    private final TaoOrderMapper mapper;
    private final TaoOrderItemMapper itemMapper;
    private final TaoOrderPromotionMapper promotionDetailsMapper;
    private final TaoGoodsSkuService goodsSkuService;
    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);
    @Override
    public PageResult<TaoOrder> queryPageList(TaoOrderBo bo, PageQuery pageQuery) {
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

        LambdaQueryWrapper<TaoOrder> queryWrapper = new LambdaQueryWrapper<TaoOrder>()
                .eq(bo.getShopId()!=null,TaoOrder::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getTid()),TaoOrder::getTid,bo.getTid())
                .eq(StringUtils.hasText(bo.getStatus()),TaoOrder::getStatus,bo.getStatus())
                .ge(org.springframework.util.StringUtils.hasText(bo.getStartTime()),TaoOrder::getCreated,bo.getStartTime()+" 00:00:00")
                .le(org.springframework.util.StringUtils.hasText(bo.getEndTime()),TaoOrder::getCreated,bo.getEndTime()+" 23:59:59")
                ;
        pageQuery.setOrderByColumn("created");
        pageQuery.setIsAsc("desc");
        Page<TaoOrder> taoGoodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
        if(taoGoodsPage.getRecords()!=null){
            for (var order:taoGoodsPage.getRecords()) {
                order.setItems(itemMapper.selectList(new LambdaQueryWrapper<TaoOrderItem>().eq(TaoOrderItem::getTid,order.getTid())));
            }
        }
        return PageResult.build(taoGoodsPage);
    }

    @Override
    public TaoOrder queryDetailById(Long id) {
        return mapper.selectById(id);
    }

    @Override
    public TaoOrder queryDetailByTid(String tid) {
        List<TaoOrder> taoOrders = mapper.selectList(new LambdaQueryWrapper<TaoOrder>().eq(TaoOrder::getTid, tid));
        if(taoOrders.isEmpty())
            return null;
        else{
            taoOrders.get(0).setItems(itemMapper.selectList(new LambdaQueryWrapper<TaoOrderItem>().eq(TaoOrderItem::getTid,tid)));
            taoOrders.get(0).setPromotions(promotionDetailsMapper.selectList(new LambdaQueryWrapper<TaoOrderPromotion>().eq(TaoOrderPromotion::getId,tid)));
            return taoOrders.get(0);
        }
    }

    @Transactional
    @Override
    public ResultVo<Long> saveOrder(Long shopId, TaoOrder order) {
        if(order == null ) return ResultVo.error(ResultVoEnum.SystemException);
        try {

            List<TaoOrder> taoOrders = mapper.selectList(new LambdaQueryWrapper<TaoOrder>().eq(TaoOrder::getTid, order.getTid()));
            if (taoOrders != null && taoOrders.size() > 0) {
                // 存在，修改
                TaoOrder update = new TaoOrder();
                update.setId(taoOrders.get(0).getId());
                if(order.getStatus().equals("WAIT_SELLER_SEND_GOODS")) {
                    update.setReceiverName(order.getReceiverName());
                    update.setReceiverMobile(order.getReceiverMobile());
                    update.setReceiverAddress(order.getReceiverAddress());
                }
                update.setSid(order.getSid());
                update.setSellerRate(order.getSellerRate());
                update.setBuyerRate(order.getBuyerRate());
                update.setStatus(order.getStatus());
                update.setModified(order.getModified());
                update.setEndTime(order.getEndTime());
                update.setConsignTime(order.getConsignTime());

                update.setUpdateTime(new Date());
                update.setReceivedPayment(order.getReceivedPayment());
                update.setAvailableConfirmFee(order.getAvailableConfirmFee());
                mapper.updateById(update);
                // 更新item
                for (var item : order.getItems()) {
                    List<TaoOrderItem> taoOrderItems = itemMapper.selectList(new LambdaQueryWrapper<TaoOrderItem>().eq(TaoOrderItem::getOid, item.getOid()));
                    if (taoOrderItems != null && taoOrderItems.size() > 0) {
                        // 更新
                        TaoOrderItem itemUpdate = new TaoOrderItem();
                        itemUpdate.setId(taoOrderItems.get(0).getId());
                        itemUpdate.setRefundId(item.getRefundId());
                        itemUpdate.setRefundStatus(item.getRefundStatus());
                        itemUpdate.setStatus(item.getStatus());
                        itemUpdate.setBuyerRate(item.getBuyerRate());
                        itemUpdate.setSellerRate(item.getSellerRate());
                        itemUpdate.setEndTime(item.getEndTime());
                        itemUpdate.setConsignTime(item.getConsignTime());
                        itemUpdate.setTotalFee(item.getTotalFee());
                        itemUpdate.setDiscountFee(item.getDiscountFee());
                        itemUpdate.setAdjustFee(item.getAdjustFee());
                        itemUpdate.setDivideOrderFee(item.getDivideOrderFee());
                        itemUpdate.setPartMjzDiscount(item.getPartMjzDiscount());
                        itemUpdate.setPayment(item.getPayment());
                        itemUpdate.setShippingType(item.getShippingType());
                        itemUpdate.setLogisticsCompany(item.getLogisticsCompany());
                        itemUpdate.setInvoiceNo(item.getInvoiceNo());
                        List<TaoGoodsSku> skus = goodsSkuService.list(new LambdaQueryWrapper<TaoGoodsSku>().eq(TaoGoodsSku::getSkuId, item.getSkuId()));
                        if (skus != null && !skus.isEmpty()) {
                            itemUpdate.setoGoodsId(skus.get(0).getOGoodsId());
                            itemUpdate.setoGoodsSkuId(skus.get(0).getOGoodsSkuId());
                        }

                        itemMapper.updateById(itemUpdate);
                    } else {
                        // 新增
                        List<TaoGoodsSku> skus = goodsSkuService.list(new LambdaQueryWrapper<TaoGoodsSku>().eq(TaoGoodsSku::getSkuId, item.getSkuId()));
                        if (skus != null && !skus.isEmpty()) {
                            item.setoGoodsId(skus.get(0).getOGoodsId());
                            item.setoGoodsSkuId(skus.get(0).getOGoodsSkuId());
                        }
                        itemMapper.insert(item);
                    }
                }
                return ResultVo.error(ResultVoEnum.DataExist.getIndex(), "订单已经存在，更新成功",Long.parseLong(update.getId()));
            } else {
                // 不存在，新增
                order.setShopId(shopId);
                order.setCreateTime(new Date());
                mapper.insert(order);
                // 添加item
                for (var item : order.getItems()) {
                    itemMapper.insert(item);
                }
                // 添加 优惠信息
                if(order.getPromotions()!=null){
                    for (var p:order.getPromotions()) {
                        promotionDetailsMapper.insert(p);
                    }
                }
                return ResultVo.success(Long.parseLong(order.getId()));
            }
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();
            log.info("保存订单数据错误："+e.getMessage());
            return ResultVo.error(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
        }
    }

    @Transactional
    @Override
    public ResultVo<Integer> updateOrder(TaoOrder order) {
        if(order == null ) return ResultVo.error(ResultVoEnum.SystemException);
        List<TaoOrder> taoOrders = mapper.selectList(new LambdaQueryWrapper<TaoOrder>().eq(TaoOrder::getTid, order.getTid()));
        if (taoOrders != null && taoOrders.size() > 0) {
            TaoOrder update = new TaoOrder();
            update.setId(taoOrders.get(0).getId());
            update.setSid(order.getSid());
            update.setSellerRate(order.getSellerRate());
            update.setBuyerRate(order.getBuyerRate());
            update.setStatus(order.getStatus());
            update.setModified(order.getModified());
            update.setEndTime(order.getEndTime());
            update.setConsignTime(order.getConsignTime());
            update.setUpdateTime(new Date());
            mapper.updateById(update);

            return ResultVo.error(ResultVoEnum.SUCCESS, "订单更新成功");
        } else {
            // 不存在，新增
            return ResultVo.error(ResultVoEnum.NotFound, "订单不存在");
        }
    }
}




