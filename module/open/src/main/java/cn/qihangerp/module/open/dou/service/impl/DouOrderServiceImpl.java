package cn.qihangerp.module.open.dou.service.impl;


import cn.qihangerp.module.open.dou.domain.DouGoodsSku;
import cn.qihangerp.module.open.dou.domain.DouOrder;
import cn.qihangerp.module.open.dou.domain.DouOrderItem;
import cn.qihangerp.module.open.dou.domain.bo.DouOrderBo;
import cn.qihangerp.module.open.dou.mapper.DouGoodsSkuMapper;
import cn.qihangerp.module.open.dou.mapper.DouOrderItemMapper;
import cn.qihangerp.module.open.dou.mapper.DouOrderMapper;
import cn.qihangerp.module.open.dou.service.DouOrderService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.utils.DateUtils;

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
* @description 针对表【dou_order(抖店订单表)】的数据库操作Service实现
* @createDate 2024-06-05 15:06:31
*/
@Log
@AllArgsConstructor
@Service
public class DouOrderServiceImpl extends ServiceImpl<DouOrderMapper, DouOrder>
    implements DouOrderService {
    private final DouOrderMapper mapper;
    private final DouOrderItemMapper itemMapper;
    private final DouGoodsSkuMapper goodsSkuMapper;
    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);
    @Override
    public PageResult<DouOrder> queryPageList(DouOrderBo bo, PageQuery pageQuery) {
        long startTimeStamp = 0;
        long endTimeStamp = 0;
        if(org.springframework.util.StringUtils.hasText(bo.getStartTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getStartTime());
            boolean b = matcher.find();
            if(b){
                bo.setStartTime(bo.getStartTime()+" 00:00:00");
                startTimeStamp = DateUtils.dateTimeStrToTimeStamp(null,bo.getStartTime());
            }
        }
        if(org.springframework.util.StringUtils.hasText(bo.getEndTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getEndTime());
            boolean b = matcher.find();
            if(b){
                bo.setEndTime(bo.getEndTime()+" 23:59:59");
                endTimeStamp = DateUtils.dateTimeStrToTimeStamp(null,bo.getEndTime());
            }
        }

        LambdaQueryWrapper<DouOrder> queryWrapper = new LambdaQueryWrapper<DouOrder>()
                .eq(bo.getShopId()!=null,DouOrder::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderId()),DouOrder::getOrderId,bo.getOrderId())
                .eq(StringUtils.hasText(bo.getOrderStatus()),DouOrder::getOrderStatus,bo.getOrderStatus())
                .ge(StringUtils.hasText(bo.getStartTime()),DouOrder::getCreateTime, startTimeStamp)
                .le(StringUtils.hasText(bo.getEndTime()),DouOrder::getCreateTime,endTimeStamp)
                ;
        pageQuery.setOrderByColumn("create_time");
        pageQuery.setIsAsc("desc");
        Page<DouOrder> taoGoodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
        if(taoGoodsPage.getRecords()!=null){
            for (var order:taoGoodsPage.getRecords()) {
                order.setItems(itemMapper.selectList(new LambdaQueryWrapper<DouOrderItem>().eq(DouOrderItem::getParentOrderId,order.getOrderId())));
            }
        }
        return PageResult.build(taoGoodsPage);
    }

    @Override
    public DouOrder queryDetailById(Long id) {
        DouOrder douOrder = mapper.selectById(id);
        if(douOrder!=null) {
            douOrder.setItems(itemMapper.selectList(new LambdaQueryWrapper<DouOrderItem>().eq(DouOrderItem::getParentOrderId,douOrder.getOrderId())));
        }
        return  douOrder;
    }

    @Override
    public DouOrder queryDetailByOrderId(String orderId) {
        List<DouOrder> douOrders = mapper.selectList(new LambdaQueryWrapper<DouOrder>().eq(DouOrder::getOrderId,orderId));
        if(!douOrders.isEmpty()) {
            douOrders.get(0).setItems(itemMapper.selectList(new LambdaQueryWrapper<DouOrderItem>().eq(DouOrderItem::getParentOrderId,douOrders.get(0).getOrderId())));
            return douOrders.get(0);
        }else return null;
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveOrder(Long shopId, DouOrder order) {
        if(order == null ) return ResultVo.error(ResultVoEnum.SystemException);
        try {

            List<DouOrder> taoOrders = mapper.selectList(new LambdaQueryWrapper<DouOrder>().eq(DouOrder::getOrderId, order.getOrderId()));
            if (taoOrders != null && taoOrders.size() > 0) {
                // 存在，修改
                DouOrder update = new DouOrder();
                update.setId(taoOrders.get(0).getId());
                update.setOrderStatus(order.getOrderStatus());
                update.setOrderStatusDesc(order.getOrderStatusDesc());
                update.setBuyerWords(order.getBuyerWords());
                update.setSellerWords(order.getSellerWords());
                update.setSellerRemarkStars(order.getSellerRemarkStars());
                update.setCancelReason(order.getCancelReason());
                update.setChannelPaymentNo(order.getChannelPaymentNo());
                update.setPayTime(order.getPayTime());
                update.setUpdateTime(order.getUpdateTime());
                update.setFinishTime(order.getFinishTime());
                update.setOrderExpireTime(order.getOrderExpireTime());
                update.setLogisticsInfo(order.getLogisticsInfo());
                update.setMainStatus(order.getMainStatus());
                update.setMainStatusDesc(order.getMainStatusDesc());
                update.setMaskPostReceiver(order.getMaskPostReceiver());
                update.setMaskPostTel(order.getMaskPostTel());
                update.setMaskPostAddress(order.getMaskPostAddress());
                update.setPayAmount(order.getPayAmount());
                update.setPayType(order.getPayType());
                update.setShipTime(order.getShipTime());
                update.setTotalPromotionAmount(order.getTotalPromotionAmount());
                update.setModifyAmount(order.getModifyAmount());
                update.setModifyPostAmount(order.getModifyPostAmount());
                update.setLastPullTime(new Date());

                mapper.updateById(update);
                // 删除item
                itemMapper.delete(new LambdaQueryWrapper<DouOrderItem>().eq(DouOrderItem::getParentOrderId,order.getOrderId()));
                for (var item : order.getItems()) {
                    // 新增
                    DouGoodsSku goodsSku = goodsSkuMapper.selectById(item.getSkuId());
                    if (goodsSku != null) {
                        item.setOGoodsId(goodsSku.getOGoodsId());
                        item.setOGoodsSkuId(goodsSku.getOGoodsSkuId());
                    }
                    itemMapper.insert(item);
                }
                return ResultVo.error(ResultVoEnum.DataExist, "订单已经存在，更新成功");
            } else {
                // 不存在，新增
                order.setShopId(shopId);
                order.setAuditStatus(0);
                order.setPullTime(new Date());
                mapper.insert(order);
                // 添加item
                for (var item : order.getItems()) {
                    DouGoodsSku goodsSku = goodsSkuMapper.selectById(item.getSkuId());
                    if (goodsSku != null) {
                        item.setOGoodsId(goodsSku.getOGoodsId());
                        item.setOGoodsSkuId(goodsSku.getOGoodsSkuId());
                    }
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




