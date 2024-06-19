package com.qihang.wei.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 第三方平台设置
 * @TableName s_shop_setting
 */
@Data
public class SShopSetting implements Serializable {
    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 配置名
     */
    private String name;

    /**
     * appKey
     */
    private String appKey;

    /**
     * appSecret
     */
    private String appSecret;

    /**
     * 阿里access token
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
     * 更新时间
     */
    private Long modifyOn;

    /**
     * 描述
     */
    private String remark;

    /**
     * 请求url
     */
    private String requestUrl;

    /**
     * 第三方店铺id
     */
    private String thirdId;

    private static final long serialVersionUID = 1L;
}