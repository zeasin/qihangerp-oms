package com.qihang.jd.mq;

import lombok.Data;

@Data
public class MqMessage {
    private int mqType;// 消息类型（1：订单消息；2：退款消息）
    private String keyId;//主键ID

    public static MqMessage build(int mqType , String keyId){
        MqMessage result = new MqMessage();
        result.setMqType(mqType);
        result.setKeyId(keyId);
        return result;
    }
}
