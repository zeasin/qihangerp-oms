package cn.qihangerp.module.stock.request;

import lombok.Data;

@Data
public class StockInCreateItem {
    private String skuId;
    private String goodsId;
    private Integer quantity;
    private String skuCode;
    private String goodsName;
    private String goodsImg;
    private String skuName;
}
