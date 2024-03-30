package com.qihang.wei.openApi.service;


import com.qihang.wei.openApi.vo.Token;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.service.annotation.GetExchange;
import org.springframework.web.service.annotation.HttpExchange;

@HttpExchange
public interface TokenApiService {

    @GetExchange("/cgi-bin/token")
    Token getToken(@RequestParam String grant_type, @RequestParam String appid, @RequestParam String secret);
}
