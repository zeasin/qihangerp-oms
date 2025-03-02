package cn.qihangerp.module.service;

import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.domain.OShop;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author qilip
* @description 针对表【sys_shop(数据中心-店铺)】的数据库操作Service
* @createDate 2024-03-17 15:17:34
*/
public interface OShopService extends IService<OShop> {
    List<OShop> selectShopList(OShop shop);
    OShop selectShopById(Long id);
    int updateShopById(OShop shop);
    int insertShop(OShop shop);

    int deleteShopByIds(Long[] ids);
//    List<SysPlatform> selectShopPlatformList();
//    SysPlatform selectShopPlatformById(Long id);
//    int updateShopPlatformById(SysPlatform platform);
    List<OShop> selectShopByShopType(EnumShopType shopType);
    void updateSessionKey(Long shopId,String sessionKey);
}
