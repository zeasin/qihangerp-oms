package cn.qihangerp.module.service;

import cn.qihangerp.domain.OShopPlatform;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【o_shop_platform(店铺平台配置表)】的数据库操作Service
* @createDate 2024-07-27 18:06:22
*/
public interface OShopPlatformService extends IService<OShopPlatform> {
    OShopPlatform selectById(Integer id);
}
