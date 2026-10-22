package cn.qihangerp.enums;

/**
 * 描述：发货状态
 *
 *
 * @author qlp
 * @date 2019-09-18 19:44
 */
public enum EnumOOrderStatus {
    //订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；13已关闭；21待付款；22锁定，29删除，31售后中，101部分发货
    WAIT_SHIP("待发货", 1),
    SHIPPED("已发货", 2),
    COMPLETE("已完成", 3),
    CANCEL("已取消", 11),
    REFUND("退款中", 12),
    CLOSED("已关闭", 13),
    WAIT_PAY("待付款", 21),
    LOCKED("已锁定", 22),
    DELETED("已删除", 29),
    SHIPPED_BF("部分发货", 101),
    NEW("新订单", 0)
    ;
    private String name;
    private int index;

    // 构造方法
    private EnumOOrderStatus(String name, int index) {
        this.name = name;
        this.index = index;
    }

    // 普通方法
    public static String getName(int index) {
        for (EnumOOrderStatus c : EnumOOrderStatus.values()) {
            if (c.getIndex() == index) {
                return c.name;
            }
        }
        return null;
    }

    // get set 方法
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
