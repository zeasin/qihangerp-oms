package cn.qihangerp.open.tao.controller;

import cn.qihangerp.open.tao.domain.OmsTaoOrder;
import cn.qihangerp.open.tao.domain.bo.TaoOrderBo;
import cn.qihangerp.open.tao.domain.bo.TaoOrderPushBo;
import cn.qihangerp.open.tao.service.OmsTaoOrderService;
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

import java.util.ArrayList;

@AllArgsConstructor
@RestController
@RequestMapping("/tao/order")
public class TaoOrderContoller extends BaseController {
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
