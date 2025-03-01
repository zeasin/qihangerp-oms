package cn.qihangerp.oms.controller;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.common.TableDataInfo;
import cn.qihangerp.oms.service.ErpSaleAfterInfoService;
import cn.qihangerp.oms.domain.ErpSaleAfterInfo;
import cn.qihangerp.security.common.BaseController;
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
