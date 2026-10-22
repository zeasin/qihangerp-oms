package cn.qihangerp.erp.waybill;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.model.bo.waybill.UnifiedWaybillCancelBo;
import cn.qihangerp.model.bo.waybill.UnifiedWaybillShipBo;
import cn.qihangerp.model.bo.waybill.UnifiedWaybillTakeBo;

/**
 * 统一电子面单动作服务（平台调用入口）
 * 设计口径对齐企业版 docs/design/16-打单发货.md §4.2 / §4.3 / §8.2
 */
public interface UnifiedWaybillService {

    /**
     * 取号：校验订单/账号归属后路由到平台适配器
     */
    ResultVo<PlatformWaybillTakeResult> take(UnifiedWaybillTakeBo bo, Integer identity, Long deptId);

    /**
     * 取消取号：校验订单归属后路由到平台适配器
     */
    ResultVo<Void> cancel(UnifiedWaybillCancelBo bo, Integer identity, Long deptId);

    /**
     * 平台面单动作能力
     */
    PlatformWaybillCapability capability(Integer shopType);

    /**
     * 发货回传：校验订单归属后路由到平台适配器
     */
    ResultVo<WaybillShipResult> ship(UnifiedWaybillShipBo bo, Integer identity, Long deptId);
}
