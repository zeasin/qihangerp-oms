package com.qihang.oms.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.oms.domain.SShop;
import com.qihang.oms.domain.SShopSetting;
import com.qihang.oms.domain.SysLogisticsCompany;
import com.qihang.oms.service.SShopService;
import com.qihang.oms.service.SShopSettingService;
import com.qihang.oms.service.SysLogisticsCompanyService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
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
    private final SShopSettingService shopSettingService;

    /**
     * 查询店铺列表logistics
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:list')")
    @GetMapping("/list")
    public TableDataInfo list(SShop shop)
    {
        LambdaQueryWrapper<SShop> qw = new LambdaQueryWrapper<SShop>().eq(shop.getType()!=null,SShop::getType,shop.getType());
        List<SShop> list = shopService.list(qw);
        return getDataTable(list);
    }

    @GetMapping("/platformList")
    public TableDataInfo platformList()
    {
        List<SShopSetting> list = shopSettingService.list();
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
        return success(shopService.getById(id));
    }

    /**
     * 新增店铺
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:add')")
    @PostMapping("/shop")
    public AjaxResult add(@RequestBody SShop shop)
    {
        shop.setModifyOn(System.currentTimeMillis()/1000);
        return toAjax(shopService.save(shop));
    }

    /**
     * 修改店铺
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:edit')")
    @PutMapping("/shop")
    public AjaxResult edit(@RequestBody SShop shop)
    {
        return toAjax(shopService.updateById(shop));
    }

    /**
     * 修改平台
     * @param
     * @return
     */
    @PutMapping("/platform")
    public AjaxResult edit(@RequestBody SShopSetting platform)
    {
        return toAjax(shopSettingService.updateById(platform));
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
