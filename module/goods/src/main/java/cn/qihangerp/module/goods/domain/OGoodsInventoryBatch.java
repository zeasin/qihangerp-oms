package cn.qihangerp.module.goods.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 商品库存批次
 * @TableName o_goods_inventory_batch
 */
@Data
public class OGoodsInventoryBatch implements Serializable {
    /**
     * 主键ID
     */
    private Long id;

    /**
     * 批次号
     */
    private String batchNum;

    /**
     * 初始数量
     */
    private Long originQty;

    /**
     * 当前数量
     */
    private Long currentQty;

    /**
     * 采购价
     */
    private Double purPrice;

    /**
     * 采购单id
     */
    private Long purId;

    /**
     * 采购单itemId
     */
    private Long purItemId;

    /**
     * 备注
     */
    private String remark;

    /**
     * 规格id
     */
    private String skuId;

    /**
     * 商品id
     */
    private String goodsId;

    /**
     * sku编码
     */
    private String skuCode;

    /**
     * 仓库id
     */
    private Long warehouseId;

    /**
     * 仓位id
     */
    private Long positionId;

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