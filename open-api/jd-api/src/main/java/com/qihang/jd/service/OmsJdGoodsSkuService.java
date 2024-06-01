package com.qihang.jd.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.jd.domain.OmsJdGoodsSku;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【oms_jd_goods_sku(京东商品SKU表)】的数据库操作Service
* @createDate 2024-05-10 10:56:39
*/
public interface OmsJdGoodsSkuService extends IService<OmsJdGoodsSku> {
    PageResult<OmsJdGoodsSku> queryPageList(OmsJdGoodsSku bo, PageQuery pageQuery);

    ResultVo<Integer> saveGoodsSku(Long shopId, OmsJdGoodsSku goodsSku);
}
