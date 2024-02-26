package com.qihang.tao.controller;

import com.qihang.tao.domain.TaoGoods;
import com.qihang.tao.mapper.TaoGoodsMapper;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class
HomeController {
    @Autowired
    private TaoGoodsMapper goodsMapper;
    @GetMapping("/")
    public String home(){
        return "{'code':0,'msg':'请通过api访问'}";
    }

    @Value(value = "${zhijian.name:1}")
    private String serverName;

    @GetMapping(value = "/test/na")
    public String get(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        System.out.println("tao-api token:"+token);

        TaoGoods taoGoods = goodsMapper.selectById(1L);

        return serverName;
    }

}
