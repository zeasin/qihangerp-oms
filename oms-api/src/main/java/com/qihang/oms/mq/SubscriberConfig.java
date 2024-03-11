package com.qihang.oms.mq;

import lombok.AllArgsConstructor;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.PatternTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.listener.adapter.MessageListenerAdapter;

@AllArgsConstructor
@Configuration
@AutoConfigureAfter({ApiMessageReceiver.class})
public class SubscriberConfig {
    private final RedisTemplate redisTemplate;

    /**
     * 消息监听适配器，注入接受消息方法，输入方法名字 反射方法
     *
     * @param apiMessageReceiver
     * @return
     */
    @Bean
    public MessageListenerAdapter getMessageListenerAdapter(ApiMessageReceiver apiMessageReceiver) {
        //当没有实现MessageListener时需要写接收消息的方法名字，实现了就不用写receiveMessage了
//        return new MessageListenerAdapter(apiMessageReceiver, "receiveMessage");
        return new MessageListenerAdapter(apiMessageReceiver);
    }

    /**
     * 创建消息监听容器
     *
     * @param redisConnectionFactory
     * @param messageListenerAdapter
     * @return
     */
    @Bean
    public RedisMessageListenerContainer getRedisMessageListenerContainer(RedisConnectionFactory redisConnectionFactory, MessageListenerAdapter messageListenerAdapter) {
        RedisMessageListenerContainer redisMessageListenerContainer = new RedisMessageListenerContainer();
        redisMessageListenerContainer.setConnectionFactory(redisConnectionFactory);
        redisMessageListenerContainer.addMessageListener(messageListenerAdapter, new PatternTopic("TOPIC_USERNAME"));
        return redisMessageListenerContainer;
    }


    /**
     *
     * @param connectionFactory
     * @return
     */
    @Bean
    public RedisMessageListenerContainer container(RedisConnectionFactory connectionFactory) {
        RedisMessageListenerContainer container = new RedisMessageListenerContainer();
        container.setConnectionFactory(connectionFactory);

        //订阅频道，通配符*表示任意多个占位符

        // API 消息订阅
        container.addMessageListener(new ApiMessageReceiver(redisTemplate), new PatternTopic("ApiMessage*"));

        return container;
    }
}