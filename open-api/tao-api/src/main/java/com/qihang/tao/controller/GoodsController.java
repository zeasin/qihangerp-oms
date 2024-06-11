package com.qihang.tao.controller;


import com.qihang.common.bo.LinkErpGoodsSkuBo;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.tao.common.BaseController;
import com.qihang.tao.domain.OmsTaoGoods;
import com.qihang.tao.domain.OmsTaoGoodsSku;
import com.qihang.tao.domain.bo.TaoGoodsBo;
import com.qihang.tao.domain.vo.TaoGoodsSkuListVo;
import com.qihang.tao.service.OmsTaoGoodsService;
import com.qihang.tao.service.OmsTaoGoodsSkuService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


@RequestMapping("/goods")
@RestController
@AllArgsConstructor
public class GoodsController extends BaseController {
    private final OmsTaoGoodsService goodsService;
    private final OmsTaoGoodsSkuService skuService;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(OmsTaoGoods bo, PageQuery pageQuery) throws Exception {
        PageResult<OmsTaoGoods> result = goodsService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @RequestMapping(value = "/skuList", method = RequestMethod.GET)
    public TableDataInfo skuList(OmsTaoGoods bo, PageQuery pageQuery) throws Exception {
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
        OmsTaoGoodsSku sku = new OmsTaoGoodsSku();
        sku.setId(bo.getId());
        sku.setErpGoodsSkuId(Long.parseLong(bo.getErpGoodsSkuId()));
        skuService.updateById(sku);
        return success();
    }

}
