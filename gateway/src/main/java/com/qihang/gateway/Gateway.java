package com.qihang.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Hello world!
 *
 */
@SpringBootApplication
public class Gateway
{
    public static void main( String[] args )
    {
        System.out.println( "Hello gateway! " );
        SpringApplication.run(Gateway.class, args);
    }
}
