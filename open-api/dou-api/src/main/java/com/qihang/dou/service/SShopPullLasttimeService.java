package com.qihang.dou.service;

import com.qihang.dou.domain.SShopPullLasttime;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【s_shop_pull_lasttime(店铺更新最后时间记录)】的数据库操作Service
* @createDate 2024-06-11 14:40:36
*/
public interface SShopPullLasttimeService extends IService<SShopPullLasttime> {
    SShopPullLasttime getLasttimeByShop(Long shopId,String pullType);
}
