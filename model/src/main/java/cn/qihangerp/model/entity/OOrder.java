package cn.qihangerp.model.entity;

import cn.qihangerp.model.vo.OrderDiscountVo;
import cn.qihangerp.model.vo.OrderItemListVo;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 订单表
 * @TableName o_order
 */
@Data
public class OOrder implements Serializable {
    /**
     * 订单id，自增
     */
    @TableId(type = IdType.AUTO)
    private String id;

    /**
     * 主订单ID（父单=0；拆分子单指向主订单ID）
     */
    private Long parentOrderId;

    /**
     * 订单角色：0主订单 1拆分子订单
     */
    private Integer orderRole;

    /**
     * 来源订单ID（拆分子单追溯原始主订单）
     */
    private Long sourceOrderId;

    /**
     * 订单编号（第三方平台订单号）
     */
    private String orderNum;
    private int orderMode;

    /**
     * 店铺类型
     */
    private Integer shopType;

    /**
     * 店铺ID
     */
    private Long shopId;
    private Long merchantId;

    /**
     * 订单备注
     */
    private String remark;

    /**
     * 买家留言信息
     */
    private String buyerMemo;

    /**
     * 卖家留言信息
     */
    private String sellerMemo;

    /**
     * 标签
     */
    private String tag;

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 
     */
//    private Integer refundStatus;

    /**
     * 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；13已关闭；21待付款；22锁定，29删除，31售后中，101部分发货
     */
    private Integer orderStatus;

    /**
     * 审核状态：0待审核 1已审核通过 2已转异常 3已拆单
     */
    private Integer auditStatus;

    /**
     * 审核类型：0自动审核 1人工审核
     */
    private Integer auditType;

    /**
     * 审核时间
     */
    private LocalDateTime auditTime;

    /**
     * 审核人
     */
    private String auditBy;

    /**
     * 审核备注
     */
    private String auditRemark;

    /**
     * 平台状态编码
     */
    private String platformStatusCode;

    /**
     * 平台状态描述
     */
    private String platformStatusDesc;

    /**
     * 订单商品金额
     */
    private Double goodsAmount;
    private Double postFee;

    /**
     * 订单实际金额
     */
    private Double amount;
    private Double payment;
    /**
     * 订单改价折扣金额，单位元
     */
    private Double changeAmount;
    //平台优惠金额，单位：元
    private Double platformDiscount;
    //商家优惠金额，单位：元
    private Double sellerDiscount;
    private Double merchantAmount;//商家实收

    private String openAddressId;
    /**
     * 收件人姓名
     */
    private String receiverName;

    /**
     * 收件人手机号
     */
    private String receiverMobile;

    /**
     * 收件人地址
     */
    private String address;

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
    private String town;

    /**
     * 订单时间
     */
    private LocalDateTime orderTime;

    /**
     * 订单完成时间（时间戳毫秒）
     */
    private Long orderFinishTime;

    /**
     * 订单更新时间
     */
    private String orderModifiedTime;


    /**
     * 发货类型（0仓库发货；1供应商代发）
     */
//    private Integer shipType;
    private Integer shipStatus;
    private Integer distStatus;

    /**
     * 发货时间
     */
//    private LocalDateTime shippingTime;

    /**
     * 快递单号
     */
//    private String shippingNumber;

    /**
     * 物流公司
     */
//    private String shippingCompany;

    /**
     * 发货人
     */
//    private String shippingMan;

    /**
     * 发货费用
     */
//    private BigDecimal shippingCost;
    private Integer erpPushStatus;
    private String erpPushResult;
    private LocalDateTime erpPushTime;

    /**
     * 长
     */
//    private Double length;

    /**
     * 宽
     */
//    private Double width;

    /**
     * 高
     */
//    private Double height;

    /**
     * 重量
     */
//    private Double weight;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 销售员ID
     */
    private String salesmanId;

    /**
     * 销售员名称
     */
    private String salesmanName;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 更新人
     */
    private String updateBy;
    private String waybillCode;
    private String waybillCompany;
    private String waybillOrderId;
    private LocalDateTime shippingTime;
    /**
     * 最晚发货时间（epoch 秒）
     */
    private Long latestDeliveryTime;
    /**
     * 发货快递公司编码
     */
    private String shippingCompanyCode;
    /**
     * 平台回传发货状态
     */
    private Integer platformShipStatus;
    /**
     * 平台回传发货结果
     */
    private String platformShipResult;

    private Integer hasGift;//是否有礼品0没有，大于0表示有，-1表示全是礼品

    private String cancelReason;
    /**
     * 取号状态：0未取号 1已取号 2已打印 3已发货 10手动发货
     */
    private Integer waybillStatus;
    /**
     * 电子面单账号ID（发货分配）
     */
    private Long waybillAccountId;
    private Integer shareStatus; // 分账状态：0未分账，1已分账
    private LocalDateTime shareTime; // 分账时间

    private Integer settlementStatus; // 结算状态：0-未结算，1-已结算
    private Long settlementId; // 结算单ID
    private LocalDateTime settlementTime; // 结算时间

    @TableField(exist = false)
    private List<OOrderItem> itemList;
    /**
     * 订单items（详情）
     */
    @TableField(exist = false)
    private List<OrderItemListVo> itemVoList;

    /**
     * 订单优惠（详情）
     */
    @TableField(exist = false)
    private List<OrderDiscountVo> discounts;

    /**
     * 订单发货记录（详情）
     */
    @TableField(exist = false)
    private List<OOrderStocking> logistics;
//    private List<OShipment> logistics;


    private static final long serialVersionUID = 1L;

}