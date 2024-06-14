package com.qihang.dou.controller;

import com.alibaba.fastjson2.JSONObject;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.common.mq.MqUtils;
import com.qihang.dou.domain.OmsDouOrder;
import com.qihang.dou.domain.bo.DouOrderBo;
import com.qihang.dou.domain.bo.DouOrderPushBo;
import com.qihang.dou.service.OmsDouOrderService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/order")
public class OrderContoller extends BaseController {
    private final OmsDouOrderService orderService;
    private final KafkaTemplate<String,Object> kafkaTemplate;
//    private final MqUtils mqUtils;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(DouOrderBo bo, PageQuery pageQuery) {
        PageResult<OmsDouOrder> result = orderService.queryPageList(bo, pageQuery);

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
                kafkaTemplate.send(MqType.ORDER_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.PDD, MqType.ORDER_MESSAGE,id)));
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.PDD, MqType.ORDER_MESSAGE, id));
            }
        }
        return success();
    }
}
