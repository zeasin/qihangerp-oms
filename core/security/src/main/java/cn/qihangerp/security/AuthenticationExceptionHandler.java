package cn.qihangerp.security;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.enums.HttpStatus;
import com.alibaba.fastjson2.JSON;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.PrintWriter;

@Component
public class AuthenticationExceptionHandler implements AuthenticationEntryPoint {
    Logger log = LoggerFactory.getLogger(getClass());
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        fallback(authException.getMessage(), response);
    }

    private void fallback(String message, HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        PrintWriter writer = null;
        try {
            if (message == null) {
                message = "认证失败！";
            }
            AjaxResult res = AjaxResult.error(HttpStatus.ERROR, message);
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
