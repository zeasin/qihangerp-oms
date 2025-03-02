package cn.qihangerp.common.mq;

public class MqType {
    /**
     * 订单消息
     */
    public static final int ORDER_MESSAGE = 1;
    /**
     * 退款消息
     */
    public static final int REFUND_MESSAGE = 2;
    /**
     * 备货消息
     */
    public static final int SHIP_STOCKUP_MESSAGE = 30;

    /**
     * 发货消息
     */
    public static final int SHIP_SEND_MESSAGE = 40;

    /**
     * 新订单消息
     */
    public static final String ORDER_MQ = "ORDER_MQ";
    /**
     * 新退款消息
     */
    public static final String REFUND_MQ = "REFUND_MQ";
    /**
     * 新备货消息
     */
    public static final String SHIP_STOCK_UP_MQ = "SHIP_STOCK_UP_MQ";
    /**
     * 发货通知
     */
    public static final String SHIP_SEND_MQ = "SHIP_SEND_MQ";
}
