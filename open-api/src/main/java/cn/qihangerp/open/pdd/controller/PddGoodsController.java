package cn.qihangerp.open.pdd.controller;


import cn.qihangerp.open.pdd.domain.OmsPddGoods;
import cn.qihangerp.open.pdd.domain.OmsPddGoodsSku;
import cn.qihangerp.open.pdd.service.OmsPddGoodsService;
import cn.qihangerp.open.pdd.service.OmsPddGoodsSkuService;
import com.qihang.common.bo.LinkErpGoodsSkuBo;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;

import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/pdd/goods")
@RestController
@AllArgsConstructor
public class PddGoodsController extends BaseController {
    private final OmsPddGoodsService goodsService;
    private final OmsPddGoodsSkuService skuService;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(OmsPddGoods bo, PageQuery pageQuery) {
        PageResult<OmsPddGoods> result = goodsService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @RequestMapping(value = "/skuList", method = RequestMethod.GET)
    public TableDataInfo skuList(OmsPddGoodsSku bo, PageQuery pageQuery) {
        PageResult<OmsPddGoodsSku> result = skuService.queryPageList(bo, pageQuery);

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
        OmsPddGoodsSku sku = new OmsPddGoodsSku();
        sku.setId(bo.getId());
        sku.setErpGoodsSkuId(Long.parseLong(bo.getErpGoodsSkuId()));
        skuService.updateById(sku);
        return success();
    }

}
