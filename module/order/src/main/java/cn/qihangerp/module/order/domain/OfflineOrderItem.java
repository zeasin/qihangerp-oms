package cn.qihangerp.module.order.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 渠道订单明细表
 * @TableName offline_order_item
 */
@Data
public class OfflineOrderItem implements Serializable {
    /**
     * id，自增
     */
    private Long id;

    /**
     * 订单ID（o_order外键）
     */
    private String orderId;

    /**
     * 订单号（第三方平台）
     */
    private String orderNum;

    /**
     * 子订单号（第三方平台）
     */
    private String subOrderNum;

    /**
     * 第三方平台skuId
     */
    private String skuId;

    /**
     * 商品id(o_goods外键)
     */
    private Long goodsId;

    /**
     * 商品skuid(o_goods_sku外键)
     */
    private Long goodsSkuId;

    /**
     * 商品标题
     */
    private String goodsTitle;

    /**
     * 商品图片
     */
    private String goodsImg;

    /**
     * 商品编码
     */
    private String goodsNum;

    /**
     * 商品规格
     */
    private String goodsSpec;

    /**
     * 商品规格编码
     */
    private String skuNum;

    /**
     * 商品单价
     */
    private Double goodsPrice;

    /**
     * 子订单金额
     */
    private Double itemAmount;

    /**
     * 实际支付金额
     */
    private Double payment;

    /**
     * 商品数量
     */
    private Integer quantity;

    /**
     * 备注
     */
    private String remark;

    /**
     * 已退货数量
     */
    private Integer refundCount;

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 
     */
    private Integer refundStatus;

    /**
     * 订单状态1：待发货，2：已发货，3：已完成，11已取消；21待付款
     */
    private Integer orderStatus;

    /**
     * 是否推送到ERP
     */
    private Integer hasPushErp;

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