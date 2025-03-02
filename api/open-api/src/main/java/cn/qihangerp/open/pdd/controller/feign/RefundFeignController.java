package cn.qihangerp.open.pdd.controller.feign;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.module.open.pdd.domain.PddRefund;
import cn.qihangerp.module.open.pdd.service.PddRefundService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
@RequestMapping("/api/open-api/pdd/refund")
public class RefundFeignController {
    private final PddRefundService refundService;
    @GetMapping(value = "/get_detail")
    public AjaxResult getInfo(Long id)
    {
        PddRefund order = refundService.getById(id);
        if(order==null) return AjaxResult.error(404,"没有找到退款单");
        else return AjaxResult.success(order);
    }
}
