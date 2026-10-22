package cn.qihangerp.erp.waybill.workbench;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.erp.waybill.PlatformWaybillCapability;
import cn.qihangerp.model.bo.waybill.WorkbenchWaybillBatchBo;
import cn.qihangerp.model.bo.waybill.WorkbenchWaybillDistributeBo;
import cn.qihangerp.model.bo.waybill.WorkbenchWaybillManualShipBo;
import cn.qihangerp.model.entity.ShopWaybillAccount;
import cn.qihangerp.model.vo.waybill.WaybillPrintDataVo;
import cn.qihangerp.model.vo.waybill.WorkbenchWaybillResultVo;

import java.util.List;

/**
 * 打单发货统一队列编排服务
 * 设计口径对齐企业版 docs/design/16-打单发货.md §4：
 * 逐单独立事务、条件更新状态闸门、平台占号后本地落库失败触发补偿取消。
 */
public interface WorkbenchWaybillService {

    /**
     * 批量取号
     */
    ResultVo<WorkbenchWaybillResultVo> take(WorkbenchWaybillBatchBo bo);

    /**
     * 批量取消取号（仅已取号未打印可回退）
     */
    ResultVo<WorkbenchWaybillResultVo> cancel(WorkbenchWaybillBatchBo bo);

    /**
     * 批量打印成功回传（状态推进 1→2，打印数据下发由前端打印组件完成）
     */
    ResultVo<WorkbenchWaybillResultVo> print(WorkbenchWaybillBatchBo bo);

    /**
     * 批量获取打印数据（已取号/已打印订单，供前端打印组件驱动；含补打场景）
     */
    ResultVo<List<WaybillPrintDataVo>> printData(WorkbenchWaybillBatchBo bo);

    /**
     * 批量发货（平台回传 + 订单终态 + 备货单落库）
     */
    ResultVo<WorkbenchWaybillResultVo> ship(WorkbenchWaybillBatchBo bo);

    /**
     * 手动发货兜底通道（未取号订单人工录入物流单号）
     */
    ResultVo<WorkbenchWaybillResultVo> manualShip(WorkbenchWaybillManualShipBo bo);

    /**
     * 分配/改派：写订单面单账号 + 明细发货主体字段（§3.1/§3.2）
     */
    ResultVo<WorkbenchWaybillResultVo> distribute(WorkbenchWaybillDistributeBo bo);

    /**
     * 可用面单账号集合（店铺维度，启用且有余额；按主体分组由前端处理）
     */
    ResultVo<List<ShopWaybillAccount>> accountOptions(Long shopId, Integer shipperType, Long shipperId);

    /**
     * 平台面单动作能力
     */
    ResultVo<PlatformWaybillCapability> capabilities(Integer shopType);
}
