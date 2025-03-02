package cn.qihangerp.module.open.tao.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @TableName tao_goods_sku
 */
@TableName("oms_tao_goods_sku")
@Data
public class TaoGoodsSku implements Serializable {
    /**
     * 主键id
     */
    private String id;

    /**
     * 外键id
     */
    private Long taoGoodsId;

    /**
     * sku所属商品数字id
     */
    private Long numIid;

    /**
     * sku所属商品id(注意：iid近期即将废弃，请用num_iid参数)
     */
    private String iid;

    /**
     * 商品skuid，阿里
     */
    private Long skuId;

    /**
     * sku的销售属性组合字符串（颜色，大小，等等，可通过类目API获取某类目下的销售属性）,格式是p1:v1;p2:v2
     */
    private String properties;

    /**
     * sku所对应的销售属性的中文名字串，格式如：pid1:vid1:pid_name1:vid_name1;pid2:vid2:pid_name2:vid_name2……
     */
    private String propertiesName;

    /**
     * 属于这个sku的商品的数量，
     */
    private Integer quantity;

    /**
     * specId
     */
    private String spec;

    /**
     * 属于这个sku的商品的价格 取值范围:0-100000000;精确到2位小数;单位:元。如:200.07，表示:200元7分。
     */
    private Double price;

    /**
     * 商家设置的外部id。
     */
    private String outerId;

    /**
     * sku创建日期 时间格式：yyyy-MM-dd HH:mm:ss
     */
    private String created;

    /**
     * sku最后修改日期 时间格式：yyyy-MM-dd HH:mm:ss
     */
    private String modified;

    /**
     * sku状态。	normal
     */
    private String status;

    /**
     * 表示SKu上的产品规格信息
     */
    private String skuSpecId;

    /**
     * 商品级别的条形码
     */
    private String barcode;

    /**
     * erp商品SKUid
     */
    private String oGoodsSkuId;

    /**
     * erp商品id
     */
    private String oGoodsId;

    /**
     * 创建时间
     */
    private Date createTime;

    private static final long serialVersionUID = 1L;

}