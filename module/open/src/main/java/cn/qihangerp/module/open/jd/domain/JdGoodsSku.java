package cn.qihangerp.module.open.jd.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 
 * @TableName jd_goods_sku
 */
@TableName("oms_jd_goods_sku")
@Data
public class JdGoodsSku implements Serializable {
    /**
     * 
     */
    private String id;



    /**
     * 
     */
    private Long wareId;

    /**
     * 
     */
    private Long skuId;

    private Long shopId;

    /**
     * 
     */
    private Integer status;

    /**
     * 
     */
    private BigDecimal jdPrice;

    /**
     * 
     */
    private String outerId;

    /**
     * 
     */
    private String barCode;

    /**
     * 
     */
    private String logo;

    /**
     * 
     */
    private String saleAttrs;

    /**
     * 
     */
    private String skuName;

    /**
     * 
     */
    private Integer stockNum;

    /**
     * 
     */
    private Date modified;

    /**
     * 
     */
    private Date created;

    /**
     * 
     */
    private String currencySpuId;

    /**
     * erp商品id
     */
    private String oGoodsId;

    /**
     * erp商品sku id
     */
    private Long oGoodsSkuId;

    private static final long serialVersionUID = 1L;

}