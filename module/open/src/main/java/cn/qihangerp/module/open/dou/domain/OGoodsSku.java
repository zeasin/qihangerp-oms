//package cn.qihangerp.dou.domain;
//
//import java.io.Serializable;
//import java.math.BigDecimal;
//import lombok.Data;
//
///**
// * OMS商品SKU表
// * @TableName o_goods_sku
// */
//@Data
//public class OGoodsSku implements Serializable {
//    /**
//     * 主键id
//     */
//    private String id;
//
//    /**
//     * 外键（o_goods）
//     */
//    private Long goodsId;
//
//    /**
//     * 外部erp系统商品id
//     */
//    private String outerErpGoodsId;
//
//    /**
//     * 外部erp系统skuId(唯一)
//     */
//    private String outerErpSkuId;
//
//    /**
//     * 商品名
//     */
//    private String goodsName;
//
//    /**
//     * 规格名
//     */
//    private String skuName;
//
//    /**
//     * 规格编码
//     */
//    private String skuCode;
//
//    /**
//     * 颜色id
//     */
//    private Integer colorId;
//
//    /**
//     * 颜色值
//     */
//    private String colorValue;
//
//    /**
//     * 颜色图片
//     */
//    private String colorImage;
//
//    /**
//     * 尺码id
//     */
//    private Integer sizeId;
//
//    /**
//     * 尺码值(材质)
//     */
//    private String sizeValue;
//
//    /**
//     * 款式id
//     */
//    private Integer styleId;
//
//    /**
//     * 款式值
//     */
//    private String styleValue;
//
//    /**
//     * 库存条形码
//     */
//    private String barCode;
//
//    /**
//     * 建议零售价
//     */
//    private BigDecimal retailPrice;
//
//    /**
//     * 单位成本
//     */
//    private BigDecimal unitCost;
//
//    /**
//     * 备注
//     */
//    private String remark;
//
//    /**
//     * 状态
//     */
//    private Integer status;
//
//    /**
//     * 最低库存（预警）
//     */
//    private Integer lowQty;
//
//    /**
//     * 最高库存（预警）
//     */
//    private Integer highQty;
//
//    /**
//     * 标签
//     */
//    private String tag;
//
//    /**
//     * erp商品体积
//     */
//    private String volume;
//
//    private static final long serialVersionUID = 1L;
//}