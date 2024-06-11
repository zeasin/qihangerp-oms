package com.qihang.pdd.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.pdd.domain.OmsPddGoods;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【oms_pdd_goods(pdd商品表)】的数据库操作Service
* @createDate 2024-06-11 14:16:55
*/
public interface OmsPddGoodsService extends IService<OmsPddGoods> {
    PageResult<OmsPddGoods> queryPageList(OmsPddGoods bo, PageQuery pageQuery);

    int saveAndUpdateGoods(Long shopId,OmsPddGoods goods);
}
