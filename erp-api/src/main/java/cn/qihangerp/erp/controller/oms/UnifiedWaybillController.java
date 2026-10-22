package cn.qihangerp.erp.controller.oms;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.erp.waybill.UnifiedWaybillService;
import cn.qihangerp.model.bo.waybill.UnifiedWaybillCancelBo;
import cn.qihangerp.model.bo.waybill.UnifiedWaybillShipBo;
import cn.qihangerp.model.bo.waybill.UnifiedWaybillTakeBo;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.security.common.SecurityUtils;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 统一电子面单动作接口（平台调用收口）
 * 设计口径对齐企业版 docs/design/16-打单发货.md §8.2：
 * 接口不接收平台路由参数，按订单 shop_type 自动路由平台适配器。
 */
@AllArgsConstructor
@RestController
@RequestMapping("/api/oms-api/ewaybill/unified")
public class UnifiedWaybillController extends BaseController {

    private final UnifiedWaybillService unifiedWaybillService;

    /**
     * 服务层 ResultVo(0=成功) 转前端约定的 AjaxResult(200=成功)
     */
    private AjaxResult toAjax(ResultVo<?> result) {
        return result.getCode() == 0 ? AjaxResult.success(result.getData()) : AjaxResult.error(result.getMsg());
    }

    /**
     * 取号（订单 id + 面单账号 id）
     */
    @PostMapping("/take")
    public AjaxResult take(@RequestBody UnifiedWaybillTakeBo bo) {
        return toAjax(unifiedWaybillService.take(bo, SecurityUtils.getUserIdentity(), SecurityUtils.getDeptId()));
    }

    /**
     * 取消取号（订单 id + 快递单号 + 快递公司编码）
     */
    @PostMapping("/cancel")
    public AjaxResult cancel(@RequestBody UnifiedWaybillCancelBo bo) {
        return toAjax(unifiedWaybillService.cancel(bo, SecurityUtils.getUserIdentity(), SecurityUtils.getDeptId()));
    }

    /**
     * 发货回传（订单 id + 快递单号 + 快递公司编码）
     */
    @PostMapping("/ship")
    public AjaxResult ship(@RequestBody UnifiedWaybillShipBo bo) {
        return toAjax(unifiedWaybillService.ship(bo, SecurityUtils.getUserIdentity(), SecurityUtils.getDeptId()));
    }

    /**
     * 平台面单动作能力（统一队列按钮开放依据）
     */
    @GetMapping("/capabilities")
    public AjaxResult capabilities(Integer shopType) {
        return AjaxResult.success(unifiedWaybillService.capability(shopType));
    }
}
