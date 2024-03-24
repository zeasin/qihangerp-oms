package com.qihang.sys.api.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.sys.api.domain.SysTask;
import com.qihang.sys.api.domain.SysTaskLogs;
import com.qihang.sys.api.service.SysTaskLogsService;
import com.qihang.sys.api.mapper.SysTaskLogsMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【sys_task_logs】的数据库操作Service实现
* @createDate 2024-03-22 20:07:56
*/
@AllArgsConstructor
@Service
public class SysTaskLogsServiceImpl extends ServiceImpl<SysTaskLogsMapper, SysTaskLogs>
    implements SysTaskLogsService{
    private final SysTaskLogsMapper mapper;

    @Override
    public PageResult<SysTaskLogs> queryPageList(Integer taskId, PageQuery pageQuery) {
        LambdaQueryWrapper<SysTaskLogs> queryWrapper = new LambdaQueryWrapper<SysTaskLogs>().eq(SysTaskLogs::getTaskId,taskId);
        Page<SysTaskLogs> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
}




