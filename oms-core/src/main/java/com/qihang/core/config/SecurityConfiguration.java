//package com.qihang.core.config;
//
//import com.qihang.core.security.AuthenticationExceptionHandler;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.http.SessionCreationPolicy;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.web.SecurityFilterChain;
//import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
//import org.springframework.util.CollectionUtils;
//import java.util.ArrayList;
//import java.util.List;
//
///**
// *
// * @Description SecurityConfiguration
// * @Author
// * @Date
// **/
//@Configuration
//@EnableWebSecurity
//public class SecurityConfiguration {
//    @Autowired
//    private AuthenticationExceptionHandler authenticationExceptionHandler;
//    @Autowired
//    private TokenFilter tokenFilter;
//
//
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        List<String> permitAllPaths = new ArrayList<>();//security.getPermitAllPath();
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
//        // 关闭csrf因为不使用session
//        http.csrf().disable()
//                // 不通过Session获取SecurityContext
//                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
//                .and()
//                .authorizeHttpRequests()
//                // 除了上面那些请求都需要认证
//                .anyRequest().authenticated()
//                .and()
//                // 配置异常处理
//                // 如果是认证过程中出现的异常会被封装成AuthenticationException然后调用AuthenticationEntryPoint对象的方法去进行异常处理。
//                // 如果是授权过程中出现的异常会被封装成AccessDeniedException然后调用AccessDeniedHandler对象的方法去进行异常处理。
//                .exceptionHandling()
//                .authenticationEntryPoint(authenticationExceptionHandler);
//        // 配置token拦截过滤器
//        http.addFilterBefore(tokenFilter, UsernamePasswordAuthenticationFilter.class);
//        return http.build();
//    }
//
//    /**
//     * 身份认证管理器，调用authenticate()方法完成认证
//     */
//    @Bean
//    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
//        return authenticationConfiguration.getAuthenticationManager();
//    }
//
//    /**
//     * 密码加密器
//     */
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//
//}