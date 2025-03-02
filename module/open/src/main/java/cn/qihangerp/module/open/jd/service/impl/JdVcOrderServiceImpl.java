package cn.qihangerp.module.open.jd.service.impl;

import cn.qihangerp.module.open.jd.domain.JdVcGoods;
import cn.qihangerp.module.open.jd.domain.JdVcOrder;
import cn.qihangerp.module.open.jd.domain.JdVcOrderItem;
import cn.qihangerp.module.open.jd.domain.bo.JdOrderBo;
import cn.qihangerp.module.open.jd.mapper.JdVcGoodsMapper;
import cn.qihangerp.module.open.jd.mapper.JdVcOrderItemMapper;
import cn.qihangerp.module.open.jd.mapper.JdVcOrderMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.module.open.jd.service.JdVcOrderService;
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
 * @author TW
 * @description 针对表【jd_vc_order】的数据库操作Service实现
 * @createDate 2024-05-25 17:19:21
 */
@AllArgsConstructor
@Service
public class JdVcOrderServiceImpl extends ServiceImpl<JdVcOrderMapper, JdVcOrder>
        implements JdVcOrderService{
    private final JdVcOrderMapper mapper;
    private final JdVcOrderItemMapper itemMapper;
    private final JdVcGoodsMapper jdVcGoodsMapper;

    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);
    @Override
    public PageResult<JdVcOrder> queryPageList(JdOrderBo bo, PageQuery pageQuery) {
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

        LambdaQueryWrapper<JdVcOrder> queryWrapper = new LambdaQueryWrapper<JdVcOrder>()
                .eq(bo.getShopId()!=null,JdVcOrder::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderId()),JdVcOrder::getCustomOrderId,bo.getOrderId())
                .eq(StringUtils.hasText(bo.getOrderState()),JdVcOrder::getOrderState,bo.getOrderState())
                .ge(org.springframework.util.StringUtils.hasText(bo.getStartTime()),JdVcOrder::getOrderCreateDate,bo.getStartTime())
                .le(org.springframework.util.StringUtils.hasText(bo.getEndTime()),JdVcOrder::getOrderCreateDate,bo.getEndTime())
                ;

        pageQuery.setOrderByColumn("order_create_date");
        pageQuery.setIsAsc("desc");
        Page<JdVcOrder> taoGoodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
        if(taoGoodsPage.getRecords()!=null){
            for (var order:taoGoodsPage.getRecords()) {
                order.setItems(itemMapper.selectList(new LambdaQueryWrapper<JdVcOrderItem>().eq(JdVcOrderItem::getJdVcOrderId,order.getId())));
            }
        }
        return PageResult.build(taoGoodsPage);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveOrder(Long shopId, JdVcOrder order) {
        try {
            List<JdVcOrder> jdOrders = mapper.selectList(new LambdaQueryWrapper<JdVcOrder>().eq(JdVcOrder::getCustomOrderId, order.getCustomOrderId()));
            if (jdOrders != null && jdOrders.size() > 0) {
                // 存在，修改
                JdVcOrder update = new JdVcOrder();
                update.setId(jdOrders.get(0).getId());
                update.setOrderState(order.getOrderState());
                update.setPay(order.getPay());
                update.setOperatorState(order.getOperatorState());
                update.setOrderState(order.getOrderState());
                update.setConsigneeName(order.getConsigneeName());
                update.setTelephone(order.getTelephone());
                update.setPhone(order.getPhone());
                update.setAddress(order.getAddress());
                update.setOrderRemark(order.getOrderRemark());
                update.setPaymentCategory(order.getPaymentCategory());
                update.setPaymentCategoryDispName(order.getPaymentCategoryDispName());
                update.setRefundSourceFlag(order.getRefundSourceFlag());
                update.setProvinceId(order.getProvinceId());
                update.setProvinceName(order.getProvinceName());
                update.setCityId(order.getCityId());
                update.setCityName(order.getCityName());
                update.setCountyId(order.getCountyId());
                update.setCountyName(order.getCountyName());
                update.setTownId(order.getTownId());
                update.setTownName(order.getTownName());
                update.setMemoByVendor(order.getMemoByVendor());
                update.setUpdateDate(order.getUpdateDate());
                update.setUpdateTime(new Date());

                mapper.updateById(update);
                // 删除item
                itemMapper.delete(new LambdaQueryWrapper<JdVcOrderItem>().eq(JdVcOrderItem::getJdVcOrderId,jdOrders.get(0).getId()));

                // 添加item
                for (var item : order.getItems()) {
                    List<JdVcGoods> pddGoodsSku = jdVcGoodsMapper.selectList(new LambdaQueryWrapper<JdVcGoods>().eq(JdVcGoods::getWareId, item.getSku()));
                    if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
                        item.setOGoodsId(pddGoodsSku.get(0).getOGoodsId().toString());
                        item.setOGoodsSkuId(pddGoodsSku.get(0).getOGoodsSkuId());
                    }
                    item.setJdVcOrderId(jdOrders.get(0).getId());
                    item.setCustomOrderId(jdOrders.get(0).getCustomOrderId());
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
                    List<JdVcGoods> pddGoodsSku = jdVcGoodsMapper.selectList(new LambdaQueryWrapper<JdVcGoods>().eq(JdVcGoods::getWareId, item.getSku()));
                    if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
                        item.setOGoodsId(pddGoodsSku.get(0).getOGoodsId().toString());
                        item.setOGoodsSkuId(pddGoodsSku.get(0).getOGoodsSkuId());
                    }
                    item.setCustomOrderId(order.getCustomOrderId());
                    item.setJdVcOrderId(order.getId());
                    itemMapper.insert(item);
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
    public JdVcOrder queryDetailByOrderId(Long customOrderId) {
        LambdaQueryWrapper<JdVcOrder> queryWrapper = new LambdaQueryWrapper<JdVcOrder>().eq(JdVcOrder::getCustomOrderId,customOrderId);
        List<JdVcOrder> jdVcOrders = mapper.selectList(queryWrapper);
        if(jdVcOrders.isEmpty()) return null;
        else{
            jdVcOrders.get(0).setItems(itemMapper.selectList(new LambdaQueryWrapper<JdVcOrderItem>().eq(JdVcOrderItem::getJdVcOrderId, jdVcOrders.get(0).getId())));
            return jdVcOrders.get(0);
        }
    }

}




