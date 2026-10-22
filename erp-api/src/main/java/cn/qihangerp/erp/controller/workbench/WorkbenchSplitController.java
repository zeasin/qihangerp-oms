package cn.qihangerp.erp.controller.workbench;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.enums.EnumUserType;
import cn.qihangerp.model.bo.SplitSubmitBo;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.security.common.SecurityUtils;
import cn.qihangerp.service.OrderWorkbenchSplitService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 订单处理工作台-拆单
 * 拆单预览/提交拆单；一单一单真实拆单，事务内全量分配强校验
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/api/erp-api/orderWorkbench/split")
public class WorkbenchSplitController extends BaseController {

    private final OrderWorkbenchSplitService splitService;

    private List<Long> resolveMerchantIds() {
        Integer identity = SecurityUtils.getUserIdentity();
        if (identity == null) return List.of(-1L);
        if (identity == EnumUserType.SUPPER.getIndex()) return null;
        if (identity == EnumUserType.MERCHANT.getIndex()) return List.of(SecurityUtils.getDeptId());
        return List.of(-1L);
    }

    /**
     * 拆单预览：被拆订单可分配明细（含剩余可分配数量）
     */
    @GetMapping("/preview")
    public AjaxResult preview(@RequestParam Long orderId) {
        log.info("======工作台拆单预览======orderId={}", orderId);
        try {
            return AjaxResult.success(splitService.preview(orderId, resolveMerchantIds()));
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 提交拆单（累计分配强校验，事务内生成子订单）
     */
    @PostMapping("/submit")
    public AjaxResult submit(@RequestBody SplitSubmitBo bo) {
        log.info("======工作台提交拆单======orderId={}", bo.getOrderId());
        try {
            var result = splitService.submit(bo, resolveMerchantIds(), getUsername());
            if (result.getCode() == 0) return AjaxResult.success(result.getData());
            return AjaxResult.error(result.getMsg());
        } catch (Exception e) {
            log.error("======工作台提交拆单失败======orderId={}，error={}", bo.getOrderId(), e.getMessage(), e);
            return AjaxResult.error(e.getMessage());
        }
    }
}
