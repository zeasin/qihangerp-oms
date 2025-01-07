package cn.qihangerp.open.wei.controller;


import com.qihang.common.bo.LinkErpGoodsSkuBo;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.security.common.BaseController;
import cn.qihangerp.open.wei.domain.OmsWeiGoodsSku;
import cn.qihangerp.open.wei.service.OmsWeiGoodsSkuService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/wei/goods")
@RestController
@AllArgsConstructor
public class WeiGoodsController extends BaseController {
    private final OmsWeiGoodsSkuService skuService;

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
        OmsWeiGoodsSku sku = new OmsWeiGoodsSku();
        sku.setId(bo.getId());
        sku.setErpGoodsSkuId(Long.parseLong(bo.getErpGoodsSkuId()));
        skuService.updateById(sku);
        return success();
    }
}
