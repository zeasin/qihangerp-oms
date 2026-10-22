package cn.qihangerp.erp.controller.workbench;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.enums.EnumUserType;
import cn.qihangerp.model.entity.OrderSearchScheme;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.security.common.SecurityUtils;
import cn.qihangerp.service.OrderWorkbenchSchemeService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 订单处理工作台-组合条件方案
 * 方案 CRUD + 方案栏清单；方案按商户隔离，merchant_id=0 为总部公共方案
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/api/erp-api/orderWorkbench/scheme")
public class WorkbenchSchemeController extends BaseController {

    private final OrderWorkbenchSchemeService schemeService;

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
     * 方案管理分页列表
     */
    @GetMapping("/list")
    public TableDataInfo list(OrderSearchScheme bo, PageQuery pageQuery) {
        log.info("======工作台方案list======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            TableDataInfo table = new TableDataInfo();
            table.setCode(500);
            table.setMsg("仅总部与商户端可操作");
            return table;
        }
        return getDataTable(schemeService.queryPageList(bo, merchantId, pageQuery));
    }

    /**
     * 方案栏常驻清单（仅启用方案，含商户自建+总部公共）
     */
    @GetMapping("/options")
    public AjaxResult options() {
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        return AjaxResult.success(schemeService.listEnabled(merchantId));
    }

    /**
     * 方案详情（含 conditions JSON，供套用后回填筛选面板临时调整）
     */
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        OrderSearchScheme scheme = schemeService.getInfo(id);
        if (scheme == null) return AjaxResult.error("方案不存在");
        return AjaxResult.success(scheme);
    }

    /**
     * 新建方案
     */
    @PostMapping
    public AjaxResult add(@RequestBody OrderSearchScheme bo) {
        log.info("======工作台方案add======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        ResultVo<Long> result = schemeService.add(bo, merchantId, getUsername());
        if (result.getCode() == 0) return AjaxResult.success(result.getData());
        return AjaxResult.error(result.getMsg());
    }

    /**
     * 编辑方案（名称/条件/排序）
     */
    @PutMapping
    public AjaxResult edit(@RequestBody OrderSearchScheme bo) {
        log.info("======工作台方案edit======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        ResultVo<Void> result = schemeService.edit(bo, merchantId, getUsername());
        if (result.getCode() == 0) return AjaxResult.success();
        return AjaxResult.error(result.getMsg());
    }

    /**
     * 删除方案
     */
    @DeleteMapping("/{id}")
    public AjaxResult remove(@PathVariable("id") Long id) {
        log.info("======工作台方案remove======id={}", id);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        ResultVo<Void> result = schemeService.remove(id, merchantId);
        if (result.getCode() == 0) return AjaxResult.success();
        return AjaxResult.error(result.getMsg());
    }

    /**
     * 停用/启用方案
     */
    @PutMapping("/status")
    public AjaxResult setStatus(@RequestBody OrderSearchScheme bo) {
        log.info("======工作台方案status======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        ResultVo<Void> result = schemeService.setStatus(bo.getId(), bo.getStatus(), merchantId, getUsername());
        if (result.getCode() == 0) return AjaxResult.success();
        return AjaxResult.error(result.getMsg());
    }
}
