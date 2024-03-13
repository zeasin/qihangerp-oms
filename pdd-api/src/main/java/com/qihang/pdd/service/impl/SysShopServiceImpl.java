package com.qihang.pdd.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.pdd.domain.SysShop;
import com.qihang.pdd.service.SysShopService;
import com.qihang.pdd.mapper.SysShopMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【sys_shop(数据中心-店铺)】的数据库操作Service实现
* @createDate 2024-03-13 17:43:42
*/
@AllArgsConstructor
@Service
public class SysShopServiceImpl extends ServiceImpl<SysShopMapper, SysShop>
    implements SysShopService{

    private SysShopMapper mapper;
    @Override
    public SysShop selectShopById(Integer shopId) {
        return mapper.selectById(shopId);
    }

    @Override
    public void updateSessionKey(Integer shopId, String sessionKey,String refreshToken) {
        SysShop shop = new SysShop();
        shop.setId(shopId);
        shop.setAccessToken(sessionKey);
        shop.setRefreshToken(refreshToken);
        mapper.updateById(shop);
    }
}




