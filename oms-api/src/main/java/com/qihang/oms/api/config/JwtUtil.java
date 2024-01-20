package com.qihang.oms.api.config;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.util.Date;
import java.util.UUID;

public class JwtUtil {
    /**
     * 需要拦截的请求头信息
     */
    public static final String TOKEN_HEADER = "token";
    /**
     * 有效期
     */
    public static final Long JWT_EXPIRE_TIME = 60 * 60 * 1000L; // 1h
    /**
     * 加密算法
     */
    public static final String SIGN_ALGORITHMS = "AES";
    /**
     * jwt key
     */
    public static final String JWT_KEY = "security";

    /**
     * 获取token
     * @param id 唯一标识(盐值)
     * @param subject
     * @param expire
     * @return
     */
    public static String createToken(String id, String subject, Long expire) {
        JwtBuilder builder = getJwtBuilder(subject, expire, id);
        return builder.compact();
    }

    /**
     * 解析token
     * @param token
     * @return
     */
    public static Claims parseToken(String token) {
        SecretKey secretKey = generalKey();
        Claims body = Jwts.parser()
                .setSigningKey(secretKey)
                .parseClaimsJws(token)
                .getBody();
        return body;
    }

    private static JwtBuilder getJwtBuilder(String subject, Long expire, String uuid) {
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
        SecretKey secretKey = generalKey();
        Date date = new Date();
        if (expire == null) {
            expire = JWT_EXPIRE_TIME;
        }
        if (uuid == null) {
            uuid = getUUID();
        }
        Long expireTime = date.getTime() + expire;
        Date expireDate = new Date(expireTime);
        JwtBuilder builder = Jwts.builder()
                .setId(uuid) // 唯一标识
                .setSubject(subject) // 签名数据/主题
                .setIssuer(JWT_KEY) // 签发者
                .setIssuedAt(date) // 签发时间
                .signWith(signatureAlgorithm, secretKey) // 签名算法 + 秘钥
                .setExpiration(expireDate); // 过期时间
        return builder;
    }

    public static String getUUID() {
        return UUID.randomUUID().toString();
    }

    // 生成秘钥
    public static SecretKey generalKey() {
        byte[] encodeKey = Base64.getDecoder().decode(JWT_KEY);
        SecretKey secretKey = new SecretKeySpec(encodeKey, 0, encodeKey.length, SIGN_ALGORITHMS);
        return secretKey;
    }
}
