package cn.qihangerp.oms.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.oms.domain.ErpShipStockUp;
import cn.qihangerp.oms.domain.bo.ShipStockUpBo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【erp_ship_stock_up(备货表)】的数据库操作Service
* @createDate 2024-06-18 15:25:18
*/
public interface ErpShipStockUpService extends IService<ErpShipStockUp> {
    PageResult<ErpShipStockUp> queryPageList(ShipStockUpBo bo, PageQuery pageQuery);

}
