package com.qihang.jd.controller;

import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqUtils;
import com.qihang.common.mq.MqMessage;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

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
        MqMessage mqVo = MqMessage.build(EnumShopType.JD,1,"288531622338");

        mqUtils.sendMessage("channel",mqVo);
        mqUtils.sendMessage("ApiMessage",mqVo);
        return "{'code':0,'msg':'请通过api访问'}";
    }
}
