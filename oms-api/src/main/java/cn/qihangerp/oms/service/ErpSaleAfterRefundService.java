package cn.qihangerp.oms.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.oms.domain.ErpSaleAfterRefund;
import com.baomidou.mybatisplus.extension.service.IService;

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
