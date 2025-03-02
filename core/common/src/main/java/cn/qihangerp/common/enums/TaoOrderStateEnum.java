package cn.qihangerp.common.enums;

/**
 * 描述：
 * Tao订单状态
 *
 * @author qlp
 * @date 2019-09-18 19:44
 */
public enum TaoOrderStateEnum {
    /**
     * 交易状态。
     * 可选值:
     * * TRADE_NO_CREATE_PAY(没有创建支付宝交易)
     * * WAIT_BUYER_PAY(等待买家付款)
     * * SELLER_CONSIGNED_PART(卖家部分发货)
     * * WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款)
     * * WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货)
     * * TRADE_BUYER_SIGNED(买家已签收,货到付款专用)
     * * TRADE_FINISHED(交易成功)
     * * TRADE_CLOSED(付款以后用户退款成功，交易自动关闭)
     * * TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易)
     * * PAY_PENDING(国际信用卡支付付款确认中)
     * * WAIT_PRE_AUTH_CONFIRM(0元购合约中)
     * * PAID_FORBID_CONSIGN(拼团中订单或者发货强管控的订单，已付款但禁止发货)
     */
    WAIT_SELLER_SEND_GOODS("等待发货","WAIT_SELLER_SEND_GOODS", 1),
    WAIT_BUYER_CONFIRM_GOODS("等待买家确认收货","WAIT_BUYER_CONFIRM_GOODS", 2),
    TRADE_FINISHED("交易成功", "TRADE_FINISHED",3),
    WAIT_BUYER_PAY("等待买家付款", "WAIT_BUYER_PAY",21),
    TRADE_BUYER_SIGNED("买家已签收,货到付款专用", "TRADE_BUYER_SIGNED",25),
    PAID_FORBID_CONSIGN("拼团中订单或者发货强管控的订单，已付款但禁止发货", "PAID_FORBID_CONSIGN",29),
    TRADE_CLOSED("交易关闭", "TRADE_CLOSED",11),
    TRADE_CLOSED_BY_TAOBAO ("交易关闭", "TRADE_CLOSED_BY_TAOBAO",11);
    private String name;
    private String code;
    private int index;

    // 构造方法
    private TaoOrderStateEnum(String name, String code, int index) {
        this.name = name;
        this.code = code;
        this.index = index;
    }

    // 普通方法
    public static String getName(int index) {
        for (TaoOrderStateEnum c : TaoOrderStateEnum.values()) {
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
        for (TaoOrderStateEnum c : TaoOrderStateEnum.values()) {
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
