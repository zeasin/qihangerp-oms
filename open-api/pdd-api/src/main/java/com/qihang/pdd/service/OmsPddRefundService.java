package com.qihang.pdd.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.pdd.domain.OmsPddRefund;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.pdd.domain.bo.PddAfterSaleBo;

/**
* @author TW
* @description 针对表【oms_pdd_refund(拼多多订单退款表)】的数据库操作Service
* @createDate 2024-06-20 16:33:28
*/
public interface OmsPddRefundService extends IService<OmsPddRefund> {
    PageResult<OmsPddRefund> queryPageList(PddAfterSaleBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveRefund(Long shopId, OmsPddRefund refund);
}
