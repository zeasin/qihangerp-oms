package cn.qihangerp.oms.controller;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.TableDataInfo;

import cn.qihangerp.domain.OShopPullLogs;


import cn.qihangerp.module.service.OShopPullLogsService;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
@RequestMapping("/shop")
public class ShopPullLogsController extends BaseController {
    private final OShopPullLogsService pullLogsService;

    @GetMapping("/pull_logs_list")
    public TableDataInfo list(OShopPullLogs logs, PageQuery pageQuery)
    {
        var pageList = pullLogsService.queryPageList(logs,pageQuery);
        return getDataTable(pageList);
    }
}
