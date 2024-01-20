package com.qihang.oms.api.config;

import com.alibaba.nacos.client.naming.utils.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.reactive.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.util.ArrayList;
import java.util.List;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Autowired
    private TokenFilter tokenFilter;
    @Autowired
    private AuthenticationExceptionHandler authenticationExceptionHandler;
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        List<String> permitAllPaths = new ArrayList<>();//security.getPermitAllPath();
//        permitAllPaths.add("/login");
//        // 配置不需要认证的请求(这里所有的路径可以写在配置文件上修改时就不用改代码)
//        if (!CollectionUtils.isEmpty(permitAllPaths)) {
//            permitAllPaths.forEach(path -> {
//                try {
//                    http.authorizeHttpRequests().requestMatchers(path).permitAll();
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            });
//        }
//        http.csrf().disable().authorizeHttpRequests().requestMatchers(HttpMethod.GET,"/home").permitAll();
        // 关闭csrf因为不使用session
        http.csrf().disable()
                // 不通过Session获取SecurityContext
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeHttpRequests(authorizeHttpRequests -> authorizeHttpRequests

                                .requestMatchers( "/home").permitAll()
                                .requestMatchers("/login").permitAll()
                                // 允许 SpringMVC 的默认错误地址匿名访问
                                .requestMatchers("/error").permitAll()
                                // 其他所有接口必须有Authority信息，Authority在登录成功后的UserDetailsImpl对象中默认设置“ROLE_USER”
                                //.requestMatchers("/**").hasAnyAuthority("ROLE_USER")
                                // 允许任意请求被已登录用户访问，不检查Authority
                                .anyRequest().authenticated()
                      )
                // 除了上面那些请求都需要认证 https://blog.csdn.net/xieshaohu/article/details/129780439
//                .anyRequest().authenticated()
//                .and()
                // 配置异常处理
                // 如果是认证过程中出现的异常会被封装成AuthenticationException然后调用AuthenticationEntryPoint对象的方法去进行异常处理。
                // 如果是授权过程中出现的异常会被封装成AccessDeniedException然后调用AccessDeniedHandler对象的方法去进行异常处理。
                .exceptionHandling()
                .authenticationEntryPoint(authenticationExceptionHandler);
        // 配置token拦截过滤器
        http.addFilterBefore(tokenFilter, UsernamePasswordAuthenticationFilter.class);
        return http.build();
    }

    /**
     * 身份认证管理器，调用authenticate()方法完成认证
     */
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    /**
     * 密码加密器
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
