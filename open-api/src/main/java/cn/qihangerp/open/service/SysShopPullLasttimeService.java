package cn.qihangerp.open.service;

import cn.qihangerp.open.domain.SysShopPullLasttime;
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @author qilip
* @description 针对表【sys_shop_pull_lasttime(店铺更新最后时间记录)】的数据库操作Service
* @createDate 2024-03-17 19:45:11
*/
public interface SysShopPullLasttimeService extends IService<SysShopPullLasttime> {
    SysShopPullLasttime getLasttimeByShop(Long shopId, String pullType);
}
