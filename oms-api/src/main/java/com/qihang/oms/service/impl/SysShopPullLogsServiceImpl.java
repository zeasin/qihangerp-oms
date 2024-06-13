package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.oms.domain.SysShopPullLogs;
import com.qihang.oms.service.SysShopPullLogsService;
import com.qihang.oms.mapper.SysShopPullLogsMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author TW
* @description 针对表【sys_shop_pull_logs(更新日志表)】的数据库操作Service实现
* @createDate 2024-03-22 17:43:38
*/
@AllArgsConstructor
@Service
public class SysShopPullLogsServiceImpl extends ServiceImpl<SysShopPullLogsMapper, SysShopPullLogs>
    implements SysShopPullLogsService{
    private final SysShopPullLogsMapper mapper;

    @Override
    public PageResult<SysShopPullLogs> queryPageList(SysShopPullLogs bo, PageQuery pageQuery) {
        LambdaQueryWrapper<SysShopPullLogs> queryWrapper = new LambdaQueryWrapper<SysShopPullLogs>();
        queryWrapper.eq(bo.getShopId()!=null,SysShopPullLogs::getShopId,bo.getShopId());
        queryWrapper.eq(bo.getShopType()!=null,SysShopPullLogs::getShopType,bo.getShopType());
        queryWrapper.eq(StringUtils.hasText(bo.getPullType()),SysShopPullLogs::getPullType,bo.getPullType());
        Page<SysShopPullLogs> pages = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }
}




