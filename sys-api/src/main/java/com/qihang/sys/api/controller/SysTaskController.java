package com.qihang.sys.api.controller;

import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.security.common.BaseController;
import com.qihang.sys.api.domain.SysTask;
import com.qihang.sys.api.service.SysTaskLogsService;
import com.qihang.sys.api.service.SysTaskService;
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
