package cn.qihangerp.common.mq;

import cn.qihangerp.common.enums.EnumShopType;
import lombok.Data;

@Data
public class MqMessage {
    private int mqType;// 消息类型（1：订单消息；2：退款消息）
    private EnumShopType shopType;
    private String keyId;
    private String data1;//数据1 -快递公司
    private String data2;//数据2 -物流单号

    public static MqMessage build(EnumShopType shopType,int mqType ,  String keyId){
        MqMessage result = new MqMessage();
        result.setShopType(shopType);
        result.setMqType(mqType);
        result.setKeyId(keyId);
        return result;
    }

    public static MqMessage build(EnumShopType shopType,int mqType ,  String orderNum,String logisticsCompany,String logisticsCode){
        MqMessage result = new MqMessage();
        result.setShopType(shopType);
        result.setMqType(mqType);
        result.setKeyId(orderNum);
        result.setData1(logisticsCompany);
        result.setData2(logisticsCode);
        return result;
    }
}
