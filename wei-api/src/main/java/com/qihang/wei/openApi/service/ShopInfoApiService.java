package com.qihang.wei.openApi.service;

import com.qihang.wei.openApi.vo.ShopApiResultVo;
import com.qihang.wei.openApi.vo.Token;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.service.annotation.GetExchange;
import org.springframework.web.service.annotation.HttpExchange;

@HttpExchange
public interface ShopInfoApiService {
    @GetExchange("/channels/ec/basics/info/get")
    ShopApiResultVo getShopInfo(@RequestParam String access_token);
}
