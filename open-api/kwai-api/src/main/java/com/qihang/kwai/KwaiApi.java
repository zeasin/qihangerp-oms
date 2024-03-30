package com.qihang.kwai;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages={"com.qihang"})
@SpringBootApplication
public class KwaiApi {
    public static void main( String[] args )
    {
        System.out.println( "Hello kwai-api!" );
        SpringApplication.run(KwaiApi.class, args);
    }
}
