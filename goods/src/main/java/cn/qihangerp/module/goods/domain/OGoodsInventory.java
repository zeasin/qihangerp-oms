package cn.qihangerp.module.goods.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 商品库存表
 * @TableName o_goods_inventory
 */
@Data
public class OGoodsInventory implements Serializable {
    /**
     * 主键ID
     */
    private String id;

    /**
     * 商品id
     */
    private String goodsId;

    /**
     * 商品编码
     */
    private String goodsNum;

    /**
     * 商品规格id
     */
    private String skuId;

    /**
     * 规格编码（唯一）
     */
    private String skuCode;

    /**
     * 当前库存
     */
    private Long quantity;

    /**
     * 0正常  1删除
     */
    private Integer isDelete;

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