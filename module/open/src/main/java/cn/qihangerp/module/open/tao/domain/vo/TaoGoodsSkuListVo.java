package cn.qihangerp.module.open.tao.domain.vo;


import cn.qihangerp.module.open.tao.domain.TaoGoodsSku;
import lombok.Data;

@Data
public class TaoGoodsSkuListVo extends TaoGoodsSku {
    private String title;
    private String picUrl;
    private String outerErpSkuId;
    private Long shopId;
}
