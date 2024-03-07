package com.qihang.sys.api.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;


@FeignClient(name = "tao-api")
public interface EchoService {
    @GetMapping(value = "/test/na")
    String echo(@RequestHeader(name = "Authorization",required = true) String Token);
}
