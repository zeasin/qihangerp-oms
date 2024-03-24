package com.qihang.security;


import com.alibaba.fastjson2.JSON;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.enums.HttpStatus;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * token过滤器 验证token有效性
 * 
 * @author qihang
 */
@Component
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter
{
    @Autowired
    private TokenService tokenService;
    /**
     * 需要拦截的请求头信息
     */
    @Value("${token.header:'Authorization'}")
    public String TOKEN_HEADER = "Authorization";
    private Logger log = LoggerFactory.getLogger(getClass());
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException
    {
//        String token = exchange.getRequest().getHeaders().getFirst(TOKEN_HEADER);
        String token = request.getHeader("Authorization");
        String url =request.getRequestURI();
//        log.info("intercept " + url);
//        log.info("token: " + token); || request.getRequestURI().equals("/getInfo") || request.getRequestURI().equals("/logout")
        if(request.getRequestURI().equals("/login") ){
            // 登录页面，放行
            chain.doFilter(request, response);
            return;
        }
        LoginUser loginUser = tokenService.getLoginUser(request);
        if (loginUser !=null )
        {
            tokenService.verifyToken(loginUser);
            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(loginUser, null, loginUser.getAuthorities());
            authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
            SecurityContextHolder.getContext().setAuthentication(authenticationToken);
        }else {
            fallback(" 授权过期！",response);
            return;
        }
        chain.doFilter(request, response);
    }

        private void fallback(String message, HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        PrintWriter writer = null;
        try {
            if (message == null) {
                message = "401 Forbidden";
            }
            AjaxResult res = AjaxResult.error(HttpStatus.UNAUTHORIZED, message);
            writer = response.getWriter();
            writer.append(JSON.toJSONString(res));
        } catch (IOException e) {
            log.error(e.getMessage());
        } finally {
            if (writer != null) {
                writer.close();
            }
        }
    }
}
