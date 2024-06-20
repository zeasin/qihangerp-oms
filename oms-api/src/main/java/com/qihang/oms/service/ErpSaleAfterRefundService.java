package com.qihang.oms.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.oms.domain.ErpSaleAfterRefund;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.oms.domain.ErpSaleOrder;

/**
* @author TW
* @description 针对表【erp_sale_after_refund(售后退款表)】的数据库操作Service
* @createDate 2024-06-19 17:59:48
*/
public interface ErpSaleAfterRefundService extends IService<ErpSaleAfterRefund> {
    PageResult<ErpSaleAfterRefund> queryPageList(ErpSaleAfterRefund bo, PageQuery pageQuery);

    ResultVo<Integer> jdRefundMessage(String serviceId);
    ResultVo<Integer> weiRefundMessage(String afterSaleOrderId);
    ResultVo<Integer> taoRefundMessage(String refundId);
    ResultVo<Integer> pddRefundMessage(String refundId);
    ResultVo<Integer> douRefundMessage(String refundId);
}
