package cn.qihangerp.module.order.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 发货记录表
 * @TableName o_order_shipping
 */
@Data
public class OShipment implements Serializable {
    /**
     * 
     */
    private String id;

    /**
     * 店铺id
     */
    private Long shopId;


    private Integer shippingType;//发货类型（1订单发货2商品补发3商品换货）
    private String orderNums;//发货的所有订单号，以逗号隔开
    private String subOrderNums;//发货的所有子订单号，以逗号隔开
    private String receiverName;
    private String receiverMobile;
    private String province;
    private String city;
    private String town;
    private String address;

    /**
     * 物流公司
     */
    private String logisticsCompany;
    private String logisticsCompanyCode;

    /**
     * 物流单号
     */
    private String waybillCode;

    /**
     * 物流费用
     */
    private Integer shippingFee;

    /**
     * 发货时间
     */
    private Date shippingTime;

    /**
     * 发货操作人
     */
    private String shippingOperator;

    /**
     * 物流状态（1运输中2已完成）
     */
    private Integer shippingStatus;

    /**
     * 包裹重量
     */
    private Double packageWeight;

    /**
     * 包裹长度
     */
    private Double packageLength;

    /**
     * 包裹宽度
     */
    private Double packageWidth;

    /**
     * 包裹高度
     */
    private Double packageHeight;

    /**
     * 打包操作人
     */
    private String packageOperator;

    /**
     * 打包时间
     */
    private Date packageTime;

    /**
     * 包裹内容JSON
     */
    private String packages;
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

    private static final long serialVersionUID = 1L;
}