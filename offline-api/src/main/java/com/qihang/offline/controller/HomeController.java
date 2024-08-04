package com.qihang.offline.controller;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
public class HomeController {


    @GetMapping("/")
    public String home(){
        return "{'code':0,'msg':'offline-api请通过api访问'}";
    }
    @GetMapping("/test")
    public String test(){
        return "{'code':0,'msg':'offline-api/test请通过api访问'}";
    }
}