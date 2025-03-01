package cn.qihangerp.oms.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.oms.domain.ErpShipWaybill;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.qihangerp.oms.domain.bo.ShipWaybillBo;

/**
* @author TW
* @description 针对表【erp_ship_waybill(发货电子面单记录表)】的数据库操作Service
* @createDate 2024-06-18 17:06:10
*/
public interface ErpShipWaybillService extends IService<ErpShipWaybill> {
    PageResult<ErpShipWaybill> queryPageList(ShipWaybillBo bo, PageQuery pageQuery);

}
