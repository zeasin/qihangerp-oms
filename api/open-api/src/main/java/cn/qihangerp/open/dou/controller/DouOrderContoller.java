package cn.qihangerp.open.dou.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.mq.MqMessage;
import cn.qihangerp.common.mq.MqType;
import cn.qihangerp.common.mq.MqUtils;
import cn.qihangerp.module.open.dou.domain.DouOrder;
import cn.qihangerp.module.open.dou.domain.bo.DouOrderBo;
import cn.qihangerp.module.open.dou.domain.bo.DouOrderPushBo;
import cn.qihangerp.module.open.dou.service.DouOrderService;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/dou/order")
public class DouOrderContoller extends BaseController {
    private final DouOrderService orderService;
    private final MqUtils mqUtils;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(DouOrderBo bo, PageQuery pageQuery) {
        PageResult<DouOrder> result = orderService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(orderService.queryDetailById(id));
    }

    /**
     * 手动推送到系统
     * @param bo
     * @return
     */
    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody DouOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(String id: bo.getIds()) {
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.DOU, MqType.ORDER_MESSAGE, id));
            }
        }
        return success();
    }
}
