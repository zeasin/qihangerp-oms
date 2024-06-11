package com.qihang.dou.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

/**
 * 抖店商品表
 * @TableName oms_dou_goods
 */
@Data
public class OmsDouGoods implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 商品ID，抖店系统生成，店铺下唯一
     */
    private Long productId;

    /**
     * 商品类型；0-普通；1-新客商品；3-虚拟；6-玉石闪购；7-云闪购 ；127-其他类型；
     */
    private Integer productType;

    /**
     * 商品标题。
     */
    private String name;

    /**
     * 商品主图的第一张图
     */
    private String img;

    /**
     * 商品审核状态: 1-未提交；2-待审核；3-审核通过；4-审核未通过；5-封禁；7-审核通过待上架；
     */
    private Integer checkStatus;

    /**
     * 商品在店铺中状态: 0-在线；1-下线；2-删除；
     */
    private Integer status;

    /**
     * 商品规格，全局唯一
     */
    private Long specId;

    /**
     * 商品创建时间，unix时间戳，单位：秒；
     */
    private Integer createTime;

    /**
     * 商品更新时间，unix时间戳，单位：秒；
     */
    private Integer updateTime;

    /**
     * 商品详情，最大支持50张图片，单张详情图宽高比不超2000*2000px，大小5M内，仅支持jpg/jpeg/png格式；
     */
    private String description;

    /**
     * 类目详情；商品类目id可使用【/shop/getShopCategory】查询
     */
    private String categoryDetail;

    /**
     * 外部商家编码，商家自定义字段，支持最多 255个字符
     */
    private String outerProductId;

    /**
     * 是否是组合商品，true-是，false-不是；
     */
    private String isPackageProduct;

    /**
     * erp商品id
     */
    private Long erpGoodsId;

    /**
     * 拉取时间
     */
    private Date pullTime;

    /**
     * 更新时间
     */
    private Date modifyTime;

    @TableField(exist = false)
    private List<OmsDouGoodsSku> skuList;
    private static final long serialVersionUID = 1L;
}