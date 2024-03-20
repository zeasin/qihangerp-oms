package com.qihang.wei.openApi.service;

import com.qihang.wei.openApi.bo.OrderListBo;
import com.qihang.wei.openApi.vo.GoodsListVo;
import com.qihang.wei.openApi.vo.OrderListVo;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.service.annotation.HttpExchange;
import org.springframework.web.service.annotation.PostExchange;

@HttpExchange
public interface OrderApiService {
    @PostExchange("/channels/ec/order/list/get")
    OrderListVo getOrderList(@RequestParam String access_token, @RequestBody OrderListBo bo);
}
