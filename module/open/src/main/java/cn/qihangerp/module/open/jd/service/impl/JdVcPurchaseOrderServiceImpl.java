//package cn.qihangerp.open.jd.service.impl;
//
//import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
//import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
//import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
//import cn.qihangerp.common.PageQuery;
//import cn.qihangerp.common.PageResult;
//import cn.qihangerp.common.ResultVo;
//import cn.qihangerp.common.ResultVoEnum;
//import cn.qihangerp.open.jd.domain.JdVcPurchaseOrder;
//import cn.qihangerp.open.jd.domain.JdVcPurchaseOrderItem;
//import cn.qihangerp.open.jd.domain.bo.JdOrderBo;
//import cn.qihangerp.open.jd.mapper.JdVcPurchaseOrderItemMapper;
//import cn.qihangerp.open.jd.service.JdVcPurchaseOrderService;
//import cn.qihangerp.open.jd.mapper.JdVcPurchaseOrderMapper;
//import lombok.AllArgsConstructor;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.transaction.interceptor.TransactionAspectSupport;
//import org.springframework.util.StringUtils;
//
//import java.util.Date;
//import java.util.List;
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//
///**
//* @author TW
//* @description 针对表【jd_vc_purchase_order(京东自营采购订单表)】的数据库操作Service实现
//* @createDate 2024-05-29 15:43:05
//*/
//@AllArgsConstructor
//@Service
//public class JdVcPurchaseOrderServiceImpl extends ServiceImpl<JdVcPurchaseOrderMapper, JdVcPurchaseOrder>
//    implements JdVcPurchaseOrderService{
//    private final JdVcPurchaseOrderMapper mapper;
//    private final JdVcPurchaseOrderItemMapper itemMapper;
//
//    private final String DATE_PATTERN =
//            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
//    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);
//    @Override
//    public PageResult<JdVcPurchaseOrder> queryPageList(JdOrderBo bo, PageQuery pageQuery) {
//        if(org.springframework.util.StringUtils.hasText(bo.getStartTime())){
//            Matcher matcher = DATE_FORMAT.matcher(bo.getStartTime());
//            boolean b = matcher.find();
//            if(b){
//                bo.setStartTime(bo.getStartTime()+" 00:00:00");
//            }
//        }
//        if(org.springframework.util.StringUtils.hasText(bo.getEndTime())){
//            Matcher matcher = DATE_FORMAT.matcher(bo.getEndTime());
//            boolean b = matcher.find();
//            if(b){
//                bo.setEndTime(bo.getEndTime()+" 23:59:59");
//            }
//        }
//
//        LambdaQueryWrapper<JdVcPurchaseOrder> queryWrapper = new LambdaQueryWrapper<JdVcPurchaseOrder>()
//                .eq(bo.getShopId()!=null,JdVcPurchaseOrder::getShopId,bo.getShopId())
//                .eq(StringUtils.hasText(bo.getOrderId()),JdVcPurchaseOrder::getOrderId,bo.getOrderId())
//                .eq(StringUtils.hasText(bo.getOrderState()),JdVcPurchaseOrder::getState,bo.getOrderState())
//                .ge(org.springframework.util.StringUtils.hasText(bo.getStartTime()),JdVcPurchaseOrder::getCreatedDate,bo.getStartTime())
//                .le(org.springframework.util.StringUtils.hasText(bo.getEndTime()),JdVcPurchaseOrder::getCreatedDate,bo.getEndTime())
//                ;
//
//        pageQuery.setOrderByColumn("created_date");
//        pageQuery.setIsAsc("desc");
//        Page<JdVcPurchaseOrder> taoGoodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
//        if(taoGoodsPage.getRecords()!=null){
//            for (var order:taoGoodsPage.getRecords()) {
//                order.setItems(itemMapper.selectList(new LambdaQueryWrapper<JdVcPurchaseOrderItem>().eq(JdVcPurchaseOrderItem::getOrderId,order.getOrderId())));
//            }
//        }
//        return PageResult.build(taoGoodsPage);
//    }
//
//    @Transactional
//    @Override
//    public ResultVo<Integer> saveOrder(Long shopId, JdVcPurchaseOrder order) {
//        try {
//            List<JdVcPurchaseOrder> jdOrders = mapper.selectList(new LambdaQueryWrapper<JdVcPurchaseOrder>().eq(JdVcPurchaseOrder::getOrderId, order.getOrderId()));
//            if (jdOrders != null && jdOrders.size() > 0) {
//                // 存在，修改
//                JdVcPurchaseOrder update = new JdVcPurchaseOrder();
//                update.setId(jdOrders.get(0).getId());
//                update.setStatus(order.getStatus());
//                update.setStatusName(order.getStatusName());
//                update.setState(order.getState());
//                update.setStateName(order.getStateName());
//                if(order.getCompleteDate()!=null) {
//                    update.setCompleteDate(order.getCompleteDate());
//                }
//                update.setUpdateDate(order.getUpdateDate());
//                update.setUpdateTime(new Date());
//
//                mapper.updateById(update);
//                // 删除item
//                itemMapper.delete(new LambdaQueryWrapper<JdVcPurchaseOrderItem>().eq(JdVcPurchaseOrderItem::getOrderId,jdOrders.get(0).getOrderId()));
//
//                // 添加item
//                for (var item : order.getItems()) {
//                    item.setOrderId(jdOrders.get(0).getOrderId());
//                    itemMapper.insert(item);
//                }
//                return ResultVo.error(ResultVoEnum.DataExist, "订单已经存在，更新成功");
//            } else {
//                // 不存在，新增
//                order.setShopId(shopId);
//                order.setCreateTime(new Date());
//                mapper.insert(order);
//                // 添加item
//                for (var item : order.getItems()) {
//                    item.setOrderId(order.getOrderId());
//                    itemMapper.insert(item);
//                }
//                return ResultVo.success();
//            }
//        } catch (Exception e) {
//            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//            e.printStackTrace();
//            return ResultVo.error(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
//        }
//    }
//}
//
//
//
//
