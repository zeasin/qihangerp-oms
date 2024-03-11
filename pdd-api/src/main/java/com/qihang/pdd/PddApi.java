package com.qihang.pdd;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages={"com.qihang"})
@SpringBootApplication
public class PddApi {
    public static void main( String[] args )
    {
        System.out.println( "Hello pdd-api!" );
        SpringApplication.run(PddApi.class, args);
    }
}
