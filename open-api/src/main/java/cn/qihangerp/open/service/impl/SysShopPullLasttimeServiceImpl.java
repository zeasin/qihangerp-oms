package cn.qihangerp.open.service.impl;

import cn.qihangerp.open.domain.SysShopPullLasttime;
import cn.qihangerp.open.mapper.SysShopPullLasttimeMapper;
import cn.qihangerp.open.service.SysShopPullLasttimeService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author qilip
* @description 针对表【sys_shop_pull_lasttime(店铺更新最后时间记录)】的数据库操作Service实现
* @createDate 2024-03-17 19:45:11
*/
@AllArgsConstructor
@Service
public class SysShopPullLasttimeServiceImpl extends ServiceImpl<SysShopPullLasttimeMapper, SysShopPullLasttime>
    implements SysShopPullLasttimeService {
    private final SysShopPullLasttimeMapper mapper;

    @Override
    public SysShopPullLasttime getLasttimeByShop(Long shopId, String pullType) {
        List<SysShopPullLasttime> sysShopPullLasttimes = mapper.selectList(new LambdaQueryWrapper<SysShopPullLasttime>().eq(SysShopPullLasttime::getShopId, shopId).eq(SysShopPullLasttime::getPullType, pullType));
        if(sysShopPullLasttimes != null && !sysShopPullLasttimes.isEmpty()) return sysShopPullLasttimes.get(0);
        else return null;
    }
}




