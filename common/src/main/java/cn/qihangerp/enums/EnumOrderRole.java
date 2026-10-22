package cn.qihangerp.enums;

/**
 * 描述：订单角色（o_order.order_role）
 * 0主订单 1拆分子订单
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
public enum EnumOrderRole {
    MASTER("主订单", 0),
    CHILD("子订单", 1)
    ;
    private final String name;
    private final int code;

    EnumOrderRole(String name, int code) {
        this.name = name;
        this.code = code;
    }

    public static String getName(int code) {
        for (EnumOrderRole c : EnumOrderRole.values()) {
            if (c.getCode() == code) return c.name;
        }
        return null;
    }

    public String getName() { return name; }
    public int getCode() { return code; }
}
