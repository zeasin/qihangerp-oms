package com.qihang.oms.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.oms.domain.ErpSaleOrder;
import com.qihang.oms.domain.SShop;
import com.qihang.oms.domain.SShopPlatform;
import com.qihang.oms.domain.SysLogisticsCompany;
import com.qihang.oms.domain.bo.ShipStockUpBo;
import com.qihang.oms.domain.bo.ShipWaybillBo;
import com.qihang.oms.service.*;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 店铺Controller
 * 
 * @author qihang
 * @date 2023-12-31
 */
@AllArgsConstructor
@RestController
@RequestMapping("/ship")
public class ShipController extends BaseController {
    private final ErpShipStockUpService shipStockUpService;
    private final ErpShipWaybillService shipWaybillService;

    /**
     * 备货列表
     * @param bo
     * @param pageQuery
     * @return
     */
    @GetMapping("/stock_up_list")
    public TableDataInfo stock_up_list(ShipStockUpBo bo, PageQuery pageQuery)
    {
        var pageList = shipStockUpService.queryPageList(bo,pageQuery);
        return getDataTable(pageList);
    }

    /**
     * 订单物流信息list
     * @param bo
     * @param pageQuery
     * @return
     */
    @GetMapping("/order_waybill_list")
    public TableDataInfo order_waybill_list(ShipWaybillBo bo, PageQuery pageQuery)
    {
        var pageList = shipWaybillService.queryPageList(bo,pageQuery);
        return getDataTable(pageList);
    }


}
