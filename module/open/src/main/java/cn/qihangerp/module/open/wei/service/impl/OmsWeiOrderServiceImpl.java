package cn.qihangerp.module.open.wei.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.module.open.wei.domain.OmsWeiGoodsSku;
import cn.qihangerp.module.open.wei.domain.OmsWeiOrder;
import cn.qihangerp.module.open.wei.domain.OmsWeiOrderItem;
import cn.qihangerp.module.open.wei.mapper.OmsWeiGoodsSkuMapper;
import cn.qihangerp.module.open.wei.mapper.OmsWeiOrderItemMapper;
import cn.qihangerp.module.open.wei.mapper.OmsWeiOrderMapper;
import cn.qihangerp.module.open.wei.service.OmsWeiOrderService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.StringUtils;

import java.util.List;

/**
* @author TW
* @description 针对表【oms_wei_order】的数据库操作Service实现
* @createDate 2024-06-03 16:48:31
*/
@AllArgsConstructor
@Service
public class OmsWeiOrderServiceImpl extends ServiceImpl<OmsWeiOrderMapper, OmsWeiOrder>
    implements OmsWeiOrderService {
    private final OmsWeiOrderMapper mapper;
    private final OmsWeiOrderItemMapper itemMapper;
    private final OmsWeiGoodsSkuMapper goodsSkuMapper;
//    private final MQClientService mqClientService;

    @Override
    public PageResult<OmsWeiOrder> queryPageList(OmsWeiOrder bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OmsWeiOrder> queryWrapper = new LambdaQueryWrapper<OmsWeiOrder>()
                .eq(bo.getShopId()!=null,OmsWeiOrder::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderId()),OmsWeiOrder::getOrderId,bo.getOrderId())
                .eq(bo.getStatus()!=null,OmsWeiOrder::getStatus,bo.getStatus())
                ;
        if(bo.getErpSendStatus()!=null){
            if(bo.getErpSendStatus()==-1) {
                queryWrapper.lt(OmsWeiOrder::getErpSendStatus,3);
            }else {
                queryWrapper.eq(OmsWeiOrder::getErpSendStatus, bo.getErpSendStatus());
            }
        }

        Page<OmsWeiOrder> page = mapper.selectPage(pageQuery.build(), queryWrapper);
        if(page.getRecords()!=null){
            for (var order:page.getRecords()) {
                order.setItems(itemMapper.selectList(new LambdaQueryWrapper<OmsWeiOrderItem>().eq(OmsWeiOrderItem::getOrderId,order.getOrderId())));
            }
        }
        return PageResult.build(page);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveOrder(Long shopId, OmsWeiOrder order) {
        try {
            List<OmsWeiOrder> orders = mapper.selectList(new LambdaQueryWrapper<OmsWeiOrder>().eq(OmsWeiOrder::getOrderId, order.getOrderId()));
            if (orders != null && orders.size() > 0) {
                // 存在，修改
                OmsWeiOrder update = new OmsWeiOrder();
                update.setId(orders.get(0).getId());
                update.setOrderId(order.getOrderId());
                update.setStatus(order.getStatus());
                update.setUpdateTime(order.getUpdateTime());
                update.setPayInfo(order.getPayInfo());
                update.setAftersaleDetail(order.getAftersaleDetail());
                update.setDeliveryProductInfo(order.getDeliveryProductInfo());

                mapper.updateById(update);
                // 更新item
                for (var item : order.getItems()) {
                    List<OmsWeiOrderItem> taoOrderItems = itemMapper.selectList(
                            new LambdaQueryWrapper<OmsWeiOrderItem>().eq(OmsWeiOrderItem::getSkuId, item.getSkuId()).eq(OmsWeiOrderItem::getOrderId,order.getOrderId())
                    );

                    if (taoOrderItems != null && taoOrderItems.size() > 0) {
                        // 更新
                        OmsWeiOrderItem itemUpdate = new OmsWeiOrderItem();
                        itemUpdate.setId(taoOrderItems.get(0).getId());
                        List<OmsWeiGoodsSku> skus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OmsWeiGoodsSku>().eq(OmsWeiGoodsSku::getSkuId, item.getSkuId()));
                        if (skus != null && !skus.isEmpty()) {
                            itemUpdate.setOGoodsId(skus.get(0).getOGoodsId());
                            itemUpdate.setOGoodsSkuId(skus.get(0).getOGoodsSkuId());
                        }
                        itemMapper.updateById(itemUpdate);
                    } else {
                        // 新增
                        List<OmsWeiGoodsSku> skus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OmsWeiGoodsSku>().eq(OmsWeiGoodsSku::getSkuId, item.getSkuId()));
                        if (skus != null && !skus.isEmpty()) {
                            item.setOGoodsId(skus.get(0).getOGoodsId());
                            item.setOGoodsSkuId(skus.get(0).getOGoodsSkuId());
                        }
                        item.setShopId(shopId);
                        item.setOrderId(order.getOrderId());
                        itemMapper.insert(item);
                    }
                }
                return ResultVo.error(ResultVoEnum.DataExist, "订单已经存在，更新成功");
            } else {
                // 不存在，新增

                order.setShopId(shopId);
                mapper.insert(order);
                // 添加item
                for (var item : order.getItems()) {
                    List<OmsWeiGoodsSku> skus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OmsWeiGoodsSku>().eq(OmsWeiGoodsSku::getSkuId, item.getSkuId()));
                    if (skus != null && !skus.isEmpty()) {
                        item.setOGoodsId(skus.get(0).getOGoodsId());
                        item.setOGoodsSkuId(skus.get(0).getOGoodsSkuId());
                    }
                    item.setShopId(shopId);
                    item.setOrderId(order.getOrderId());
                    itemMapper.insert(item);
                }
                return ResultVo.success();
            }
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return ResultVo.error(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
        }
    }


    @Override
    public OmsWeiOrder queryDetailById(Long id) {
        OmsWeiOrder weiOrder = mapper.selectById(id);
        if(weiOrder!=null){
            weiOrder.setItems(itemMapper.selectList(new LambdaQueryWrapper<OmsWeiOrderItem>().eq(OmsWeiOrderItem::getOrderId,weiOrder.getOrderId())));
        }
        return weiOrder;
    }
    @Override
    public OmsWeiOrder queryDetailByOrderId(String orderId) {
        List<OmsWeiOrder> weiOrders = mapper.selectList(new LambdaQueryWrapper<OmsWeiOrder>().eq(OmsWeiOrder::getOrderId,orderId));
        if(weiOrders!=null&&weiOrders.size()>0){
            weiOrders.get(0).setItems(itemMapper.selectList(new LambdaQueryWrapper<OmsWeiOrderItem>().eq(OmsWeiOrderItem::getOrderId,orderId)));
            return weiOrders.get(0);
        }else return null;
    }
}




