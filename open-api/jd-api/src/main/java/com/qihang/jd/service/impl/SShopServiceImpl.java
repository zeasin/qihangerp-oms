package com.qihang.jd.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.jd.domain.SShop;
import com.qihang.jd.service.SShopService;
import com.qihang.jd.mapper.SShopMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【s_shop(数据中心-店铺)】的数据库操作Service实现
* @createDate 2024-05-10 11:07:56
*/
@AllArgsConstructor
@Service
public class SShopServiceImpl extends ServiceImpl<SShopMapper, SShop>
    implements SShopService{
    private final SShopMapper mapper;
    @Override
    public SShop selectShopById(Long shopId) {
        return mapper.selectById(shopId);
    }

    @Override
    public void updateSessionKey(Long shopId, String sessionKey) {
        SShop shop = new SShop();
        shop.setId(shopId);
        shop.setSessionkey(sessionKey);
        mapper.updateById(shop);
    }
}




