package com.qihang.pdd.controller;

import cn.qihangerp.open.pdd.GoodsApiHelper;
import cn.qihangerp.open.pdd.common.ApiResultVo;
import cn.qihangerp.open.pdd.model.GoodsResultVo;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.HttpStatus;
import com.qihang.pdd.domain.OmsPddGoods;
import com.qihang.pdd.domain.OmsPddGoodsSku;
import com.qihang.pdd.openapi.ApiCommon;
import com.qihang.pdd.openapi.PullRequest;
import com.qihang.pdd.service.OmsPddGoodsService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Log
@RequestMapping("/goods")
@RestController
@AllArgsConstructor
public class PddGoodsApiController extends BaseController {
    private final OmsPddGoodsService goodsService;
    private final ApiCommon pddApiHelper;

/**
        * @api {post} /api/v1/pull_goods 更新店铺商品列表
     * @apiVersion 1.0.0
            * @apiName pullGoods
     * @apiGroup taoGood
     * @apiParam {String}  startTime 开始时间
     * @apiParam {String}  endTime 结束时间
     * @apiParam {Number}  shopId 店铺id(东方符号：7)
     * @apiSuccessExample {json} Success-Response:
            * HTTP/1.1 200 OK{
        "code": "0成功其他失败",
                "msg": "成功或失败信息"
    }
     */
    @RequestMapping(value = "/pull_goods", method = RequestMethod.POST)
    public AjaxResult pullGoodsList(@RequestBody PullRequest req) throws Exception {
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
//            return ApiResult.build(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        var checkResult = pddApiHelper.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数
        ApiResultVo<GoodsResultVo> apiResultVo = GoodsApiHelper.pullGoodsList(appKey, appSecret, accessToken, 1, 20);
        if(apiResultVo.getCode() == 10019) return AjaxResult.error(HttpStatus.UNAUTHORIZED1,"Token已过期");
        if (apiResultVo.getCode() != 0) return AjaxResult.error(apiResultVo.getCode(), apiResultVo.getMsg());
        //成功
        if (apiResultVo.getData().getGoodsList() != null) {
            for (var g : apiResultVo.getData().getGoodsList()) {
                OmsPddGoods goods = new OmsPddGoods();
                BeanUtils.copyProperties(g, goods);
                // TODO:转换goods
                goods.setShopId(req.getShopId());
                goods.setCreateTime(new Date());
                List<OmsPddGoodsSku> skuList = new ArrayList<>();
                for (var s : g.getSkuList()) {
                    OmsPddGoodsSku sku = new OmsPddGoodsSku();
                    BeanUtils.copyProperties(s, sku);
                    sku.setShopId(req.getShopId());
                    sku.setGoodsId(g.getGoodsId());
                    sku.setGoodsName(g.getGoodsName());
                    sku.setThumbUrl(g.getThumbUrl());

                    sku.setCreateTime(new Date());
                    skuList.add(sku);
                }
                goods.setSkuList(skuList);

                int result = goodsService.saveAndUpdateGoods(req.getShopId(), goods);
                if (result == ResultVoEnum.DataExist.getIndex()) {
                    //已经存在
                    hasExistOrder++;
                } else if (result == ResultVoEnum.SUCCESS.getIndex()) {
                    insertSuccess++;
                } else {
                    totalError++;
                }
            }
        }
        String msg = "成功，总共找到：" + apiResultVo.getData().getGoodsList().size() + "条商品数据，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        logger.info(msg);
//        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), msg);
        return AjaxResult.success(msg);

    }

}
