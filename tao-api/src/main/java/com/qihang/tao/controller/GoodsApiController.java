package com.qihang.tao.controller;

import com.qihang.common.common.ApiResult;
import com.qihang.common.common.EnumResultVo;
import com.qihang.common.enums.HttpStatus;
import com.qihang.tao.api.ApiCommon;
import com.qihang.tao.api.GoodsApiHelper;
import com.qihang.tao.api.OrderApiHelper;
import com.qihang.tao.common.TaoRequest;
import com.qihang.tao.domain.TaoGoods;
import com.qihang.tao.domain.TaoOrder;
import com.qihang.tao.service.TaoGoodsService;
import lombok.AllArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RequestMapping("/goods")
@RestController
@AllArgsConstructor
public class GoodsApiController {
    private final ApiCommon apiCommon;
    private final TaoGoodsService goodsService;

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
    public ApiResult<Integer> pullGoodsList(@RequestBody TaoRequest req) throws Exception {
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return ApiResult.build(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        var checkResult = apiCommon.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return ApiResult.build(checkResult.getCode(), checkResult.getMsg());
        }
        String sessionKey = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getApiRequestUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();

        Long pageIndex = 1L;
        Long pageSize = 40L;

        ApiResult<TaoGoods> listApiResult = GoodsApiHelper.pullGoods(pageIndex, pageSize, url, appKey, appSecret, sessionKey);

        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数

        for (var goods:listApiResult.getList()) {
            int result = goodsService.saveAndUpdateGoods(req.getShopId(), goods);
            if (result == EnumResultVo.DataExist.getIndex()) {
                //已经存在
                hasExistOrder++;
            } else if (result == EnumResultVo.SUCCESS.getIndex()) {
                insertSuccess++;
            }else {
                totalError++;
            }
        }
        //计算总页数
        int totalPage = (listApiResult.getTotalRecords() % pageSize == 0) ? listApiResult.getTotalRecords() / pageSize.intValue() : (listApiResult.getTotalRecords() / pageSize.intValue()) + 1;
        pageIndex++;

        while (pageIndex <= totalPage) {

            ApiResult<TaoGoods> result1 = GoodsApiHelper.pullGoods(pageIndex, pageIndex, url, appKey, appSecret, sessionKey);
            //循环插入订单数据到数据库
            for (var goods:listApiResult.getList()) {
                int result = goodsService.saveAndUpdateGoods(req.getShopId(), goods);
                if (result == EnumResultVo.DataExist.getIndex()) {
                    //已经存在
                    hasExistOrder++;
                } else if (result == EnumResultVo.SUCCESS.getIndex()) {
                    insertSuccess++;
                }else {
                    totalError++;
                }
            }
            pageIndex++;
        }

        String msg = "成功，总共找到：" + listApiResult.getTotalRecords() + "条订单，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
//        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), msg);
        return ApiResult.build(HttpStatus.SUCCESS, msg);
    }

}
