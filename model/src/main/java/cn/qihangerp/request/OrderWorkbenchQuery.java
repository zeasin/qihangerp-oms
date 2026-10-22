package cn.qihangerp.request;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 订单处理工作台查询对象
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderWorkbenchQuery {
    /** 订单号：支持多号输入，换行/英文逗号/中文逗号/分号/空白分隔，上限50个 */
    private String orderNums;
    /** 状态池：pending待审核 / exception异常池 / released待放行 / shipped已发货（pool 优先） */
    private String pool;
    /** 店铺ID */
    private Long shopId;
    /** 店铺类型（平台） */
    private Integer shopType;
    /** 商户ID（前端不传时由 Controller 按登录身份填充） */
    private Long merchantId;
    /** 订单状态 */
    private Integer orderStatus;
    /** 审核状态：0待审核 1已审核通过 2已转异常 */
    private Integer auditStatus;
    /** 发货状态 */
    private Integer shipStatus;
    /** 取号状态 */
    private Integer waybillStatus;
    /** 商品关键词：匹配商品标题/规格编码/条码（模糊） */
    private String goodsKeyword;
    /** 订单时间起（yyyy-MM-dd 或 yyyy-MM-dd HH:mm:ss） */
    private String orderTimeBegin;
    /** 订单时间止（yyyy-MM-dd 或 yyyy-MM-dd HH:mm:ss） */
    private String orderTimeEnd;
    /** 店铺ID列表（多选，逗号分隔） */
    private String shopIds;
    /** 收件人姓名（模糊） */
    private String receiverName;
    /** 收件人手机号（模糊） */
    private String receiverMobile;
    /** 收货省份 */
    private String province;
    /** 收货城市 */
    private String city;
    /** 收货区/县 */
    private String district;
    /** 订单模式：0店铺 1手工 2补发 */
    private Integer orderMode;
    /** 发货主体类型（匹配订单明细 ship_type：200仓库/300供应商） */
    private Integer shipperType;
    /** 发货主体ID（匹配订单明细 shipper_id） */
    private Long shipperId;
    /** 发货方分类（仅待发货池生效）：self店铺自用 / supplier供应商 / cloud云仓 */
    private String shipperCategory;
    /** 最晚发货时间起（epoch 秒） */
    private Long latestDeliveryBegin;
    /** 最晚发货时间止（epoch 秒） */
    private Long latestDeliveryEnd;
    /** 是否含买家留言（true=buyer_memo 非空） */
    private Boolean hasBuyerMemo;
    /** 标签ID列表（多选，逗号分隔；命中任一标签即返回） */
    private String tagIds;
    /** 买家留言（模糊） */
    private String buyerMemo;
    /** 卖家备注（模糊） */
    private String sellerMemo;
    /** 实付金额下限 */
    private BigDecimal amountMin;
    /** 实付金额上限 */
    private BigDecimal amountMax;
    /** 排序列白名单：shippingTime发货时间 / payment实付金额 / orderTime下单时间（空=默认下单时间倒序） */
    private String sortField;
    /** 排序方向：ascending正序 / 其他=倒序 */
    private String sortOrder;
}
