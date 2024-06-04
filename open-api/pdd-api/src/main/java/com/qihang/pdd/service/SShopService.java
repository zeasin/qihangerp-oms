package com.qihang.pdd.service;

import com.qihang.pdd.domain.SShop;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【s_shop(电商平台店铺表)】的数据库操作Service
* @createDate 2024-06-04 15:29:29
*/
public interface SShopService extends IService<SShop> {
    SShop selectShopById(Integer shopId);
    void updateSessionKey(Integer shopId, String ownerId, String sessionKey, String refreshToken, Long expiresIn);
}
