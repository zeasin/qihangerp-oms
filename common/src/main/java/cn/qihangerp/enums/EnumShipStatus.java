package cn.qihangerp.enums;

/**
 * 描述：发货状态
 *
 *
 * @author qlp
 * @date 2019-09-18 19:44
 */
public enum EnumShipStatus {
    BU_FEN("部分发货", 1),
    ALL("全部发货", 2),
    NOT("未发货", 0),
    NO_SHIP("无需发货", 3)
    ;
    private String name;
    private int index;

    // 构造方法
    private EnumShipStatus(String name, int index) {
        this.name = name;
        this.index = index;
    }

    // 普通方法
    public static String getName(int index) {
        for (EnumShipStatus c : EnumShipStatus.values()) {
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
