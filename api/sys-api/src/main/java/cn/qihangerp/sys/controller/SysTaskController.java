package cn.qihangerp.sys.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.domain.SysTask;
import cn.qihangerp.module.service.SysTaskService;
import cn.qihangerp.module.service.SysTaskLogsService;
import cn.qihangerp.security.common.BaseController;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 *
 * 
 * @author qihang
 */
@AllArgsConstructor
@RestController
@RequestMapping("/system/task")
public class SysTaskController extends BaseController
{
    private final SysTaskService taskService;
    private final SysTaskLogsService taskLogsService;
    @GetMapping("/list")
    public TableDataInfo list(PageQuery pageQuery)
    {
        PageResult<SysTask> pageResult = taskService.queryPageList(pageQuery);
        return getDataTable(pageResult);
    }

    @GetMapping(value = "/{taskId}")
    public AjaxResult getInfo(@PathVariable Long taskId)
    {
        return success(taskService.getById(taskId));
    }

    @GetMapping(value = "/logs/{taskId}")
    public AjaxResult getLogs(@PathVariable Integer taskId)
    {
        return success(taskLogsService.queryPageList(taskId,new PageQuery()));
    }

    @PutMapping
    public AjaxResult edit(@RequestBody SysTask task)
    {
        return toAjax(taskService.updateById(task));
    }
}
