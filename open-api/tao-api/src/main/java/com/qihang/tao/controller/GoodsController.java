package com.qihang.tao.controller;


import com.qihang.common.bo.LinkErpGoodsSkuBo;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.tao.common.BaseController;
import com.qihang.tao.domain.bo.TaoGoodsBo;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import tech.qihangec.open.tao.common.PageQuery;
import tech.qihangec.open.tao.common.PageResult;
import tech.qihangec.open.tao.domain.TaoGoods;
import tech.qihangec.open.tao.domain.vo.TaoGoodsSkuListVo;
import tech.qihangec.open.tao.service.TaoGoodsService;
import tech.qihangec.open.tao.service.TaoGoodsSkuService;

@RequestMapping("/goods")
@RestController
@AllArgsConstructor
public class GoodsController extends BaseController {
    private final TaoGoodsService goodsService;
    private final TaoGoodsSkuService skuService;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(TaoGoodsBo bo, PageQuery pageQuery) throws Exception {
        tech.qihangec.open.tao.common.PageResult<TaoGoods> result = goodsService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @RequestMapping(value = "/skuList", method = RequestMethod.GET)
    public TableDataInfo skuList(TaoGoodsBo bo, PageQuery pageQuery) throws Exception {
        PageResult<TaoGoodsSkuListVo> result = skuService.queryPageList(bo.getShopId(), bo.getNumIid(), pageQuery);

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
//    @PostMapping(value = "/sku/linkErp")
//    public AjaxResult linkErp(@RequestBody LinkErpGoodsSkuBo bo)
//    {
//        TaoGoodsSku sku = new TaoGoodsSku();
//        sku.setId(bo.getId());
//        sku.setErpGoodsSkuId(Long.parseLong(bo.getErpGoodsSkuId()));
//        skuService.updateById(sku);
//        return success();
//    }

}
