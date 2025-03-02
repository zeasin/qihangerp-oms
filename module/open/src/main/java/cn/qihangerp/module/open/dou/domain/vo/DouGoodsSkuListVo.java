package cn.qihangerp.module.open.dou.domain.vo;

import lombok.Data;

@Data
public class DouGoodsSkuListVo   {

    /**
     * 商品sku_id;抖店系统生成。
     */
    private String id;

    /**
     * 商品ID；抖店系统生成。
     */
    private String productId;

    /**
     * 规格ID
     */
    private String specId;

    /**
     * sku外部编码
     */
    private String code;

    /**
     * 第一级子规格名
     */
    private String specDetailName1;

    /**
     * 第二级子规格名
     */
    private String specDetailName2;

    /**
     *
     第三级子规格名
     */
    private String specDetailName3;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 商品标题。
     */
    private String name;

    /**
     * 商品主图的第一张图
     */
    private String img;

    private String outerErpSkuId;

}
