package com.qihang.oms.controller;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
public class HomeController {
    @GetMapping("/")
    public String home(){
        return "{'code':0,'msg':'oms-api请通过api访问'}";
    }
}
