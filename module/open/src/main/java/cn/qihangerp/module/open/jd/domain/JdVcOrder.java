package cn.qihangerp.module.open.jd.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 *
 * @TableName jd_vc_order
 */
@TableName("oms_jd_vc_order")
@Data
public class JdVcOrder implements Serializable {
    /**
     *
     */
    private Long id;

    /**
     * 客单编号
     */
    private Long customOrderId;

    /**
     * 支付金额
     */
    private BigDecimal pay;

    /**
     * 操作状态:5 新订单；10等待发货；16发货完成
     */
    private Integer operatorState;

    /**
     * 订单状态:7 新订单；10等待发货；16等待确认收货；19订单完成；22锁定，29删除
     */
    private Integer orderState;

    /**
     * 收货人姓名
     */
    private String consigneeName;

    /**
     * 固定电话
     */
    private String telephone;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 收货地址
     */
    private String address;

    /**
     * 订单备注
     */
    private String orderRemark;

    /**
     * 订购日期/订单生成时间
     */
    private Date orderCreateDate;

    /**
     * 支付分类: COD, NON_COD
     */
    private String paymentCategory;

    /**
     * 支付分类名称: 货到付款, 在线支付
     */
    private String paymentCategoryDispName;

    /**
     * 创建日期
     */
    private Date createDate;

    /**
     * 下单账号
     */
    private String pin;

    /**
     * 退款标识
     */
    private Integer refundSourceFlag;

    /**
     * 省份id
     */
    private Integer provinceId;

    /**
     * 省份名称
     */
    private String provinceName;

    /**
     * 市id
     */
    private Integer cityId;

    /**
     * 市名称
     */
    private String cityName;

    /**
     * 县id
     */
    private Integer countyId;

    /**
     * 县名称
     */
    private String countyName;

    /**
     * 镇id
     */
    private Integer townId;

    /**
     * 镇名称
     */
    private String townName;

    /**
     * 厂商备注
     */
    private String memoByVendor;

    /**
     * 父单号
     */
    private Long parentOrderId;

    /**
     * 商品编号
     */
    private String sku;

    /**
     * 商品名称
     */
    private String commodityName;

    /**
     * 商品数量
     */
    private Integer commodityNum;

    /**
     * 京东价
     */
    private BigDecimal jdPrice;

    /**
     * 优惠价
     */
    private BigDecimal discount;

    /**
     * 优惠金额
     */
    private BigDecimal reduceCount;

    /**
     * 总运费
     */
    private BigDecimal totalCarriage;

    /**
     * 采购价
     */
    private BigDecimal cost;

    /**
     * 品牌名称
     */
    private String branchName;

    /**
     * 更新时间
     */
    private Long updateDate;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 系统创建时间
     */
    private Date createTime;

    /**
     * 系统更新时间
     */
    private Date updateTime;

    @TableField(exist = false)
    private List<JdVcOrderItem> items;
    private static final long serialVersionUID = 1L;
}