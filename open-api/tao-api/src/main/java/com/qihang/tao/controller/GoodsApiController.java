package com.qihang.tao.controller;

import com.qihang.common.api.ShopApiParams;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.security.common.BaseController;
import com.qihang.tao.domain.SysShopPullLogs;
import com.qihang.tao.openApi.ApiCommon;
import com.qihang.tao.common.TaoRequest;
import com.qihang.tao.service.SysShopPullLogsService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import tech.qihangec.open.tao.TaoGoodsApiService;
import tech.qihangec.open.tao.common.ApiResultVo;
import tech.qihangec.open.tao.domain.TaoGoods;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Log
@RequestMapping("/goods")
@RestController
@AllArgsConstructor
public class GoodsApiController extends BaseController {
    private final ApiCommon apiCommon;
    private final TaoGoodsApiService goodsApiService;
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

        ApiResultVo<TaoGoods> resultVo = goodsApiService.pullGoodsList(req.getShopId(), url, appKey, appSecret, sessionKey);
        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数

//        for (var goods:resultVo.getList()) {
//            int result = goodsService.saveAndUpdateGoods(req.getShopId(), goods);
//            if (result == ResultVoEnum.DataExist.getIndex()) {
//                //已经存在
//                hasExistOrder++;
//            } else if (result == ResultVoEnum.SUCCESS.getIndex()) {
//                insertSuccess++;
//            }else {
//                totalError++;
//            }
//        }

        SysShopPullLogs logs = new SysShopPullLogs();
        logs.setShopId(req.getShopId());
        logs.setShopType(EnumShopType.TAO.getIndex());
        logs.setPullType("GOODS");
        logs.setPullWay("主动拉取");
        logs.setPullParams("{PageNo:1,PageSize:100}");
        logs.setPullResult("{successTotal:"+resultVo.getTotalRecords()+"}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - startTime);
        pullLogsService.save(logs);

        String msg = "成功，总共找到：" + resultVo.getTotalRecords() + "条商品数据";
        logger.info(msg);
//        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), msg);
        return AjaxResult.success(msg);
    }

}
