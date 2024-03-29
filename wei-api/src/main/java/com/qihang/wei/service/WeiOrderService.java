package com.qihang.wei.service;

import com.qihang.common.common.ResultVo;
import com.qihang.wei.domain.WeiOrder;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【wei_order】的数据库操作Service
* @createDate 2024-03-29 16:44:51
*/
public interface WeiOrderService extends IService<WeiOrder> {
    ResultVo<Integer> saveOrder(Integer shopId, WeiOrder order);
}
