package com.qihang.tao.domain.bo;

import lombok.Data;
import tech.qihangec.open.tao.domain.TaoGoods;

import java.io.Serializable;

@Data
public class TaoGoodsBo extends TaoGoods implements Serializable {
    /**
     * 商品数字id
     */
    private Long numIid;
    private Long skuId;
    private Long erpGoodsSkuId;

    /**
     * 商品标题
     */
    private String title;
    private String outerId;
    private Integer shopId;
}
