package cn.qihangerp.erp.waybill.impl;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.enums.EnumAuditStatus;
import cn.qihangerp.enums.EnumOOrderStatus;
import cn.qihangerp.enums.EnumShipStatus;
import cn.qihangerp.enums.EnumUserType;
import cn.qihangerp.enums.EnumWaybillStatus;
import cn.qihangerp.model.bo.waybill.UnifiedWaybillCancelBo;
import cn.qihangerp.model.bo.waybill.UnifiedWaybillShipBo;
import cn.qihangerp.model.bo.waybill.UnifiedWaybillTakeBo;
import cn.qihangerp.model.entity.OOrder;
import cn.qihangerp.model.entity.ShopWaybillAccount;
import cn.qihangerp.erp.waybill.PlatformWaybillAdapter;
import cn.qihangerp.erp.waybill.PlatformWaybillAdapterRegistry;
import cn.qihangerp.erp.waybill.PlatformWaybillCapability;
import cn.qihangerp.erp.waybill.PlatformWaybillTakeResult;
import cn.qihangerp.erp.waybill.UnifiedWaybillService;
import cn.qihangerp.erp.waybill.WaybillCancelContext;
import cn.qihangerp.erp.waybill.WaybillShipContext;
import cn.qihangerp.erp.waybill.WaybillShipResult;
import cn.qihangerp.erp.waybill.WaybillTakeContext;
import cn.qihangerp.service.OOrderService;
import cn.qihangerp.service.ShopWaybillAccountService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Objects;

/**
 * 统一电子面单动作服务实现
 * 只做归属/状态校验与适配器路由，平台协议全部下沉到各平台适配器。
 */
@Slf4j
@Service
@AllArgsConstructor
public class UnifiedWaybillServiceImpl implements UnifiedWaybillService {

    private final OOrderService orderService;
    private final ShopWaybillAccountService waybillAccountService;
    private final PlatformWaybillAdapterRegistry adapterRegistry;

    @Override
    public ResultVo<PlatformWaybillTakeResult> take(UnifiedWaybillTakeBo bo, Integer identity, Long deptId) {
        if (bo.getOrderId() == null || bo.getAccountId() == null) {
            return ResultVo.error("缺少参数：orderId/accountId");
        }
        OOrder order = orderService.getById(String.valueOf(bo.getOrderId()));
        if (order == null) {
            return ResultVo.error("订单不存在");
        }
        String scopeMsg = checkScope(order, identity, deptId);
        if (scopeMsg != null) {
            return ResultVo.error(scopeMsg);
        }
        String stateMsg = checkTakeState(order);
        if (stateMsg != null) {
            return ResultVo.error(stateMsg);
        }
        ShopWaybillAccount account = waybillAccountService.getById(bo.getAccountId());
        if (account == null) {
            return ResultVo.error("电子面单账号不存在");
        }
        String accountMsg = checkAccount(order, account);
        if (accountMsg != null) {
            return ResultVo.error(accountMsg);
        }
        PlatformWaybillAdapter adapter = adapterRegistry.get(order.getShopType());
        if (adapter == null || !Boolean.TRUE.equals(adapter.capability().getTake())) {
            return ResultVo.error("该平台暂不支持统一取号");
        }
        return adapter.take(new WaybillTakeContext(order, account));
    }

    @Override
    public ResultVo<Void> cancel(UnifiedWaybillCancelBo bo, Integer identity, Long deptId) {
        if (bo.getOrderId() == null || !StringUtils.hasText(bo.getWaybillCode())
                || !StringUtils.hasText(bo.getLogisticsCode())) {
            return ResultVo.error("缺少参数：orderId/waybillCode/logisticsCode");
        }
        OOrder order = orderService.getById(String.valueOf(bo.getOrderId()));
        if (order == null) {
            return ResultVo.error("订单不存在");
        }
        String scopeMsg = checkScope(order, identity, deptId);
        if (scopeMsg != null) {
            return ResultVo.error(scopeMsg);
        }
        // 本地取号状态由队列编排服务把关；此处不再校验，避免取号落库失败的补偿取消被拦截
        PlatformWaybillAdapter adapter = adapterRegistry.get(order.getShopType());
        if (adapter == null || !Boolean.TRUE.equals(adapter.capability().getCancel())) {
            return ResultVo.error("该平台暂不支持取消取号");
        }
        return adapter.cancel(new WaybillCancelContext(order, bo.getLogisticsCode(), bo.getWaybillCode()));
    }

    @Override
    public PlatformWaybillCapability capability(Integer shopType) {
        return adapterRegistry.capability(shopType);
    }

    @Override
    public ResultVo<WaybillShipResult> ship(UnifiedWaybillShipBo bo, Integer identity, Long deptId) {
        if (bo.getOrderId() == null || !StringUtils.hasText(bo.getWaybillCode())
                || !StringUtils.hasText(bo.getLogisticsCode())) {
            return ResultVo.error("缺少参数：orderId/waybillCode/logisticsCode");
        }
        OOrder order = orderService.getById(String.valueOf(bo.getOrderId()));
        if (order == null) {
            return ResultVo.error("订单不存在");
        }
        String scopeMsg = checkScope(order, identity, deptId);
        if (scopeMsg != null) {
            return ResultVo.error(scopeMsg);
        }
        PlatformWaybillAdapter adapter = adapterRegistry.get(order.getShopType());
        if (adapter == null || !Boolean.TRUE.equals(adapter.capability().getShip())) {
            return ResultVo.error("该平台暂不支持统一发货回传");
        }
        return adapter.ship(new WaybillShipContext(order, bo.getLogisticsCode(), bo.getWaybillCode()));
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

    private String checkTakeState(OOrder order) {
        if (order.getAuditStatus() == null || order.getAuditStatus() != EnumAuditStatus.APPROVED.getCode()) {
            return "仅已放行订单可取号";
        }
        if (order.getOrderStatus() == null || order.getOrderStatus() != EnumOOrderStatus.WAIT_SHIP.getIndex()) {
            return "订单当前状态不在待发货队列";
        }
        if (order.getShipStatus() != null && (order.getShipStatus() == EnumShipStatus.BU_FEN.getIndex()
                || order.getShipStatus() == EnumShipStatus.ALL.getIndex())) {
            return "订单已部分/全部发货，不能取号";
        }
        Integer ws = order.getWaybillStatus();
        if (ws != null && ws != EnumWaybillStatus.NOT_TAKEN.getIndex()) {
            return "订单已取号/已打印/已发货，不能重复取号";
        }
        return null;
    }

    private String checkAccount(OOrder order, ShopWaybillAccount account) {
        if (!Objects.equals(account.getShopId(), order.getShopId())) {
            return "面单账号不属于该店铺";
        }
        if (account.getShopType() != null && !Objects.equals(account.getShopType(), order.getShopType())) {
            return "面单账号平台与订单不一致";
        }
        if (account.getMerchantId() != null && account.getMerchantId() > 0
                && !Objects.equals(account.getMerchantId(), order.getMerchantId())) {
            return "面单账号不属于该商户";
        }
        return null;
    }
}
