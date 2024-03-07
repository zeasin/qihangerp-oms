package com.qihang.jd;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

/**
 * Hello world!
 *
 */
@EnableDiscoveryClient
@ComponentScan(basePackages={"com.qihang"})
//@MapperScan("com.qihang.jd.mapper")
@SpringBootApplication
public class JdApi
{
    public static void main( String[] args )
    {
        System.out.println( "Hello jd-api!" );
        SpringApplication.run(JdApi.class, args);
    }

    /**
     * redis消息监听器容器
     */



}
