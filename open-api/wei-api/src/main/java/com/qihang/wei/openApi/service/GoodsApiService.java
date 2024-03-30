package com.qihang.wei.openApi.service;

import com.qihang.wei.openApi.bo.GoodsDetailApiBo;
import com.qihang.wei.openApi.bo.GoodsListApiBo;
import com.qihang.wei.openApi.vo.GoodsDetailVo;
import com.qihang.wei.openApi.vo.GoodsListVo;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.service.annotation.HttpExchange;
import org.springframework.web.service.annotation.PostExchange;

@HttpExchange
public interface GoodsApiService {
    @PostExchange("/channels/ec/product/list/get")
    GoodsListVo getGoodsList(@RequestParam String access_token, @RequestBody GoodsListApiBo bo);
    @PostExchange("/channels/ec/product/get")
    GoodsDetailVo getGoodsDetail(@RequestParam String access_token, @RequestBody GoodsDetailApiBo bo);
}
