package cn.qihangerp.open.pdd.controller;

import cn.qihangerp.open.pdd.domain.OmsPddRefund;
import cn.qihangerp.open.pdd.domain.bo.PddAfterSaleBo;
import cn.qihangerp.open.pdd.domain.bo.PddOrderPushBo;
import cn.qihangerp.open.pdd.service.OmsPddRefundService;
import com.alibaba.fastjson2.JSONObject;
import cn.qihangerp.common.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.common.TableDataInfo;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.mq.MqMessage;
import cn.qihangerp.common.mq.MqType;

import cn.qihangerp.security.common.BaseController;
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
