package cn.qihangerp.module.order.domain.vo;

import lombok.Data;

@Data
public class SalesDailyVo {
    private String date;
    private Integer count;
    private Double amount;
}
