package cn.qihangerp.module.order.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 线下渠道退款表
 * @TableName offline_refund
 */
@Data
public class OfflineRefund implements Serializable {
    /**
     * 主键id
     */
    private Long id;

    /**
     * 类型（10退货退款；11仅退款；20换货；）
     */
    private Integer type;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 退款单号
     */
    private String refundNum;

    /**
     * 订单号
     */
    private String orderId;

    /**
     * 子订单号
     */
    private String orderItemId;

    /**
     * 订单id
     */
    private String orderNum;

    /**
     * 状态（10005等待卖家处理 10006等待卖家发货 10011退款关闭 10010退款完成 10020售后成功 10021售后失败 10090退款中 10091换货成功 10092换货失败 ）
     */
    private Integer status;

    /**
     * 备注
     */
    private String remark;

    /**
     * 
     */
    private Date createTime;

    /**
     * 
     */
    private String createBy;

    /**
     * 
     */
    private Date updateTime;

    /**
     * 
     */
    private Date updateBy;

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
     * 子订单金额
     */
    private Double itemAmount;

    /**
     * 退款金额
     */
    private Double refundFee;

    /**
     * 买家是否需要退货。可选值:1(是),0(否)
     */
    private Integer hasGoodReturn;

    /**
     * 退货数量
     */
    private Long refundQuantity;

    /**
     * 退货物流公司
     */
    private String returnLogisticsCompany;

    /**
     * 退货物流单号
     */
    private String returnLogisticsCode;

    /**
     * 收货时间
     */
    private Date receiveTime;

    private static final long serialVersionUID = 1L;
}