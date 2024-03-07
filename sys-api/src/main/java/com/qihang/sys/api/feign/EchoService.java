package com.qihang.sys.api.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;


@FeignClient(name = "tao-api")
public interface EchoService {
    @GetMapping(value = "/test/na")
    String echo();
}
