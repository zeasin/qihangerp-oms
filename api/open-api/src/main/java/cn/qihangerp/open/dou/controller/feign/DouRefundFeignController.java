package cn.qihangerp.open.dou.controller.feign;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.module.open.dou.domain.DouRefund;
import cn.qihangerp.module.open.dou.service.DouRefundService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
@RequestMapping("/api/open-api/dou/refund")
public class DouRefundFeignController {
    private final DouRefundService refundService;
    @GetMapping(value = "/get_detail")
    public AjaxResult getInfo(String id)
    {
        DouRefund order = refundService.queryByAftersaleId(id);
        if(order==null) return AjaxResult.error(404,"没有找到退款单");
        else return AjaxResult.success(order);
    }
}
