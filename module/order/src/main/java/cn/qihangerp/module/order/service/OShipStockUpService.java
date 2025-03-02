package cn.qihangerp.module.order.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.order.domain.OShipStockUp;
import cn.qihangerp.module.order.domain.bo.ShipStockUpBo;
import cn.qihangerp.module.order.domain.bo.ShipStockUpCompleteBo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【o_ship_stock_up(备货表（打单加入备货清单）)】的数据库操作Service
* @createDate 2024-07-28 18:29:53
*/
public interface OShipStockUpService extends IService<OShipStockUp> {
    PageResult<OShipStockUp> queryPageList(ShipStockUpBo bo, PageQuery pageQuery);

    /**
     * 备货完成
     * @param bo
     * @return
     */
    int stockUpComplete(ShipStockUpCompleteBo bo);
    int stockUpCompleteByOrder(ShipStockUpCompleteBo bo);
}
