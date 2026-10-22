package cn.qihangerp.enums;

/**
 * 描述：订单审核状态（o_order.audit_status）
 * 0待审核 1已审核通过 2已转异常 3已拆单（主订单拆单后终态，退出全部状态池）
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
public enum EnumAuditStatus {
    PENDING("待审核", 0),
    APPROVED("已审核通过", 1),
    EXCEPTION("已转异常", 2),
    SPLIT("已拆单", 3)
    ;
    private final String name;
    private final int code;

    EnumAuditStatus(String name, int code) {
        this.name = name;
        this.code = code;
    }

    public static String getName(int code) {
        for (EnumAuditStatus c : EnumAuditStatus.values()) {
            if (c.getCode() == code) return c.name;
        }
        return null;
    }

    public String getName() { return name; }
    public int getCode() { return code; }
}
