package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 电商平台店铺表
 * @TableName s_shop
 */
@Data
public class SShop implements Serializable {
    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 店铺名
     */
    private String name;

    /**
     * 店铺别名
     */
    private String nickName;

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
    private Integer platform;

    /**
     * 店铺url
     */
    private String shopUrl;

    /**
     * 排序
     */
    private Integer orderNum;

    /**
     * 是否删除0否1是
     */
    private Integer isDelete;

    /**
     * 描述
     */
    private String remark;

    /**
     * 第三方平台店铺id
     */
    private Long sellerShopId;

    /**
     * Appkey(微信视频号小店专用)
     */
    private String appKey;

    /**
     * Appsercet(微信视频号小店专用)
     */
    private String appSercet;

    /**
     * 第三方平台sessionKey（access_token）
     */
    private String accessToken;

    /**
     * accessToken到期（秒）
     */
    private Long accessExpiresIn;

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
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;
}