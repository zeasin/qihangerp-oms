package com.qihang.jd.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * 数据中心-店铺
 * @TableName s_shop
 */
@Data
public class SShop implements Serializable {
    /**
     * 主键
     */
    private Long id;

    /**
     * 店铺名
     */
    private String name;

    /**
     * 店铺别名
     */
    private String nickname;

    /**
     * 标识
     */
    private String ename;

    /**
     * 店铺主题
     */
    private String company;

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
    private Integer ordernum;

    /**
     * 是否删除0否1是
     */
    private Integer isdelete;

    /**
     * 是否显示(0：是1否）
     */
    private Integer isshow;

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
    private Long selleruserid;

    /**
     * 卖家userId
     */
    private String selleruseridstr;

    /**
     * 第三方平台sessionKey（access_token）
     */
    private String sessionkey;

    /**
     * Appkey
     */
    private String appkey;

    /**
     * Appsercet
     */
    private String appsercet;

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