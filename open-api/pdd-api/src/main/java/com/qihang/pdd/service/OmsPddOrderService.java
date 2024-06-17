package com.qihang.pdd.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.pdd.domain.OmsPddOrder;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【oms_pdd_order(拼多多订单表)】的数据库操作Service
* @createDate 2024-06-13 16:54:36
*/
public interface OmsPddOrderService extends IService<OmsPddOrder> {
    PageResult<OmsPddOrder> queryPageList(OmsPddOrder bo, PageQuery pageQuery);
    ResultVo<Integer> saveOrder(Long shopId, OmsPddOrder order);

    OmsPddOrder queryDetailByOrderSn(String orderSn);
}
