package cn.qihangerp.module.open.jd.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 
 * @TableName jd_order_coupon
 */
@TableName("oms_jd_order_coupon")
@Data
public class JdOrderCoupon implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 订单编号
     */
    private Long orderId;

    /**
     * 京东sku编号。(只有30-单品促销优惠 此skuId才非空)
     */
    private String skuid;

    /**
     * 优惠类型: 20-套装优惠, 28-闪团优惠, 29-团购优惠, 30-单品促销优惠, 34-手机红包, 35-满返满送(返现), 39-京豆优惠,41-京东券优惠, 52-礼品卡优惠,100-店铺优惠
     */
    private String couponType;

    /**
     * 优惠金额。
     */
    private String couponPrice;

    private static final long serialVersionUID = 1L;
}