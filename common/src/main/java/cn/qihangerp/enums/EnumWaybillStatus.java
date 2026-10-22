package cn.qihangerp.enums;

/**
 * 描述：电子面单取号状态（o_order.waybill_status）
 * 0未取号 1已取号 2已打印 3已发货 10手动发货
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
public enum EnumWaybillStatus {
    NOT_TAKEN("未取号", 0),
    TAKEN("已取号", 1),
    PRINTED("已打印", 2),
    SHIPPED("已发货", 3),
    MANUAL_SHIPPED("手动发货", 10)
    ;
    private String name;
    private int index;

    private EnumWaybillStatus(String name, int index) {
        this.name = name;
        this.index = index;
    }

    public static String getName(int index) {
        for (EnumWaybillStatus c : EnumWaybillStatus.values()) {
            if (c.getIndex() == index) {
                return c.name;
            }
        }
        return null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}
