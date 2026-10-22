package cn.qihangerp.model.vo;

import lombok.Data;

import java.util.List;

/**
 * 订单处理工作台-异常池分类计数VO
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class ExceptionTagCountVo {
    /** 分类计数列表（含未命中的分类，count=0） */
    private List<Item> tags;
    /** 未分类兜底计数 */
    private Long uncategorized;

    @Data
    public static class Item {
        private Long tagId;
        private String name;
        private String color;
        /** 状态（0停用 1启用） */
        private Integer status;
        /** 当前池内订单数 */
        private Long count;
    }
}
