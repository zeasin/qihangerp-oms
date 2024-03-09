package com.qihang.jd.service;

import com.qihang.common.common.ResultVo;
import com.qihang.jd.domain.JdGoods;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.jd.domain.JdOrder;

/**
* @author qilip
* @description 针对表【jd_goods】的数据库操作Service
* @createDate 2024-03-09 11:29:59
*/
public interface JdGoodsService extends IService<JdGoods> {
    ResultVo<Integer> saveGoods(Integer shopId, JdGoods goods);
}
