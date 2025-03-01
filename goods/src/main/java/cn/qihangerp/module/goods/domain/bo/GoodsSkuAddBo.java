package cn.qihangerp.module.goods.domain.bo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class GoodsSkuAddBo {
   private String erpSkuId;	//erp商品ID
   private String erpSkuName;//	erp商品名称
   private String erpSkuCode;//	erp商品编码
   private BigDecimal salePrice;//	erp商品零售价
   private String productSpec;//	erp商品规格
   private String productColor;//	erp商品颜色
   private String materialKind;//	erp商品材质
   private String productVolume;//	erp商品体积
   private String productPicture1;//	erp商品图片地址
   private Integer productIsUse;//	是否在用
}
