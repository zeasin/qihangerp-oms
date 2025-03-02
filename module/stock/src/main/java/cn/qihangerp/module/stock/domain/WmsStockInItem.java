package cn.qihangerp.module.stock.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

/**
 * 入库单明细
 * @TableName wms_stock_in_item
 */
@Data
public class WmsStockInItem implements Serializable {
    /**
     * 
     */
    private String id;

    /**
     * 入库单id
     */
    private Long stockInId;

    /**
     * 来源类型（1采购订单2退货订单）
     */
    private Integer stockInType;

    /**
     * 来源单号
     */
    private String sourceNo;

    /**
     * 来源单id
     */
    private Long sourceId;

    /**
     * 来源单itemId
     */
    private Long sourceItemId;

    /**
     * 商品id
     */
    private String goodsId;

    /**
     * 商品编码
     */
    private String goodsNum;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品图片
     */
    private String goodsImage;

    /**
     * 商品规格id
     */
    private String skuId;

    /**
     * 商品规格编码
     */
    private String skuCode;

    /**
     * 颜色
     */
    private String skuName;

    /**
     * 原始数量
     */
    private Integer quantity;

    /**
     * 入库数量
     */
    private Integer inQuantity;

    /**
     * 备注
     */
    private String remark;

    /**
     * 状态（0待入库1部分入库2全部入库）
     */
    private Integer status;

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
    private Integer intoQuantity;
    @TableField(exist = false)
    private Integer positionId;
    @TableField(exist = false)
    private String positionNum;

    private static final long serialVersionUID = 1L;
}