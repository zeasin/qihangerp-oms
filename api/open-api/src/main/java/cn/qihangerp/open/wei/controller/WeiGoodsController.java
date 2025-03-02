package cn.qihangerp.open.wei.controller;



import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;

import cn.qihangerp.domain.bo.LinkErpGoodsSkuBo;
import cn.qihangerp.module.goods.domain.OGoodsSku;
import cn.qihangerp.module.goods.service.OGoodsSkuService;
import cn.qihangerp.module.open.wei.domain.OmsWeiGoodsSku;
import cn.qihangerp.module.open.wei.service.OmsWeiGoodsSkuService;

import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/wei/goods")
@RestController
@AllArgsConstructor
public class WeiGoodsController extends BaseController {
    private final OmsWeiGoodsSkuService skuService;
    private final OGoodsSkuService oGoodsSkuService;

    @RequestMapping(value = "/skuList", method = RequestMethod.GET)
    public TableDataInfo skuList(OmsWeiGoodsSku bo, PageQuery pageQuery) {
        PageResult<OmsWeiGoodsSku> result = skuService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    /**
     *
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
        OmsWeiGoodsSku sku = new OmsWeiGoodsSku();
        sku.setId(bo.getId());
        sku.setOGoodsSkuId(Long.parseLong(bo.getErpGoodsSkuId()));
        skuService.updateById(sku);
        return success();
    }
}
