package com.qihang.wei.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import lombok.Data;

/**
 * 商品规格库存管理
 * @TableName o_goods_sku
 */
@Data
public class OGoodsSku implements Serializable {
    /**
     * 主键id
     */
    private Long id;

    /**
     * 商品id
     */
    private Long erpGoodsId;

    /**
     * skuId(唯一)
     */
    private Long erpSkuId;

    /**
     * 规格名
     */
    private String skuName;

    /**
     * 规格编码
     */
    private String skuNum;

    /**
     * 颜色id
     */
    private Integer colorId;

    /**
     * 颜色值
     */
    private String colorValue;

    /**
     * 颜色图片
     */
    private String colorImage;

    /**
     * 尺码id
     */
    private Integer sizeId;

    /**
     * 尺码值
     */
    private String sizeValue;

    /**
     * 款式id
     */
    private Integer styleId;

    /**
     * 款式值
     */
    private String styleValue;

    /**
     * 库存条形码
     */
    private String barCode;

    /**
     * 预计采购价
     */
    private BigDecimal purPrice;

    /**
     * 建议批发价
     */
    private BigDecimal wholePrice;

    /**
     * 建议零售价
     */
    private BigDecimal retailPrice;

    /**
     * 单位成本
     */
    private BigDecimal unitCost;

    /**
     * 备注
     */
    private String remark;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 最低库存（预警）
     */
    private Integer lowQty;

    /**
     * 最高库存（预警）
     */
    private Integer highQty;

    /**
     * 0启用   1禁用
     */
    private Integer disable;

    private static final long serialVersionUID = 1L;
}