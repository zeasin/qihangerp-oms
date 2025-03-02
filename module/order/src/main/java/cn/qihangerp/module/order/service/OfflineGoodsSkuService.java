package cn.qihangerp.module.order.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;

import cn.qihangerp.module.order.domain.OfflineGoodsSku;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author qilip
* @description 针对表【offline_goods_sku(OMS商品SKU表)】的数据库操作Service
* @createDate 2024-07-27 21:22:27
*/
public interface OfflineGoodsSkuService extends IService<OfflineGoodsSku> {
    PageResult<OfflineGoodsSku> querySkuPageList(OfflineGoodsSku bo, PageQuery pageQuery);
    List<OfflineGoodsSku> searchGoodsSpec(String keyword);
    ResultVo<Long> insertGoodsSku(OfflineGoodsSku goodsSku);
}
