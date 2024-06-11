package com.qihang.pdd.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.pdd.domain.SShop;
import com.qihang.pdd.service.SShopService;
import com.qihang.pdd.mapper.SShopMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【s_shop(电商平台店铺表)】的数据库操作Service实现
* @createDate 2024-06-04 15:29:29
*/
@AllArgsConstructor
@Service
public class SShopServiceImpl extends ServiceImpl<SShopMapper, SShop>
    implements SShopService{
    private SShopMapper mapper;
    @Override
    public SShop selectShopById(Long shopId) {
        return mapper.selectById(shopId);
    }

    @Override
    public void updateSessionKey(Integer shopId, String ownerId, String sessionKey, String refreshToken, Long expiresIn) {
        SShop shop = new SShop();
        shop.setId(shopId);
        shop.setAccessToken(sessionKey);
        shop.setRefreshToken(refreshToken);
        shop.setAccessExpiresIn(expiresIn);
        shop.setAccessTokenBegin(System.currentTimeMillis() / 1000);
        mapper.updateById(shop);
    }
}




