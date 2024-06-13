package com.qihang.oms.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.oms.domain.SysShopPullLogs;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【sys_shop_pull_logs(更新日志表)】的数据库操作Service
* @createDate 2024-03-22 17:43:38
*/
public interface SysShopPullLogsService extends IService<SysShopPullLogs> {

    PageResult<SysShopPullLogs> queryPageList(SysShopPullLogs bo, PageQuery pageQuery);
}
