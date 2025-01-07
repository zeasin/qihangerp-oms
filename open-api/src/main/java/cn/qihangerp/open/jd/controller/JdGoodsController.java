package cn.qihangerp.open.jd.controller;


import cn.qihangerp.open.jd.domain.OmsJdGoodsSku;
import cn.qihangerp.open.jd.service.OmsJdGoodsSkuService;
import com.qihang.common.bo.LinkErpGoodsSkuBo;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;

import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/jd/goods")
@RestController
@AllArgsConstructor
public class JdGoodsController extends BaseController {
//    private final JdGoodsService goodsService;
    private final OmsJdGoodsSkuService skuService;
//    @RequestMapping(value = "/list", method = RequestMethod.GET)
//    public TableDataInfo goodsList(JdGoodsBo bo, PageQuery pageQuery) {
//        PageResult<JdGoods> result = goodsService.queryPageList(bo, pageQuery);
//
//        return getDataTable(result);
//    }

    @RequestMapping(value = "/skuList", method = RequestMethod.GET)
    public TableDataInfo skuList(OmsJdGoodsSku bo, PageQuery pageQuery) {
        PageResult<OmsJdGoodsSku> result = skuService.queryPageList(bo, pageQuery);

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
        OmsJdGoodsSku sku = new OmsJdGoodsSku();
        sku.setId(bo.getId());
        sku.setErpGoodsSkuId(Long.parseLong(bo.getErpGoodsSkuId()));
        skuService.updateById(sku);
        return success();
    }

}
