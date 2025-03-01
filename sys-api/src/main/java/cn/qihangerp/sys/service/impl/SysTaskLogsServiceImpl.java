package cn.qihangerp.sys.service.impl;

import cn.qihangerp.sys.mapper.SysTaskLogsMapper;
import cn.qihangerp.sys.service.SysTaskLogsService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.sys.domain.SysTaskLogs;
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
    implements SysTaskLogsService {
    private final SysTaskLogsMapper mapper;

    @Override
    public PageResult<SysTaskLogs> queryPageList(Integer taskId, PageQuery pageQuery) {
        LambdaQueryWrapper<SysTaskLogs> queryWrapper = new LambdaQueryWrapper<SysTaskLogs>().eq(SysTaskLogs::getTaskId,taskId);
        Page<SysTaskLogs> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
}




