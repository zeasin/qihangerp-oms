package cn.qihangerp.module.stock.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 出库单明细
 * @TableName wms_stock_out_item
 */
@Data
public class WmsStockOutItem implements Serializable {
    /**
     * 主键ID
     */
    private Long id;

    /**
     * 出库类型1订单拣货出库2采购退货出库3盘点出库4报损出库
     */
    private Integer stockOutType;

    /**
     * 出库单id（外键）
     */
    private Long entryId;

    /**
     * 来源订单id
     */
    private Long sourceOrderId;

    /**
     * 来源订单itemId出库对应的itemId，如：order_item表id、invoice_info表id
     */
    private Long sourceOrderItemId;

    /**
     * 来源订单号
     */
    private String sourceOrderNum;

    /**
     * 商品id
     */
    private Integer goodsId;

    /**
     * 商品规格id
     */
    private Integer specId;

    /**
     * 规格编码
     */
    private String specNum;

    /**
     * 总数量
     */
    private Long originalQuantity;

    /**
     * 已出库数量
     */
    private Long outQuantity;

    /**
     * 完成出库时间
     */
    private Date completeTime;

    /**
     * 完成拣货时间
     */
    private Date pickedTime;

    /**
     * 状态：0待出库1部分出库2全部出库
     */
    private Integer status;

    /**
     * 
     */
    private Date createTime;

    /**
     * 
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;
}