package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 售后处理表
 * @TableName erp_sale_after_info
 */
@Data
public class ErpSaleAfterInfo implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 类型（10退货；20换货；80补发；99订单拦截；）
     */
    private Integer type;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 店铺类型
     */
    private Integer shopType;

    /**
     * 售后单号
     */
    private String afterSaleOrderId;

    /**
     * 订单号
     */
    private String orderId;

    /**
     * 子订单号
     */
    private String subOrderId;

    /**
     * 商品spuid
     */
    private String productId;

    /**
     * 商品skuid
     */
    private String skuId;

    /**
     * 数量
     */
    private Integer count;

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
     * ERP商品id
     */
    private Integer erpGoodsId;

    /**
     * ERP商品skuId
     */
    private Integer erpSkuId;

    /**
     * 退回人信息json
     */
    private String returnInfo;

    /**
     * 退回快递单号
     */
    private String returnWaybillCode;

    /**
     * 退回物流公司名称
     */
    private String returnCompany;

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
     * 发货快递单号（补发、换货发货、拦截订单发货）
     */
    private String shipWaybillCode;

    /**
     * 发货快递公司
     */
    private String shipCompany;

    /**
     * 状态:1已发出；2已完成(已收货);3已入库
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
    private String updateBy;

    private static final long serialVersionUID = 1L;
}