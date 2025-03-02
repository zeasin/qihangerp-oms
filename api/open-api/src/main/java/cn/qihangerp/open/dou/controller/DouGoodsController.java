package cn.qihangerp.open.dou.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;

import cn.qihangerp.domain.bo.LinkErpGoodsSkuBo;
import cn.qihangerp.module.goods.domain.OGoodsSku;
import cn.qihangerp.module.goods.service.OGoodsSkuService;
import cn.qihangerp.module.open.dou.domain.DouGoods;
import cn.qihangerp.module.open.dou.domain.DouGoodsSku;
import cn.qihangerp.module.open.dou.domain.bo.DouGoodsBo;
import cn.qihangerp.module.open.dou.domain.vo.DouGoodsSkuListVo;
import cn.qihangerp.module.open.dou.service.DouGoodsService;
import cn.qihangerp.module.open.dou.service.DouGoodsSkuService;

import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/dou/goods")
@RestController
@AllArgsConstructor
public class DouGoodsController extends BaseController {
    private final DouGoodsService goodsService;
    private final DouGoodsSkuService skuService;
    private final OGoodsSkuService oGoodsSkuService;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(DouGoodsBo bo, PageQuery pageQuery) {
        PageResult<DouGoods> result = goodsService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @RequestMapping(value = "/skuList", method = RequestMethod.GET)
    public TableDataInfo skuList(DouGoodsBo bo, PageQuery pageQuery) {
        PageResult<DouGoodsSkuListVo> result = skuService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    /**
     * 获取店铺订单详细信息
     */
    @GetMapping(value = "/sku/{id}")
    public AjaxResult getSkuInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(skuService.getById(id));
    }
    @PostMapping(value = "/sku/linkErp")
    public AjaxResult linkErp(@RequestBody LinkErpGoodsSkuBo bo)
    {
        if(StringUtils.isBlank(bo.getId())){
            return AjaxResult.error(500,"缺少参数Id");
        }
        if(StringUtils.isBlank(bo.getErpGoodsSkuId())){
            return AjaxResult.error(500,"缺少参数oGoodsSkuId");
        }
        OGoodsSku oGoodsSku = oGoodsSkuService.getById(bo.getErpGoodsSkuId());
        if(oGoodsSku == null) return AjaxResult.error(1500,"未找到系统商品sku");
        DouGoodsSku sku = new DouGoodsSku();
        sku.setId(Long.parseLong(bo.getId()));
        sku.setOGoodsSkuId(bo.getErpGoodsSkuId());
        skuService.updateById(sku);
        return success();
    }

}
