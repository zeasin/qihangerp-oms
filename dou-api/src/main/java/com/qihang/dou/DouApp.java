package com.qihang.dou;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

//@EnableDiscoveryClient
@ComponentScan(basePackages={"com.qihang"})
@SpringBootApplication
public class DouApp {
    public static void main( String[] args )
    {
        System.out.println( "Hello dou-api!" );
        SpringApplication.run(DouApp.class, args);
    }

}
