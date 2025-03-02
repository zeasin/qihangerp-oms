package cn.qihangerp.module.open.pdd.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 拼多多订单明细表
 * @TableName pdd_order_item
 */
@TableName("oms_pdd_order_item")
@Data
public class PddOrderItem implements Serializable {
    /**
     * id，自增
     */
    private Long id;

    /**
     * 订单编号
     */
    private String orderSn;

    /**
     * 拼多多商品id
     */
    private Long goodsId;

    /**
     * 拼多多商品skuid
     */
    private Long skuId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品图片
     */
    private String goodsImg;

    /**
     * 商品规格
     */
    private String goodsSpec;

    /**
     * 商品单价
     */
    private Double goodsPrice;

    /**
     * 商家外部编码（商品）
     */
    private String outerGoodsId;

    /**
     * 商家外部编码（sku）
     */
    private String outerId;

    /**
     * 商品数量
     */
    private Integer goodsCount;

    /**
     * 备注
     */
    private String remark;
    private String oGoodsId;
    private String oGoodsSkuId;

    private static final long serialVersionUID = 1L;
}