package com.qihang.tao;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

/**
 * Hello world!
 *
 */
//@EnableWebSecurity
@EnableDiscoveryClient
@SpringBootApplication
public class TaoApi
{
    public static void main( String[] args )
    {
//        System.out.println( "Hello World!" );
        SpringApplication.run(TaoApi.class, args);
    }
}
