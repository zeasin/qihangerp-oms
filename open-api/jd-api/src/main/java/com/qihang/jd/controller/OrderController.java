package com.qihang.jd.controller;

import com.alibaba.fastjson2.JSONObject;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.common.mq.MqUtils;
import com.qihang.jd.domain.OmsJdOrder;
import com.qihang.jd.domain.bo.JdOrderBo;
import com.qihang.jd.domain.bo.JdOrderPushBo;
import com.qihang.jd.service.OmsJdOrderService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/order")
public class OrderController extends BaseController {
    private final OmsJdOrderService orderService;
//    private final MqUtils mqUtils;
    private final KafkaTemplate<String,Object> kafkaTemplate;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo orderList(JdOrderBo bo, PageQuery pageQuery) {
        PageResult<OmsJdOrder> result = orderService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }
    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody JdOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(String id: bo.getIds()) {
                kafkaTemplate.send(MqType.ORDER_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.JD, MqType.ORDER_MESSAGE,id)));
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.ORDER_MESSAGE, id));
            }
        }
        return success();
    }
}
