package com.qihang.tao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
    @GetMapping("/test/22")
    public String home(){
        return "hello world";
    }

    @Value(value = "${zhijian.name:1}")
    private String serverName;

    @GetMapping(value = "/test/na")
    public String get() {
        return serverName;
    }

}
