package cn.qihangerp.open.jd.domain.bo;

import lombok.Data;

import java.io.Serializable;

@Data
public class JdGoodsBo implements Serializable {
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
