//package cn.qihangerp.domain;
//
////import com.baomidou.mybatisplus.annotation.IdType;
////import com.baomidou.mybatisplus.annotation.TableId;
//import com.baomidou.mybatisplus.annotation.IdType;
//import com.baomidou.mybatisplus.annotation.TableId;
//import lombok.Data;
//
//import java.io.Serializable;
//import java.math.BigDecimal;
//
///**
// * 商品规格库存管理
// * @TableName o_goods_sku
// */
//@Data
//public class OGoodsSku implements Serializable {
//    /**
//     * 主键id
//     */
//    @TableId(value = "id", type= IdType.AUTO)
//    private String id;
//    private String goodsId;
//
//    /**
//     * 商品id
//     */
//    private String outerErpGoodsId;
//
//
//    /**
//     * skuId(唯一)
//     */
//    private String outerErpSkuId;
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
//    private Long colorId;
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
//    private Long sizeId;
//
//    /**
//     * 尺码值
//     */
//    private String sizeValue;
//
//    /**
//     * 款式id
//     */
//    private Long styleId;
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
//
//    /**
//     * 建议零售价
//     */
//    private BigDecimal retailPrice;
//    private BigDecimal purPrice;
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
//    private String volume;
//    private static final long serialVersionUID = 1L;
//
//}