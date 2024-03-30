package com.qihang.kwai.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import lombok.Data;

/**
 * 快手订单
 * @TableName kwai_order
 */
@Data
public class KwaiOrder implements Serializable {
    /**
     * dc订单id
     */
    private Long id;

    /**
     * 快手订单id
     */
    private Long oid;

    /**
     * 创建时间
     */
    private Long createtime;

    /**
     * 折扣价格
     */
    private BigDecimal discountfee;

    /**
     * 运费
     */
    private BigDecimal expressfee;

    /**
     * sku数量
     */
    private Integer num;

    /**
     * 收件人姓名
     */
    private String consignee;

    /**
     * 收件人手机号
     */
    private String mobile;

    /**
     * 支付时间
     */
    private Long paytime;

    /**
     * 买家备注
     */
    private String buyerremark;

    /**
     * 卖家备注
     */
    private String sellerremark;

    /**
     * 订单状态
     */
    private Integer status;

    /**
     * 是否退款 0未退款 1该订单申请过退款
     */
    private Integer refund;

    /**
     * 子订单商品总价
     */
    private BigDecimal totalfee;

    /**
     * 省
     */
    private String province;

    /**
     * 市
     */
    private String city;

    /**
     * 区
     */
    private String district;

    /**
     * 详细地址
     */
    private String address;

    /**
     * 快递公司
     */
    private String logisticscompany;

    /**
     * 快递公司编码
     */
    private String logisticscompanycode;

    /**
     * 快递单号
     */
    private String logisticscode;

    /**
     * 订单审核状态（0待审核1已审核）
     */
    private Integer auditstatus;

    /**
     * 创建时间
     */
    private Long createon;

    /**
     * 发货状态（0待出库1拣货中2已拣货3已出库4已发货）
     */
    private Integer sendstatus;

    /**
     * 发货时间（仓库真实发货时间）
     */
    private Long sendtime;

    private static final long serialVersionUID = 1L;
}