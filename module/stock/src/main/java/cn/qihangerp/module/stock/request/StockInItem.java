package cn.qihangerp.module.stock.request;

import lombok.Data;

@Data
public class StockInItem {
    private Long id;
    private Long intoQuantity;
    private Long positionId;
    private String positionNum;
}
