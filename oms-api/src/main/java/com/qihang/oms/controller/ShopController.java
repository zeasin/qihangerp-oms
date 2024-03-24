package com.qihang.oms.controller;

import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.oms.domain.SysLogisticsCompany;
import com.qihang.oms.domain.SysPlatform;
import com.qihang.oms.domain.SysShop;
import com.qihang.oms.service.SysLogisticsCompanyService;
import com.qihang.oms.service.SysShopService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
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
@AllArgsConstructor
@RestController
@RequestMapping("/shop")
public class ShopController extends BaseController {
    private final SysLogisticsCompanyService logisticsCompanyService;
    private final SysShopService shopService;

    /**
     * 查询店铺列表logistics
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysShop shop)
    {
        List<SysShop> list = shopService.selectShopList(shop);
        return getDataTable(list);
    }

    @GetMapping("/platformList")
    public TableDataInfo platformList()
    {
        List<SysPlatform> list = shopService.selectShopPlatformList();
        return getDataTable(list);
    }

    /**
     * 获取店铺详细信息
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:query')")
    @GetMapping(value = "/shop/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(shopService.selectShopById(id));
    }

    @GetMapping(value = "/platform/{id}")
    public AjaxResult getPlatform(@PathVariable("id") Long id)
    {
        return success(shopService.selectShopPlatformById(id));
    }

    /**
     * 新增店铺
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:add')")
    @PostMapping("/shop")
    public AjaxResult add(@RequestBody SysShop shop)
    {
        shop.setModifyOn(System.currentTimeMillis()/1000);
        return toAjax(shopService.insertShop(shop));
    }

    /**
     * 修改店铺
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:edit')")
    @PutMapping("/shop")
    public AjaxResult edit(@RequestBody SysShop shop)
    {
        return toAjax(shopService.updateShopById(shop));
    }

    /**
     * 修改平台
     * @param
     * @return
     */
    @PutMapping("/platform")
    public AjaxResult edit(@RequestBody SysPlatform platform)
    {
        return toAjax(shopService.updateShopPlatformById(platform));
    }

    /**
     * 删除店铺
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:remove')")
	@DeleteMapping("/shop/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(shopService.deleteShopByIds(ids));
    }


    /**
     * 查询店铺列表logistics
     */
    @GetMapping("/logistics")
    public TableDataInfo logisticsList(Integer platform, Integer shopId, PageQuery pageQuery)
    {
        PageResult<SysLogisticsCompany> result = logisticsCompanyService.queryPageList(platform, shopId, pageQuery);
        return getDataTable(result);
    }
}
