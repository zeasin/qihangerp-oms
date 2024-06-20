package com.qihang.dou.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.dou.domain.OmsDouRefund;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.dou.domain.bo.DouRefundBo;

/**
* @author TW
* @description 针对表【oms_dou_refund(抖店退款表)】的数据库操作Service
* @createDate 2024-06-20 16:59:03
*/
public interface OmsDouRefundService extends IService<OmsDouRefund> {
    PageResult<OmsDouRefund> queryPageList(DouRefundBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveRefund(Long shopId, OmsDouRefund refund);
}
