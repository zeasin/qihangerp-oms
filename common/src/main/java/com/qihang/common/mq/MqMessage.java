package com.qihang.common.mq;

import com.qihang.common.enums.EnumShopType;
import lombok.Data;

import java.util.List;

@Data
public class MqMessage {
    private int mqType;// 消息类型（1：订单消息；2：退款消息）
    private EnumShopType shopType;
    private String keyId;
    private String[] orderIds;
    private Long shopId;
    private String logisticsCompanyCode;//快递公司编码
    private String waybillCode;//运单号


    public static MqMessage build(EnumShopType shopType,int mqType ,  String keyId){
        MqMessage result = new MqMessage();
        result.setShopType(shopType);
        result.setMqType(mqType);
        result.setKeyId(keyId);
        return result;
    }

    public static MqMessage build(Long shopId,String orderId){
        MqMessage result = new MqMessage();
        result.setShopId(shopId);
        result.setKeyId(orderId);
        return result;
    }

    public static MqMessage build(Long shopId,String orderId,String logisticsCompanyCode,String waybillCode){
        MqMessage result = new MqMessage();
        result.setShopId(shopId);
        result.setKeyId(orderId);
        result.setLogisticsCompanyCode(logisticsCompanyCode);
        result.setWaybillCode(waybillCode);
        return result;
    }
}
