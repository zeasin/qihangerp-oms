package com.qihang.wei.service;

import com.qihang.wei.domain.SShop;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【s_shop(数据中心-店铺)】的数据库操作Service
* @createDate 2024-06-03 14:14:56
*/
public interface SShopService extends IService<SShop> {
    SShop selectShopById(Integer shopId);

    void updateSessionKey(Integer shopId,String sessionKey);
}
