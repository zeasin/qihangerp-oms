package cn.qihangerp.module.order.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 备货表（打单加入备货清单）
 * @TableName o_ship_stock_up
 */
@Data
public class OShipStockUp implements Serializable {
    /**
     *
     */
    private String id;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * erp订单id
     */
    private String saleOrderId;

    /**
     * erp订单itemid
     */
    private String saleOrderItemId;

    /**
     * 订单编号
     */
    private String orderNum;

    /**
     * 原始订单skuid
     */
    private String originalSkuId;

    /**
     * erp系统商品id
     */
    private Long goodsId;

    /**
     * erp系统商品规格id
     */
    private String specId;

    /**
     * 商品标题
     */
    private String goodsTitle;

    /**
     * 商品图片
     */
    private String goodsImg;

    /**
     * 商品规格
     */
    private String goodsSpec;

    /**
     * 商品编码
     */
    private String goodsNum;

    /**
     * 商品规格编码
     */
    private String specNum;

    /**
     * 商品数量
     */
    private Integer quantity;

    /**
     * 状态0待备货1备货中2已出库3已发货
     */
    private Integer status;

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