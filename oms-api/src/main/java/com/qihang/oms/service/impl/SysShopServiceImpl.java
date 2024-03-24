package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.oms.domain.SysPlatform;
import com.qihang.oms.domain.SysShop;
import com.qihang.oms.mapper.SysPlatformMapper;
import com.qihang.oms.service.SysShopService;
import com.qihang.oms.mapper.SysShopMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
* @author qilip
* @description 针对表【sys_shop(数据中心-店铺)】的数据库操作Service实现
* @createDate 2024-03-17 15:17:34
*/
@AllArgsConstructor
@Service
public class SysShopServiceImpl extends ServiceImpl<SysShopMapper, SysShop>
    implements SysShopService{
    private final SysShopMapper mapper;
    private final SysPlatformMapper platformMapper;

    @Override
    public List<SysShop> selectShopList(SysShop shop) {
        LambdaQueryWrapper<SysShop> qw = new LambdaQueryWrapper<SysShop>()
                .eq(shop.getType()!=null,SysShop::getType,shop.getType());
        return mapper.selectList(qw);
    }

    @Override
    public SysShop selectShopById(Long id) {
        return mapper.selectById(id);
    }

    @Override
    public int updateShopById(SysShop shop) {
        return mapper.updateById(shop);
    }

    @Override
    public int insertShop(SysShop shop) {
        return mapper.insert(shop);
    }

    @Override
    public int deleteShopByIds(Long[] ids) {
        return mapper.deleteBatchIds(Arrays.asList(ids));
    }

    @Override
    public List<SysPlatform> selectShopPlatformList() {
        return platformMapper.selectList(new LambdaQueryWrapper<>());
    }

    @Override
    public SysPlatform selectShopPlatformById(Long id) {
        return platformMapper.selectById(id);
    }

    @Override
    public int updateShopPlatformById(SysPlatform platform) {
        return platformMapper.updateById(platform);
    }
}




