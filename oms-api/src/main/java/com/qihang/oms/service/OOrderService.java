package com.qihang.oms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.common.common.ResultVo;
import com.qihang.oms.domain.OOrder;

import java.util.List;

/**
* @author qilip
* @description 针对表【o_order(订单表)】的数据库操作Service
* @createDate 2024-03-09 13:15:57
*/
public interface OOrderService extends IService<OOrder> {
    ResultVo<Integer> jdOrderMessage(String orderId);
    ResultVo<Integer> taoOrderMessage(String orderId);

    List<OOrder> getList(OOrder order);
}
