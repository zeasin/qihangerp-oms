//package com.qihang.jd.mq;
//
//
//import com.alibaba.fastjson2.JSON;
//import lombok.AllArgsConstructor;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.data.redis.connection.Message;
//import org.springframework.data.redis.connection.MessageListener;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.data.redis.serializer.RedisSerializer;
//import org.springframework.stereotype.Component;
//@AllArgsConstructor
//@Component
//public class ApiMessageReceiver implements MessageListener {
//    private static final Logger logger = LoggerFactory.getLogger(ApiMessageReceiver.class);
//
//    private final RedisTemplate redisTemplate;
//
//
//    @Override
//    public void onMessage(Message message, byte[] pattern) {
//        RedisSerializer<String> valueSerializer = redisTemplate.getStringSerializer();
//        String deserialize = valueSerializer.deserialize(message.getBody());
//        //message 和 deserialize 都能拿到msg
//        logger.info("Received <" + message + ">");
////        System.out.println("deserialize = " + deserialize);
//        String messageContent = new String(message.getBody());
//        MqMessage vo = JSON.parseObject(messageContent, MqMessage.class);
//
//        System.out.println(vo.getMqType());
//        if(vo.getMqType() == 1){
//            // 有新订单，插入新订单到shop_order
//            logger.info("订单消息");
//
//        }
//    }
//}
