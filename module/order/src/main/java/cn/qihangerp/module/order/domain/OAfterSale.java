package cn.qihangerp.module.order.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * OMS售后处理表
 * @TableName o_after_sale
 */
@Data
public class OAfterSale implements Serializable {
    /**
     * 
     */
    private String id;

    /**
     * 类型（10退货；20换货；80补发；99订单拦截；）
     */
    private Integer type;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 店铺类型
     */
    private Integer shopType;
    private Integer hasGoodsSend;

    /**
     * 退款id（o_refund表主键）
     */
    private String refundId;

    /**
     * 订单号
     */
    private String orderNum;
    private String refundNum;

    /**
     * 子订单号
     */
    private String subOrderNum;

    /**
     * 订单id（o_order表主键id）
     */
    private String oOrderId;

    /**
     * 子订单id（o_order_item表主键id）
     */
    private String oOrderItemId;

    /**
     * 平台商品skuid
     */
    private Long skuId;

    /**
     * 售后数量
     */
    private Integer quantity;

    /**
     * 商品标题
     */
    private String title;

    /**
     * 商品图片
     */
    private String img;

    /**
     * sku描述
     */
    private String skuInfo;

    /**
     * sku编码
     */
    private String skuCode;

    /**
     * 系统商品id（o_goods表主键id）
     */
    private String oGoodsId;

    /**
     * 系统商品skuId（o_goods表主键id）
     */
    private String oGoodsSkuId;

    /**
     * 发货物流单号
     */
    private String sendLogisticsCode;

    /**
     * 退回人信息json
     */
    private String returnInfo;

    /**
     * 退回快递单号
     */
    private String returnLogisticsCode;

    /**
     * 退回物流公司名称
     */
    private String returnLogisticsCompany;

    /**
     * 收件人姓名
     */
    private String receiverName;

    /**
     * 收件人联系电话
     */
    private String receiverTel;

    /**
     * 省
     */
    private String receiverProvince;

    /**
     * 市
     */
    private String receiverCity;

    /**
     * 区
     */
    private String receiverTown;

    /**
     * 收件人详细地址
     */
    private String receiverAddress;

    /**
     * 发货快递单号（补发、换货发货）
     */
    private String reissueLogisticsCode;

    /**
     * 发货快递公司
     */
    private String reissueLogisticsCompany;

    /**
     * 状态:0待进一步处理；1已发出；2已完成(已收货);
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

    private static final long serialVersionUID = 1L;
}