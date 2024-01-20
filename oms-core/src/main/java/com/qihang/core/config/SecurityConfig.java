//package com.qihang.core.config;
//
//import com.qihang.core.security.AuthenticationEntryPointImpl;
//import com.qihang.core.security.LogoutSuccessHandlerImpl;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.HttpMethod;
//import org.springframework.security.config.annotation.SecurityBuilder;
//import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
//import org.springframework.security.config.annotation.web.WebSecurityConfigurer;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.http.SessionCreationPolicy;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
//@EnableMethodSecurity
//public class SecurityConfig  {
//    @Value("${auth.whitelist:/login}")
//    private String[] URL_WHITELIST;
//
//    @Autowired
//    private AuthenticationEntryPointImpl unauthorizedHandler;
//    @Autowired
//    private LogoutSuccessHandlerImpl logoutSuccessHandler;
//    @Bean
//    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
////        http
////                // CSRF禁用，因为不使用session
////                .csrf().disable()
////                .authorizeRequests()
////                .anyRequest().authenticated()
////                .and()
////                .formLogin()
////                .and()
////                .httpBasic();
//        // CSRF禁用，因为不使用session
//        http.csrf().disable()
//                // 禁用HTTP响应标头
//                .headers().cacheControl().disable().and()
//                // 认证失败处理类
////                .exceptionHandling().authenticationEntryPoint(unauthorizedHandler).and()
//                // 基于token，所以不需要session
//                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
//                // 过滤请求
//                .authorizeRequests(authz -> authz
//                        .requestMatchers(URL_WHITELIST).permitAll() // 允许访问无需认证的路径
//                        .anyRequest().authenticated())
//                .formLogin(form -> form.
//                        loginProcessingUrl("/login")
//                        .usernameParameter("username")
//                        .passwordParameter("password")
//                        .successHandler(unauthorizedHandler)
////                        .failureHandler(unauthorizedHandler))
//                // 对于登录login 注册register 验证码captchaImage 允许匿名访问
//                .antMatchers("/login", "/register", "/captchaImage").permitAll()
//                // 静态资源，可匿名访问
//                .antMatchers(HttpMethod.GET, "/", "/*.html", "/**/*.html", "/**/*.css", "/**/*.js", "/profile/**").permitAll()
//                .antMatchers("/swagger-ui.html", "/swagger-resources/**", "/webjars/**", "/*/api-docs", "/druid/**").permitAll()
//                .antMatchers("/test/**").permitAll()
//                .antMatchers("/preview/**").permitAll()
//                .antMatchers("/h2-console/**").permitAll()
//                .antMatchers("/taoapi2/**").permitAll()
//                // 除上面外的所有请求全部需要鉴权认证
//                .anyRequest().authenticated()
//                .and()
//                .headers().frameOptions().disable();
//        return http.build();
//    }
//
//    /**
//     * 强散列哈希加密实现
//     */
//    @Bean
//    public BCryptPasswordEncoder bCryptPasswordEncoder()
//    {
//        return new BCryptPasswordEncoder();
//    }
//}
