package com.qihang.wei.controller;



import com.alibaba.fastjson2.JSONObject;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.security.common.BaseController;
import com.qihang.wei.bo.WeiOrderPushBo;
import com.qihang.wei.domain.OmsWeiRefund;
import com.qihang.wei.service.OmsWeiRefundService;
import lombok.AllArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/refund")
public class WeiRefundController extends BaseController {
    private final OmsWeiRefundService refundService;
    private final KafkaTemplate<String,Object> kafkaTemplate;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(OmsWeiRefund bo, PageQuery pageQuery) {
        PageResult<OmsWeiRefund> result = refundService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody WeiOrderPushBo bo) {
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
