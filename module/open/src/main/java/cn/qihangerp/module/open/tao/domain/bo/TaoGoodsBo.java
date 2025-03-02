package cn.qihangerp.module.open.tao.domain.bo;

import lombok.Data;

import java.io.Serializable;

@Data
public class TaoGoodsBo implements Serializable {
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
    private Integer hasLink;//是否关联
}
