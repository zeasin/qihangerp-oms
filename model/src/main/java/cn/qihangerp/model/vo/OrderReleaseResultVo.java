package cn.qihangerp.model.vo;

import lombok.Data;

import java.util.List;

/**
 * 订单处理工作台-批量放行结果VO（逐单结果，部分失败留池）
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderReleaseResultVo {
    /** 成功单数 */
    private Integer successCount;
    /** 失败单数 */
    private Integer failCount;
    /** 逐单结果 */
    private List<Item> items;

    @Data
    public static class Item {
        private Long id;
        private String orderNum;
        private Boolean success;
        private String msg;
    }
}
