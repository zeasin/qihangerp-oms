package cn.qihangerp.module.stock.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 出库单
 * @TableName wms_stock_out
 */
@Data
public class WmsStockOut implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 出库单编号
     */
    private String stockOutNum;

    /**
     * 来源单据号
     */
    private String sourceNum;

    /**
     * 来源单据Id
     */
    private Long sourceId;

    /**
     * 出库类型1订单拣货出库2采购退货出库3盘点出库4报损出库
     */
    private Integer stockOutType;

    /**
     * 商品数
     */
    private Integer goodsUnit;

    /**
     * 商品规格数
     */
    private Integer specUnit;

    /**
     * 总件数
     */
    private Integer specUnitTotal;

    /**
     * 已出库数量
     */
    private Integer outTotal;

    /**
     * 备注
     */
    private String remark;

    /**
     * 状态：0待出库1部分出库2全部出库
     */
    private Integer status;

    /**
     * 打印状态：是否打印1已打印0未打印
     */
    private Integer printStatus;

    /**
     * 打印时间
     */
    private Date printTime;

    /**
     * 出库时间
     */
    private Date outTime;

    /**
     * 完成出库时间
     */
    private Date completeTime;

    /**
     * 出库操作人userid
     */
    private Integer operatorId;

    /**
     * 出库操作人
     */
    private String operatorName;

    /**
     * 创建日期
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