package cn.qihangerp.module.open.dou.domain.bo;

import lombok.Data;

import java.io.Serializable;

@Data
public class DouGoodsBo implements Serializable {
    /**
     * 商品数字id
     */
    private Long productId;
    private Long skuId;
    private String title;
    private String code;
    private Integer shopId;
    private Integer hasLink;//是否关联
}
