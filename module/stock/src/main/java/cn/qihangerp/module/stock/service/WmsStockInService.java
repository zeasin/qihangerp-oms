package cn.qihangerp.module.stock.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;

import cn.qihangerp.module.stock.domain.WmsStockIn;
import cn.qihangerp.module.stock.request.StockInCreateRequest;
import cn.qihangerp.module.stock.request.StockInRequest;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【wms_stock_in(入库单)】的数据库操作Service
* @createDate 2024-09-22 16:10:08
*/
public interface WmsStockInService extends IService<WmsStockIn> {
    PageResult<WmsStockIn> queryPageList(WmsStockIn bo, PageQuery pageQuery);
    ResultVo<Long> createEntry(Long userId, String userName, StockInCreateRequest request);
    ResultVo<Long> stockIn(Long userId, String userName, StockInRequest request);

    WmsStockIn getDetailAndItemById(Long id);
}
