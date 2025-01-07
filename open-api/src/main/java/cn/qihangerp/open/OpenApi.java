package cn.qihangerp.open;

//import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;



//@EnableDiscoveryClient
//@MapperScan("com.qihang.oms.mapper")
@ComponentScan(basePackages={"cn.qihangerp.open","com.qihang"})
@SpringBootApplication
public class OpenApi {
    public static void main( String[] args )
    {
        System.out.println( "Hello open-api!" );
        SpringApplication.run(OpenApi.class, args);
    }

}
