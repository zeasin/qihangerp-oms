package cn.qihangerp.erp.controller.workbench;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.enums.EnumUserType;
import cn.qihangerp.model.bo.OrderTagApplyBo;
import cn.qihangerp.model.entity.OrderTag;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.security.common.SecurityUtils;
import cn.qihangerp.service.OrderWorkbenchTagService;
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

import java.util.List;

/**
 * 订单处理工作台-用户自建标签
 * 标签 CRUD + 批量打标/撤标；标签按商户隔离，merchant_id=0 为总部公共标签
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/api/erp-api/orderWorkbench/tag")
public class WorkbenchTagController extends BaseController {

    private final OrderWorkbenchTagService tagService;

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
     * 标签管理分页列表（管理弹窗）
     */
    @GetMapping("/list")
    public TableDataInfo list(OrderTag bo, PageQuery pageQuery) {
        log.info("======工作台标签list======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            TableDataInfo table = new TableDataInfo();
            table.setCode(500);
            table.setMsg("仅总部与商户端可操作");
            return table;
        }
        return getDataTable(tagService.queryPageList(bo, merchantId, pageQuery));
    }

    /**
     * 打标选项清单（打标弹窗：仅启用标签，含商户自建+总部公共）
     */
    @GetMapping("/options")
    public AjaxResult options() {
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        return AjaxResult.success(tagService.listEnabled(merchantId));
    }

    /**
     * 状态池分类标签选项（转异常弹窗单选数据源：bind_pool 匹配 + 启用，全系统共用不限商户）
     */
    @GetMapping("/poolOptions")
    public AjaxResult poolOptions(Integer bindPool) {
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        return AjaxResult.success(tagService.listEnabledByPool(bindPool));
    }

    /**
     * 新建标签
     */
    @PostMapping
    public AjaxResult add(@RequestBody OrderTag bo) {
        log.info("======工作台标签add======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        ResultVo<Long> result = tagService.add(bo, merchantId, getUsername());
        if (result.getCode() == 0) return AjaxResult.success(result.getData());
        return AjaxResult.error(result.getMsg());
    }

    /**
     * 编辑标签（名称/颜色/排序）
     */
    @PutMapping
    public AjaxResult edit(@RequestBody OrderTag bo) {
        log.info("======工作台标签edit======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        ResultVo<Void> result = tagService.edit(bo, getUsername());
        if (result.getCode() == 0) return AjaxResult.success();
        return AjaxResult.error(result.getMsg());
    }

    /**
     * 停用/启用标签
     */
    @PutMapping("/status")
    public AjaxResult setStatus(@RequestBody OrderTag bo) {
        log.info("======工作台标签status======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        ResultVo<Void> result = tagService.setStatus(bo.getId(), bo.getStatus(), getUsername());
        if (result.getCode() == 0) return AjaxResult.success();
        return AjaxResult.error(result.getMsg());
    }

    /**
     * 删除标签（物理删除）
     */
    @DeleteMapping("/{id}")
    public AjaxResult remove(@PathVariable Long id) {
        log.info("======工作台标签remove======id={}", id);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        ResultVo<Void> result = tagService.remove(id, getUsername());
        if (result.getCode() == 0) return AjaxResult.success();
        return AjaxResult.error(result.getMsg());
    }

    /**
     * 批量打标/撤标：action 1=打标（追加去重）、0=撤标（移除）
     */
    @PostMapping("/apply")
    public AjaxResult apply(@RequestBody OrderTagApplyBo bo) {
        log.info("======工作台标签apply======{}", bo);
        Long merchantId = resolveMerchantId();
        if (merchantId != null && merchantId == -1L) {
            return AjaxResult.error("仅总部与商户端可操作");
        }
        // 商户身份仅可操作本商户订单；总部不限
        List<Long> merchantIds = merchantId == null ? null : List.of(merchantId);
        ResultVo<String> result = tagService.applyTags(bo, merchantIds, getUsername());
        if (result.getCode() == 0) return AjaxResult.success(result.getData());
        return AjaxResult.error(result.getMsg());
    }
}
