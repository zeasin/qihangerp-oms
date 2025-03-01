package cn.qihangerp.module.goods.domain;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 商品库存管理
 * @TableName o_goods
 */
@Data
public class OGoods implements Serializable {
    /**
     * 主键id
     */
    @TableId(value = "id", type= IdType.AUTO)
    private String id;

    /**
     * 商品名称
     */
    private String name;

    /**
     * 商品图片地址
     */
    private String image;

    /**
     * 商品唯一ID
     */
    private String outerErpGoodsId;

    /**
     * 商品编号
     */
    private String goodsNum;

    /**
     * 单位名称
     */
    private String unitName;
    /**发货地*/
    private String province;
    private String city;
    private String town;

    /**
     * 商品分类ID
     */
    private Long categoryId;

    /**
     * 条码
     */
    private String barCode;

    /**
     * 备注
     */
    private String remark;

    /**
     * 状态1销售中2已下架
     */
    private Integer status;

    /**
     * 衣长/裙长/裤长
     */
    private Double length;

    /**
     * 高度/袖长
     */
    private Double height;

    /**
     * 宽度/胸阔(围)
     */
    private Double width;

    /**
     * 肩阔
     */
    private Double width1;

    /**
     * 腰阔
     */
    private Double width2;

    /**
     * 臀阔
     */
    private Double width3;

    /**
     * 重量
     */
    private Double weight;

    /**
     * 0启用   1禁用
     */
    private Integer disable;

    /**
     * 保质期
     */
    private String period;

    /**
     * 预计采购价格
     */
    private BigDecimal purPrice;

    /**
     * 建议批发价
     */
    private BigDecimal wholePrice;

    /**
     * 建议零售价
     */
    private BigDecimal retailPrice;

    /**
     * 单位成本
     */
    private BigDecimal unitCost;

    /**
     * 供应商id
     */
    private Long supplierId;

    /**
     * 品牌id
     */
    private Long brandId;

    /**
     * 属性1：季节
     */
    private String attr1;

    /**
     * 属性2：分类
     */
    private String attr2;

    /**
     * 属性3：风格
     */
    private String attr3;

    /**
     * 属性4：年份
     */
    private String attr4;

    /**
     * 属性5：面料
     */
    private String attr5;

    /**
     * 外链url
     */
    private String linkUrl;

    /**
     * 最低库存（预警）
     */
    private Integer lowQty;

    /**
     * 最高库存（预警）
     */
    private Integer highQty;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新人
     */
    private String updateBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    @TableField(exist = false)
    private List<OGoodsSku> skuList;

    private static final long serialVersionUID = 1L;


}