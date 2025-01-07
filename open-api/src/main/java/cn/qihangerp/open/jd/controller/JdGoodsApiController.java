package cn.qihangerp.open.jd.controller;


import cn.qihangerp.open.jd.JdApiCommon;
import cn.qihangerp.open.jd.GoodsApiHelper;
import cn.qihangerp.open.jd.JdPullRequest;
import cn.qihangerp.open.jd.common.ApiResultVo;
import cn.qihangerp.open.jd.domain.OmsJdGoodsSku;
import cn.qihangerp.open.jd.model.GoodsSku;
import cn.qihangerp.open.jd.service.OmsJdGoodsSkuService;
import cn.qihangerp.open.jd.utils.DateUtil;
import com.alibaba.fastjson2.JSON;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.enums.HttpStatus;

import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

@AllArgsConstructor
@RestController
@RequestMapping("/jd/goods")
public class JdGoodsApiController extends BaseController {
    private final JdApiCommon jdApiCommon;
    private final OmsJdGoodsSkuService goodsSkuService;

    @RequestMapping(value = "/pull_goods", method = RequestMethod.POST)
    public AjaxResult pullList(@RequestBody JdPullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        var checkResult = jdApiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();


        //获取接口
        ApiResultVo<GoodsSku> upResult = GoodsApiHelper.pullGoods(appKey,appSecret,accessToken);
        if(upResult.getCode() == 19) return AjaxResult.error(HttpStatus.UNAUTHORIZED1,"Token已过期");
        if(upResult.getCode()!=0) return AjaxResult.error(upResult.getCode(),upResult.getMsg());

        int successTotal = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数
        for (GoodsSku sku: upResult.getList()) {
            OmsJdGoodsSku goodsSku = new OmsJdGoodsSku();
            BeanUtils.copyProperties(sku, goodsSku);
            goodsSku.setJdPrice(BigDecimal.valueOf(sku.getJdPrice()/100));
            goodsSku.setCreated( DateUtil.unixTimeToDate(sku.getCreated()/1000));
            goodsSku.setModified(DateUtil.unixTimeToDate(sku.getModified()/1000));
            goodsSku.setShopId(params.getShopId());
            if(sku.getSaleAttrs()!=null){
                goodsSku.setSaleAttrs(JSON.toJSONString(sku.getSaleAttrs()));
                String attrs = "";
                for(GoodsSku.SaleAttrsDTO dto:sku.getSaleAttrs()){
                    for(String s: dto.getAttrValueAlias()) {
                        attrs += s +";";
                    }
                }
                goodsSku.setAttrs(attrs);
            }

            goodsSkuService.saveGoodsSku(params.getShopId(), goodsSku);
            successTotal++;
            logger.info("添加商品："+successTotal);

        }
        return AjaxResult.success();
    }
}
