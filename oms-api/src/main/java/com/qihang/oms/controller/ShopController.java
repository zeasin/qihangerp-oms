package com.qihang.oms.controller;

import com.qihang.common.common.TableDataInfo;
import com.qihang.oms.domain.SysShop;
import com.qihang.oms.service.SysShopService;
import com.qihang.security.common.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;

/**
 * 店铺Controller
 * 
 * @author qihang
 * @date 2023-12-31
 */
@RestController
@RequestMapping("/shop")
public class ShopController extends BaseController
{
    @Autowired
    private SysShopService shopService;

    /**
     * 查询店铺列表
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysShop shop)
    {
        List<SysShop> list = shopService.selectShopList();
        return getDataTable(list);
    }

//    /**
//     * 获取店铺详细信息
//     */
//    @PreAuthorize("@ss.hasPermi('shop:shop:query')")
//    @GetMapping(value = "/{id}")
//    public AjaxResult getInfo(@PathVariable("id") Long id)
//    {
//        return success(shopService.selectShopById(id));
//    }
//
//    /**
//     * 新增店铺
//     */
//    @PreAuthorize("@ss.hasPermi('shop:shop:add')")
//    @PostMapping
//    public AjaxResult add(@RequestBody Shop shop)
//    {
//        shop.setModifyOn(System.currentTimeMillis()/1000);
//        return toAjax(shopService.insertShop(shop));
//    }
//
//    /**
//     * 修改店铺
//     */
//    @PreAuthorize("@ss.hasPermi('shop:shop:edit')")
//    @Log(title = "店铺", businessType = BusinessType.UPDATE)
//    @PutMapping
//    public AjaxResult edit(@RequestBody Shop shop)
//    {
//        return toAjax(shopService.updateShop(shop));
//    }
//
//    /**
//     * 删除店铺
//     */
//    @PreAuthorize("@ss.hasPermi('shop:shop:remove')")
//    @Log(title = "店铺", businessType = BusinessType.DELETE)
//	@DeleteMapping("/{ids}")
//    public AjaxResult remove(@PathVariable Long[] ids)
//    {
//        return toAjax(shopService.deleteShopByIds(ids));
//    }
}
