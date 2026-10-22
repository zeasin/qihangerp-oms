package cn.qihangerp.model.vo.waybill;

import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 打单队列批量动作结果（逐单成败明细，支持部分成功）
 */
@Data
public class WorkbenchWaybillResultVo implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 成功数 */
    private int successCount;
    /** 失败数 */
    private int failCount;
    /** 失败明细 */
    private List<FailItem> failures = new ArrayList<>();

    public void success() {
        this.successCount++;
    }

    public void fail(Long orderId, String orderNum, String reason) {
        this.failCount++;
        FailItem item = new FailItem();
        item.setOrderId(orderId);
        item.setOrderNum(orderNum);
        item.setReason(reason);
        this.failures.add(item);
    }

    @Data
    public static class FailItem implements Serializable {
        private static final long serialVersionUID = 1L;
        private Long orderId;
        private String orderNum;
        private String reason;
    }
}
