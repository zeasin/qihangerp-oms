package cn.qihangerp.service.impl;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.enums.EnumAuditStatus;
import cn.qihangerp.enums.EnumOOrderStatus;
import cn.qihangerp.enums.EnumOrderRole;
import cn.qihangerp.enums.EnumShipStatus;
import cn.qihangerp.enums.EnumShipType;
import cn.qihangerp.enums.EnumWaybillStatus;
import cn.qihangerp.mapper.ErpLogisticsCompanyMapper;
import cn.qihangerp.mapper.ErpSupplierMapper;
import cn.qihangerp.mapper.ErpWarehouseMapper;
import cn.qihangerp.mapper.OOrderItemMapper;
import cn.qihangerp.mapper.OOrderMapper;
import cn.qihangerp.model.bo.SplitSubmitBo;
import cn.qihangerp.model.entity.ErpLogisticsCompany;
import cn.qihangerp.model.entity.ErpSupplier;
import cn.qihangerp.model.entity.ErpWarehouse;
import cn.qihangerp.model.entity.OOrder;
import cn.qihangerp.model.entity.OOrderItem;
import cn.qihangerp.model.vo.SplitPreviewVo;
import cn.qihangerp.service.OrderWorkbenchSplitService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 订单处理工作台-拆单服务实现
 * 事务内按 §2.5.2 步骤执行：行锁锁定主订单与商品行 → 全量分配强校验 → 生成子订单+履约快照明细 → 保持原子性；
 * 任何一步失败整体回滚，不产生"只有子订单头没有子订单商品"的中间状态。
 * 拆单完成后被拆主订单置「已拆单 + 无需发货」（audit_status=3、ship_status=3），退出全部状态池；子订单承担履约。
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Slf4j
@Service
@AllArgsConstructor
public class OrderWorkbenchSplitServiceImpl implements OrderWorkbenchSplitService {

    private final OOrderMapper orderMapper;
    private final OOrderItemMapper orderItemMapper;
    private final ErpWarehouseMapper warehouseMapper;
    private final ErpSupplierMapper supplierMapper;
    private final ErpLogisticsCompanyMapper logisticsMapper;

    // ==================== 拆单预览 ====================

    @Override
    public SplitPreviewVo preview(Long orderId, List<Long> merchantIds) {
        OOrder master = orderMapper.selectById(orderId);
        if (master == null) {
            throw new RuntimeException("订单不存在：" + orderId);
        }
        checkScope(merchantIds, master.getMerchantId());
        boolean isChild = master.getOrderRole() != null && master.getOrderRole() == EnumOrderRole.CHILD.getCode();

        // 被拆单商品行（主单=原始行 item_role=0；子单=分配行 item_role=1），部分拆统一逻辑
        int srcRole = isChild ? 1 : 0;
        List<OOrderItem> sourceItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>()
                .eq(OOrderItem::getOrderId, master.getId())
                .eq(OOrderItem::getItemRole, srcRole)
                .orderByAsc(OOrderItem::getSortNo)
                .orderByAsc(OOrderItem::getId));

        // 已拆出聚合：现有子单明细按来源行聚合（部分拆模型下原单可反复拆，需展示剩余可拆）
        Map<Long, Integer> splitOutMap = aggregateSplitOut(sourceItems);

        // 仅 1 条明细且商品总数量为 1 件的订单无拆分意义，禁止进入拆单
        int totalQty = sourceItems.stream().mapToInt(i -> nz(i.getQuantity())).sum();
        if (sourceItems.size() == 1 && totalQty == 1) {
            throw new RuntimeException("该订单仅 1 条明细且商品数量只有 1 件，不允许拆单");
        }

        SplitPreviewVo vo = new SplitPreviewVo();
        vo.setOrderId(orderId);
        vo.setOrderNum(master.getOrderNum());
        vo.setAuditStatus(master.getAuditStatus());
        List<SplitPreviewVo.Item> items = new ArrayList<>();
        for (OOrderItem item : sourceItems) {
            SplitPreviewVo.Item i = new SplitPreviewVo.Item();
            i.setItemId(Long.parseLong(item.getId()));
            i.setGoodsTitle(item.getGoodsTitle());
            i.setGoodsImg(item.getGoodsImg());
            i.setSkuNum(item.getSkuNum());
            i.setGoodsSpec(item.getGoodsSpec());
            i.setBarcode(item.getBarcode());
            i.setQuantity(nz(item.getQuantity()));
            i.setRefundCount(nz(item.getRefundCount()));
            i.setAvailable(nz(item.getQuantity()) - nz(item.getRefundCount()));
            i.setSplitOut(splitOutMap.getOrDefault(Long.parseLong(item.getId()), 0));
            items.add(i);
        }
        vo.setItems(items);
        return vo;
    }

    // ==================== 提交拆单 ====================

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo<String> submit(SplitSubmitBo bo, List<Long> merchantIds, String username) {
        int created = doSplit(bo, merchantIds, username);
        return ResultVo.success(String.format("拆单成功，生成 %d 个子订单", created));
    }

    /**
     * 拆单事务体（§2.5.1 校验 + §2.5.2 事务步骤）
     * 部分拆模型：弹窗内可反复「添加到待拆分」攒多个批次，最后统一拆分；
     * 每批生成一个子单平挂顶层主单下，原单保留剩余（不再作废任何单），有剩余即可再次拆；
     * 校验口径=各商品行「本单累计拆出+已拆出 ≤ 可发货数量」；发货主体可空（后置到打单发货）
     *
     * @return 新建子订单数
     */
    private int doSplit(SplitSubmitBo bo, List<Long> merchantIds, String username) {
        if (bo.getOrderId() == null) {
            throw new RuntimeException("订单ID不能为空");
        }
        if (bo.getGroups() == null || bo.getGroups().isEmpty()) {
            throw new RuntimeException("请先添加待拆明细（每批填入拆分数量后添加）");
        }
        // 1. 行锁锁定被拆订单（防两个操作员同时拆分）
        OOrder master = orderMapper.lockById(bo.getOrderId());
        if (master == null) {
            throw new RuntimeException("订单不存在：" + bo.getOrderId());
        }
        checkScope(merchantIds, master.getMerchantId());
        boolean isChild = master.getOrderRole() != null && master.getOrderRole() == EnumOrderRole.CHILD.getCode();
        if (master.getOrderRole() == null
                || (!isChild && master.getOrderRole() != EnumOrderRole.MASTER.getCode())) {
            throw new RuntimeException("仅主订单或子订单支持拆分");
        }
        if (isChild && master.getWaybillStatus() != null
                && master.getWaybillStatus() != EnumWaybillStatus.NOT_TAKEN.getIndex()) {
            throw new RuntimeException("子单[" + master.getOrderNum() + "]已取号/打印/发货，不能拆单；变化请走补发、换货或售后流程");
        }
        if (master.getAuditStatus() != null && master.getAuditStatus() == EnumAuditStatus.SPLIT.getCode()) {
            throw new RuntimeException("该订单已拆单，不能重复拆分");
        }
        if (master.getAuditStatus() == null
                || (master.getAuditStatus() != EnumAuditStatus.PENDING.getCode()
                && master.getAuditStatus() != EnumAuditStatus.EXCEPTION.getCode())) {
            throw new RuntimeException("订单已放行，不能拆分");
        }
        if (master.getOrderStatus() != null
                && (master.getOrderStatus() == EnumOOrderStatus.CANCEL.getIndex()
                || master.getOrderStatus() == EnumOOrderStatus.DELETED.getIndex())) {
            throw new RuntimeException("订单已取消/作废，不能拆分");
        }

        // 2. 行锁锁定被拆订单商品行并重读（主单原始行 item_role=0；子单分配行 item_role=1）
        List<OOrderItem> masterItems = orderItemMapper.lockByOrderId(Long.parseLong(master.getId()));
        Map<Long, OOrderItem> masterItemMap = new HashMap<>();
        int srcRole = isChild ? 1 : 0;
        for (OOrderItem item : masterItems) {
            if (item.getItemRole() != null && item.getItemRole() == srcRole) {
                masterItemMap.put(Long.parseLong(item.getId()), item);
            }
        }
        if (masterItemMap.isEmpty()) {
            throw new RuntimeException("该订单无可拆分商品行");
        }
        // 仅 1 条明细且商品总数量为 1 件的订单无拆分意义，禁止拆分（防绕过前端/预览直调）
        int totalQty = masterItemMap.values().stream().mapToInt(i -> nz(i.getQuantity())).sum();
        if (masterItemMap.size() == 1 && totalQty == 1) {
            throw new RuntimeException("该订单仅 1 条明细且商品数量只有 1 件，不允许拆单");
        }

        // 3. 部分拆累计校验：各商品行「本次累计拆出 + 已拆出 ≤ 可发货数量」（原单允许留剩余）
        Map<Long, Integer> allocatedMap = new HashMap<>();
        for (SplitSubmitBo.SplitGroupBo group : bo.getGroups()) {
            validateGroupShipper(group);
            if (group.getItems() == null || group.getItems().isEmpty()) {
                throw new RuntimeException("待拆批次[" + safeName(group.getGroupName()) + "]没有商品明细");
            }
            for (SplitSubmitBo.SplitItemBo gi : group.getItems()) {
                if (gi.getSourceOrderItemId() == null || gi.getQuantity() == null || gi.getQuantity() <= 0) {
                    throw new RuntimeException("待拆批次[" + safeName(group.getGroupName()) + "]存在无效明细行");
                }
                OOrderItem source = masterItemMap.get(gi.getSourceOrderItemId());
                if (source == null) {
                    throw new RuntimeException("明细行不属于该订单：sourceOrderItemId=" + gi.getSourceOrderItemId());
                }
                allocatedMap.merge(gi.getSourceOrderItemId(), gi.getQuantity(), Integer::sum);
            }
        }
        Map<Long, Integer> splitOutMap = aggregateSplitOut(new ArrayList<>(masterItemMap.values()));
        for (Map.Entry<Long, Integer> entry : allocatedMap.entrySet()) {
            OOrderItem source = masterItemMap.get(entry.getKey());
            int available = nz(source.getQuantity()) - nz(source.getRefundCount());
            int alreadyOut = splitOutMap.getOrDefault(entry.getKey(), 0);
            if (available <= 0) {
                throw new RuntimeException("商品[" + source.getGoodsTitle() + "]可发货数量为0（已全部退款），不能拆分");
            }
            if (alreadyOut >= available) {
                throw new RuntimeException("商品[" + source.getGoodsTitle() + "]已全部拆出（" + alreadyOut
                        + "/" + available + "），无剩余可拆");
            }
            if (entry.getValue() + alreadyOut > available) {
                throw new RuntimeException("商品[" + source.getGoodsTitle() + "]拆分数量超限：已拆出" + alreadyOut
                        + "，本次拆" + entry.getValue() + "，可发货仅 " + available);
            }
        }

        // 4. 按待拆批次创建子订单 + 履约快照明细（原单保留剩余，不作废任何单）
        LocalDateTime now = LocalDateTime.now();
        BigDecimal masterGoodsAmount = master.getGoodsAmount() == null ? BigDecimal.ZERO : BigDecimal.valueOf(master.getGoodsAmount());
        int created = 0;
        int groupIndex = 0;
        for (SplitSubmitBo.SplitGroupBo group : bo.getGroups()) {
            groupIndex++;

            OOrder child = new OOrder();
            child.setOrderNum(master.getOrderNum());
            child.setOrderMode(master.getOrderMode());
            child.setShopType(master.getShopType());
            child.setShopId(master.getShopId());
            child.setMerchantId(master.getMerchantId());
            child.setBuyerMemo(master.getBuyerMemo());
            child.setSellerMemo(master.getSellerMemo());
            child.setReceiverName(master.getReceiverName());
            child.setReceiverMobile(master.getReceiverMobile());
            child.setAddress(master.getAddress());
            child.setProvince(master.getProvince());
            child.setCity(master.getCity());
            child.setTown(master.getTown());
            child.setOpenAddressId(master.getOpenAddressId());
            child.setParentOrderId(isChild ? master.getParentOrderId() : Long.parseLong(master.getId()));
            child.setOrderRole(EnumOrderRole.CHILD.getCode());
            child.setSourceOrderId(isChild ? master.getSourceOrderId() : Long.parseLong(master.getId()));
            child.setAuditStatus(master.getAuditStatus());
            child.setOrderStatus(master.getOrderStatus());
            child.setShipStatus(EnumShipStatus.NOT.getIndex());
            child.setWaybillStatus(EnumWaybillStatus.NOT_TAKEN.getIndex());
            child.setTag(master.getTag());
            child.setOrderTime(master.getOrderTime());
            // 拆单继承：被拆订单已分配面单账号时子单沿用；未分配保持为空，放行前由审单台补齐
            child.setWaybillAccountId(master.getWaybillAccountId());
            child.setRemark("拆分批次" + groupIndex);
            child.setCreateTime(now);
            child.setCreateBy(username);
            child.setUpdateTime(now);
            child.setUpdateBy(username);

            // 分组金额快照：按商品金额占比分摊（金额事实保留在主订单）
            BigDecimal childGoods = BigDecimal.ZERO;
            for (SplitSubmitBo.SplitItemBo gi : group.getItems()) {
                OOrderItem source = masterItemMap.get(gi.getSourceOrderItemId());
                double price = source.getGoodsPrice() == null ? 0 : source.getGoodsPrice();
                childGoods = childGoods.add(BigDecimal.valueOf(price).multiply(BigDecimal.valueOf(gi.getQuantity())));
            }
            if (masterGoodsAmount.compareTo(BigDecimal.ZERO) > 0) {
                BigDecimal ratio = childGoods.divide(masterGoodsAmount, 6, RoundingMode.HALF_UP);
                child.setGoodsAmount(childGoods.setScale(2, RoundingMode.HALF_UP).doubleValue());
                if (master.getAmount() != null) {
                    child.setAmount(BigDecimal.valueOf(master.getAmount()).multiply(ratio).setScale(2, RoundingMode.HALF_UP).doubleValue());
                }
                if (master.getPayment() != null) {
                    child.setPayment(BigDecimal.valueOf(master.getPayment()).multiply(ratio).setScale(2, RoundingMode.HALF_UP).doubleValue());
                }
            }
            // 快递公司（选填）：查 erp_logistics_company 写 waybill_company + shipping_company_code
            applyLogistics(child, group.getLogisticsId());
            orderMapper.insert(child);

            int sort = 0;
            for (SplitSubmitBo.SplitItemBo gi : group.getItems()) {
                OOrderItem source = masterItemMap.get(gi.getSourceOrderItemId());
                OOrderItem ci = new OOrderItem();
                ci.setOrderId(child.getId());
                ci.setOrderNum(master.getOrderNum());
                ci.setSubOrderNum(source.getSubOrderNum());
                ci.setItemRole(1);
                ci.setSourceOrderItemId(Long.parseLong(source.getId()));
                ci.setSortNo(source.getSortNo() == null ? sort : source.getSortNo());
                ci.setSkuId(source.getSkuId());
                ci.setProductId(source.getProductId());
                ci.setGoodsId(source.getGoodsId());
                ci.setGoodsSkuId(source.getGoodsSkuId());
                ci.setGoodsTitle(source.getGoodsTitle());
                ci.setGoodsImg(source.getGoodsImg());
                ci.setGoodsNum(source.getGoodsNum());
                ci.setGoodsSpec(source.getGoodsSpec());
                ci.setSkuNum(source.getSkuNum());
                ci.setBarcode(source.getBarcode());
                ci.setGoodsPrice(source.getGoodsPrice());
                ci.setQuantity(gi.getQuantity());
                double price = source.getGoodsPrice() == null ? 0 : source.getGoodsPrice();
                ci.setItemAmount(BigDecimal.valueOf(price).multiply(BigDecimal.valueOf(gi.getQuantity())).setScale(2, RoundingMode.HALF_UP).doubleValue());
                ci.setPayment(ci.getItemAmount());
                ci.setShopId(master.getShopId());
                ci.setShopType(master.getShopType());
                ci.setMerchantId(master.getMerchantId());
                // 发货主体：批次显式指定优先；未指定时继承来源明细主体（被拆前未分配则保持为空，后置到打单发货分配）
                boolean inheritShipper = group.getShipType() == null
                        && (source.getShipType() != null || source.getShipperId() != null);
                if (inheritShipper) {
                    ci.setShipType(source.getShipType());
                    ci.setShipperId(source.getShipperId());
                    ci.setShipperNo(source.getShipperNo());
                    ci.setShipperType(source.getShipperType());
                    ci.setShipperName(source.getShipperName());
                } else {
                    ci.setShipType(group.getShipType());
                    ci.setShipperId(resolveShipperId(group));
                    ci.setShipperNo(resolveShipperNo(group));
                    ci.setShipperType(resolveShipperType(group));
                    ci.setShipperName(resolveShipperName(group));
                }
                ci.setShipStatus(group.getShipType() == null && !inheritShipper
                        ? EnumShipStatus.NOT.getIndex() : EnumShipStatus.BU_FEN.getIndex());
                ci.setCreateTime(now);
                ci.setCreateBy(username);
                ci.setUpdateTime(now);
                ci.setUpdateBy(username);
                orderItemMapper.insert(ci);
                sort++;
            }
            created++;
        }
        // 拆单完成：被拆主单置「已拆单 + 无需发货」终态，退出全部状态池（不再发货、不受理转异常/撤回）；履约由子单承担
        if (!isChild) {
            orderMapper.update(null, new LambdaUpdateWrapper<OOrder>()
                    .eq(OOrder::getId, master.getId())
                    .in(OOrder::getAuditStatus, EnumAuditStatus.PENDING.getCode(), EnumAuditStatus.EXCEPTION.getCode())
                    .set(OOrder::getAuditStatus, EnumAuditStatus.SPLIT.getCode())
                    .set(OOrder::getShipStatus, EnumShipStatus.NO_SHIP.getIndex())
                    .set(OOrder::getUpdateTime, now)
                    .set(OOrder::getUpdateBy, username));
        }
        log.info("======工作台拆单======操作人={}，订单={}，生成子单={}个，主单置已拆单/无需发货",
                username, master.getOrderNum(), created);
        return created;
    }

    // ==================== 私有工具 ====================

    /**
     * 已拆出数量聚合：现有子单明细（item_role=1）按来源行（source_order_item_id）分组求和，
     * 排除已取消/作废子单的明细。溯源链直指直接来源行（子单再拆出的挂子单明细行下）
     */
    private Map<Long, Integer> aggregateSplitOut(List<OOrderItem> sourceItems) {
        Map<Long, Integer> map = new HashMap<>();
        if (sourceItems == null || sourceItems.isEmpty()) {
            return map;
        }
        List<Long> sourceIds = new ArrayList<>();
        for (OOrderItem item : sourceItems) {
            sourceIds.add(Long.parseLong(item.getId()));
        }
        List<OOrderItem> childItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>()
                .in(OOrderItem::getSourceOrderItemId, sourceIds)
                .eq(OOrderItem::getItemRole, 1));
        if (childItems.isEmpty()) {
            return map;
        }
        // 排除已取消/作废子单的明细
        List<Long> childOrderIds = childItems.stream()
                .map(ci -> Long.parseLong(ci.getOrderId()))
                .distinct().collect(java.util.stream.Collectors.toList());
        List<OOrder> childOrders = orderMapper.selectBatchIds(childOrderIds);
        Set<Long> voidOrderIds = childOrders.stream()
                .filter(o -> o.getOrderStatus() != null
                        && (o.getOrderStatus() == EnumOOrderStatus.CANCEL.getIndex()
                        || o.getOrderStatus() == EnumOOrderStatus.DELETED.getIndex()))
                .map(o -> Long.parseLong(o.getId()))
                .collect(java.util.stream.Collectors.toSet());
        for (OOrderItem ci : childItems) {
            if (ci.getSourceOrderItemId() == null || ci.getOrderId() == null) {
                continue;
            }
            if (voidOrderIds.contains(Long.parseLong(ci.getOrderId()))) {
                continue;
            }
            map.merge(ci.getSourceOrderItemId(), nz(ci.getQuantity()), Integer::sum);
        }
        return map;
    }

    /** 校验分组发货主体：部分拆模型下发货主体后置到打单发货，shipType 允许为空 */
    private void validateGroupShipper(SplitSubmitBo.SplitGroupBo group) {
        if (group.getShipType() == null) {
            return;
        }
        if (group.getShipType() == EnumShipType.LOCAL.getIndex()) {
            if (group.getWarehouseId() == null || group.getWarehouseId() <= 0) {
                throw new RuntimeException("分组[" + safeName(group.getGroupName()) + "]未指定发货仓库");
            }
            ErpWarehouse warehouse = warehouseMapper.selectById(group.getWarehouseId());
            if (warehouse == null) {
                throw new RuntimeException("分组[" + safeName(group.getGroupName()) + "]指定仓库不存在");
            }
        } else if (group.getShipType() == EnumShipType.SUPPLIER.getIndex()) {
            if (group.getSupplierId() == null || group.getSupplierId() <= 0) {
                throw new RuntimeException("分组[" + safeName(group.getGroupName()) + "]未指定发货供应商");
            }
            ErpSupplier supplier = supplierMapper.selectById(group.getSupplierId());
            if (supplier == null) {
                throw new RuntimeException("分组[" + safeName(group.getGroupName()) + "]指定供应商不存在");
            }
        } else {
            throw new RuntimeException("分组[" + safeName(group.getGroupName()) + "]发货方式不支持（仅支持本仓/供应商发货）");
        }
    }

    private Long resolveShipperId(SplitSubmitBo.SplitGroupBo group) {
        if (group.getShipType() == null) {
            return null;
        }
        return group.getShipType() == EnumShipType.LOCAL.getIndex() ? group.getWarehouseId() : group.getSupplierId();
    }

    private String resolveShipperNo(SplitSubmitBo.SplitGroupBo group) {
        if (group.getShipType() == null) {
            return "";
        }
        if (group.getShipType() == EnumShipType.LOCAL.getIndex()) {
            ErpWarehouse warehouse = warehouseMapper.selectById(group.getWarehouseId());
            return warehouse == null ? "" : warehouse.getWarehouseNo();
        }
        ErpSupplier supplier = supplierMapper.selectById(group.getSupplierId());
        return supplier == null ? "" : supplier.getNumber();
    }

    private String resolveShipperType(SplitSubmitBo.SplitGroupBo group) {
        if (group.getShipType() == null) {
            return "";
        }
        if (group.getShipType() == EnumShipType.LOCAL.getIndex()) {
            ErpWarehouse warehouse = warehouseMapper.selectById(group.getWarehouseId());
            return warehouse == null ? "" : warehouse.getWarehouseType();
        }
        return EnumShipType.SUPPLIER.toString();
    }

    private String resolveShipperName(SplitSubmitBo.SplitGroupBo group) {
        if (group.getShipType() == null) {
            return "";
        }
        if (group.getShipType() == EnumShipType.LOCAL.getIndex()) {
            ErpWarehouse warehouse = warehouseMapper.selectById(group.getWarehouseId());
            return warehouse == null ? "" : warehouse.getWarehouseName();
        }
        ErpSupplier supplier = supplierMapper.selectById(group.getSupplierId());
        return supplier == null ? "" : supplier.getName();
    }

    /** 快递公司（选填）：查 erp_logistics_company 写 waybill_company + shipping_company_code */
    private void applyLogistics(OOrder child, Long logisticsId) {
        if (logisticsId == null || logisticsId <= 0) {
            return;
        }
        ErpLogisticsCompany company = logisticsMapper.selectById(String.valueOf(logisticsId));
        if (company == null) {
            throw new RuntimeException("物流公司不存在：logisticsId=" + logisticsId);
        }
        child.setWaybillCompany(company.getName());
        child.setShippingCompanyCode(company.getCode());
    }

    private void checkScope(List<Long> merchantIds, Long orderMerchantId) {
        if (merchantIds != null && (orderMerchantId == null || !merchantIds.contains(orderMerchantId))) {
            throw new RuntimeException("无该订单操作权限");
        }
    }

    private String safeName(String name) {
        return name == null || name.isBlank() ? "未命名" : name;
    }

    private int nz(Integer value) {
        return value == null ? 0 : value;
    }
}
