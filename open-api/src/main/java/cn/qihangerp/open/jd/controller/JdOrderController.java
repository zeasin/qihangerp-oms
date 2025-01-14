package cn.qihangerp.open.jd.controller;

import cn.qihangerp.open.jd.domain.OmsJdOrder;
import cn.qihangerp.open.jd.domain.bo.JdOrderBo;
import cn.qihangerp.open.jd.domain.bo.JdOrderPushBo;
import cn.qihangerp.open.jd.service.OmsJdOrderService;
import com.alibaba.fastjson2.JSONObject;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;

import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/jd/order")
public class JdOrderController extends BaseController {
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
