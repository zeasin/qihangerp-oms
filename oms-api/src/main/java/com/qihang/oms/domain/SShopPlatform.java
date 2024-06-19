package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
    @TableId(value = "id", type = IdType.AUTO)
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