package com.qihang.sys.api.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.sys.api.domain.SysTask;
import com.qihang.sys.api.service.SysTaskService;
import com.qihang.sys.api.mapper.SysTaskMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【sys_task】的数据库操作Service实现
* @createDate 2024-03-22 19:34:41
*/
@AllArgsConstructor
@Service
public class SysTaskServiceImpl extends ServiceImpl<SysTaskMapper, SysTask>
    implements SysTaskService{
    private final SysTaskMapper mapper;

    @Override
    public PageResult<SysTask> queryPageList(PageQuery pageQuery) {
        LambdaQueryWrapper<SysTask> queryWrapper = new LambdaQueryWrapper<SysTask>();
        Page<SysTask> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
}




