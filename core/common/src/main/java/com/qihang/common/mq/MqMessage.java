package com.qihang.common.mq;

import com.qihang.common.enums.EnumShopType;
import lombok.Data;

import java.util.List;

@Data
public class MqMessage {
    private int mqType;// 消息类型（1：订单消息；2：退款消息）
    private EnumShopType shopType;
    private String keyId;

    public static MqMessage build(EnumShopType shopType,int mqType ,  String keyId){
        MqMessage result = new MqMessage();
        result.setShopType(shopType);
        result.setMqType(mqType);
        result.setKeyId(keyId);
        return result;
    }
}
