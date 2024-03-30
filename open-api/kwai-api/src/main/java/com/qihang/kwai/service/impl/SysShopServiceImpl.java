package com.qihang.kwai.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.kwai.domain.SysShop;
import com.qihang.kwai.service.SysShopService;
import com.qihang.kwai.mapper.SysShopMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【sys_shop(数据中心-店铺)】的数据库操作Service实现
* @createDate 2024-03-30 10:04:16
*/
@AllArgsConstructor
@Service
public class SysShopServiceImpl extends ServiceImpl<SysShopMapper, SysShop>
    implements SysShopService{
    private final SysShopMapper mapper;

    @Override
    public void updateAccessToken(Integer shopId, String accessToken, String refreshToken, Long expireIn) {
        SysShop shop =new SysShop();
        shop.setId(shopId);
        shop.setAccessToken(accessToken);
        shop.setRefreshToken(refreshToken);
        shop.setExpiresIn(expireIn);
        mapper.updateById(shop);
    }
}




