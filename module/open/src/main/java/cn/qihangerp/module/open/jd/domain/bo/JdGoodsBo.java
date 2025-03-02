package cn.qihangerp.module.open.jd.domain.bo;

import lombok.Data;

import java.io.Serializable;

@Data
public class JdGoodsBo implements Serializable {
    /**
     * 商品数字id
     */
    private Long wareId;
    private Long skuId;
    private String title;
    private String outerId;
    private Integer shopId;
    private Integer hasLink;//是否关联
    private Integer saleState;//状态（京东自营用）
}
