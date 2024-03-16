package com.qihang.wei;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages={"com.qihang"})
@SpringBootApplication
public class WeiApi {
    public static void main( String[] args )
    {
        System.out.println( "Hello wei-api!" );
        SpringApplication.run(WeiApi.class, args);
    }
}
