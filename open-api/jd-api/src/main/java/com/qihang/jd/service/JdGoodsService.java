package com.qihang.jd.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.jd.domain.JdGoods;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.jd.domain.bo.JdGoodsBo;

/**
* @author qilip
* @description 针对表【jd_goods】的数据库操作Service
* @createDate 2024-03-09 11:29:59
*/
public interface JdGoodsService extends IService<JdGoods> {
    PageResult<JdGoods> queryPageList(JdGoodsBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveGoods(Integer shopId, JdGoods goods);
}
