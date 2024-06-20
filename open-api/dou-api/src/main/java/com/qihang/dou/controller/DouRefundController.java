package com.qihang.dou.controller;


import com.alibaba.fastjson2.JSONObject;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.dou.domain.OmsDouRefund;
import com.qihang.dou.domain.bo.DouOrderPushBo;
import com.qihang.dou.domain.bo.DouRefundBo;
import com.qihang.dou.service.OmsDouRefundService;
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
@RequestMapping("/refund")
public class DouRefundController extends BaseController
{
    private final KafkaTemplate<String,Object> kafkaTemplate;
    private final OmsDouRefundService refundService;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo orderList(DouRefundBo bo, PageQuery pageQuery) {
        PageResult<OmsDouRefund> result = refundService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody DouOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(String id: bo.getIds()) {
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.DOU, MqType.REFUND_MESSAGE, id));
                kafkaTemplate.send(MqType.REFUND_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.DOU, MqType.REFUND_MESSAGE,id)));
            }
        }
        return AjaxResult.success();
    }
}
