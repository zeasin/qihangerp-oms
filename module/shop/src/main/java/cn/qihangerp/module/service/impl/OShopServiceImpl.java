package cn.qihangerp.module.service.impl;

import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.module.mapper.OShopMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.domain.OShop;
import cn.qihangerp.module.service.OShopService;

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
public class OShopServiceImpl extends ServiceImpl<OShopMapper, OShop>
    implements OShopService {
    private final OShopMapper mapper;


    @Override
    public List<OShop> selectShopList(OShop shop) {
        LambdaQueryWrapper<OShop> qw = new LambdaQueryWrapper<OShop>()
                .eq(shop.getType()!=null, OShop::getType,shop.getType());
        return mapper.selectList(qw);
    }

    @Override
    public OShop selectShopById(Long id) {
        return mapper.selectById(id);
    }

    @Override
    public int updateShopById(OShop shop) {
        return mapper.updateById(shop);
    }

    @Override
    public int insertShop(OShop shop) {
        return mapper.insert(shop);
    }

    @Override
    public int deleteShopByIds(Long[] ids) {
        return mapper.deleteBatchIds(Arrays.asList(ids));
    }


    @Override
    public List<OShop> selectShopByShopType(EnumShopType shopType) {
        LambdaQueryWrapper<OShop> qw = new LambdaQueryWrapper<OShop>()
                .eq(OShop::getType,shopType.getIndex())
                .eq(OShop::getStatus,1);
        return mapper.selectList(qw);
    }

    @Override
    public void updateSessionKey(Long shopId, String sessionKey) {
        OShop shop = new OShop();
        shop.setId(shopId);
        shop.setAccessToken(sessionKey);
        mapper.updateById(shop);
    }
//    @Override
//    public List<SysPlatform> selectShopPlatformList() {
//        return platformMapper.selectList(new LambdaQueryWrapper<>());
//    }
//
//    @Override
//    public SysPlatform selectShopPlatformById(Long id) {
//        return platformMapper.selectById(id);
//    }
//
//    @Override
//    public int updateShopPlatformById(SysPlatform platform) {
//        return platformMapper.updateById(platform);
//    }
}




