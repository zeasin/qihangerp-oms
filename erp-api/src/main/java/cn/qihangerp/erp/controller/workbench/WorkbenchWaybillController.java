package cn.qihangerp.erp.controller.workbench;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.erp.waybill.workbench.WorkbenchWaybillService;
import cn.qihangerp.model.bo.waybill.WorkbenchWaybillBatchBo;
import cn.qihangerp.model.bo.waybill.WorkbenchWaybillDistributeBo;
import cn.qihangerp.model.bo.waybill.WorkbenchWaybillManualShipBo;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 打单发货统一队列接口
 * 设计口径对齐企业版 docs/design/16-打单发货.md §8.2；
 * 批量接口返回逐单成败明细，支持部分成功；统一转 AjaxResult 与前端拦截器 code=200 约定对齐。
 */
@RestController
@RequestMapping("/api/erp-api/orderWorkbench/waybill")
@AllArgsConstructor
public class WorkbenchWaybillController extends BaseController {

    private final WorkbenchWaybillService workbenchWaybillService;

    /**
     * 服务层 ResultVo(0=成功) 转前端约定的 AjaxResult(200=成功)
     */
    private AjaxResult toAjax(ResultVo<?> result) {
        return result.getCode() == 0 ? AjaxResult.success(result.getData()) : AjaxResult.error(result.getMsg());
    }

    /**
     * 批量取号
     */
    @PostMapping("/take")
    public AjaxResult take(@RequestBody WorkbenchWaybillBatchBo bo) {
        return toAjax(workbenchWaybillService.take(bo));
    }

    /**
     * 批量取消取号
     */
    @PostMapping("/cancel")
    public AjaxResult cancel(@RequestBody WorkbenchWaybillBatchBo bo) {
        return toAjax(workbenchWaybillService.cancel(bo));
    }

    /**
     * 打印成功状态回传
     */
    @PostMapping("/print")
    public AjaxResult print(@RequestBody WorkbenchWaybillBatchBo bo) {
        return toAjax(workbenchWaybillService.print(bo));
    }

    /**
     * 批量获取打印数据（前端打印组件驱动用，含补打）
     */
    @PostMapping("/printData")
    public AjaxResult printData(@RequestBody WorkbenchWaybillBatchBo bo) {
        return toAjax(workbenchWaybillService.printData(bo));
    }

    /**
     * 批量发货（平台回传 + 本地终态 + 备货单）
     */
    @PostMapping("/ship")
    public AjaxResult ship(@RequestBody WorkbenchWaybillBatchBo bo) {
        return toAjax(workbenchWaybillService.ship(bo));
    }

    /**
     * 手动发货兜底通道
     */
    @PostMapping("/manualShip")
    public AjaxResult manualShip(@RequestBody WorkbenchWaybillManualShipBo bo) {
        return toAjax(workbenchWaybillService.manualShip(bo));
    }

    /**
     * 分配/改派（主体 + 账号一步完成）
     */
    @PostMapping("/distribute")
    public AjaxResult distribute(@RequestBody WorkbenchWaybillDistributeBo bo) {
        return toAjax(workbenchWaybillService.distribute(bo));
    }

    /**
     * 可用面单账号集合（按主体分组展示由前端处理）
     */
    @GetMapping("/accountOptions")
    public AjaxResult accountOptions(Long shopId, Integer shipperType, Long shipperId) {
        return toAjax(workbenchWaybillService.accountOptions(shopId, shipperType, shipperId));
    }

    /**
     * 平台面单动作能力（前端按钮开放依据）
     */
    @GetMapping("/capabilities")
    public AjaxResult capabilities(Integer shopType) {
        return toAjax(workbenchWaybillService.capabilities(shopType));
    }
}
