package cn.qihangerp.common.enums;

/**
 * 描述：
 * 京东订单状态
 *
 * @author qlp
 * @date 2019-09-18 19:44
 */
public enum JdOrderStateEnum {
    WAIT_SELLER_STOCK_OUT("等待发货","WAIT_SELLER_STOCK_OUT", 1),
    WAIT_GOODS_RECEIVE_CONFIRM("待确认收货","WAIT_GOODS_RECEIVE_CONFIRM", 2),
    FINISHED_L("完成", "FINISHED_L",3),
    PARENT_TRADE_CANCELED("父单取消", "PARENT_TRADE_CANCELED",11),
    TRADE_CANCELED ("已取消", "TRADE_CANCELED",11);
    private String name;
    private String code;
    private int index;

    // 构造方法
    private JdOrderStateEnum(String name,String code, int index) {
        this.name = name;
        this.code = code;
        this.index = index;
    }

    // 普通方法
    public static String getName(int index) {
        for (JdOrderStateEnum c : JdOrderStateEnum.values()) {
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getIndex() {
        return index;
    }
    public static int getIndex(String code) {
        for (JdOrderStateEnum c : JdOrderStateEnum.values()) {
            if (c.getCode().equals(code)) {
                return c.index;
            }
        }
        return -1;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}
