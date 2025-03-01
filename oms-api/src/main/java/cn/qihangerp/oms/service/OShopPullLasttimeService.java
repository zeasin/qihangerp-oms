package cn.qihangerp.oms.service;


import cn.qihangerp.oms.domain.OShopPullLasttime;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author TW
* @description 针对表【sys_shop_pull_lasttime(店铺更新最后时间记录)】的数据库操作Service
* @createDate 2024-06-04 16:13:03
*/
public interface OShopPullLasttimeService extends IService<OShopPullLasttime> {
    OShopPullLasttime getLasttimeByShop(Long shopId, String pullType);

    List<OShopPullLasttime> getLasttimeByShop(Long shopId);
}
