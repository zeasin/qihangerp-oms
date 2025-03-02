package cn.qihangerp.module.open.jd.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 京东自营退款表
 * @TableName jd_vc_refund
 */
@TableName("oms_jd_vc_refund")
@Data
public class JdVcRefund implements Serializable {
    /**
     * 售前退款数据唯一标示
     */
    private Long id;

    /**
     * 客户订单号
     */
    private Long customOrderId;

    /**
     * 退款申请金额
     */
    private BigDecimal roApplyFee;

    /**
     * 退款申请时间
     */
    private Date roApplyDate;

    /**
     * 订单生成时间
     */
    private Date orderCreateDate;

    /**
     * 退款状态更新时间
     */
    private Date modifiedDate;

    /**
     * 审核状态0未审核 1审核通过 2审核不通过
     */
    private Integer approvalState;

    /**
     * 订单状态orderState 7 新订单 10等待发货 16等待确认收货 19订单完成 22锁定 29删除
     */
    private Integer orderState;

    /**
     * 	操作状态 operatorState 5 新订单 10等待发货 16发货完成
     */
    private Integer operatorState;

    /**
     * 申请单号
     */
    private Long roPreNo;

    /**
     * 退款申请账户
     */
    private String roAccount;

    /**
     * 退款申请理由
     */
    private String roReason;

    /**
     * 审核意见
     */
    private String approvalSuggestion;

    /**
     * 仓id
     */
    private Integer vendorStoreId;

    /**
     * 仓名称
     */
    private String vendorStoreName;

    /**
     * 返回商品结果集合JSON
     */
    private String orderDetailList;

    /**
     * 商品编码
     */
    private String skuId;

    /**
     * 商品名称
     */
    private String commodityName;

    /**
     * 退货数量
     */
    private Integer commodityNum;

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

    /**
     * 商品id(o_goods外键)
     */
    private String oGoodsId;

    /**
     * 商品skuid(o_goods_sku外键)
     */
    private String oGoodsSkuId;

    private static final long serialVersionUID = 1L;
}