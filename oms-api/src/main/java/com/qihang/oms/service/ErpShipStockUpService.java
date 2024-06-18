package com.qihang.oms.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.oms.domain.ErpSaleOrder;
import com.qihang.oms.domain.ErpShipStockUp;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.oms.domain.bo.ShipStockUpBo;

/**
* @author TW
* @description 针对表【erp_ship_stock_up(备货表)】的数据库操作Service
* @createDate 2024-06-18 15:25:18
*/
public interface ErpShipStockUpService extends IService<ErpShipStockUp> {
    PageResult<ErpShipStockUp> queryPageList(ShipStockUpBo bo, PageQuery pageQuery);

}
