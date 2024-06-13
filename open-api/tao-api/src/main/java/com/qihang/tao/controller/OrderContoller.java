package com.qihang.tao.controller;

import com.alibaba.fastjson2.JSONObject;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.common.mq.MqUtils;
import com.qihang.tao.common.BaseController;
import com.qihang.tao.domain.OmsTaoOrder;
import com.qihang.tao.domain.bo.TaoOrderBo;
import com.qihang.tao.domain.bo.TaoOrderPushBo;
import com.qihang.tao.service.OmsTaoOrderService;
import lombok.AllArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;

@AllArgsConstructor
@RestController
@RequestMapping("/order")
public class OrderContoller extends BaseController {
    private final OmsTaoOrderService orderService;
    private final KafkaTemplate<String,Object> kafkaTemplate;
//    private final MqUtils mqUtils;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(TaoOrderBo bo, PageQuery pageQuery)   {
//        OmsTaoOrder taoOrder = new OmsTaoOrder();
//        taoOrder.setShopId(bo.getShopId());
        try {
            PageResult<OmsTaoOrder> result = orderService.queryPageList(bo, pageQuery);

            return getDataTable(result);
        }catch (Exception e){
            return getDataTable(new ArrayList<>());
        }
    }

    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody TaoOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(String id: bo.getIds()) {
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.ORDER_MESSAGE, id));
                kafkaTemplate.send(MqType.ORDER_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.TAO, MqType.ORDER_MESSAGE,id)));
            }
        }
        return success();
    }
}
