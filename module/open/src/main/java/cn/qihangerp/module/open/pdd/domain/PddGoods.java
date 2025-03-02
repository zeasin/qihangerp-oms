package cn.qihangerp.module.open.pdd.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * pdd商品表
 * @TableName pdd_goods
 */
@TableName("oms_pdd_goods")
@Data
public class PddGoods implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 商品编码
     */
    private Long goodsId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品总数量
     */
    private Long goodsQuantity;

    /**
     * 是否多sku，0-单sku，1-多sku
     */
    private Integer isMoreSku;

    /**
     * 是否在架上，0-下架中，1-架上
     */
    private Integer isOnsale;

    /**
     * 商品缩略图
     */
    private String thumbUrl;

    /**
     * 商品创建时间的时间戳
     */
    private Long createdAt;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * erp商品id
     */
    private Long oGoodsId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    @TableField(exist = false)
    private List<PddGoodsSku> skuList;

    private static final long serialVersionUID = 1L;
}