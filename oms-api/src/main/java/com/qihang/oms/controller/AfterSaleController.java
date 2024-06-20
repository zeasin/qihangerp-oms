package com.qihang.oms.controller;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.TableDataInfo;
import com.qihang.oms.domain.ErpSaleAfterInfo;
import com.qihang.oms.domain.ErpSaleOrder;
import com.qihang.oms.service.ErpSaleAfterInfoService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
@RequestMapping("/afterSale")
public class AfterSaleController extends BaseController {
    private final ErpSaleAfterInfoService afterInfoService;

    @GetMapping("/list")
    public TableDataInfo list(ErpSaleAfterInfo bo, PageQuery pageQuery)
    {
        var pageList = afterInfoService.queryPageList(bo,pageQuery);
        return getDataTable(pageList);
    }
}
