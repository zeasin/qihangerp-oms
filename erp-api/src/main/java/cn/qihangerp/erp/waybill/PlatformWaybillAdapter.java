package cn.qihangerp.erp.waybill;

import cn.qihangerp.common.ResultVo;

/**
 * 平台电子面单动作适配器契约
 * 设计口径对齐企业版 docs/design/16-打单发货.md §4.4 / §8.1
 * 开源版为单体：平台协议调用统一收口在各平台适配器，队列编排服务不感知平台协议。
 */
public interface PlatformWaybillAdapter {

    /**
     * 适配的店铺类型（EnumShopType）
     */
    Integer shopType();

    /**
     * 平台动作能力
     */
    PlatformWaybillCapability capability();

    /**
     * 取号（含获取打印数据）
     */
    ResultVo<PlatformWaybillTakeResult> take(WaybillTakeContext context);

    /**
     * 取消取号
     */
    ResultVo<Void> cancel(WaybillCancelContext context);

    /**
     * 发货回传（平台确认发货）
     * 默认不支持；已接入的平台适配器 override 本方法
     */
    default ResultVo<WaybillShipResult> ship(WaybillShipContext context) {
        return ResultVo.error("该平台暂不支持统一发货回传");
    }
}
