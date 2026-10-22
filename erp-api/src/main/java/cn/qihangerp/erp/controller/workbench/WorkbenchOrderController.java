package cn.qihangerp.erp.controller.workbench;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.enums.EnumUserType;
import cn.qihangerp.model.bo.OrderAddressBo;
import cn.qihangerp.model.bo.OrderCancelBo;
import cn.qihangerp.model.bo.OrderExceptionBo;
import cn.qihangerp.model.bo.OrderMemoBo;
import cn.qihangerp.model.bo.OrderReleaseBo;
import cn.qihangerp.model.bo.OrderWithdrawBo;
import cn.qihangerp.request.OrderWorkbenchQuery;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.security.common.SecurityUtils;
import cn.qihangerp.service.OrderWorkbenchOrderService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 订单处理工作台-订单域
 * 状态池查询/池计数/批量转异常转正常/批量放行/取消订单/修改卖家备注/修改收货地址
 * 工作台仅总部与商户端可用
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/api/erp-api/orderWorkbench/order")
public class WorkbenchOrderController extends BaseController {

    private final OrderWorkbenchOrderService orderService;

    /**
     * 数据范围：null=总部（全部），非空=本商户ID；工作台外身份返回 -1 表示拒绝
     */
    private Long resolveMerchantId() {
        Integer identity = SecurityUtils.getUserIdentity();
        if (identity == null) return -1L;
        if (identity == EnumUserType.SUPPER.getIndex()) return null;
        if (identity == EnumUserType.MERCHANT.getIndex()) return SecurityUtils.getDeptId();
        return -1L;
    }

    /**
     * 状态池分页查询（主订单行 + 子订单行统一平铺，含 canRelease）
     */
    @GetMapping("/page")
    public TableDataInfo page(OrderWorkbenchQuery query, PageQuery pageQuery) {
        log.info("======工作台状态池page======pool={}，query={}", query.getPool(), query);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            TableDataInfo table = new TableDataInfo();
            table.setCode(500);
            table.setMsg("仅总部与商户端可操作");
            return table;
        }
        query.setMerchantId(merchantId);
        return getDataTable(orderService.poolPage(query, pageQuery));
    }

    /**
     * 状态池计数（页签角标）
     */
    @GetMapping("/poolCounts")
    public AjaxResult poolCounts(OrderWorkbenchQuery query) {
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        query.setMerchantId(merchantId);
        return AjaxResult.success(orderService.poolCounts(query));
    }

    /**
     * 批量转异常/转正常（audit_status 0↔2 流转）
     */
    @PostMapping("/exception")
    public AjaxResult exception(@RequestBody OrderExceptionBo bo) {
        log.info("======工作台转异常/转正常======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        List<Long> merchantIds = merchantId == null ? null : List.of(merchantId);
        var result = orderService.toException(bo, merchantIds, getUsername());
        if (result.getCode() == 0) return AjaxResult.success(result.getData());
        return AjaxResult.error(result.getMsg());
    }

    /**
     * 异常池分类计数（bind_pool=2 标签聚合 + 未分类兜底；分类导航节点数据源）
     */
    @GetMapping("/exceptionTagCounts")
    public AjaxResult exceptionTagCounts(OrderWorkbenchQuery query) {
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        query.setMerchantId(merchantId);
        return AjaxResult.success(orderService.exceptionTagCounts(query));
    }

    /**
     * 批量审核放行（部分失败留池并返回逐单原因）
     */
    @PostMapping("/release")
    public AjaxResult release(@RequestBody OrderReleaseBo bo) {
        log.info("======工作台批量放行======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        List<Long> merchantIds = merchantId == null ? null : List.of(merchantId);
        var result = orderService.release(bo, merchantIds, getUsername());
        if (result.getCode() == 0) return AjaxResult.success(result.getData());
        return AjaxResult.error(result.getMsg());
    }

    /**
     * 已放行订单撤回异常池（audit_status 1→2，未发货前置守卫）
     */
    @PostMapping("/withdrawException")
    public AjaxResult withdrawException(@RequestBody OrderWithdrawBo bo) {
        log.info("======工作台撤回异常======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        List<Long> merchantIds = merchantId == null ? null : List.of(merchantId);
        var result = orderService.withdrawToException(bo, merchantIds, getUsername());
        if (result.getCode() == 0) return AjaxResult.success(result.getData());
        return AjaxResult.error(result.getMsg());
    }

    /**
     * 取消订单（主订单级单张，未发货前置，子单联动作废）
     */
    @PostMapping("/cancel")
    public AjaxResult cancel(@RequestBody OrderCancelBo bo) {
        log.info("======工作台取消订单======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        List<Long> merchantIds = merchantId == null ? null : List.of(merchantId);
        var result = orderService.cancelOrder(bo, merchantIds, getUsername());
        if (result.getCode() == 0) return AjaxResult.success();
        return AjaxResult.error(result.getMsg());
    }

    /**
     * 修改卖家备注（未发货前可改）
     */
    @PostMapping("/memo")
    public AjaxResult memo(@RequestBody OrderMemoBo bo) {
        log.info("======工作台修改卖家备注======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        List<Long> merchantIds = merchantId == null ? null : List.of(merchantId);
        var result = orderService.updateMemo(bo, merchantIds, getUsername());
        if (result.getCode() == 0) return AjaxResult.success();
        return AjaxResult.error(result.getMsg());
    }

    /**
     * 修改收货地址（未发货前可改，已取号需先取消取号，主单同步未取号子单）
     */
    @PostMapping("/address")
    public AjaxResult address(@RequestBody OrderAddressBo bo) {
        log.info("======工作台修改收货地址======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        List<Long> merchantIds = merchantId == null ? null : List.of(merchantId);
        var result = orderService.updateAddress(bo, merchantIds, getUsername());
        if (result.getCode() == 0) return AjaxResult.success();
        return AjaxResult.error(result.getMsg());
    }
}
