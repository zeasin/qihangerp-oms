package cn.qihangerp.open.dou.controller;


import cn.qihangerp.open.dou.domain.OmsDouGoods;
import cn.qihangerp.open.dou.domain.OmsDouGoodsSku;
import cn.qihangerp.open.dou.service.OmsDouGoodsService;
import cn.qihangerp.open.dou.service.OmsDouGoodsSkuService;
import com.qihang.common.bo.LinkErpGoodsSkuBo;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;

import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.web.bind.annotation.*;
@Log
@RequestMapping("/dou/goods")
@RestController
@AllArgsConstructor
public class DouGoodsController extends BaseController {
    private final OmsDouGoodsService goodsService;
    private final OmsDouGoodsSkuService skuService;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(OmsDouGoods bo, PageQuery pageQuery) {
        PageResult<OmsDouGoods> result = goodsService.queryPageList(bo, pageQuery);
        log.info("访问商品接口");
        return getDataTable(result);
    }

    @RequestMapping(value = "/skuList", method = RequestMethod.GET)
    public TableDataInfo skuList(OmsDouGoodsSku bo, PageQuery pageQuery) {
        PageResult<OmsDouGoodsSku> result = skuService.queryPageList(bo, pageQuery);

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
        OmsDouGoodsSku sku = new OmsDouGoodsSku();
        sku.setId(bo.getId());
        sku.setErpGoodsSkuId(Long.parseLong(bo.getErpGoodsSkuId()));
        skuService.updateById(sku);
        return success();
    }

}
