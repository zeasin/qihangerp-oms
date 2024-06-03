package com.qihang.wei.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.wei.bo.WeiOrderConfirmBo;
import com.qihang.wei.domain.OmsWeiOrder;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【oms_wei_order】的数据库操作Service
* @createDate 2024-06-03 16:48:31
*/
public interface OmsWeiOrderService extends IService<OmsWeiOrder> {
    PageResult<OmsWeiOrder> queryPageList(OmsWeiOrder bo, PageQuery pageQuery);
    ResultVo<Integer> saveOrder(Long shopId, OmsWeiOrder order);
    OmsWeiOrder queryDetailById(Long id);
    int confirmOrder(WeiOrderConfirmBo bo) throws InterruptedException;
}
