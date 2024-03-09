package com.qihang.sys.api.mq;


import com.alibaba.fastjson2.JSON;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.common.utils.SpringUtils;
import com.qihang.sys.api.mapper.OOrderMapper;
import com.qihang.sys.api.service.OOrderService;
import jakarta.annotation.Resource;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Component;

@AllArgsConstructor
@Component
public class ApiMessageReceiver implements MessageListener {
    private static final Logger logger = LoggerFactory.getLogger(ApiMessageReceiver.class);

    private final RedisTemplate redisTemplate;

//    private final OOrderService orderService;

    /**
     * 消息处理
     * @param message
     * @param pattern
     */
    @Override
    public void onMessage(Message message, byte[] pattern) {
//        RedisSerializer<String> valueSerializer = redisTemplate.getStringSerializer();
//        String deserialize = valueSerializer.deserialize(message.getBody());
        //message 和 deserialize 都能拿到msg
//        logger.info("Received <" + message + ">");
//        System.out.println("deserialize = " + deserialize);
        String messageContent = new String(message.getBody());
        MqMessage vo = JSON.parseObject(messageContent, MqMessage.class);

        System.out.println(vo.getMqType());

        if(vo.getMqType() == MqType.ORDER_MESSAGE){
            // 有新订单，插入新订单到shop_order
            logger.info("订单消息"+messageContent);
            OOrderService orderService = SpringUtils.getBean(OOrderService.class);
            if(vo.getShopType().getIndex() == EnumShopType.JD.getIndex()) {
                orderService.jdOrderMessage(vo.getKeyId());
            }else if(vo.getShopType().getIndex() == EnumShopType.TAO.getIndex()) {
                orderService.taoOrderMessage(vo.getKeyId());
            }
        }
    }
}
