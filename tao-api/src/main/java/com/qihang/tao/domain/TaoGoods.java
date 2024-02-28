package com.qihang.tao.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

@Data
@TableName("tao_goods")
public class TaoGoods {
    /**
     * 主键id（自增长）
     */
    private Long id;

    /**
     * tao商品id
     */
    private Long numIid;

    /**
     * 商品标题
     */
    private String title;

    /**
     * 商品主图
     */
    private String picUrl;

    /**
     * 商品价格
     */
    private BigDecimal price;

    /**
     * 商品数量
     */
    private Long num;

    /**
     * 商品状态：onsale出售中instock库中
     */
    private String approveStatus;

    /**
     * 商品外部编码
     */
    private String outerId;

    /**
     * 商品销量
     */
    private Long soldQuantity;

    /**
     * 上架时间
     */
    private Long listTime;

    /**
     * 下架时间
     */
    private Long delistTime;

    /**
     * 修改时间
     */
    private Long modified;
    /**
     * 销售价
     */
    private BigDecimal salesPrice;
    /**
     * 批发价
     */
    private BigDecimal whslePrice;
    /**
     * 创建时间
     */
    private Long createOn;
    //标签
    private String tag;
    //评价数量
    private Integer commentCount;

}
