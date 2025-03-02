package cn.qihangerp.module.order.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * OMS发货明细表
 * @TableName o_order_shipping_item
 */
@Data
public class OShipmentItem implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 发货表id
     */
    private String shippingId;

    /**
     * o_order表id
     */
    private String orderId;

    /**
     * o_order_item表id
     */
    private String orderItemId;

    /**
     * 订单编号（第三方平台）
     */
    private String orderNum;

    /**
     * 子订单号（第三方平台）
     */
    private String subOrderNum;

    private static final long serialVersionUID = 1L;
}