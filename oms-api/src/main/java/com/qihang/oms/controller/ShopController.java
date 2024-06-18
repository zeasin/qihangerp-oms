package com.qihang.oms.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.oms.domain.SShop;
import com.qihang.oms.domain.SShopPlatform;
import com.qihang.oms.domain.SysLogisticsCompany;
import com.qihang.oms.service.SShopPlatformService;
import com.qihang.oms.service.SShopService;
import com.qihang.oms.service.SysLogisticsCompanyService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
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
    private final SShopService shopService;
    private final SShopPlatformService platformService;

    /**
     * 查询店铺列表logistics
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:list')")
    @GetMapping("/list")
    public TableDataInfo list(SShop shop)
    {
        LambdaQueryWrapper<SShop> qw = new LambdaQueryWrapper<SShop>().eq(shop.getPlatform()!=null,SShop::getPlatform,shop.getPlatform());
        List<SShop> list = shopService.list(qw);
        return getDataTable(list);
    }

    @GetMapping("/platformList")
    public TableDataInfo platformList()
    {
        List<SShopPlatform> list = platformService.list();
        return getDataTable(list);
    }

    /**
     * 获取店铺详细信息
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:query')")
    @GetMapping(value = "/shop/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(shopService.getById(id));
    }

    @GetMapping(value = "/platform/{id}")
    public AjaxResult getPlatform(@PathVariable("id") Long id)
    {
        return success(platformService.getById(id));
    }

    /**
     * 新增店铺
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:add')")
    @PostMapping("/shop")
    public AjaxResult add(@RequestBody SShop shop)
    {
        shop.setCreateTime(new Date());
        return toAjax(shopService.save(shop));
    }

    /**
     * 修改店铺
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:edit')")
    @PutMapping("/shop")
    public AjaxResult edit(@RequestBody SShop shop)
    {
        shop.setUpdateTime(new Date());
        return toAjax(shopService.updateById(shop));
    }

    /**
     * 修改平台
     * @param
     * @return
     */
    @PutMapping("/platform")
    public AjaxResult edit(@RequestBody SShopPlatform platform)
    {
        return toAjax(platformService.updateById(platform));
    }

    /**
     * 删除店铺
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:remove')")
	@DeleteMapping("/shop/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(shopService.removeBatchByIds(Arrays.stream(ids).toList()));
    }

}
