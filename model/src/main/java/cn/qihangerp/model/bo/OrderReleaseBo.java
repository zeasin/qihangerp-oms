package cn.qihangerp.model.bo;

import lombok.Data;

import java.util.List;

/**
 * 订单处理工作台-批量审核放行请求
 * 支持主订单/子订单混合勾选；部分失败留池并返回逐单原因，成功单不回滚
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderReleaseBo {
    /** 订单ID列表（主订单或子订单） */
    private List<Long> ids;
    /** 放行备注（可选） */
    private String remark;
    /** 分店铺面单账号（选填；开源版第一期不强制，填写时同步分配发货主体） */
    private List<ShopAssignment> assignments;

    /**
     * 店铺面单账号
     */
    @Data
    public static class ShopAssignment {
        private Long shopId;
        private Integer shopType;
        private Long waybillAccountId;
    }
}
