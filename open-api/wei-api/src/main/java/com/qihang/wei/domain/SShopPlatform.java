package com.qihang.wei.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 电商平台配置表
 * @TableName s_shop_platform
 */
@Data
public class SShopPlatform implements Serializable {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 平台名
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
     * 描述
     */
    private String remark;

    /**
     * 服务url
     */
    private String serverUrl;

    /**
     * 回调url
     */
    private String redirectUrl;

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