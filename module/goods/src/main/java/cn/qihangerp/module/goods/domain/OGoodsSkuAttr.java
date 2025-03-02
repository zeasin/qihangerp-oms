package cn.qihangerp.module.goods.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 
 * @TableName o_goods_sku_attr
 */
@Data
public class OGoodsSkuAttr implements Serializable {
    /**
     * 
     */
    @TableId(value = "id", type= IdType.AUTO)
    private Long id;

    /**
     * 
     */
    private String goodsId;

    /**
     * 
     */
    private String type;

    /**
     * 
     */
    private String k;

    /**
     * 
     */
    private Long kid;

    /**
     * 
     */
    private Long vid;

    /**
     * 
     */
    private String v;

    /**
     * 
     */
    private String img;

    private static final long serialVersionUID = 1L;
}