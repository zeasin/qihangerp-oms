package com.qihang.api;

import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.http.HttpStatus;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

@Configuration
public class TokenFilter implements GlobalFilter, Ordered {
    private static final String TOKEN_HEADER = "Authorization";
    private static final String TOKEN_PREFIX = "Bearer ";
    private static final String SECRET_KEY = "mysecretkey235200303325adjjeddd";
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        String token = exchange.getRequest().getHeaders().getFirst(TOKEN_HEADER);
        System.out.println("Token:"+token);
        String url = exchange.getRequest().getURI().getPath();
        System.out.println("intercept " + url);
        if(url.equals("/api/sys-api/login") || url.equals("/api/sys-api/getInfo") || url.equals("/api/sys-api/logout")){
            // 登录页面 放行
            return chain.filter(exchange);
        }
        // TODO: 统一鉴权处理
        if(!StringUtils.hasText(token)){
            exchange.getResponse().setStatusCode(HttpStatus.UNAUTHORIZED);
            return exchange.getResponse().setComplete();
        }
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return -10000;
    }
}
