package com.qihang.tao.service;

import com.qihang.tao.domain.SShop;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【s_shop(数据中心-店铺)】的数据库操作Service
* @createDate 2024-05-10 10:13:15
*/
public interface SShopService extends IService<SShop> {
    SShop selectShopById(Long shopId);

    void updateSessionKey(Long shopId, String sessionKey);

}
