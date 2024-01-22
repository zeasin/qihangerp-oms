package com.qihang.core;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

/**
 * Hello world!
 *
 */
@EnableCaching
//@ComponentScan(basePackages = "com.qihang")
@SpringBootApplication
public class OmsCoreApplication
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        SpringApplication.run(OmsCoreApplication.class, args);
    }

}
