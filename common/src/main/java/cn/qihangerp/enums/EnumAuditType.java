package cn.qihangerp.enums;

/**
 * 描述：审核类型（o_order.audit_type）
 * 0自动审核 1人工审核
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
public enum EnumAuditType {
    AUTO("自动审核", 0),
    MANUAL("人工审核", 1)
    ;
    private final String name;
    private final int code;

    EnumAuditType(String name, int code) {
        this.name = name;
        this.code = code;
    }

    public static String getName(int code) {
        for (EnumAuditType c : EnumAuditType.values()) {
            if (c.getCode() == code) return c.name;
        }
        return null;
    }

    public String getName() { return name; }
    public int getCode() { return code; }
}
