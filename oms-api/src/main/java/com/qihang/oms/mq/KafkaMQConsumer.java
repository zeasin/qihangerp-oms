package com.qihang.oms.mq;

import com.qihang.common.mq.MqType;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.connection.Message;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

/**
 * Kafka 消息消费者
 */
@Component
public class KafkaMQConsumer {
    private static final Logger logger = LoggerFactory.getLogger(KafkaMQConsumer.class);

    /**
     * 订单消息处理
     * @param message
     */
    @KafkaListener(topics = {MqType.ORDER_MQ})
    public void onOrderMessage(ConsumerRecord<String,Object> message) {
        logger.info("收到kafka消息ORDER============"+message.topic()+"====="+message.partition()+"======"+message.value());
    }

    /**
     * 退款消息处理
     * @param message
     */
    @KafkaListener(topics = {MqType.REFUND_MQ})
    public void onRefundMessage(ConsumerRecord<String,Object> message) {
        logger.info("收到kafka消息REFUND============"+message.topic()+"====="+message.partition()+"======"+message.value());
    }
}
