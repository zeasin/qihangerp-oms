package cn.qihangerp.open.dou.controller;


import cn.qihangerp.open.dou.DouGoodsApiHelper;
import cn.qihangerp.open.dou.DouRequest;
import cn.qihangerp.open.dou.DouTokenApiHelper;
import cn.qihangerp.open.dou.common.ApiResultVo;
import cn.qihangerp.open.dou.domain.OmsDouGoods;
import cn.qihangerp.open.dou.domain.OmsDouGoodsSku;
import cn.qihangerp.open.dou.model.GoodsListResultVo;
import cn.qihangerp.open.dou.model.Token;
import cn.qihangerp.open.dou.service.OmsDouGoodsService;
import cn.qihangerp.common.common.AjaxResult;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.HttpStatus;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@AllArgsConstructor
@RequestMapping("/dou/goods")
@RestController
public class DouGoodsApiController {
    private static Logger logger = LoggerFactory.getLogger(DouGoodsApiController.class);
    private final DouApiHelper douApiHelper;
    private final OmsDouGoodsService goodsService;

    @RequestMapping(value = "/pull_goods", method = RequestMethod.POST)
    public AjaxResult getOrderList(@RequestBody DouRequest req) throws Exception {
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        var checkResult = douApiHelper.checkBefore(req.getShopId());
        if (checkResult.getCode() != ResultVoEnum.SUCCESS.getIndex()) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSercet = checkResult.getData().getAppSecret();

        ApiResultVo<Token> token = DouTokenApiHelper.getToken(appKey, appSercet,checkResult.getData().getSellerShopId());
        if(token.getCode()==0) {
            accessToken = token.getData().getAccessToken();
        }else{
            return AjaxResult.error(token.getMsg());
        }

        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数
        ApiResultVo<GoodsListResultVo> apiResultVo = DouGoodsApiHelper.getGoodsList(appKey, appSercet, accessToken, 1, 10);
        if (apiResultVo.getCode() != 0) return AjaxResult.error(apiResultVo.getCode(), apiResultVo.getMsg());
        //成功
        if (apiResultVo.getData().getGoodsList() != null) {
            for (var g : apiResultVo.getData().getGoodsList()) {
                OmsDouGoods goods = new OmsDouGoods();
                BeanUtils.copyProperties(g, goods);
                // TODO:转换goods
                goods.setShopId(req.getShopId());
                goods.setPullTime(new Date());
                List<OmsDouGoodsSku> skuList = new ArrayList<>();
                for (var s : g.getSkuList()) {
                    OmsDouGoodsSku sku = new OmsDouGoodsSku();
                    BeanUtils.copyProperties(s, sku);
                    sku.setShopId(req.getShopId());
                    sku.setName(g.getName());
                    sku.setImg(g.getImg());
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
