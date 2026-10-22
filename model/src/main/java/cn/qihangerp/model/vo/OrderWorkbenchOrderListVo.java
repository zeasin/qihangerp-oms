package cn.qihangerp.model.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 订单处理工作台-订单列表/树节点VO（主订单与子订单通用）
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderWorkbenchOrderListVo {
    private Long id;
    /** 订单模式：0店铺订单 1手工订单 */
    private Integer orderMode;
    /** 平台订单号 */
    private String orderNum;
    private Integer shopType;
    private Long shopId;
    private Long merchantId;
    /** 订单角色：0主订单 1子订单 */
    private Integer orderRole;
    private String orderRoleName;
    /** 审核状态：0待审核 1已审核通过 2已转异常 3已拆单 */
    private Integer auditStatus;
    private String auditStatusName;
    /** 审核类型：0自动审核 1人工审核 */
    private Integer auditType;
    private String auditTypeName;
    private LocalDateTime auditTime;
    private String auditBy;
    private String auditRemark;
    /** 订单状态 */
    private Integer orderStatus;
    /** 发货状态 */
    private Integer shipStatus;
    /** 取号状态 */
    private Integer waybillStatus;
    /** 发货分配状态 */
    private Integer distStatus;
    private BigDecimal goodsAmount;
    private BigDecimal postFee;
    private BigDecimal amount;
    private BigDecimal payment;
    private BigDecimal merchantAmount;
    private String receiverName;
    private String receiverMobile;
    private String province;
    private String city;
    private String town;
    private String address;
    private String buyerMemo;
    private String sellerMemo;
    private String remark;
    private String tag;
    private String waybillCode;
    private String waybillCompany;
    private LocalDateTime orderTime;
    /** 订单完成时间（毫秒时间戳） */
    private Long orderFinishTime;
    private LocalDateTime createTime;
    /** 是否已拆分子订单 */
    private Boolean hasChildren;
    /** 子订单数量 */
    private Integer childCount;
}
