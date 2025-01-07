package cn.qihangerp.open.pdd.controller;

import cn.qihangerp.open.pdd.domain.OmsPddRefund;
import cn.qihangerp.open.pdd.domain.bo.PddAfterSaleBo;
import cn.qihangerp.open.pdd.domain.bo.PddOrderPushBo;
import cn.qihangerp.open.pdd.service.OmsPddRefundService;
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

/**
 * 拼多多订单Controller
 * 
 * @author qihang
 * @date 2024-01-02
 */
@AllArgsConstructor
@RestController
@RequestMapping("/pdd/refund")
public class PddRefundController extends BaseController
{
    private final KafkaTemplate<String,Object> kafkaTemplate;
    private final OmsPddRefundService refundService;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo orderList(PddAfterSaleBo bo, PageQuery pageQuery) {
        PageResult<OmsPddRefund> result = refundService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }
    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody PddOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(String id: bo.getIds()) {
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.PDD, MqType.REFUND_MESSAGE, id));
                kafkaTemplate.send(MqType.REFUND_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.PDD, MqType.REFUND_MESSAGE,id)));
            }
        }
        return success();
    }

}
