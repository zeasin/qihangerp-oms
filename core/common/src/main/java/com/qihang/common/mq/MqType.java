package com.qihang.common.mq;

public class MqType {
    /**
     * 订单消息
     */
    public static final int ORDER_MESSAGE = 1;
    /**
     * 退款消息
     */
    public static final int REFUND_MESSAGE = 2;

    public static final String ORDER_MQ = "ORDER_MQ";
    public static final String REFUND_MQ = "REFUND_MQ";
}
