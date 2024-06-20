package com.qihang.oms.controller;


import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.TableDataInfo;
import com.qihang.oms.domain.ErpSaleAfterRefund;
import com.qihang.oms.domain.ErpSaleOrder;
import com.qihang.oms.service.ErpSaleAfterRefundService;
import com.qihang.oms.service.ErpSaleOrderService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 店铺订单Controller
 *
 * @author qihang
 * @date 2023-12-31
 */
@AllArgsConstructor
@RestController
@RequestMapping("/refund")
public class RefundController extends BaseController
{

    private final ErpSaleAfterRefundService refundService;
    private final KafkaTemplate<String,Object> kafkaTemplate;

    /**
     * 列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ErpSaleAfterRefund bo, PageQuery pageQuery)
    {
        var pageList = refundService.queryPageList(bo,pageQuery);
        return getDataTable(pageList);
    }

}
