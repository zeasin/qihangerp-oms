package cn.qihangerp.module.goods.domain.bo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * 商品管理对象 erp_goods
 *
 * @author qihang
 * @date 2023-12-29
 */
@Data
public class GoodsAddBo
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 商品名称 */
    private String name;

    /** 商品图片地址 */
    private String image;

    /** 商品编号 */
    private String number;
    /** 外部商品id */
    private String outerErpGoodsId;
    /**发货地*/
    private String province;
    private String city;
    private String town;

    /** 单位名称 */
    private String unitName;

    /** 商品分类ID */
    private Long categoryId;

    /** 条码 */
    private String barCode;

    /** 状态1销售中2已下架 */
    private Integer status;

//    /** 衣长/裙长/裤长 */
//    private Long length;
//
//    /** 高度/袖长 */
//    private Long height;
//
//    /** 宽度/胸阔(围) */
//    private Long width;
//
//    /** 肩阔 */
//    private Long width1;
//
//    /** 腰阔 */
//    private Long width2;
//
//    /** 臀阔 */
//    private Long width3;
//
//    /** 重量 */
//    private Long weight;
//
//    /** 0启用   1禁用 */
//    private Integer disable;

    /** 保质期 */
    private String period;

    /** 预计采购价格 */
    private BigDecimal purPrice;

    /** 建议批发价 */
    private BigDecimal wholePrice;

    /** 建议零售价 */
    private BigDecimal retailPrice;

    /** 单位成本 */
    private BigDecimal unitCost;

    /** 供应商id */
    private Long supplierId;

    /** 品牌id */
    private Long brandId;

//    /** 属性1：季节 */
//    private String attr1;
//
//    /** 属性2：分类 */
//    private String attr2;
//
//    /** 属性3：风格 */
//    private String attr3;
//
//    /** 属性4：年份 */
//    private String attr4;
//
//    /** 属性5：面料 */
    private String attr5;

    /** 外链url */
    private String linkUrl;

//    /** 最低库存（预警） */
//    private Long lowQty;
//
//    /** 最高库存（预警） */
//    private Long highQty;

    private Long[] colorValues;
    private Map<Long,String> colorImages;
//    private Map<Long,String> colorNames;
    private Long[] sizeValues;
    private Long[] styleValues;
    private List<GoodsAddSkuBo> specList;

}
