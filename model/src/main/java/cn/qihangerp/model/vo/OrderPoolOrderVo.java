package cn.qihangerp.model.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 订单处理工作台-状态池订单行VO（主订单行与子订单行统一平铺）
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderPoolOrderVo {
    /** 订单ID */
    private Long id;
    /** 平台订单号 */
    private String orderNum;
    /** 订单角色：0主订单 1子订单 */
    private Integer orderRole;
    /** 订单模式 0店铺/1手工/2补发 */
    private Integer orderMode;
    private String orderRoleName;
    /** 审核状态：0待审核 1已放行 2已转异常 3已拆单 */
    private Integer auditStatus;
    private String auditStatusName;
    private Long shopId;
    /** 店铺类型（平台） */
    private Integer shopType;
    private Long merchantId;
    /** 订单状态 */
    private Integer orderStatus;
    /** 发货状态 */
    private Integer shipStatus;
    /** 取号状态 */
    private Integer waybillStatus;
    private String waybillCode;
    private String waybillCompany;
    private BigDecimal goodsAmount;
    private BigDecimal postFee;
    private BigDecimal amount;
    private BigDecimal payment;
    private String receiverName;
    private String receiverMobile;
    private String province;
    private String city;
    private String town;
    private String address;
    private String buyerMemo;
    private String sellerMemo;
    /** 标签ID列表（逗号分隔） */
    private String tag;
    /** 下单时间 */
    private LocalDateTime orderTime;
    private LocalDateTime createTime;

    /** 子订单数量（主订单行） */
    private Integer childCount;
    /** 是否已拆分（主订单行） */
    private Boolean hasChildren;
    /** 已拆分标记：主单存在有效拆分子单 */
    private Boolean splitFlag;
    /** 拆分子单所属主单ID（子单行有值） */
    private Long parentOrderId;
    /** 是否可放行 */
    private Boolean canRelease;
    /** 不可放行原因（可放行为空） */
    private String canReleaseMsg;
    /** 面单账号ID（选填分配） */
    private Long waybillAccountId;
    /** 是否已分配面单账号 */
    private Boolean allocated;
    /** 商品摘要 */
    private String goodsSummary;
    /** 款式编码（明细去重逗号拼接） */
    private String skuNumText;
    /** 商品编码（明细去重逗号拼接） */
    private String goodsNumText;
    /** 明细首图 */
    private String firstImage;
    /** 商品款数 */
    private Integer itemCount;
    /** 商品件数合计 */
    private Integer totalQuantity;
    /** 实际发货时间 */
    private LocalDateTime shippingTime;
    /** 平台最晚发货时间（epoch秒） */
    private Long latestDeliveryTime;

    /** 子订单行（主订单行内嵌：拆分子订单） */
    private List<OrderPoolOrderVo> children;

    /** 商品明细全量 */
    private List<OrderPoolItemVo> items;
}
