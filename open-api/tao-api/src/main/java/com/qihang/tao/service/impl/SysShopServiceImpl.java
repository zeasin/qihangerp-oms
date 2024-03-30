package com.qihang.tao.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.tao.domain.SysShop;
import com.qihang.tao.service.SysShopService;
import com.qihang.tao.mapper.SysShopMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【sys_shop(数据中心-店铺)】的数据库操作Service实现
* @createDate 2024-02-29 18:37:06
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
    public void updateSessionKey(Integer shopId, String sessionKey) {
        SysShop shop = new SysShop();
        shop.setId(shopId);
        shop.setAccessToken(sessionKey);
        mapper.updateById(shop);
    }
}




