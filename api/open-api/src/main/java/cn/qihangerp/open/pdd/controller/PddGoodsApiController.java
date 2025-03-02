package cn.qihangerp.open.pdd.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.enums.HttpStatus;
import cn.qihangerp.domain.OShopPullLasttime;
import cn.qihangerp.domain.OShopPullLogs;
import cn.qihangerp.module.open.pdd.domain.PddGoods;
import cn.qihangerp.module.open.pdd.domain.PddGoodsSku;
import cn.qihangerp.module.open.pdd.service.PddGoodsService;
import cn.qihangerp.module.service.OShopPullLasttimeService;
import cn.qihangerp.module.service.OShopPullLogsService;
import cn.qihangerp.open.PullRequest;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.pdd.ApiCommon;
import cn.qihangerp.open.pdd.PddGoodsApiHelper;
import cn.qihangerp.open.pdd.model.GoodsResultVo;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/pdd/goods")
@RestController
@AllArgsConstructor
public class PddGoodsApiController {
    private final ApiCommon apiCommon;
    private final PddGoodsService goodsService;
    private final OShopPullLogsService pullLogsService;
    private final OShopPullLasttimeService pullLasttimeService;



    /**
     * 拉取商品列表（包含sku）
     * @param params
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/pull_goods", method = RequestMethod.POST)
    public AjaxResult pullSkuList(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Long currTimeMillis = System.currentTimeMillis();
        Date currDateTime = new Date();
        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();

        // 获取最后更新时间
        LocalDateTime startTime = null;
        LocalDateTime endTime = null;
        OShopPullLasttime lasttime = pullLasttimeService.getLasttimeByShop(params.getShopId(), "GOODS");
        if(params.getPullType()!=null && params.getPullType()==1) {
            if (lasttime != null) {
                // 按更新时间来
                startTime = lasttime.getLasttime().minusHours(7*24);//取上次结束一个小时前
                endTime = LocalDateTime.now();
            }
        }
//        String pullParams = "{PageNo:1,PageSize:50,startTime:"+startTime+",endTime:"+endTime+"}";
        String pullParams = "{startTime:"+startTime+",endTime:"+endTime+"}";

        ApiResultVo<GoodsResultVo> resultVo = PddGoodsApiHelper.pullGoodsList(appKey, appSecret, accessToken, 1, 20);
        if(resultVo.getCode() == 10019) return AjaxResult.error(HttpStatus.UNAUTHORIZED1,"Token已过期");

//        ApiResultVo<PddGoodsResponse> resultVo = GoodsApiHelper.pullGoodsList(appKey, appSecret,accessToken,startTime,endTime);
        if(resultVo.getCode() !=0 ){
            OShopPullLogs logs = new OShopPullLogs();
            logs.setShopId(params.getShopId());
            logs.setShopType(EnumShopType.PDD.getIndex());
            logs.setPullType("GOODS");
            logs.setPullWay("主动拉取商品sku");
            logs.setPullParams(pullParams);
            logs.setPullResult(resultVo.getMsg());
            logs.setPullTime(currDateTime);
            logs.setDuration(System.currentTimeMillis() - currTimeMillis);
            pullLogsService.save(logs);
            return AjaxResult.error("接口拉取错误："+resultVo.getMsg());
        }

        int successTotal = 0;
        if (resultVo.getData().getGoodsList() == null) return AjaxResult.error(1200,"数据获取失败");

        for (var g : resultVo.getData().getGoodsList()) {
            PddGoods pddGoods = new PddGoods();
            BeanUtils.copyProperties(g, pddGoods);
            // TODO:转换goods
            pddGoods.setShopId(params.getShopId());
            pddGoods.setCreateTime(new Date());
            List<PddGoodsSku> skuList = new ArrayList<>();
            for (var s : g.getSkuList()) {
                PddGoodsSku sku = new PddGoodsSku();
                BeanUtils.copyProperties(s, sku);
                sku.setShopId(params.getShopId());
                sku.setGoodsId(g.getGoodsId());
                sku.setGoodsName(g.getGoodsName());
                sku.setThumbUrl(g.getThumbUrl());

                sku.setCreateTime(new Date());
                skuList.add(sku);
            }
            pddGoods.setSkuList(skuList);

            goodsService.saveGoods(params.getShopId(),pddGoods);
            successTotal++;
        }
        // 添加拉取日志
        OShopPullLogs logs = new OShopPullLogs();
        logs.setShopId(params.getShopId());
        logs.setShopType(EnumShopType.PDD.getIndex());
        logs.setPullType("GOODS");
        logs.setPullWay("主动拉取商品sku");
        logs.setPullParams(pullParams);
        logs.setPullResult("{successTotal:"+successTotal+"}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - currTimeMillis);
        pullLogsService.save(logs);


        if(lasttime == null){
            // 新增
            OShopPullLasttime insertLasttime = new OShopPullLasttime();
            insertLasttime.setShopId(params.getShopId());
            insertLasttime.setCreateTime(new Date());
            insertLasttime.setLasttime(endTime==null?LocalDateTime.now():endTime);
            insertLasttime.setPullType("GOODS");
            pullLasttimeService.save(insertLasttime);

        }else {
            // 修改
            OShopPullLasttime updateLasttime = new OShopPullLasttime();
            updateLasttime.setId(lasttime.getId());
            updateLasttime.setUpdateTime(new Date());
            updateLasttime.setLasttime(endTime==null?LocalDateTime.now():endTime);
            pullLasttimeService.updateById(updateLasttime);
        }
        return AjaxResult.success("接口拉取成功，总数据："+successTotal);
    }
}
