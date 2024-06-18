package com.qihang.oms.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.oms.domain.ErpShipStockUp;
import com.qihang.oms.domain.ErpShipWaybill;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.oms.domain.bo.ShipStockUpBo;
import com.qihang.oms.domain.bo.ShipWaybillBo;

/**
* @author TW
* @description 针对表【erp_ship_waybill(发货电子面单记录表)】的数据库操作Service
* @createDate 2024-06-18 17:06:10
*/
public interface ErpShipWaybillService extends IService<ErpShipWaybill> {
    PageResult<ErpShipWaybill> queryPageList(ShipWaybillBo bo, PageQuery pageQuery);

}
