package cn.qihangerp.erp.waybill;

import lombok.Data;

import java.io.Serializable;

/**
 * 平台电子面单动作能力（取号/取消/打印/发货）
 * 设计口径对齐企业版 docs/design/16-打单发货.md §4.4
 */
@Data
public class PlatformWaybillCapability implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 店铺类型（EnumShopType） */
    private Integer shopType;
    /** 平台名称 */
    private String platformName;
    /** 是否已接入统一面单适配器 */
    private Boolean supported;
    /** 是否支持取号 */
    private Boolean take;
    /** 是否支持取消取号 */
    private Boolean cancel;
    /** 是否支持打印 */
    private Boolean print;
    /** 是否支持平台发货 */
    private Boolean ship;
    /** 能力说明 */
    private String remark;

    public static PlatformWaybillCapability of(Integer shopType, boolean supported, boolean take,
                                               boolean cancel, boolean print, boolean ship, String remark) {
        PlatformWaybillCapability capability = new PlatformWaybillCapability();
        capability.setShopType(shopType);
        capability.setPlatformName(shopType == null ? null : cn.qihangerp.enums.EnumShopType.getName(shopType));
        capability.setSupported(supported);
        capability.setTake(take);
        capability.setCancel(cancel);
        capability.setPrint(print);
        capability.setShip(ship);
        capability.setRemark(remark);
        return capability;
    }

    public static PlatformWaybillCapability unsupported(Integer shopType) {
        return of(shopType, false, false, false, false, false, "该平台暂未接入统一面单动作");
    }
}
