package com.qihang.jd.service;

import com.qihang.jd.domain.SysShop;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【sys_shop(数据中心-店铺)】的数据库操作Service
* @createDate 2024-03-04 18:43:05
*/
public interface SysShopService extends IService<SysShop> {
    SysShop selectShopById(Integer shopId);

    void updateSessionKey(Integer shopId,String sessionKey);
}
