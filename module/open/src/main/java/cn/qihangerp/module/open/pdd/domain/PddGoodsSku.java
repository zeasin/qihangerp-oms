package cn.qihangerp.module.open.pdd.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * pdd商品SKU表
 * @TableName pdd_goods_sku
 */
@TableName("oms_pdd_goods_sku")
@Data
public class PddGoodsSku implements Serializable {
    /**
     * 
     */
    private String id;

    /**
     * sku编码
     */
    private Long skuId;

    /**
     * pdd商品编码
     */
    private Long goodsId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品缩略图
     */
    private String thumbUrl;

    /**
     * 商家外部编码（sku）
     */
    private String outerId;

    /**
     * sku库存
     */
    private Long skuQuantity;

    /**
     * 规格名称
     */
    private String spec;

    /**
     * sku是否在架上，0-下架中，1-架上
     */
    private Integer isSkuOnsale;

    /**
     * 商品id(o_goods外键)
     */
    private String oGoodsId;

    /**
     * 商品skuid(o_goods_sku外键)
     */
    private String oGoodsSkuId;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 修改时间
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;
}