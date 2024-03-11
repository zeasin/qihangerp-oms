package com.qihang.oms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
//import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

//@EnableDiscoveryClient
@ComponentScan(basePackages={"com.qihang"})
@SpringBootApplication
public class OmsApp {
    public static void main( String[] args )
    {
        System.out.println( "Hello oms-api!" );
        SpringApplication.run(OmsApp.class, args);
    }

}
