//package cn.qihangerp.jd.domain;
//
//import java.io.Serializable;
//import java.math.BigDecimal;
//
//import lombok.Data;
//
///**
// * 京东自营采购订单明细表
// * @TableName jd_vc_purchase_order_item
// */
//@Data
//public class JdVcPurchaseOrderItem implements Serializable {
//    /**
//     *
//     */
//    private Long id;
//
//    /**
//     * 采购单号
//     */
//    private Long orderId;
//
//    /**
//     * 商品编号
//     */
//    private Long wareId;
//
//    /**
//     * 商品名称
//     */
//    private String wareName;
//
//    /**
//     * 采购价，单位元
//     */
//    private BigDecimal purchasePrice;
//
//    /**
//     * 原始采购数量
//     */
//    private Integer originalNum;
//
//    /**
//     * 回告数量或者采购数量
//     */
//    private Integer confirmNum;
//
//    /**
//     * 实收数量
//     */
//    private Integer actualNum;
//
//    /**
//     * 不满足原因（适用于非图书的）
//     */
//    private String nonDeliveryReason;
//
//    /**
//     * 采购总金额，单位元
//     */
//    private BigDecimal totoalPrice;
//
//    /**
//     * 备注
//     */
//    private String remark;
//
//    /**
//     * 库房ID
//     */
//    private Integer storeId;
//
//    /**
//     * 亚洲一号小件库
//     */
//    private String storeName;
//
//    /**
//     * 配送中心ID（配送机构）
//     */
//    private Integer deliverCenterId;
//
//    /**
//     * 配送中心名称
//     */
//    private String deliverCenterName;
//
//    private static final long serialVersionUID = 1L;
//}