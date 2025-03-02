package cn.qihangerp.module.open.jd.domain;

import java.io.Serializable;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 *
 * @TableName jd_vc_order_item
 */
@TableName("oms_jd_vc_order_item")
@Data
public class JdVcOrderItem implements Serializable {
    /**
     *
     */
    private Long id;

    /**
     * 外键id
     */
    private Long jdVcOrderId;

    /**
     * 客单编号
     */
    private Long customOrderId;

    /**
     * 京东商品编码
     */
    private String sku;

    /**
     * 商品名称
     */
    private String wareName;

    /**
     * 商品UPC编码
     */
    private String upc;

    /**
     * 商品数量
     */
    private Integer wareNum;

    /**
     * 京东价
     */
    private BigDecimal jdPrice;

    /**
     * 优惠价
     */
    private BigDecimal discount;

    /**
     * 采购价
     */
    private BigDecimal cost;

    /**
     * 采购单号
     */
    private String poId;

    /**
     * 退货单号
     */
    private String roId;

    /**
     * erp商品id
     */
    private String oGoodsId;

    /**
     * erp商品sku id
     */
    private String oGoodsSkuId;

    private static final long serialVersionUID = 1L;
}
