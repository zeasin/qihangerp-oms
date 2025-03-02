package cn.qihangerp.module.order.domain.bo;

import lombok.Data;

import java.util.List;

/**
 * 订单对象 erp_order
 *
 * @author qihang
 * @date 2024-01-05
 */
@Data
public class OfflineOrderCreateBo
{
    private static final long serialVersionUID = 1L;


    /** 订单编号 */
    private String orderNum;

    /** 店铺ID */
    private Long shopId;

    /** 买家留言信息 */
    private String buyerMemo;

    /** 备注 */
    private String remark;


    /** 商品金额 */
    private Double goodsAmount;

    /** 卖家优惠金额 */
    private Double sellerDiscount;

    /** 平台优惠金额 */
    private Double platformDiscount;

    /** 运费 */
    private Double postage;


    /** 收件人姓名 */
    private String receiverName;

    /** 收件人手机号 */
    private String receiverPhone;

    /** 收件人地址 */
    private String address;


    /** 省 */
    private String province;

    /** 市 */
    private String city;

    /** 区 */
    private String town;


    /** 订单明细信息 */
    private List<OfflineOrderCreateItemBo> itemList;

}
