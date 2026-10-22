package cn.qihangerp.enums;

/**
 * 订单商品行角色（o_order_item.item_role）
 * 0主订单平台原始行 1子订单履约行
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
public enum EnumOrderItemRole {
    MASTER_ITEM("主订单原始行", 0),
    CHILD_ITEM("子订单履约行", 1);

    private final String name;
    private final int code;

    EnumOrderItemRole(String name, int code) {
        this.name = name;
        this.code = code;
    }

    public static String getName(int code) {
        for (EnumOrderItemRole role : values()) {
            if (role.code == code) {
                return role.name;
            }
        }
        return null;
    }

    public String getName() {
        return name;
    }

    public int getCode() {
        return code;
    }
}
