package com.qihang.offline;

//import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;



//@EnableDiscoveryClient
//@MapperScan("com.qihang.oms.mapper")
@ComponentScan(basePackages={"com.qihang"})
@SpringBootApplication
public class OfflineApi {
    public static void main( String[] args )
    {
        System.out.println( "Hello oms-api!" );
        SpringApplication.run(OfflineApi.class, args);
    }

}
