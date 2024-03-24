package com.qihang.tao.controller;


import com.qihang.common.bo.LinkErpGoodsSkuBo;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.security.common.BaseController;
import com.qihang.tao.domain.TaoGoods;
import com.qihang.tao.domain.TaoGoodsSku;
import com.qihang.tao.domain.bo.TaoGoodsBo;
import com.qihang.tao.domain.vo.TaoGoodsSkuListVo;
import com.qihang.tao.service.TaoGoodsService;
import com.qihang.tao.service.TaoGoodsSkuService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/goods")
@RestController
@AllArgsConstructor
public class GoodsController extends BaseController {
    private final TaoGoodsService goodsService;
    private final TaoGoodsSkuService skuService;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(TaoGoodsBo bo, PageQuery pageQuery) {
        PageResult<TaoGoods> result = goodsService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @RequestMapping(value = "/skuList", method = RequestMethod.GET)
    public TableDataInfo skuList(TaoGoodsBo bo, PageQuery pageQuery) {
        PageResult<TaoGoodsSkuListVo> result = skuService.queryPageList(bo, pageQuery);

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
        TaoGoodsSku sku = new TaoGoodsSku();
        sku.setId(bo.getId());
        sku.setErpGoodsSkuId(Long.parseLong(bo.getErpGoodsSkuId()));
        skuService.updateById(sku);
        return success();
    }

}
