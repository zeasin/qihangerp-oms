package cn.qihangerp.model.bo.waybill;

import lombok.Data;

import java.io.Serializable;

/**
 * 打单队列批量动作参数（订单 id 数组）
 */
@Data
public class WorkbenchWaybillBatchBo implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 发货单元ID列表（o_order.id） */
    private Long[] orderIds;
    /** 取号动作可选指定面单账号；订单已分配账号时优先沿用订单上的 */
    private Long accountId;
}
