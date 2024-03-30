package com.qihang.kwai.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName sys_platform
 */
@Data
public class SysPlatform implements Serializable {
    /**
     * 
     */
    private Integer id;

    /**
     * 平台名
     */
    private String name;

    /**
     * 平台编码
     */
    private String code;

    /**
     * 
     */
    private String appKey;

    /**
     * 
     */
    private String appSecret;

    /**
     * 平台回调uri
     */
    private String redirectUri;

    /**
     * 接口访问地址
     */
    private String serverUrl;

    private static final long serialVersionUID = 1L;
}