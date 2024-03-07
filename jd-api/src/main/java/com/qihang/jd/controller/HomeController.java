package com.qihang.jd.controller;

import com.qihang.jd.mq.MqUtils;
import com.qihang.jd.mq.MqMessage;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
public class HomeController {
    private final MqUtils mqUtils;
//    private final RedisTemplate redisTemplate;
//
//    public void sendMessage(String channel, Object message) {
//        redisTemplate.convertAndSend(channel, message);
////        redisTemplate.convertAndSend(channel, message);
//    }

    @GetMapping("/")
    public String home(){
        MqMessage mqVo = MqMessage.build(1,"52332555");

        mqUtils.sendMessage("channel",mqVo);
        return "{'code':0,'msg':'请通过api访问'}";
    }
}
