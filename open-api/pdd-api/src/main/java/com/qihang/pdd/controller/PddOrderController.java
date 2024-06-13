package com.qihang.pdd.controller;


import com.alibaba.fastjson2.JSONObject;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.pdd.domain.OmsPddOrder;
import com.qihang.pdd.domain.bo.PddOrderPushBo;
import com.qihang.pdd.service.OmsPddOrderService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.*;

/**
 * 拼多多订单Controller
 *
 * @author qihang
 * @date 2024-01-02
 */
@AllArgsConstructor
@RestController
@RequestMapping("/order")
public class PddOrderController extends BaseController
{
    private final KafkaTemplate<String,Object> kafkaTemplate;
    private final OmsPddOrderService orderService;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo orderList(OmsPddOrder bo, PageQuery pageQuery) {
        PageResult<OmsPddOrder> result = orderService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }
    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody PddOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(String id: bo.getIds()) {
                kafkaTemplate.send(MqType.ORDER_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.PDD, MqType.ORDER_MESSAGE,id)));
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.ORDER_MESSAGE, id));
            }
        }
        return success();
    }

}
