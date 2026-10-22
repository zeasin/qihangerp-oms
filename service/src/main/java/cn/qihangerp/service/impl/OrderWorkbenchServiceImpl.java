package cn.qihangerp.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.enums.EnumAuditStatus;
import cn.qihangerp.enums.EnumAuditType;
import cn.qihangerp.enums.EnumOrderItemRole;
import cn.qihangerp.enums.EnumOrderRole;
import cn.qihangerp.mapper.OOrderItemMapper;
import cn.qihangerp.mapper.OOrderMapper;
import cn.qihangerp.model.entity.OOrder;
import cn.qihangerp.model.entity.OOrderItem;
import cn.qihangerp.request.OrderWorkbenchQuery;
import cn.qihangerp.model.vo.OrderWorkbenchItemVo;
import cn.qihangerp.model.vo.OrderWorkbenchOrderListVo;
import cn.qihangerp.model.vo.OrderWorkbenchOrderTreeVo;
import cn.qihangerp.service.OrderWorkbenchService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 订单处理工作台查询服务实现
 * 主订单分页、订单树（主单+子单+明细）、订单明细查询
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Slf4j
@AllArgsConstructor
@Service
public class OrderWorkbenchServiceImpl implements OrderWorkbenchService {

    /** 订单号多号输入上限，避免超大 IN 查询 */
    private static final int ORDER_NUM_LIMIT = 50;
    /** 商品关键词命中订单数上限，保护 IN 查询规模 */
    private static final int KEYWORD_ORDER_LIMIT = 2000;
    private static final DateTimeFormatter DATE_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private static final DateTimeFormatter TIME_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    private final OOrderMapper orderMapper;
    private final OOrderItemMapper orderItemMapper;

    @Override
    public PageResult<OrderWorkbenchOrderListVo> queryMasterOrderPage(OrderWorkbenchQuery query, PageQuery pageQuery) {
        List<String> orderNums = parseOrderNums(query.getOrderNums());
        LocalDateTime begin = parseTime(query.getOrderTimeBegin(), true);
        LocalDateTime end = parseTime(query.getOrderTimeEnd(), false);

        LambdaQueryWrapper<OOrder> wrapper = new LambdaQueryWrapper<OOrder>()
                .eq(OOrder::getParentOrderId, 0L)
                .eq(query.getShopId() != null, OOrder::getShopId, query.getShopId())
                .eq(query.getShopType() != null, OOrder::getShopType, query.getShopType())
                .eq(query.getMerchantId() != null, OOrder::getMerchantId, query.getMerchantId())
                .eq(query.getOrderStatus() != null, OOrder::getOrderStatus, query.getOrderStatus())
                .eq(query.getAuditStatus() != null, OOrder::getAuditStatus, query.getAuditStatus())
                .eq(query.getShipStatus() != null, OOrder::getShipStatus, query.getShipStatus())
                .eq(query.getWaybillStatus() != null, OOrder::getWaybillStatus, query.getWaybillStatus())
                .in(!orderNums.isEmpty(), OOrder::getOrderNum, orderNums)
                .ge(begin != null, OOrder::getOrderTime, begin)
                .le(end != null, OOrder::getOrderTime, end);

        // 商品关键词：先查命中商品行的订单ID集合，再作为订单过滤条件
        if (StringUtils.hasText(query.getGoodsKeyword())) {
            String keyword = query.getGoodsKeyword().trim();
            List<OOrderItem> hitItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>()
                    .select(OOrderItem::getOrderId)
                    .and(w -> w.like(OOrderItem::getGoodsTitle, keyword)
                            .or().like(OOrderItem::getSkuNum, keyword)
                            .or().like(OOrderItem::getBarcode, keyword))
                    .last("LIMIT " + KEYWORD_ORDER_LIMIT));
            if (hitItems.isEmpty()) {
                return PageResult.build(new ArrayList<>());
            }
            List<Long> orderIds = hitItems.stream().map(OOrderItem::getOrderId).filter(Objects::nonNull)
                    .map(Long::parseLong).distinct().collect(Collectors.toList());
            wrapper.in(OOrder::getId, orderIds);
        }

        wrapper.orderByDesc(OOrder::getOrderTime);
        Page<OOrder> page = orderMapper.selectPage(pageQuery.build(), wrapper);
        List<OrderWorkbenchOrderListVo> voList = page.getRecords().stream().map(this::toOrderVo).collect(Collectors.toList());
        fillChildCount(voList);

        PageResult<OrderWorkbenchOrderListVo> result = new PageResult<>();
        result.setCode(200);
        result.setMsg("查询成功");
        result.setTotal(page.getTotal());
        result.setRecords(voList);
        return result;
    }

    @Override
    public OrderWorkbenchOrderTreeVo queryOrderTree(Long orderId) {
        OOrder order = orderMapper.selectById(orderId);
        if (order == null) {
            throw new RuntimeException("订单不存在：" + orderId);
        }
        // 传子订单ID时自动上溯主订单
        OOrder master = order;
        if (order.getParentOrderId() != null && order.getParentOrderId() != 0L) {
            master = orderMapper.selectById(order.getParentOrderId());
            if (master == null) {
                throw new RuntimeException("主订单不存在：" + order.getParentOrderId());
            }
        }

        OrderWorkbenchOrderTreeVo tree = new OrderWorkbenchOrderTreeVo();
        Long masterId = master.getId() == null ? null : Long.parseLong(master.getId());
        OrderWorkbenchOrderListVo masterVo = toOrderVo(master);
        List<OOrder> children = masterId == null ? new ArrayList<>() : orderMapper.selectList(new LambdaQueryWrapper<OOrder>()
                .eq(OOrder::getParentOrderId, masterId)
                .orderByAsc(OOrder::getId));
        masterVo.setChildCount(children.size());
        masterVo.setHasChildren(!children.isEmpty());
        tree.setMaster(masterVo);
        tree.setChildren(children.stream().map(this::toOrderVo).collect(Collectors.toList()));

        tree.setMasterItems(queryItemsByOrderId(master.getId()));
        if (children.isEmpty()) {
            tree.setChildItems(new ArrayList<>());
        } else {
            List<String> childIds = children.stream().map(c -> String.valueOf(c.getId())).collect(Collectors.toList());
            tree.setChildItems(orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>()
                            .in(OOrderItem::getOrderId, childIds)
                            .orderByAsc(OOrderItem::getOrderId)
                            .orderByAsc(OOrderItem::getSortNo))
                    .stream().map(this::toItemVo).collect(Collectors.toList()));
        }
        return tree;
    }

    @Override
    public List<OrderWorkbenchItemVo> queryOrderItems(Long orderId) {
        OOrder order = orderMapper.selectById(orderId);
        if (order == null) {
            throw new RuntimeException("订单不存在：" + orderId);
        }
        return queryItemsByOrderId(String.valueOf(orderId));
    }

    private List<OrderWorkbenchItemVo> queryItemsByOrderId(String orderId) {
        return orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>()
                        .eq(OOrderItem::getOrderId, orderId)
                        .orderByAsc(OOrderItem::getSortNo)
                        .orderByAsc(OOrderItem::getId))
                .stream().map(this::toItemVo).collect(Collectors.toList());
    }

    /**
     * 填充子订单数量与是否已拆分标记
     */
    private void fillChildCount(List<OrderWorkbenchOrderListVo> voList) {
        if (voList.isEmpty()) {
            return;
        }
        List<Long> masterIds = voList.stream().map(OrderWorkbenchOrderListVo::getId).collect(Collectors.toList());
        Map<Long, Long> countMap = orderMapper.selectList(new LambdaQueryWrapper<OOrder>()
                        .select(OOrder::getParentOrderId)
                        .in(OOrder::getParentOrderId, masterIds))
                .stream().collect(Collectors.groupingBy(OOrder::getParentOrderId, Collectors.counting()));
        for (OrderWorkbenchOrderListVo vo : voList) {
            int count = countMap.getOrDefault(vo.getId(), 0L).intValue();
            vo.setChildCount(count);
            vo.setHasChildren(count > 0);
        }
    }

    /**
     * 解析多订单号输入：换行/英文逗号/中文逗号/分号/空白分隔，去重保序，超限报错
     */
    private List<String> parseOrderNums(String input) {
        if (!StringUtils.hasText(input)) {
            return new ArrayList<>();
        }
        List<String> nums = Arrays.stream(input.split("[\\s,，;；]+"))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .distinct()
                .collect(Collectors.toList());
        if (nums.size() > ORDER_NUM_LIMIT) {
            throw new RuntimeException("订单号数量超过上限" + ORDER_NUM_LIMIT + "个，请分批查询");
        }
        return nums;
    }

    /**
     * 解析时间参数：yyyy-MM-dd 按日起止展开，yyyy-MM-dd HH:mm:ss 原样解析
     */
    private LocalDateTime parseTime(String input, boolean beginOfDay) {
        if (!StringUtils.hasText(input)) {
            return null;
        }
        String text = input.trim();
        try {
            if (text.length() == 10) {
                LocalDate date = LocalDate.parse(text, DATE_FORMAT);
                return beginOfDay ? date.atStartOfDay() : date.atTime(LocalTime.MAX);
            }
            return LocalDateTime.parse(text, TIME_FORMAT);
        } catch (Exception e) {
            throw new RuntimeException("时间格式错误：" + input + "，支持 yyyy-MM-dd 或 yyyy-MM-dd HH:mm:ss");
        }
    }

    private OrderWorkbenchOrderListVo toOrderVo(OOrder o) {
        OrderWorkbenchOrderListVo vo = new OrderWorkbenchOrderListVo();
        vo.setId(o.getId() == null ? null : Long.parseLong(o.getId()));
        vo.setOrderMode(o.getOrderMode());
        vo.setOrderNum(o.getOrderNum());
        vo.setShopType(o.getShopType());
        vo.setShopId(o.getShopId());
        vo.setMerchantId(o.getMerchantId());
        vo.setOrderRole(o.getOrderRole());
        vo.setOrderRoleName(o.getOrderRole() == null ? null : EnumOrderRole.getName(o.getOrderRole()));
        vo.setAuditStatus(o.getAuditStatus());
        vo.setAuditStatusName(o.getAuditStatus() == null ? null : EnumAuditStatus.getName(o.getAuditStatus()));
        vo.setAuditType(o.getAuditType());
        vo.setAuditTypeName(o.getAuditType() == null ? null : EnumAuditType.getName(o.getAuditType()));
        vo.setAuditTime(o.getAuditTime());
        vo.setAuditBy(o.getAuditBy());
        vo.setAuditRemark(o.getAuditRemark());
        vo.setOrderStatus(o.getOrderStatus());
        vo.setShipStatus(o.getShipStatus());
        vo.setWaybillStatus(o.getWaybillStatus());
        vo.setDistStatus(o.getDistStatus());
        vo.setGoodsAmount(toBigDecimal(o.getGoodsAmount()));
        vo.setPostFee(toBigDecimal(o.getPostFee()));
        vo.setAmount(toBigDecimal(o.getAmount()));
        vo.setPayment(toBigDecimal(o.getPayment()));
        vo.setMerchantAmount(toBigDecimal(o.getMerchantAmount()));
        vo.setReceiverName(o.getReceiverName());
        vo.setReceiverMobile(o.getReceiverMobile());
        vo.setProvince(o.getProvince());
        vo.setCity(o.getCity());
        vo.setTown(o.getTown());
        vo.setAddress(o.getAddress());
        vo.setBuyerMemo(o.getBuyerMemo());
        vo.setSellerMemo(o.getSellerMemo());
        vo.setRemark(o.getRemark());
        vo.setTag(o.getTag());
        vo.setWaybillCode(o.getWaybillCode());
        vo.setWaybillCompany(o.getWaybillCompany());
        vo.setOrderTime(o.getOrderTime());
        vo.setOrderFinishTime(o.getOrderFinishTime());
        vo.setCreateTime(o.getCreateTime());
        return vo;
    }

    private OrderWorkbenchItemVo toItemVo(OOrderItem i) {
        OrderWorkbenchItemVo vo = new OrderWorkbenchItemVo();
        vo.setId(i.getId() == null ? null : Long.parseLong(i.getId()));
        vo.setOrderId(i.getOrderId() == null ? null : Long.parseLong(i.getOrderId()));
        vo.setOrderNum(i.getOrderNum());
        vo.setSubOrderNum(i.getSubOrderNum());
        vo.setItemRole(i.getItemRole());
        vo.setItemRoleName(i.getItemRole() == null ? null : EnumOrderItemRole.getName(i.getItemRole()));
        vo.setSourceOrderItemId(i.getSourceOrderItemId());
        vo.setSortNo(i.getSortNo());
        vo.setGoodsId(i.getGoodsId());
        vo.setGoodsSkuId(i.getGoodsSkuId());
        vo.setGoodsTitle(i.getGoodsTitle());
        vo.setGoodsImg(i.getGoodsImg());
        vo.setGoodsSpec(i.getGoodsSpec());
        vo.setSkuNum(i.getSkuNum());
        vo.setSkuId(i.getSkuId());
        vo.setBarcode(i.getBarcode());
        vo.setGoodsNum(i.getGoodsNum());
        vo.setGoodsPrice(toBigDecimal(i.getGoodsPrice()));
        vo.setItemAmount(toBigDecimal(i.getItemAmount()));
        vo.setDiscountAmount(toBigDecimal(i.getDiscountAmount()));
        vo.setPayment(toBigDecimal(i.getPayment()));
        vo.setQuantity(i.getQuantity());
        vo.setRefundCount(i.getRefundCount());
        vo.setRefundStatus(i.getRefundStatus());
        vo.setShipType(i.getShipType());
        vo.setShipStatus(i.getShipStatus());
        vo.setWaybillCode(i.getWaybillCode());
        vo.setRemark(i.getRemark());
        return vo;
    }

    private BigDecimal toBigDecimal(Double value) {
        return value == null ? null : BigDecimal.valueOf(value).setScale(2, RoundingMode.HALF_UP);
    }
}
