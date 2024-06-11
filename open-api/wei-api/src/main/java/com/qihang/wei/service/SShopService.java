package com.qihang.wei.service;

import com.qihang.wei.domain.SShop;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【s_shop(电商平台店铺表)】的数据库操作Service
* @createDate 2024-06-11 15:13:13
*/
public interface SShopService extends IService<SShop> {
    SShop selectShopById(Long shopId);
    void updateSessionKey(Long shopId, String sessionKey);
}
