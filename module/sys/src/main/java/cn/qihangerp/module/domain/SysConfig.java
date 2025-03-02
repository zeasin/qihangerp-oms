package cn.qihangerp.module.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 参数配置表
 * @TableName sys_config
 */
@Data
public class SysConfig implements Serializable {
    /**
     * 参数主键
     */
    private Integer configId;

    /**
     * 参数名称
     */
    private String configName;

    /**
     * 参数键名
     */
    private String configKey;

    /**
     * 参数键值
     */
    private String configValue;

    /**
     * 系统内置（Y是 N否）
     */
    private String configType;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新者
     */
    private String updateBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 备注
     */
    private String remark;

    private static final long serialVersionUID = 1L;
}