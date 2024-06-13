package com.qihang.pdd.service;

import com.qihang.pdd.domain.SysShopPullLasttime;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【sys_shop_pull_lasttime(店铺更新最后时间记录)】的数据库操作Service
* @createDate 2024-03-13 17:43:42
*/
public interface SysShopPullLasttimeService extends IService<SysShopPullLasttime> {
    SysShopPullLasttime getLasttimeByShop(Long shopId,String pullType);
}
