package cn.qihangerp.open.pdd.controller.feign;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.module.open.pdd.domain.PddOrder;
import cn.qihangerp.module.open.pdd.service.PddOrderService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
@RequestMapping("/api/open-api/pdd/order")
public class OrderFeignController  {
    private final PddOrderService orderService;
    @GetMapping(value = "/get_detail")
    public AjaxResult getInfo(String sn)
    {
        PddOrder order = orderService.queryDetailBySn(sn);
        if(order==null) return AjaxResult.error(404,"没有找到订单");
        else return AjaxResult.success(order);
    }
}
