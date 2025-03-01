package cn.qihangerp.open.dou.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.utils.DateUtils;
import cn.qihangerp.open.dou.domain.OmsDouOrder;
import cn.qihangerp.open.dou.domain.OmsDouOrderItem;
import cn.qihangerp.open.dou.domain.bo.DouOrderBo;
import cn.qihangerp.open.dou.mapper.OmsDouOrderItemMapper;
import cn.qihangerp.open.dou.mapper.OmsDouOrderMapper;
import cn.qihangerp.open.dou.service.OmsDouOrderService;
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
* @description 针对表【oms_dou_order(抖店订单表)】的数据库操作Service实现
* @createDate 2024-06-14 11:20:51
*/
@Log
@AllArgsConstructor
@Service
public class OmsDouOrderServiceImpl extends ServiceImpl<OmsDouOrderMapper, OmsDouOrder>
    implements OmsDouOrderService{
    private final OmsDouOrderMapper mapper;
    private final OmsDouOrderItemMapper itemMapper;
    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);
    @Override
    public PageResult<OmsDouOrder> queryPageList(DouOrderBo bo, PageQuery pageQuery) {
        long startTimeStamp = 0;
        long endTimeStamp = 0;
        if(StringUtils.hasText(bo.getStartTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getStartTime());
            boolean b = matcher.find();
            if(b){
                bo.setStartTime(bo.getStartTime()+" 00:00:00");
                startTimeStamp = DateUtils.dateTimeStrToTimeStamp(null,bo.getStartTime());
            }
        }
        if(StringUtils.hasText(bo.getEndTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getEndTime());
            boolean b = matcher.find();
            if(b){
                bo.setEndTime(bo.getEndTime()+" 23:59:59");
                endTimeStamp = DateUtils.dateTimeStrToTimeStamp(null,bo.getEndTime());
            }
        }

        LambdaQueryWrapper<OmsDouOrder> queryWrapper = new LambdaQueryWrapper<OmsDouOrder>()
                .eq(bo.getShopId()!=null,OmsDouOrder::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderId()),OmsDouOrder::getOrderId,bo.getOrderId())
                .eq(bo.getOrderStatus()!=null,OmsDouOrder::getOrderStatus,bo.getOrderStatus())
                .ge(StringUtils.hasText(bo.getStartTime()),OmsDouOrder::getCreateTime, startTimeStamp)
                .le(StringUtils.hasText(bo.getEndTime()),OmsDouOrder::getCreateTime,endTimeStamp)
                ;
        if(bo.getErpSendStatus()!=null){
            if(bo.getErpSendStatus()==-1) {
                queryWrapper.lt(OmsDouOrder::getErpSendStatus,3);
            }else {
                queryWrapper.eq(OmsDouOrder::getErpSendStatus, bo.getErpSendStatus());
            }
        }

        pageQuery.setOrderByColumn("create_time");
        pageQuery.setIsAsc("desc");
        Page<OmsDouOrder> taoGoodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
        if(taoGoodsPage.getRecords()!=null){
            for (var order:taoGoodsPage.getRecords()) {
                order.setItems(itemMapper.selectList(new LambdaQueryWrapper<OmsDouOrderItem>().eq(OmsDouOrderItem::getParentOrderId,order.getOrderId())));
            }
        }
        return PageResult.build(taoGoodsPage);
    }

    @Override
    public OmsDouOrder queryDetailById(Long id) {
        var order = mapper.selectById(id);
        if(order!=null){
            order.setItems(itemMapper.selectList(new LambdaQueryWrapper<OmsDouOrderItem>().eq(OmsDouOrderItem::getParentOrderId,order.getOrderId())));
        }
        return order;
    }

    @Override
    public OmsDouOrder queryDetailByOrderId(String orderId) {
        var orders = mapper.selectList(new LambdaQueryWrapper<OmsDouOrder>().eq(OmsDouOrder::getOrderId,orderId));
        if(orders!=null&&orders.size()>0){
            orders.get(0).setItems(itemMapper.selectList(new LambdaQueryWrapper<OmsDouOrderItem>().eq(OmsDouOrderItem::getParentOrderId,orders.get(0).getOrderId())));
            return orders.get(0);
        }else return null;
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveOrder(Long shopId, OmsDouOrder order) {
        if(order == null ) return ResultVo.error(ResultVoEnum.SystemException);
        try {

            List<OmsDouOrder> taoOrders = mapper.selectList(new LambdaQueryWrapper<OmsDouOrder>().eq(OmsDouOrder::getOrderId, order.getOrderId()));
            if (taoOrders != null && taoOrders.size() > 0) {
                // 存在，修改
                OmsDouOrder update = new OmsDouOrder();
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
                itemMapper.delete(new LambdaQueryWrapper<OmsDouOrderItem>().eq(OmsDouOrderItem::getParentOrderId,order.getOrderId()));
                for (var item : order.getItems()) {
                    // 新增
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




