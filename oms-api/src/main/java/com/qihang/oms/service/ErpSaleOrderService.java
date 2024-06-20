package com.qihang.oms.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.oms.domain.ErpSaleOrder;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author TW
* @description 针对表【erp_sale_order(订单表)】的数据库操作Service
* @createDate 2024-05-09 17:34:42
*/
public interface ErpSaleOrderService extends IService<ErpSaleOrder> {
    ResultVo<Integer> jdOrderMessage(String orderId);
    ResultVo<Integer> taoOrderMessage(String orderId);
    ResultVo<Integer> pddOrderMessage(String orderId);
    ResultVo<Integer> douOrderMessage(String orderId);
    ResultVo<Integer> weiOrderMessage(String orderId);


    List<ErpSaleOrder> getList(ErpSaleOrder order);
    PageResult<ErpSaleOrder> queryPageList(ErpSaleOrder bo, PageQuery pageQuery);

    ErpSaleOrder queryDetailById(Long id);

    ResultVo<Integer> orderSendConfirm(Long shopId,String orderId,String logisticsCompanyCode,String waybillCode);

    /**
     * 订单备货
     * @param shopId
     * @param orderId
     * @param
     * @param
     * @return
     */
    ResultVo<Integer> orderShipStockUp(Long shopId,String orderId);
}
