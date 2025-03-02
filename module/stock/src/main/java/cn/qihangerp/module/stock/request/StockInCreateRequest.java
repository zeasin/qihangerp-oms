package cn.qihangerp.module.stock.request;

import lombok.Data;

import java.util.List;

@Data
public class StockInCreateRequest {
    private String stockInNum;
    private Integer stockInType;
    private String sourceNo;
    private String stockInOperator;
    private String remark;
    private List<StockInCreateItem> itemList;
}
