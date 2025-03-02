package cn.qihangerp.module.open.wei.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 视频号小店退款
 * @TableName oms_wei_refund
 */
@Data
public class OmsWeiRefund implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 售后单号
     */
    private String afterSaleOrderId;

    /**
     * 售后单当前状态，参考：
USER_CANCELD	用户取消申请
MERCHANT_PROCESSING	商家受理中
MERCHANT_REJECT_REFUND	商家拒绝退款
MERCHANT_REJECT_RETURN	商家拒绝退货退款
USER_WAIT_RETURN	待买家退货
RETURN_CLOSED	退货退款关闭
MERCHANT_WAIT_RECEIPT	待商家收货
MERCHANT_OVERDUE_REFUND	商家逾期未退款
MERCHANT_REFUND_SUCCESS	退款完成
MERCHANT_RETURN_SUCCESS	退货退款完成
PLATFORM_REFUNDING	平台退款中
PLATFORM_REFUND_FAIL	平台退款失败
USER_WAIT_CONFIRM	待用户确认
MERCHANT_REFUND_RETRY_FAIL	商家打款失败，客服关闭售后
MERCHANT_FAIL	售后关闭
USER_WAIT_CONFIRM_UPDATE	待用户处理商家协商
USER_WAIT_HANDLE_MERCHANT_AFTER_SALE	待用户处理商家代发起的售后申请
     */
    private String status;

    /**
     * 买家身份标识
     */
    private String openid;

    /**
     * 买家在开放平台的唯一标识符，若当前视频号小店已绑定到微信开放平台账号下会返回
     */
    private String unionid;

    /**
     * 商品spuid
     */
    private String productId;

    /**
     * 商品skuid
     */
    private String skuId;

    /**
     * 售后数量
     */
    private Integer count;

    /**
     * 是否极速退款RefundInfo
     */
    private String fastRefund;

    /**
     * 标明售后单退款直接原因, 枚举值参考 RefundReason
     */
    private Integer refundReason;

    /**
     * 退款金额（分）
     */
    private Integer refundAmount;

    /**
     * 快递单号
     */
    private String returnWaybillId;

    /**
     * 物流公司id
     */
    private String returnDeliveryId;

    /**
     * 物流公司名称
     */
    private String returnDeliveryName;

    /**
     * 售后相关商品信息JSON
     */
    private String merchantUploadInfo;

    /**
     * 售后单创建时间戳
     */
    private Integer createTime;

    /**
     * 售后单更新时间戳
     */
    private Integer updateTime;

    /**
     * 退款原因
     */
    private String reason;

    /**
     * 退款原因解释
     */
    private String reasonText;

    /**
     * 售后类型。REFUND:退款；RETURN:退货退款。
     */
    private String type;

    /**
     * 订单号，该字段可用于获取订单
     */
    private String orderId;

    /**
     * detail json
     */
    private String details;

    /**
     * 纠纷id，该字段可用于获取纠纷信息
     */
    private String complaintId;

    /**
     * 微信支付退款的响应
     */
    private String refundResp;

    /**
     * 推送状态（0未推送；1推送成功；2推送失败）
     */
    private Integer pullStatus;

    /**
     * 订单审核时间
     */
    private Date pullTime;

    /**
     * 商品id(o_goods外键)
     */
    private Long oGoodsId;

    /**
     * 商品skuid(o_goods_sku外键)
     */
    private Long oGoodsSkuId;

    private static final long serialVersionUID = 1L;
}