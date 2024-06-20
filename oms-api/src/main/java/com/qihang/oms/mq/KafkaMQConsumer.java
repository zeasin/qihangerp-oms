package com.qihang.oms.mq;

import com.alibaba.fastjson2.JSON;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.oms.service.ErpSaleAfterRefundService;
import com.qihang.oms.service.ErpSaleOrderService;
import lombok.AllArgsConstructor;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.connection.Message;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

/**
 * Kafka 消息消费者
 */
@AllArgsConstructor
@Component
public class KafkaMQConsumer {
    private static final Logger logger = LoggerFactory.getLogger(KafkaMQConsumer.class);
    private final ErpSaleOrderService orderService;
    private final ErpSaleAfterRefundService refundService;

    /**
     * 订单消息处理
     * @param message
     */
    @KafkaListener(topics = {MqType.ORDER_MQ})
    public void onOrderMessage(ConsumerRecord<String,Object> message) {
        logger.info("收到kafka消息ORDER============"+message.topic()+"====="+message.partition()+"======"+message.value());

        MqMessage vo = JSON.parseObject(message.value().toString(), MqMessage.class);
        if(vo.getShopType().getIndex() == EnumShopType.JD.getIndex()) {
            logger.info("Kafka订单消息JD"+vo.getKeyId());
            orderService.jdOrderMessage(vo.getKeyId());
        }else if(vo.getShopType().getIndex() == EnumShopType.TAO.getIndex()) {
            logger.info("Kafka订单消息TAO"+vo.getKeyId());
            orderService.taoOrderMessage(vo.getKeyId());
        }else if(vo.getShopType().getIndex() == EnumShopType.PDD.getIndex()) {
            logger.info("Kafka订单消息PDD"+vo.getKeyId());
            orderService.pddOrderMessage(vo.getKeyId());
        } else if(vo.getShopType().getIndex() == EnumShopType.DOU.getIndex()) {
            logger.info("Kafka订单消息DOU"+vo.getKeyId());
            orderService.douOrderMessage(vo.getKeyId());
        } else if(vo.getShopType().getIndex() == EnumShopType.WEI.getIndex()) {
            logger.info("Kafka订单消息WEI"+vo.getKeyId());
            orderService.weiOrderMessage(vo.getKeyId());
        }
    }

    /**
     * 退款消息处理
     * @param message
     */
    @KafkaListener(topics = {MqType.REFUND_MQ})
    public void onRefundMessage(ConsumerRecord<String,Object> message) {
        logger.info("收到kafka消息REFUND============"+message.topic()+"====="+message.partition()+"======"+message.value());
        MqMessage vo = JSON.parseObject(message.value().toString(), MqMessage.class);
        if(vo.getShopType().getIndex() == EnumShopType.JD.getIndex()) {
            logger.info("Kafka售后消息JD"+vo.getKeyId());
            refundService.jdRefundMessage(vo.getKeyId());
        }else if(vo.getShopType().getIndex() == EnumShopType.TAO.getIndex()) {
            logger.info("Kafka售后消息TAO"+vo.getKeyId());
            refundService.taoRefundMessage(vo.getKeyId());
        }else if(vo.getShopType().getIndex() == EnumShopType.PDD.getIndex()) {
            logger.info("Kafka售后消息PDD"+vo.getKeyId());
            refundService.pddRefundMessage(vo.getKeyId());
        } else if(vo.getShopType().getIndex() == EnumShopType.DOU.getIndex()) {
            logger.info("Kafka售后消息DOU"+vo.getKeyId());
            refundService.douRefundMessage(vo.getKeyId());
        } else if(vo.getShopType().getIndex() == EnumShopType.WEI.getIndex()) {
            logger.info("Kafka售后消息WEI"+vo.getKeyId());
            refundService.weiRefundMessage(vo.getKeyId());
        }
    }

    /**
     * 监听备货消息
     * @param message
     */
    @KafkaListener(topics = {MqType.SHIP_STOCK_UP_MQ})
    public void onSHIP_STOCK_UP_MQ(ConsumerRecord<String,Object> message) {
        logger.info("收到kafka消息 SHIP_STOCK_UP_MQ ============"+message.topic()+"====="+message.partition()+"======"+message.value());
        MqMessage vo = JSON.parseObject(message.value().toString(), MqMessage.class);
        orderService.orderShipStockUp(vo.getShopId(),vo.getKeyId());
    }

    /**
     * 监听发货完成消息
     * @param message
     */
    @KafkaListener(topics = {MqType.SHIP_SEND_MQ})
    public void onSHIP_SEND_MQ(ConsumerRecord<String,Object> message) {
        logger.info("收到kafka消息 SHIP_SEND_MQ ============"+message.topic()+"====="+message.partition()+"======"+message.value());
        MqMessage vo = JSON.parseObject(message.value().toString(), MqMessage.class);
        orderService.orderSendConfirm(vo.getShopId(),vo.getKeyId(),vo.getLogisticsCompanyCode(),vo.getWaybillCode());
    }
}
