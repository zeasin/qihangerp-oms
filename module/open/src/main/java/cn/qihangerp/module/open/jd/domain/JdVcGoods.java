package cn.qihangerp.module.open.jd.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 
 * @TableName jd_vc_goods
 */
@TableName("oms_jd_vc_goods")
@Data
public class JdVcGoods implements Serializable {
    /**
     * 
     */
    private String id;

    /**
     * 商品编号
     */
    private String wareId;

    /**
     * 商品名称
     */
    private String wareName;

    /**
     * 上下柜状态0，1，2
     */
    private Integer saleState;

    /**
     * 修改时间
     */
    private Date modifyTime;

    /**
     * 是否有主图
     */
    private Integer isPrimary;

    /**
     * 是否盖亚 0:非盖亚 1：盖亚
     */
    private Integer isGaea;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 商品id(o_goods外键)
     */
    private String oGoodsId;

    /**
     * 商品skuid(o_goods_sku外键)
     */
    private String oGoodsSkuId;

    /**
     * 店铺id
     */
    private Long shopId;

    private static final long serialVersionUID = 1L;
}