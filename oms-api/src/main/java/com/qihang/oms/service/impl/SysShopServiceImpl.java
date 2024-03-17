package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.oms.domain.SysShop;
import com.qihang.oms.service.SysShopService;
import com.qihang.oms.mapper.SysShopMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

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

    @Override
    public List<SysShop> selectShopList() {
        List<SysShop> list = mapper.selectList(new LambdaQueryWrapper<SysShop>());
        return list;
    }
}




