package cn.qihangerp.oms.controller;


import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.module.goods.domain.OGoodsInventory;
import cn.qihangerp.module.goods.domain.OGoodsInventoryBatch;
import cn.qihangerp.module.goods.service.OGoodsInventoryBatchService;
import cn.qihangerp.module.goods.service.OGoodsInventoryService;
import cn.qihangerp.security.common.BaseController;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/goodsInventory")
public class GoodsInventoryController extends BaseController {
    private final OGoodsInventoryService goodsInventoryService;
    private final OGoodsInventoryBatchService inventoryBatchService;

    @GetMapping("/list")
    public TableDataInfo list(OGoodsInventory bo, PageQuery pageQuery)
    {
        PageResult<OGoodsInventory> pageResult = goodsInventoryService.queryPageList(bo, pageQuery);
        return getDataTable(pageResult);
    }

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        OGoodsInventory goodsInventory = goodsInventoryService.getById(id);
        if(goodsInventory!=null) {
            List<OGoodsInventoryBatch> list = inventoryBatchService.list(new LambdaQueryWrapper<OGoodsInventoryBatch>().eq(OGoodsInventoryBatch::getSkuId, goodsInventory.getSkuId()));
            return AjaxResult.success(list);
        }
        return success();
    }
}
