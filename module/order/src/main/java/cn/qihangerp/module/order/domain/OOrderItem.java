package cn.qihangerp.module.order.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单明细表
 * @TableName o_order_item
 */
@Data
public class OOrderItem implements Serializable {
    /**
     * id，自增
     */
    private String id;

    /**
     * 订单ID（o_order外键）
     */
    private String orderId;

    /**
     * 子订单号（第三方平台）
     */
    private String subOrderNum;
    private String orderNum;

    /**
     * 第三方平台skuId
     */
    private String skuId;

    /**
     * erp系统商品id
     */
    private Long goodsId;

    /**
     * erp系统商品规格id
     */
    private String goodsSkuId;

    /**
     * 商品标题
     */
    private String goodsTitle;

    /**
     * 商品图片
     */
    private String goodsImg;

    /**
     * 商品编码
     */
    private String goodsNum;

    /**
     * 商品规格
     */
    private String goodsSpec;

    /**
     * 商品规格编码
     */
    private String skuNum;

    /**
     * 商品单价
     */
    private Double goodsPrice;

    /**
     * 子订单金额
     */
    private Double itemAmount;
    private Double discountAmount;
    private Double payment;

    /**
     * 商品数量
     */
    private Integer quantity;

    /**
     * 备注
     */
    private String remark;

    /**
     * 已退货数量
     */
    private Integer refundCount;

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 
     */
    private Integer refundStatus;
    private Integer orderStatus;
    private Integer hasPushErp;//是否推送到ERP


    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 更新人
     */
    private String updateBy;

    private static final long serialVersionUID = 1L;


}