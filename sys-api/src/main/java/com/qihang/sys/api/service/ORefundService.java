package com.qihang.sys.api.service;

import com.qihang.common.common.ResultVo;
import com.qihang.sys.api.domain.ORefund;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【o_refund(退换货表)】的数据库操作Service
* @createDate 2024-03-10 16:23:12
*/
public interface ORefundService extends IService<ORefund> {
    ResultVo<Integer> jdRefundMessage(String refundId);
}
