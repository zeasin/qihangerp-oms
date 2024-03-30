package com.qihang.kwai.service;

import com.qihang.kwai.domain.SysShop;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【sys_shop(数据中心-店铺)】的数据库操作Service
* @createDate 2024-03-30 10:04:16
*/
public interface SysShopService extends IService<SysShop> {
    void updateAccessToken(Integer shopId,String accessToken,String refreshToken,Long expireIn);
}
