package cn.qihangerp.module.service.impl;

import cn.qihangerp.module.mapper.OShopPlatformMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.domain.OShopPlatform;
import cn.qihangerp.module.service.OShopPlatformService;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【o_shop_platform(店铺平台配置表)】的数据库操作Service实现
* @createDate 2024-07-27 18:06:22
*/
@AllArgsConstructor
@Service
public class OShopPlatformServiceImpl extends ServiceImpl<OShopPlatformMapper, OShopPlatform>
    implements OShopPlatformService{
    private final OShopPlatformMapper mapper;
    @Override
    public OShopPlatform selectById(Integer id) {
        return mapper.selectById(id);
    }
}




