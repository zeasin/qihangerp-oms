package cn.qihangerp.model.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 订单处理工作台-订单商品行VO
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderWorkbenchItemVo {
    private Long id;
    private Long orderId;
    private String orderNum;
    private String subOrderNum;
    /** 商品行角色：0主订单原始行 1子订单履约行 */
    private Integer itemRole;
    private String itemRoleName;
    /** 来源订单明细ID */
    private Long sourceOrderItemId;
    /** 排序号 */
    private Integer sortNo;
    private Long goodsId;
    private Long goodsSkuId;
    private String goodsTitle;
    private String goodsImg;
    private String goodsSpec;
    private String skuNum;
    private String skuId;
    private String barcode;
    /** 商品编码 */
    private String goodsNum;
    private BigDecimal goodsPrice;
    private BigDecimal itemAmount;
    private BigDecimal discountAmount;
    private BigDecimal payment;
    private Integer quantity;
    private Integer refundCount;
    private Integer refundStatus;
    /** 发货方式：0物流 1无需物流 */
    private Integer shipType;
    /** 发货状态 */
    private Integer shipStatus;
    private String waybillCode;
    private String remark;
}
