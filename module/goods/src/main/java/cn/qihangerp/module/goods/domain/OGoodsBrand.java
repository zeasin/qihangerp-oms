package cn.qihangerp.module.goods.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * @TableName o_goods_brand
 */
@Data
public class OGoodsBrand implements Serializable {
    /**
     * 主键ID
     */
    private Integer id;

    /**
     * 品牌名
     */
    private String name;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 
     */
    private String createBy;

    /**
     * 
     */
    private Date createTime;

    /**
     * 
     */
    private String updateBy;

    /**
     * 
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;
}