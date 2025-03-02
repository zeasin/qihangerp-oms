package cn.qihangerp.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * 店铺平台配置表
 * @TableName o_shop_platform
 */
@Data
public class OShopPlatform implements Serializable {
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

    private Integer sort;

    /**
     * 状态（0启用1关闭）
     */
    private String status;

    private static final long serialVersionUID = 1L;
}