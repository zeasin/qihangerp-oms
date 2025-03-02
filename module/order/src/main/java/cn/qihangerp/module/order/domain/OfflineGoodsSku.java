package cn.qihangerp.module.order.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * OMS商品SKU表
 * @TableName offline_goods_sku
 */
@Data
public class OfflineGoodsSku implements Serializable {
    /**
     * 主键sku id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 外部erp系统商品id
     */
    private String oGoodsId;

    /**
     * 外部erp系统skuId(唯一)
     */
    private String oGoodsSkuId;

    /**
     * 商品名
     */
    private String goodsName;

    /**
     * 规格名
     */
    private String skuName;

    /**
     * 规格编码
     */
    private String skuCode;
    private String skuId;
    private Long shopId;

    /**
     * 颜色id
     */
    private Long colorId;

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
    private Long sizeId;

    /**
     * 尺码值(材质)
     */
    private String sizeValue;

    /**
     * 款式id
     */
    private Long styleId;

    /**
     * 款式值
     */
    private String styleValue;

    /**
     * 库存条形码
     */
    private String barCode;

    /**
     * 售价
     */
    private BigDecimal salePrice;

    /**
     * 备注
     */
    private String remark;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 更新人
     */
    private String updateBy;

    private static final long serialVersionUID = 1L;
}