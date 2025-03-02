package cn.qihangerp.module.service;

import cn.qihangerp.domain.OShopPullLasttime;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【sys_shop_pull_lasttime(店铺更新最后时间记录)】的数据库操作Service
* @createDate 2024-06-04 16:13:03
*/
public interface OShopPullLasttimeService extends IService<OShopPullLasttime> {
    OShopPullLasttime getLasttimeByShop(Long shopId, String pullType);
}
