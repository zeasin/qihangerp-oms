package com.qihang.oms.controller;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.TableDataInfo;
import com.qihang.oms.domain.SysShopPullLogs;
import com.qihang.oms.service.SysShopPullLogsService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
@RequestMapping("/shop")
public class ShopPullLogsController extends BaseController {
    private final SysShopPullLogsService pullLogsService;

    @GetMapping("/pull_logs_list")
    public TableDataInfo list(SysShopPullLogs logs, PageQuery pageQuery)
    {
        var pageList = pullLogsService.queryPageList(logs,pageQuery);
        return getDataTable(pageList);
    }
}
