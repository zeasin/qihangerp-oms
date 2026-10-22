package cn.qihangerp.erp.waybill.workbench.impl;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.enums.EnumOOrderStatus;
import cn.qihangerp.enums.EnumShipType;
import cn.qihangerp.enums.EnumUserType;
import cn.qihangerp.enums.EnumWaybillStatus;
import cn.qihangerp.erp.waybill.PlatformWaybillCapability;
import cn.qihangerp.erp.waybill.PlatformWaybillTakeResult;
import cn.qihangerp.erp.waybill.UnifiedWaybillService;
import cn.qihangerp.erp.waybill.WaybillShipResult;
import cn.qihangerp.erp.waybill.workbench.WorkbenchWaybillService;
import cn.qihangerp.mapper.OOrderItemMapper;
import cn.qihangerp.mapper.OOrderMapper;
import cn.qihangerp.mapper.OOrderShipWaybillMapper;
import cn.qihangerp.model.bo.waybill.UnifiedWaybillCancelBo;
import cn.qihangerp.model.bo.waybill.UnifiedWaybillShipBo;
import cn.qihangerp.model.bo.waybill.UnifiedWaybillTakeBo;
import cn.qihangerp.model.bo.waybill.WorkbenchWaybillBatchBo;
import cn.qihangerp.model.bo.waybill.WorkbenchWaybillDistributeBo;
import cn.qihangerp.model.bo.waybill.WorkbenchWaybillManualShipBo;
import cn.qihangerp.model.entity.OOrder;
import cn.qihangerp.model.entity.OOrderItem;
import cn.qihangerp.model.entity.OOrderShipWaybill;
import cn.qihangerp.model.entity.ShopWaybillAccount;
import cn.qihangerp.model.vo.waybill.WaybillPrintDataVo;
import cn.qihangerp.model.vo.waybill.WorkbenchWaybillResultVo;
import cn.qihangerp.security.common.SecurityUtils;
import cn.qihangerp.service.OOrderShipWaybillService;
import cn.qihangerp.service.ShopWaybillAccountService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

/**
 * 打单发货统一队列编排服务实现
 */
@Slf4j
@Service
@AllArgsConstructor
public class WorkbenchWaybillServiceImpl implements WorkbenchWaybillService {

    private final OOrderMapper orderMapper;
    private final OOrderItemMapper orderItemMapper;
    private final OOrderShipWaybillMapper waybillMapper;
    private final UnifiedWaybillService unifiedWaybillService;
    private final OOrderShipWaybillService orderShipWaybillService;
    private final ShopWaybillAccountService waybillAccountService;
    private final TransactionTemplate transactionTemplate;

    @Override
    public ResultVo<WorkbenchWaybillResultVo> take(WorkbenchWaybillBatchBo bo) {
        if (bo.getOrderIds() == null || bo.getOrderIds().length == 0) {
            return ResultVo.error("请选择要取号的订单");
        }
        Integer identity = SecurityUtils.getUserIdentity();
        Long deptId = SecurityUtils.getDeptId();
        String username = SecurityUtils.getUsername();
        WorkbenchWaybillResultVo result = new WorkbenchWaybillResultVo();

        for (Long orderId : bo.getOrderIds()) {
            OOrder order = orderMapper.selectById(String.valueOf(orderId));
            if (order == null) {
                result.fail(orderId, null, "订单不存在");
                continue;
            }
            Long accountId = order.getWaybillAccountId() != null ? order.getWaybillAccountId() : bo.getAccountId();
            if (accountId == null) {
                result.fail(orderId, order.getOrderNum(), "订单未分配面单账号，请先分配");
                continue;
            }
            UnifiedWaybillTakeBo tbo = new UnifiedWaybillTakeBo();
            tbo.setOrderId(orderId);
            tbo.setAccountId(accountId);
            ResultVo<PlatformWaybillTakeResult> takeResult = unifiedWaybillService.take(tbo, identity, deptId);
            if (takeResult.getCode() != 0 || takeResult.getData() == null) {
                result.fail(orderId, order.getOrderNum(), takeResult.getMsg());
                continue;
            }
            try {
                PlatformWaybillTakeResult data = takeResult.getData();
                transactionTemplate.executeWithoutResult(status -> saveTakeResult(order, accountId, data, username));
                result.success();
            } catch (Exception e) {
                log.error("======取号后本地落库失败，触发补偿取消======orderId={}，error={}", orderId, e.getMessage(), e);
                String reason = "本地落库失败：" + e.getMessage();
                // 补偿取消平台单号；补偿也失败时告警并保留占号信息
                UnifiedWaybillCancelBo cbo = new UnifiedWaybillCancelBo();
                cbo.setOrderId(orderId);
                cbo.setWaybillCode(takeResult.getData().getWaybillCode());
                cbo.setLogisticsCode(takeResult.getData().getLogisticsCode());
                ResultVo<Void> comp = unifiedWaybillService.cancel(cbo, identity, deptId);
                if (comp.getCode() != 0) {
                    reason += "；补偿取消失败：" + comp.getMsg()
                            + "（平台单号已占用：" + takeResult.getData().getWaybillCode() + "）";
                    log.error("======补偿取消失败======orderId={}，waybillCode={}",
                            orderId, takeResult.getData().getWaybillCode());
                }
                result.fail(orderId, order.getOrderNum(), reason);
            }
        }
        return ResultVo.success(result);
    }

    @Override
    public ResultVo<WorkbenchWaybillResultVo> cancel(WorkbenchWaybillBatchBo bo) {
        if (bo.getOrderIds() == null || bo.getOrderIds().length == 0) {
            return ResultVo.error("请选择要取消取号的订单");
        }
        Integer identity = SecurityUtils.getUserIdentity();
        Long deptId = SecurityUtils.getDeptId();
        String username = SecurityUtils.getUsername();
        WorkbenchWaybillResultVo result = new WorkbenchWaybillResultVo();

        for (Long orderId : bo.getOrderIds()) {
            OOrder order = orderMapper.selectById(String.valueOf(orderId));
            if (order == null) {
                result.fail(orderId, null, "订单不存在");
                continue;
            }
            if (order.getWaybillStatus() == null || order.getWaybillStatus() != EnumWaybillStatus.TAKEN.getIndex()) {
                result.fail(orderId, order.getOrderNum(), "仅已取号未打印的订单可取消取号");
                continue;
            }
            UnifiedWaybillCancelBo cbo = new UnifiedWaybillCancelBo();
            cbo.setOrderId(orderId);
            cbo.setWaybillCode(order.getWaybillCode());
            cbo.setLogisticsCode(order.getShippingCompanyCode());
            ResultVo<Void> cancelResult = unifiedWaybillService.cancel(cbo, identity, deptId);
            if (cancelResult.getCode() != 0) {
                // 平台取消失败不做本地回退，避免"本地未取号、平台已占号"
                result.fail(orderId, order.getOrderNum(), cancelResult.getMsg());
                continue;
            }
            transactionTemplate.executeWithoutResult(status -> saveCancelResult(order, username));
            result.success();
        }
        return ResultVo.success(result);
    }

    @Override
    public ResultVo<WorkbenchWaybillResultVo> print(WorkbenchWaybillBatchBo bo) {
        if (bo.getOrderIds() == null || bo.getOrderIds().length == 0) {
            return ResultVo.error("请选择要打印的订单");
        }
        String username = SecurityUtils.getUsername();
        WorkbenchWaybillResultVo result = new WorkbenchWaybillResultVo();

        for (Long orderId : bo.getOrderIds()) {
            OOrder order = orderMapper.selectById(String.valueOf(orderId));
            if (order == null) {
                result.fail(orderId, null, "订单不存在");
                continue;
            }
            LocalDateTime now = LocalDateTime.now();
            int n = orderMapper.update(null, new LambdaUpdateWrapper<OOrder>()
                    .set(OOrder::getWaybillStatus, EnumWaybillStatus.PRINTED.getIndex())
                    .set(OOrder::getUpdateTime, now)
                    .set(OOrder::getUpdateBy, username)
                    .eq(OOrder::getId, order.getId())
                    .eq(OOrder::getWaybillStatus, EnumWaybillStatus.TAKEN.getIndex()));
            if (n != 1) {
                result.fail(orderId, order.getOrderNum(), "订单不是已取号状态，打印状态推进失败");
                continue;
            }
            waybillMapper.update(null, new LambdaUpdateWrapper<OOrderShipWaybill>()
                    .set(OOrderShipWaybill::getStatus, 2)
                    .set(OOrderShipWaybill::getUpdateTime, now)
                    .set(OOrderShipWaybill::getUpdateBy, username)
                    .eq(OOrderShipWaybill::getOrderId, order.getOrderNum())
                    .eq(OOrderShipWaybill::getShopId, order.getShopId())
                    .eq(StringUtils.hasText(order.getWaybillCode()),
                            OOrderShipWaybill::getWaybillCode, order.getWaybillCode())
                    .eq(OOrderShipWaybill::getStatus, 1));
            result.success();
        }
        return ResultVo.success(result);
    }

    @Override
    public ResultVo<List<WaybillPrintDataVo>> printData(WorkbenchWaybillBatchBo bo) {
        if (bo.getOrderIds() == null || bo.getOrderIds().length == 0) {
            return ResultVo.error("请选择要打印的订单");
        }
        Integer identity = SecurityUtils.getUserIdentity();
        Long deptId = SecurityUtils.getDeptId();
        List<WaybillPrintDataVo> list = new ArrayList<>();
        for (Long orderId : bo.getOrderIds()) {
            OOrder order = orderMapper.selectById(String.valueOf(orderId));
            if (order == null || checkScope(order, identity, deptId) != null) {
                continue;
            }
            Integer ws = order.getWaybillStatus();
            // 已取号与已打印（补打）可取打印数据；未取号/已发货跳过
            if (ws == null || (ws != EnumWaybillStatus.TAKEN.getIndex()
                    && ws != EnumWaybillStatus.PRINTED.getIndex())) {
                continue;
            }
            List<OOrderShipWaybill> rows = waybillMapper.selectList(new LambdaQueryWrapper<OOrderShipWaybill>()
                    .eq(OOrderShipWaybill::getShipOrderId, orderId)
                    .eq(OOrderShipWaybill::getWaybillCode, order.getWaybillCode())
                    .in(OOrderShipWaybill::getStatus,
                            Arrays.asList(EnumWaybillStatus.TAKEN.getIndex(), EnumWaybillStatus.PRINTED.getIndex()))
                    .orderByDesc(OOrderShipWaybill::getId)
                    .last("LIMIT 1"));
            WaybillPrintDataVo vo = new WaybillPrintDataVo();
            vo.setOrderId(orderId);
            vo.setOrderNum(order.getOrderNum());
            vo.setShopType(order.getShopType());
            vo.setWaybillCode(order.getWaybillCode());
            vo.setLogisticsCode(order.getShippingCompanyCode());
            if (!rows.isEmpty()) {
                OOrderShipWaybill row = rows.get(0);
                vo.setTemplateUrl(row.getTemplateUrl());
                vo.setPrintData(row.getPrintData());
                vo.setSign(row.getSign());
                vo.setParams(row.getParams());
                vo.setGoodsDetail(row.getGoodsDetail());
            }
            list.add(vo);
        }
        return ResultVo.success(list);
    }

    @Override
    public ResultVo<WorkbenchWaybillResultVo> ship(WorkbenchWaybillBatchBo bo) {
        if (bo.getOrderIds() == null || bo.getOrderIds().length == 0) {
            return ResultVo.error("请选择要发货的订单");
        }
        Integer identity = SecurityUtils.getUserIdentity();
        Long deptId = SecurityUtils.getDeptId();
        String username = SecurityUtils.getUsername();
        WorkbenchWaybillResultVo result = new WorkbenchWaybillResultVo();

        for (Long orderId : bo.getOrderIds()) {
            OOrder order = orderMapper.selectById(String.valueOf(orderId));
            if (order == null) {
                result.fail(orderId, null, "订单不存在");
                continue;
            }
            if (order.getWaybillStatus() == null || order.getWaybillStatus() != EnumWaybillStatus.PRINTED.getIndex()) {
                result.fail(orderId, order.getOrderNum(), "仅已打印的订单可执行面单发货");
                continue;
            }
            UnifiedWaybillShipBo sbo = new UnifiedWaybillShipBo();
            sbo.setOrderId(orderId);
            sbo.setWaybillCode(order.getWaybillCode());
            sbo.setLogisticsCode(order.getShippingCompanyCode());
            ResultVo<WaybillShipResult> shipResult = unifiedWaybillService.ship(sbo, identity, deptId);
            if (shipResult.getCode() != 0) {
                result.fail(orderId, order.getOrderNum(), shipResult.getMsg());
                continue;
            }
            String platformMsg = shipResult.getData() == null ? "" : shipResult.getData().getPlatformMsg();
            try {
                transactionTemplate.executeWithoutResult(status -> saveShipResult(order, platformMsg, username));
            } catch (Exception e) {
                log.error("======发货回传成功但本地落库失败======orderId={}，error={}", orderId, e.getMessage(), e);
                result.fail(orderId, order.getOrderNum(), "平台已发货，本地状态更新失败，请刷新核对：" + e.getMessage());
                continue;
            }
            // 本地仓备货单落库（复用旧链路：打单记录状态→已发货 + 落备货单）
            try {
                orderShipWaybillService.localShipOrderWaybillSendAndStocking(order.getShopId(),
                        new String[]{order.getOrderNum()});
            } catch (Exception e) {
                log.error("======发货成功但备货单落库失败======orderNum={}，error={}", order.getOrderNum(), e.getMessage(), e);
            }
            result.success();
        }
        return ResultVo.success(result);
    }

    @Override
    public ResultVo<WorkbenchWaybillResultVo> manualShip(WorkbenchWaybillManualShipBo bo) {
        if (bo.getOrderId() == null) {
            return ResultVo.error("缺少订单id");
        }
        if (!StringUtils.hasText(bo.getWaybillCode()) || !StringUtils.hasText(bo.getLogisticsCode())) {
            return ResultVo.error("手动发货需录入快递单号与快递公司");
        }
        String username = SecurityUtils.getUsername();
        WorkbenchWaybillResultVo result = new WorkbenchWaybillResultVo();
        OOrder order = orderMapper.selectById(String.valueOf(bo.getOrderId()));
        if (order == null) {
            return ResultVo.error("订单不存在");
        }
        Integer ws = order.getWaybillStatus();
        if (ws != null && (ws == EnumWaybillStatus.SHIPPED.getIndex() || ws == EnumWaybillStatus.MANUAL_SHIPPED.getIndex())) {
            result.fail(bo.getOrderId(), order.getOrderNum(), "订单已发货，不能重复操作");
            return ResultVo.success(result);
        }
        if (ws != null && ws != EnumWaybillStatus.NOT_TAKEN.getIndex()) {
            result.fail(bo.getOrderId(), order.getOrderNum(), "订单已取号/已打印，请先取消取号再走手动发货");
            return ResultVo.success(result);
        }
        LocalDateTime now = LocalDateTime.now();
        int n = orderMapper.update(null, new LambdaUpdateWrapper<OOrder>()
                .set(OOrder::getWaybillStatus, EnumWaybillStatus.MANUAL_SHIPPED.getIndex())
                .set(OOrder::getWaybillCode, bo.getWaybillCode())
                .set(OOrder::getWaybillCompany, bo.getWaybillCompany())
                .set(OOrder::getShippingCompanyCode, bo.getLogisticsCode())
                .set(OOrder::getShipStatus, 2)
                .set(OOrder::getOrderStatus, EnumOOrderStatus.SHIPPED.getIndex())
                .set(OOrder::getShippingTime, now)
                .set(OOrder::getUpdateTime, now)
                .set(OOrder::getUpdateBy, username)
                .eq(OOrder::getId, order.getId())
                .and(w -> w.eq(OOrder::getWaybillStatus, EnumWaybillStatus.NOT_TAKEN.getIndex())
                        .or().isNull(OOrder::getWaybillStatus)));
        if (n != 1) {
            return ResultVo.error("状态闸门拦截：订单状态已变化，请刷新重试");
        }
        orderItemMapper.update(null, new LambdaUpdateWrapper<OOrderItem>()
                .set(OOrderItem::getShipStatus, 2)
                .set(OOrderItem::getWaybillCode, bo.getWaybillCode())
                .set(OOrderItem::getWaybillCompany, bo.getWaybillCompany())
                .eq(OOrderItem::getOrderId, order.getId())
                .ne(OOrderItem::getShipStatus, 2));
        result.success();
        return ResultVo.success(result);
    }

    @Override
    public ResultVo<WorkbenchWaybillResultVo> distribute(WorkbenchWaybillDistributeBo bo) {
        if (bo.getOrderIds() == null || bo.getOrderIds().length == 0) {
            return ResultVo.error("请选择要分配的订单");
        }
        if (bo.getAccountId() == null) {
            return ResultVo.error("请选择面单账号");
        }
        ShopWaybillAccount account = waybillAccountService.getById(bo.getAccountId());
        if (account == null) {
            return ResultVo.error("电子面单账号不存在");
        }
        if (account.getStatus() != null && account.getStatus() == 0) {
            return ResultVo.error("面单账号已停用");
        }
        if (account.getNum() != null && account.getNum() <= 0) {
            return ResultVo.error("面单账号余额不足");
        }
        Integer identity = SecurityUtils.getUserIdentity();
        Long deptId = SecurityUtils.getDeptId();
        String username = SecurityUtils.getUsername();
        // 选中账号即确定发货主体（§2.2/§3.1）：空绑定=店铺自用本地仓，否则跟随账号绑定的主体
        int shipType;
        Long shipperId;
        Integer accountShipperType = account.getShipperType();
        if (accountShipperType == null || accountShipperType == 0) {
            shipType = EnumShipType.LOCAL.getIndex();
            shipperId = 0L;
        } else {
            shipType = accountShipperType;
            shipperId = account.getShipperId() == null ? 0L : account.getShipperId();
        }
        WorkbenchWaybillResultVo result = new WorkbenchWaybillResultVo();

        for (Long orderId : bo.getOrderIds()) {
            OOrder order = orderMapper.selectById(String.valueOf(orderId));
            if (order == null) {
                result.fail(orderId, null, "订单不存在");
                continue;
            }
            String scopeMsg = checkScope(order, identity, deptId);
            if (scopeMsg != null) {
                result.fail(orderId, order.getOrderNum(), scopeMsg);
                continue;
            }
            if (!Objects.equals(order.getShopId(), account.getShopId())) {
                result.fail(orderId, order.getOrderNum(), "账号归属店铺与订单不一致，跨店分配拒绝");
                continue;
            }
            Integer ws = order.getWaybillStatus();
            if (ws != null && ws != EnumWaybillStatus.NOT_TAKEN.getIndex()) {
                result.fail(orderId, order.getOrderNum(), "订单已取号，请先取消取号再改派");
                continue;
            }
            try {
                transactionTemplate.executeWithoutResult(status -> saveDistribute(order, account,
                        shipType, shipperId, username));
                result.success();
            } catch (Exception e) {
                result.fail(orderId, order.getOrderNum(), e.getMessage());
            }
        }
        return ResultVo.success(result);
    }

    @Override
    public ResultVo<List<ShopWaybillAccount>> accountOptions(Long shopId, Integer shipperType, Long shipperId) {
        Integer identity = SecurityUtils.getUserIdentity();
        Long deptId = SecurityUtils.getDeptId();
        LambdaQueryWrapper<ShopWaybillAccount> qw = new LambdaQueryWrapper<ShopWaybillAccount>()
                .and(w -> w.eq(ShopWaybillAccount::getStatus, 1).or().isNull(ShopWaybillAccount::getStatus))
                .eq(shopId != null, ShopWaybillAccount::getShopId, shopId)
                .eq(shipperType != null, ShopWaybillAccount::getShipperType, shipperType)
                .eq(shipperId != null, ShopWaybillAccount::getShipperId, shipperId)
                .orderByAsc(ShopWaybillAccount::getShipperType)
                .orderByAsc(ShopWaybillAccount::getShipperId)
                .orderByDesc(ShopWaybillAccount::getId);
        // 商户/店铺身份只能看到本范围内的账号（§七）
        if (identity != null && identity == EnumUserType.MERCHANT.getIndex()) {
            qw.eq(ShopWaybillAccount::getMerchantId, deptId);
        } else if (identity != null && identity == EnumUserType.STORE.getIndex()) {
            qw.eq(ShopWaybillAccount::getShopId, deptId);
        }
        return ResultVo.success(waybillAccountService.list(qw));
    }

    @Override
    public ResultVo<PlatformWaybillCapability> capabilities(Integer shopType) {
        return ResultVo.success(unifiedWaybillService.capability(shopType));
    }

    /**
     * 分配落库（§1.6 分配行）：订单写 waybill_account_id；明细写主体四字段 + ship_status 0→1；不生成备货单
     */
    private void saveDistribute(OOrder order, ShopWaybillAccount account, int shipType, Long shipperId, String username) {
        LocalDateTime now = LocalDateTime.now();
        int n = orderMapper.update(null, new LambdaUpdateWrapper<OOrder>()
                .set(OOrder::getWaybillAccountId, account.getId())
                .set(OOrder::getUpdateTime, now)
                .set(OOrder::getUpdateBy, username)
                .eq(OOrder::getId, order.getId())
                .and(w -> w.eq(OOrder::getWaybillStatus, EnumWaybillStatus.NOT_TAKEN.getIndex())
                        .or().isNull(OOrder::getWaybillStatus)));
        if (n != 1) {
            throw new RuntimeException("状态闸门拦截：订单取号状态已变化");
        }
        orderItemMapper.update(null, new LambdaUpdateWrapper<OOrderItem>()
                .set(OOrderItem::getShipType, shipType)
                .set(OOrderItem::getShipperId, shipperId)
                .set(OOrderItem::getShipperName, shipperId == 0L ? "店铺自用" : null)
                .set(OOrderItem::getShipperType, String.valueOf(shipType))
                .set(OOrderItem::getShipStatus, 1)
                .eq(OOrderItem::getOrderId, order.getId())
                .in(OOrderItem::getShipStatus, Arrays.asList(0, 1)));
    }

    private String checkScope(OOrder order, Integer identity, Long deptId) {
        if (identity == null) {
            return "登录状态异常";
        }
        if (identity == EnumUserType.SUPPER.getIndex()) {
            return null;
        }
        if (identity == EnumUserType.MERCHANT.getIndex()) {
            return Objects.equals(order.getMerchantId(), deptId) ? null : "无该订单操作权限";
        }
        if (identity == EnumUserType.STORE.getIndex()) {
            return Objects.equals(order.getShopId(), deptId) ? null : "无该订单操作权限";
        }
        return "无权操作该订单";
    }

    /**
     * 取号成功后本地落库（§1.6 取号行）：订单 0→1、明细 1→10、打单记录新增一行
     */
    private void saveTakeResult(OOrder order, Long accountId, PlatformWaybillTakeResult data, String username) {
        LocalDateTime now = LocalDateTime.now();
        int n = orderMapper.update(null, new LambdaUpdateWrapper<OOrder>()
                .set(OOrder::getWaybillStatus, EnumWaybillStatus.TAKEN.getIndex())
                .set(OOrder::getWaybillCode, data.getWaybillCode())
                .set(OOrder::getWaybillCompany, data.getWaybillCompany())
                .set(OOrder::getShippingCompanyCode, data.getLogisticsCode())
                .set(OOrder::getWaybillOrderId, data.getWaybillOrderId())
                .set(OOrder::getWaybillAccountId, accountId)
                .set(OOrder::getUpdateTime, now)
                .set(OOrder::getUpdateBy, username)
                .eq(OOrder::getId, order.getId())
                .and(w -> w.eq(OOrder::getWaybillStatus, EnumWaybillStatus.NOT_TAKEN.getIndex())
                        .or().isNull(OOrder::getWaybillStatus)));
        if (n != 1) {
            throw new RuntimeException("状态闸门拦截：订单取号状态已变化");
        }
        orderItemMapper.update(null, new LambdaUpdateWrapper<OOrderItem>()
                .set(OOrderItem::getShipStatus, 10)
                .set(OOrderItem::getWaybillCode, data.getWaybillCode())
                .set(OOrderItem::getWaybillCompany, data.getWaybillCompany())
                .eq(OOrderItem::getOrderId, order.getId())
                .in(OOrderItem::getShipStatus, Arrays.asList(0, 1)));

        OOrderShipWaybill waybill = new OOrderShipWaybill();
        waybill.setOrderId(order.getOrderNum());
        waybill.setShipOrderId(Long.parseLong(order.getId()));
        waybill.setShopId(order.getShopId());
        waybill.setShopType(order.getShopType());
        waybill.setMerchantId(order.getMerchantId());
        waybill.setWaybillOrderId(StringUtils.hasText(data.getWaybillOrderId())
                ? data.getWaybillOrderId() : data.getWaybillCode());
        waybill.setWaybillCode(data.getWaybillCode());
        waybill.setLogisticsCode(data.getLogisticsCode());
        waybill.setPrintData(data.getPrintData());
        waybill.setSign(data.getSign());
        waybill.setParams(data.getParams());
        waybill.setTemplateUrl(data.getTemplateUrl());
        waybill.setGoodsDetail(data.getGoodsDetail());
        waybill.setStatus(EnumWaybillStatus.TAKEN.getIndex());
        waybill.setCreateTime(now);
        waybill.setCreateBy(username);
        waybillMapper.insert(waybill);
    }

    /**
     * 取消取号本地回退（§1.6 取消行）：订单 1→0 清运单字段保留账号、明细 10→1、删除本次打单记录
     */
    private void saveCancelResult(OOrder order, String username) {
        LocalDateTime now = LocalDateTime.now();
        int n = orderMapper.update(null, new LambdaUpdateWrapper<OOrder>()
                .set(OOrder::getWaybillStatus, EnumWaybillStatus.NOT_TAKEN.getIndex())
                .set(OOrder::getWaybillCode, null)
                .set(OOrder::getWaybillCompany, null)
                .set(OOrder::getShippingCompanyCode, null)
                .set(OOrder::getWaybillOrderId, null)
                .set(OOrder::getUpdateTime, now)
                .set(OOrder::getUpdateBy, username)
                .eq(OOrder::getId, order.getId())
                .eq(OOrder::getWaybillStatus, EnumWaybillStatus.TAKEN.getIndex()));
        if (n != 1) {
            throw new RuntimeException("状态闸门拦截：订单取号状态已变化，取消回退失败");
        }
        orderItemMapper.update(null, new LambdaUpdateWrapper<OOrderItem>()
                .set(OOrderItem::getShipStatus, 1)
                .set(OOrderItem::getWaybillCode, null)
                .set(OOrderItem::getWaybillCompany, null)
                .eq(OOrderItem::getOrderId, order.getId())
                .eq(OOrderItem::getShipStatus, 10));
        // 只删除本次取号这一行，历史行不动
        waybillMapper.delete(new LambdaQueryWrapper<OOrderShipWaybill>()
                .eq(OOrderShipWaybill::getOrderId, order.getOrderNum())
                .eq(OOrderShipWaybill::getShopId, order.getShopId())
                .eq(StringUtils.hasText(order.getWaybillCode()),
                        OOrderShipWaybill::getWaybillCode, order.getWaybillCode())
                .eq(OOrderShipWaybill::getStatus, EnumWaybillStatus.TAKEN.getIndex()));
    }

    /**
     * 发货成功本地终态（§1.6 发货行）：订单 2→3 + 平台回传结果、明细 →2
     */
    private void saveShipResult(OOrder order, String platformMsg, String username) {
        LocalDateTime now = LocalDateTime.now();
        int n = orderMapper.update(null, new LambdaUpdateWrapper<OOrder>()
                .set(OOrder::getWaybillStatus, EnumWaybillStatus.SHIPPED.getIndex())
                .set(OOrder::getShipStatus, 2)
                .set(OOrder::getOrderStatus, EnumOOrderStatus.SHIPPED.getIndex())
                .set(OOrder::getShippingTime, now)
                .set(OOrder::getPlatformShipStatus, 1)
                .set(OOrder::getPlatformShipResult, platformMsg)
                .set(OOrder::getUpdateTime, now)
                .set(OOrder::getUpdateBy, username)
                .eq(OOrder::getId, order.getId())
                .eq(OOrder::getWaybillStatus, EnumWaybillStatus.PRINTED.getIndex()));
        if (n != 1) {
            throw new RuntimeException("状态闸门拦截：订单打印状态已变化，发货落库失败");
        }
        orderItemMapper.update(null, new LambdaUpdateWrapper<OOrderItem>()
                .set(OOrderItem::getShipStatus, 2)
                .eq(OOrderItem::getOrderId, order.getId())
                .ne(OOrderItem::getShipStatus, 2));
    }
}
