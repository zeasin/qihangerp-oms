package com.qihang.dou.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.dou.domain.SShopPullLasttime;
import com.qihang.dou.service.SShopPullLasttimeService;
import com.qihang.dou.mapper.SShopPullLasttimeMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author TW
* @description 针对表【s_shop_pull_lasttime(店铺更新最后时间记录)】的数据库操作Service实现
* @createDate 2024-06-11 14:40:36
*/
@AllArgsConstructor
@Service
public class SShopPullLasttimeServiceImpl extends ServiceImpl<SShopPullLasttimeMapper, SShopPullLasttime>
    implements SShopPullLasttimeService{
    private final SShopPullLasttimeMapper mapper;
    @Override
    public SShopPullLasttime getLasttimeByShop(Long shopId, String pullType) {
        List<SShopPullLasttime> sysShopPullLasttimes = mapper.selectList(new LambdaQueryWrapper<SShopPullLasttime>().eq(SShopPullLasttime::getShopId, shopId).eq(SShopPullLasttime::getPullType, pullType));
        if(sysShopPullLasttimes != null && !sysShopPullLasttimes.isEmpty()) return sysShopPullLasttimes.get(0);
        else return null;
    }
}




