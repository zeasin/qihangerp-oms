package cn.qihangerp.module.order.domain.bo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单明细表
 * @TableName o_order_item
 */
@Data
public class OrderItemListBo implements Serializable {
    /**
     * id
     */
    private Integer shopId;
    private Integer refundStatus;
    private String subOrderNum;
    private String orderNum;
    private String startTime;
    private String endTime;

    /**
     * 第三方平台skuId
     */
    private String skuId;

    /**
     * erp系统商品id
     */
    private Long erpGoodsId;

    /**
     * erp系统商品规格id
     */
    private Long erpSkuId;

    /**
     * 商品编码
     */
    private String goodsNum;

    /**
     * 商品规格编码
     */
    private String skuNum;

    private Integer hasLink;//是否关联ERP商品
    private static final long serialVersionUID = 1L;


}