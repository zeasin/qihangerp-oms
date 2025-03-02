package cn.qihangerp.module.stock.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 出库仓位详情
 * @TableName wms_stock_out_item_position
 */
@Data
public class WmsStockOutItemPosition implements Serializable {
    /**
     * 主键ID
     */
    private Long id;

    /**
     * 出库单ID
     */
    private Long entryId;

    /**
     * 出库单ItemID
     */
    private Long entryItemId;

    /**
     * 库存ID
     */
    private Long goodsInventoryId;

    /**
     * 库存详情ID
     */
    private Long goodsInventoryDetailId;

    /**
     * 出库数量
     */
    private Long quantity;

    /**
     * 出库仓位ID
     */
    private Integer locationId;

    /**
     * 出库操作人userid
     */
    private Integer operatorId;

    /**
     * 出库操作人
     */
    private String operatorName;

    /**
     * 出库时间
     */
    private Date outTime;

    private static final long serialVersionUID = 1L;
}