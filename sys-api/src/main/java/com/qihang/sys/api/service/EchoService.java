package com.qihang.sys.api.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;


@FeignClient(name = "tao-oms")
public interface EchoService {
    @GetMapping(value = "/test/na")
    String echo();
}
