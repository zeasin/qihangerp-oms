package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 备货表
 * @TableName erp_ship_stock_up
 */
@Data
public class ErpShipStockUp implements Serializable {
    /**
     * 
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * erp订单id
     */
    private Long saleOrderId;
    private Long shopId;

    /**
     * erp订单itemid
     */
    private Long saleOrderItemId;

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
    private Long specId;

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