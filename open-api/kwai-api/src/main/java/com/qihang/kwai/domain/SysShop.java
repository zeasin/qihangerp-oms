package com.qihang.kwai.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * 数据中心-店铺
 * @TableName sys_shop
 */
@Data
public class SysShop implements Serializable {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 店铺名
     */
    private String name;

    /**
     * 对应第三方平台Id
     */
    private Integer type;

    /**
     * 店铺url
     */
    private String url;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 状态（1正常2已删除）
     */
    private Integer status;

    /**
     * 更新时间
     */
    private Long modifyOn;

    /**
     * 描述
     */
    private String remark;

    /**
     * 第三方平台店铺id，淘宝天猫开放平台使用
     */
    private Long sellerId;

    /**
     * Appkey
     */
    private String appKey;

    /**
     * Appsercet
     */
    private String appSercet;

    /**
     * 第三方平台sessionKey（access_token）
     */
    private String accessToken;

    /**
     * 到期
     */
    private Long expiresIn;

    /**
     * access_token开始时间
     */
    private Long accessTokenBegin;

    /**
     * 刷新token
     */
    private String refreshToken;

    /**
     * 刷新token过期时间
     */
    private Long refreshTokenTimeout;

    /**
     * 请求url
     */
    private String apiRequestUrl;

    private static final long serialVersionUID = 1L;
}