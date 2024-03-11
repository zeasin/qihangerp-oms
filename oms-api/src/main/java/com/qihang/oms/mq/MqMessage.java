package com.qihang.oms.mq;//package com.qihang.sys.api.mq;
//
//import lombok.Data;
//
//import java.util.List;
//
//@Data
//public class MqMessage {
//    private int mqType;// 消息类型（1：订单消息；2：退款消息）
//    private List<String> updateIds;
//    private List<String> insertIds;
//
//    public static MqMessage build(int mqType ,  List<String> insertIds,List<String> updateIds){
//        MqMessage result = new MqMessage();
//        result.setMqType(mqType);
//        result.setUpdateIds(updateIds);
//        result.setInsertIds(insertIds);
//        return result;
//    }
//}
