package com.qihang.jd.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.jd.domain.JdGoodsSku;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.jd.domain.bo.JdGoodsBo;

/**
* @author qilip
* @description 针对表【jd_goods_sku】的数据库操作Service
* @createDate 2024-03-09 20:44:11
*/
public interface JdGoodsSkuService extends IService<JdGoodsSku> {
    PageResult<JdGoodsSku> queryPageList(JdGoodsBo bo, PageQuery pageQuery);
}
