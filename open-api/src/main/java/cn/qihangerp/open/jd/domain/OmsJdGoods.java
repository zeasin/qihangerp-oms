package cn.qihangerp.open.jd.domain;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 京东商品表
 * @TableName oms_jd_goods
 */
@Data
public class OmsJdGoods implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 商品id
     */
    private Long wareId;

    /**
     * 商品名称
     */
    private String title;

    /**
     * 商品状态 -1：删除 1:从未上架 2:自主下架 4:系统下架 8:上架 513:从未上架待审 514:自主下架待审 516:系统下架待审 520:上架待审核 1028:系统下架审核失败
     */
    private Integer wareStatus;

    /**
     * 	商品外部ID,商家自行设置的ID（便于关联京东商品）
     */
    private String outerId;

    /**
     * 商品货号
     */
    private String itemNum;

    /**
     * 商品的条形码.UPC码,SN码,PLU码统称为条形码
     */
    private String barCode;

    /**
     * 商品最后一次修改时间
     */
    private String modified;

    /**
     * 商品创建时间，只读属性
     */
    private String created;

    /**
     * 最后下架时间
     */
    private Date offlineTime;

    /**
     * 最后上架时间
     */
    private Date onlineTime;

    /**
     * 发货地
     */
    private String delivery;

    /**
     * 包装清单
     */
    private String packListing;

    /**
     * 包装规格
     */
    private String wrap;

    /**
     * 
     */
    private Double weight;

    /**
     * 
     */
    private Integer width;

    /**
     * 
     */
    private Integer height;

    /**
     * 
     */
    private Integer length;

    /**
     * 
     */
    private String mobileDesc;

    /**
     * 
     */
    private String introduction;

    /**
     * 
     */
    private String afterSales;

    /**
     * 
     */
    private String logo;

    /**
     * 
     */
    private BigDecimal marketPrice;

    /**
     * 
     */
    private BigDecimal costPrice;

    /**
     * 
     */
    private BigDecimal jdPrice;

    /**
     * 
     */
    private String brandName;

    /**
     * 
     */
    private Integer stockNum;

    /**
     * 店铺id（sys_shop表id）
     */
    private Integer shopId;

    /**
     * 
     */
    private String sellPoint;

    /**
     * 
     */
    private String afterSaleDesc;

    /**
     * 
     */
    private String spuId;

    private static final long serialVersionUID = 1L;
}