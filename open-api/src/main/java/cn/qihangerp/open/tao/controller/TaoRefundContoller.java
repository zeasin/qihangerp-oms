package cn.qihangerp.open.tao.controller;

import cn.qihangerp.open.tao.domain.OmsTaoRefund;
import cn.qihangerp.open.tao.domain.bo.TaoOrderPushBo;
import cn.qihangerp.open.tao.domain.bo.TaoRefundBo;
import cn.qihangerp.open.tao.service.OmsTaoRefundService;
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
@RequestMapping("/tao/refund")
public class TaoRefundContoller extends BaseController {
    private final OmsTaoRefundService refundService;
//    private final MqUtils mqUtils;
    private final KafkaTemplate<String,Object> kafkaTemplate;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(TaoRefundBo bo, PageQuery pageQuery) throws Exception {
//        OmsTaoRefund refund = new OmsTaoRefund();
//        refund.setShopId(bo.getShopId());
//        refund.setRefundId(bo.getRefundId());
//        if(StringUtils.isNotEmpty(bo.getTid())) {
//            refund.setTid(Long.parseLong(bo.getTid()));
//        }
        PageResult<OmsTaoRefund> result = refundService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody TaoOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(String id: bo.getIds()) {
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.REFUND_MESSAGE, id));
                kafkaTemplate.send(MqType.REFUND_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.TAO, MqType.REFUND_MESSAGE,id)));
            }
        }
        return success();
    }
}
