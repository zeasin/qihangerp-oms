package cn.qihangerp.open.wei.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.HttpStatus;
import cn.qihangerp.module.open.wei.domain.OmsWeiGoods;
import cn.qihangerp.module.open.wei.domain.OmsWeiGoodsSku;
import cn.qihangerp.module.open.wei.service.OmsWeiGoodsService;
import cn.qihangerp.open.PullRequest;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.wei.WeiApiCommon;
import cn.qihangerp.open.wei.WeiGoodsApiService;
import cn.qihangerp.open.wei.model.Product;
import com.alibaba.fastjson2.JSONObject;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/wei/goods")
@RestController
@AllArgsConstructor
public class GoodsApiController {
    private final WeiGoodsApiService goodsApiService;
    private final WeiApiCommon apiCommon;
//    private final WeiGoodsService weiGoodsService;
    private final OmsWeiGoodsService weiGoodsService;

    @RequestMapping(value = "/pull_goods_list", method = RequestMethod.POST)
    public AjaxResult pullList(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
//            return ApiResul new ApiResult(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        long startTime = System.currentTimeMillis();
        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != ResultVoEnum.SUCCESS.getIndex()) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }

        String accessToken = checkResult.getData().getAccessToken();

        ApiResultVo<Product> productApiResultVo = goodsApiService.pullGoodsList(accessToken);
//        ApiResultVo<Product> productApiResultVo = WeiGoodsApiHelper.pullGoodsList(accessToken);
        if(productApiResultVo.getCode() == 0){
            // 成功
            for (var product:productApiResultVo.getList()){
                OmsWeiGoods goods = new OmsWeiGoods();
                goods.setProductId(product.getProduct_id());
                goods.setOutProductId(product.getOut_product_id());
                goods.setTitle(product.getTitle());
                goods.setSubTitle(product.getSub_title());
                goods.setHeadImg(product.getHead_imgs().getString(0));
                goods.setHeadImgs(JSONObject.toJSONString(product.getHead_imgs()));
                goods.setDescInfo(JSONObject.toJSONString(product.getDesc_info()));
                goods.setAttrs(JSONObject.toJSONString(product.getAttrs()));
                goods.setStatus(product.getStatus());
                goods.setEditStatus(product.getEdit_status());
                goods.setMinPrice(product.getMin_price());
                goods.setSpuCode(product.getSpu_code());
                goods.setProductType(product.getProduct_type());
                goods.setEditTime(product.getEdit_time());
                List<OmsWeiGoodsSku> skuList = new ArrayList<>();
                for (var sku:product.getSkus()) {
                    OmsWeiGoodsSku goodsSku = new OmsWeiGoodsSku();

                    goodsSku.setSkuId(sku.getSku_id());
                    goodsSku.setProductId(product.getProduct_id());
                    goodsSku.setOutSkuId(sku.getOut_sku_id());
                    goodsSku.setThumbImg(sku.getThumb_img());
                    if(StringUtils.isBlank(goodsSku.getThumbImg())){
                        goodsSku.setThumbImg(goods.getHeadImg());
                    }
                    goodsSku.setSkuCode(sku.getSku_code());
                    goodsSku.setSkuAttrs(JSONObject.toJSONString(sku.getSku_attrs()));
                    goodsSku.setSalePrice(sku.getSale_price());
                    goodsSku.setStockNum(sku.getStock_num());
                    goodsSku.setStatus(sku.getStatus());
                    goodsSku.setSkuDeliverInfo(JSONObject.toJSONString(sku.getSku_deliver_info()));
                    skuList.add(goodsSku);
                }
                goods.setSkus(skuList);
                weiGoodsService.saveAndUpdateGoods(params.getShopId(),goods);
            }
        }



        return AjaxResult.success();
    }
}
