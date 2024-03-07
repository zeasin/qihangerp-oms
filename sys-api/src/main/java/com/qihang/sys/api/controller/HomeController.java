package com.qihang.sys.api.controller;

import com.qihang.sys.api.feign.EchoService;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class HomeController {
    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private RedisTemplate<String,String> redisTemplate;
    @Resource
    private EchoService echoService;
    @GetMapping("/")
    public String home(){
        return "{'code':0,'msg':'请通过api访问'}";
    }
    @GetMapping(value = "/echo-rest")
    public String rest() {
        return restTemplate.getForObject("http://tao-oms/test/na", String.class);
    }
    @GetMapping(value = "/echo-feign")
    public String feign() {
        String token = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjdkOTBmN2EzLWUwNWQtNDkxNy04NjIzLTU1OGRhNGY3NjE3NiJ9._Oukm9b0P1WvcOywLdhs6_BOt_6mRSF41Q6f4fBm_DGUkPR86Qg1tqyRTM5ouTR2Xz46IRuRAVez8Wcl3NIlwg";

        return echoService.echo(token);
    }

}
