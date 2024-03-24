package com.qihang.oms.service;

import com.qihang.oms.domain.SysPlatform;
import com.qihang.oms.domain.SysShop;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author qilip
* @description 针对表【sys_shop(数据中心-店铺)】的数据库操作Service
* @createDate 2024-03-17 15:17:34
*/
public interface SysShopService extends IService<SysShop> {
    List<SysShop> selectShopList(SysShop shop);
    SysShop selectShopById(Long id);
    int updateShopById(SysShop shop);
    int insertShop(SysShop shop);

    int deleteShopByIds(Long[] ids);
    List<SysPlatform> selectShopPlatformList();
    SysPlatform selectShopPlatformById(Long id);
    int updateShopPlatformById(SysPlatform platform);
}
