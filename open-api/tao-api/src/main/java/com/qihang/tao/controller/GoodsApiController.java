package com.qihang.tao.controller;

import com.qihang.common.api.ShopApiParams;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.security.common.BaseController;
import com.qihang.tao.domain.SysShopPullLogs;
import com.qihang.tao.openApi.ApiCommon;
import com.qihang.tao.openApi.GoodsApiHelper;
import com.qihang.tao.common.TaoRequest;
import com.qihang.tao.domain.TaoGoods;
import com.qihang.tao.service.SysShopPullLogsService;
import com.qihang.tao.service.TaoGoodsService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;
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
public class GoodsApiController extends BaseController {
    private final ApiCommon apiCommon;
    private final TaoGoodsService goodsService;
    private final SysShopPullLogsService pullLogsService;
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
    public AjaxResult pullGoodsList(@RequestBody TaoRequest req) throws Exception {
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
//            return ApiResult.build(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        long startTime = System.currentTimeMillis();
        var checkResult = apiCommon.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg());
        }
        ShopApiParams shopApiParams = checkResult.getData();
        String sessionKey = shopApiParams.getAccessToken();
        String url = shopApiParams.getApiRequestUrl();
        String appKey = shopApiParams.getAppKey();
        String appSecret = shopApiParams.getAppSecret();

        Long pageIndex = 1L;
        Long pageSize = 100L;

//        ApiResult<TaoGoods> listApiResult = GoodsApiHelper.pullGoods(pageIndex, pageSize, url, appKey, appSecret, sessionKey);
        ResultVo<TaoGoods> listApiResult = GoodsApiHelper.pullGoods(pageIndex, pageSize, url, appKey, appSecret, sessionKey);

        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数

        for (var goods:listApiResult.getList()) {
            int result = goodsService.saveAndUpdateGoods(req.getShopId(), goods);
            if (result == ResultVoEnum.DataExist.getIndex()) {
                //已经存在
                hasExistOrder++;
            } else if (result == ResultVoEnum.SUCCESS.getIndex()) {
                insertSuccess++;
            }else {
                totalError++;
            }
        }
        //计算总页数
        int totalPage = (listApiResult.getTotalRecords() % pageSize == 0) ? listApiResult.getTotalRecords() / pageSize.intValue() : (listApiResult.getTotalRecords() / pageSize.intValue()) + 1;
        pageIndex++;

        while (pageIndex <= totalPage) {

            ResultVo<TaoGoods> result1 = GoodsApiHelper.pullGoods(pageIndex, pageIndex, url, appKey, appSecret, sessionKey);
            //循环插入订单数据到数据库
            for (var goods:listApiResult.getList()) {
                int result = goodsService.saveAndUpdateGoods(req.getShopId(), goods);
                if (result == ResultVoEnum.DataExist.getIndex()) {
                    //已经存在
                    hasExistOrder++;
                } else if (result == ResultVoEnum.SUCCESS.getIndex()) {
                    insertSuccess++;
                }else {
                    totalError++;
                }
            }
            pageIndex++;
        }
        SysShopPullLogs logs = new SysShopPullLogs();
        logs.setShopId(req.getShopId());
        logs.setShopType(EnumShopType.TAO.getIndex());
        logs.setPullType("GOODS");
        logs.setPullWay("主动拉取");
        logs.setPullParams("{PageNo:1,PageSize:100}");
        logs.setPullResult("{successTotal:"+listApiResult.getTotalRecords()+"}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - startTime);
        pullLogsService.save(logs);

        String msg = "成功，总共找到：" + listApiResult.getTotalRecords() + "条商品数据，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        logger.info(msg);
//        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), msg);
        return AjaxResult.success(msg);
    }

}
