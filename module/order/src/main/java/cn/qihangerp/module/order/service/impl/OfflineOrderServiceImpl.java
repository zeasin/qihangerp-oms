package cn.qihangerp.module.order.service.impl;

import cn.qihangerp.module.order.domain.OfflineOrder;
import cn.qihangerp.module.order.domain.OfflineOrderItem;
import cn.qihangerp.module.order.domain.bo.OfflineOrderCreateBo;
import cn.qihangerp.module.order.domain.bo.OfflineOrderCreateItemBo;
import cn.qihangerp.module.order.domain.bo.OfflineOrderShipBo;
import cn.qihangerp.module.order.mapper.OfflineOrderItemMapper;
import cn.qihangerp.module.order.mapper.OfflineOrderMapper;
import cn.qihangerp.module.order.service.OfflineOrderService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.mq.MqMessage;
import cn.qihangerp.common.mq.MqType;
import cn.qihangerp.common.mq.MqUtils;

import cn.qihangerp.request.OrderSearchRequest;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
* @author qilip
* @description 针对表【offline_order(线下渠道订单表)】的数据库操作Service实现
* @createDate 2024-07-27 23:03:38
*/
@AllArgsConstructor
@Service
public class OfflineOrderServiceImpl extends ServiceImpl<OfflineOrderMapper, OfflineOrder>
    implements OfflineOrderService {
    private final OfflineOrderMapper orderMapper;
    private final OfflineOrderItemMapper orderItemMapper;
    private final MqUtils mqUtils;
    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);

    @Override
    public PageResult<OfflineOrder> queryPageList(OrderSearchRequest bo, PageQuery pageQuery) {
        if(StringUtils.hasText(bo.getStartTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getStartTime());
            boolean b = matcher.find();
            if(b){
                bo.setStartTime(bo.getStartTime()+" 00:00:00");
            }
        }
        if(StringUtils.hasText(bo.getEndTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getEndTime());
            boolean b = matcher.find();
            if(b){
                bo.setEndTime(bo.getEndTime()+" 23:59:59");
            }
        }

        LambdaQueryWrapper<OfflineOrder> queryWrapper = new LambdaQueryWrapper<OfflineOrder>()
                .eq(bo.getShopId()!=null,OfflineOrder::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderNum()),OfflineOrder::getOrderNum,bo.getOrderNum())
                .eq(bo.getOrderStatus()!=null,OfflineOrder::getOrderStatus,bo.getOrderStatus())
                .ge(StringUtils.hasText(bo.getStartTime()),OfflineOrder::getOrderTime,bo.getStartTime()+" 00:00:00")
                .le(StringUtils.hasText(bo.getEndTime()),OfflineOrder::getOrderTime,bo.getEndTime()+" 23:59:59")
                .like(StringUtils.hasText(bo.getReceiverName()),OfflineOrder::getReceiverName,bo.getReceiverName())
                .like(StringUtils.hasText(bo.getReceiverMobile()),OfflineOrder::getReceiverMobile,bo.getReceiverMobile())
                .like(StringUtils.hasText(bo.getShippingNumber()),OfflineOrder::getShippingNumber,bo.getShippingNumber())
                ;

        pageQuery.setOrderByColumn("order_time");
        pageQuery.setIsAsc("desc");
        Page<OfflineOrder> pages = orderMapper.selectPage(pageQuery.build(), queryWrapper);

        // 查询子订单
        if(pages.getRecords()!=null){
            for (var order:pages.getRecords()) {
                order.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<OfflineOrderItem>().eq(OfflineOrderItem::getOrderId, order.getId())));
            }
        }

        return PageResult.build(pages);
    }

    @Override
    public OfflineOrder queryDetailById(Long id) {
        OfflineOrder oOrder = orderMapper.selectById(id);
        if(oOrder!=null) {
           oOrder.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<OfflineOrderItem>().eq(OfflineOrderItem::getOrderId, oOrder.getId())));
        }

        return oOrder;
    }


    /**
     * 新增订单
     *
     * @param bo 订单
     * @return 结果
     */
    @Transactional
    @Override
    public Long insertOfflineOrder(OfflineOrderCreateBo bo, String createBy)
    {
        List<OfflineOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OfflineOrder>().eq(OfflineOrder::getOrderNum, bo.getOrderNum()));

        if (oOrders!=null&& oOrders.size()>0) return -1L;// 订单号已存在
//        erpOrder.setCreateTime(DateUtils.getNowDate());
//        int rows = erpOrderMapper.insertErpOrder(erpOrder);
//        insertErpOrderItem(erpOrder);
//        return rows;
        if(bo.getItemList() == null || bo.getItemList().size() == 0) return -2L;
        else{
            // 循环查找是否缺少specId
            for (OfflineOrderCreateItemBo itemBo : bo.getItemList()) {
                if(itemBo.getSkuId()==null || itemBo.getQuantity()<=0) return -3L;
            }
        }

//        OShop shop = shopMapper.selectById(bo.getShopId());
//        Integer shopType = 0;
//        if(shop!=null){
//            shopType = shop.getType();
//        }else return -4;

        // 开始组合订单信息
        OfflineOrder order = new OfflineOrder();
        order.setOrderNum(bo.getOrderNum());
        order.setShopId(bo.getShopId());
        order.setBuyerMemo(bo.getBuyerMemo());
        order.setRemark(bo.getRemark());
        order.setRefundStatus(1);
        order.setOrderStatus(1);
        order.setGoodsAmount(bo.getGoodsAmount());
        order.setPostFee(bo.getPostage());
        order.setAmount(bo.getGoodsAmount()+bo.getPostage());
        order.setSellerDiscount(bo.getSellerDiscount());
        order.setPlatformDiscount(0.0);
        order.setPayment(bo.getGoodsAmount()+bo.getPostage()-bo.getSellerDiscount());
        order.setReceiverName(bo.getReceiverName());
        order.setReceiverMobile(bo.getReceiverPhone());
        order.setProvince(bo.getProvince());
        order.setCity(bo.getCity());
        order.setTown(bo.getTown());
        order.setAddress(bo.getAddress());
        order.setOrderTime(new Date());
        order.setCreateTime(new Date());
        order.setShipType(0);
        order.setCreateBy(createBy);
        order.setOmsPushStatus(0);
        orderMapper.insert(order);

//        List<OOrderItem> itemList = new ArrayList<OOrderItem>();
        for (int i = 0; i < bo.getItemList().size(); i++) {
            OfflineOrderCreateItemBo itemBo = bo.getItemList().get(i);
            OfflineOrderItem orderItem = new OfflineOrderItem();

            orderItem.setOrderId(order.getId());
            orderItem.setOrderNum(bo.getOrderNum());
            if(bo.getItemList().size()==1) {
                orderItem.setSubOrderNum(bo.getOrderNum());
            }else{
                orderItem.setSubOrderNum(bo.getOrderNum()+(i+1));
            }
            orderItem.setSkuId(itemBo.getSkuId());
            orderItem.setGoodsId(0L);
            orderItem.setGoodsSkuId(Long.parseLong(itemBo.getSkuId()));
            orderItem.setGoodsTitle(itemBo.getGoodsName());
            orderItem.setGoodsImg(itemBo.getGoodsImg());
            orderItem.setGoodsSpec(itemBo.getSkuName());
            orderItem.setSkuNum(itemBo.getSkuCode());
            orderItem.setGoodsPrice(itemBo.getSalePrice().doubleValue());
            orderItem.setItemAmount(itemBo.getItemAmount().doubleValue());
            orderItem.setPayment(itemBo.getItemAmount().doubleValue());
            orderItem.setQuantity(itemBo.getQuantity());
            orderItem.setRefundCount(0);
            orderItem.setRefundStatus(1);
            orderItem.setOrderStatus(order.getOrderStatus());
            orderItem.setHasPushErp(0);
            orderItem.setCreateTime(new Date());
            orderItem.setCreateBy(createBy);
            orderItemMapper.insert(orderItem);
//            itemList.add(orderItem);
        }

        return Long.parseLong(order.getId());
    }

    @Transactional
    @Override
    public int orderLogistics(OfflineOrderShipBo bo, String operator) {
        if(!StringUtils.hasText(bo.getOrderNum())) return -1;
        if(!StringUtils.hasText(bo.getShippingNumber()) || !StringUtils.hasText(bo.getShippingCompany())) return -2;
        List<OfflineOrder> offlineOrders = orderMapper.selectList(new LambdaQueryWrapper<OfflineOrder>().eq(OfflineOrder::getOrderNum, bo.getOrderNum()));
        if(offlineOrders==null || offlineOrders.size()==0) return -3;
        else if(offlineOrders.get(0).getOrderStatus()!=1) return -4;
        if(offlineOrders.get(0).getRefundStatus()!=1) return -5;

        OfflineOrder update = new OfflineOrder();
        update.setId(offlineOrders.get(0).getId());
        update.setShippingCompany(bo.getShippingCompany());
        update.setShippingNumber(bo.getShippingNumber());
        update.setUpdateBy(operator);
        update.setUpdateTime(new Date());
        int rows = orderMapper.updateById(update);
        if (rows > 0){
            // TODO 通知OMS系统备货
            mqUtils.sendApiMessage(MqMessage.build(EnumShopType.OFFLINE, MqType.SHIP_STOCKUP_MESSAGE, bo.getOrderNum()));
        }
        return 1;
    }
}




