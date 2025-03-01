package cn.qihangerp.open.wei.controller;

import cn.qihangerp.open.wei.WeiPullRequest;
import cn.qihangerp.open.wei.RemoteUtil;
import cn.qihangerp.open.wei.bo.GoodsDetailApiBo;
import cn.qihangerp.open.wei.bo.GoodsListApiBo;
import cn.qihangerp.open.wei.domain.OmsWeiGoods;
import cn.qihangerp.open.wei.domain.OmsWeiGoodsSku;
import cn.qihangerp.open.wei.service.GoodsApiService;
import cn.qihangerp.open.wei.service.OmsWeiGoodsService;
import cn.qihangerp.open.wei.vo.GoodsDetailVo;
import cn.qihangerp.open.wei.vo.GoodsListVo;
import com.alibaba.fastjson2.JSONObject;
import cn.qihangerp.common.common.AjaxResult;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.HttpStatus;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
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
public class WeiGoodsApiController {
    private final WeiApiCommon apiCommon;
    private final OmsWeiGoodsService weiGoodsService;

    @RequestMapping(value = "/pull_goods_list", method = RequestMethod.POST)
    public AjaxResult pullList(@RequestBody WeiPullRequest params) throws Exception {
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
        String serverUrl = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
        GoodsApiService remoting = RemoteUtil.Remoting(serverUrl, GoodsApiService.class);
        GoodsListApiBo apiBo = new GoodsListApiBo();
        apiBo.setPage_size(30);
        apiBo.setStatus(5);
        GoodsListVo res = remoting.getGoodsList(accessToken, apiBo);
        if(res.getErrcode() == 0){
            // 拉取到了数据 拉取详情
            if(res.getProduct_ids()!=null&&res.getProduct_ids().length>0){
                for (var productId:res.getProduct_ids()) {
                    GoodsDetailApiBo apiBo1 = new GoodsDetailApiBo();
                    apiBo1.setProduct_id(productId.toString());
                    GoodsDetailVo goodsDetail = remoting.getGoodsDetail(accessToken, apiBo1);
                    if(goodsDetail.getErrcode()==0){
                        // 保存到数据库
                        OmsWeiGoods goods = new OmsWeiGoods();
                        BeanUtils.copyProperties(goodsDetail.getProduct(),goods);
                        goods.setHeadImg(goodsDetail.getProduct().getHead_imgs().getString(0));
                        goods.setHeadImgs(JSONObject.toJSONString(goodsDetail.getProduct().getHead_imgs()));
                        goods.setDescInfo(JSONObject.toJSONString(goodsDetail.getProduct().getDesc_info()));
                        goods.setAttrs(JSONObject.toJSONString(goodsDetail.getProduct().getAttrs()));
                        List<OmsWeiGoodsSku> skuList = new ArrayList<>();
                        for (var sku:goodsDetail.getProduct().getSkus()) {
                            OmsWeiGoodsSku goodsSku = new OmsWeiGoodsSku();
                            BeanUtils.copyProperties(sku,goodsSku);
                            goodsSku.setSkuAttrs(JSONObject.toJSONString(sku.getSku_attrs()));
                            goodsSku.setSkuDeliverInfo(JSONObject.toJSONString(sku.getSku_deliver_info()));
                            skuList.add(goodsSku);
                        }
                        goods.setSkus(skuList);
                        weiGoodsService.saveAndUpdateGoods(params.getShopId(),goods);
                    }
                }

            }
        }


        return AjaxResult.success();
    }
}
