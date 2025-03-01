package cn.qihangerp.oms.controller;


import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.common.TableDataInfo;
import cn.qihangerp.oms.domain.ErpSaleAfterRefund;
import cn.qihangerp.oms.service.ErpSaleAfterRefundService;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.GetMapping;
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
