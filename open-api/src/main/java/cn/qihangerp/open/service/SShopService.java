package cn.qihangerp.open.service;

import cn.qihangerp.open.domain.SShop;
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @author TW
* @description 针对表【s_shop(电商平台店铺表)】的数据库操作Service
* @createDate 2024-06-04 15:20:42
*/
public interface SShopService extends IService<SShop> {
    SShop selectShopById(Long shopId);
    void updateSessionKey(Long shopId, String sessionKey);
}
