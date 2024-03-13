package com.qihang.pdd.service;

import com.qihang.pdd.domain.SysShop;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【sys_shop(数据中心-店铺)】的数据库操作Service
* @createDate 2024-03-13 17:43:42
*/
public interface SysShopService extends IService<SysShop> {
    SysShop selectShopById(Integer shopId);

    void updateSessionKey(Integer shopId,String sessionKey,String refreshToken);
}
