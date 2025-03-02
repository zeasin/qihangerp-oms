package cn.qihangerp.module.open.tao.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 订单优惠信息
 * @TableName tao_order_promotion
 */
@TableName("oms_tao_order_promotion")
@Data
public class TaoOrderPromotion implements Serializable {
    /**
     * 交易的主订单或子订单号
     */
    private Long id;

    /**
     * 优惠信息的名称
     */
    private String promotionName;

    /**
     * 优惠金额（免运费、限时打折时为空）,单位：元
     */
    private String discountFee;

    /**
     * 满就送商品时，所送商品的名称
     */
    private String giftItemName;

    /**
     * 赠品的宝贝id
     */
    private String giftItemId;

    /**
     * 满就送礼物的礼物数量
     */
    private String giftItemNum;

    /**
     * 优惠活动的描述
     */
    private String promotionDesc;

    /**
     * 优惠id，(由营销工具id、优惠活动id和优惠详情id组成，结构为：营销工具id-优惠活动id_优惠详情id，如mjs-123024_211143）
     */
    private String promotionId;

    /**
     * 分摊优惠金额（免运费、限时打折时为空）,单位：元
     */
    private String kdDiscountFee;

    /**
     * 若优惠项在主订单上，返回子订单的分摊信息
     */
    private String kdChildDiscountFee;

    private static final long serialVersionUID = 1L;
}