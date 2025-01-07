package cn.qihangerp.open.jd.controller;

import cn.qihangerp.open.jd.domain.OmsJdAfterSale;
import cn.qihangerp.open.jd.domain.bo.JdAfterBo;
import cn.qihangerp.open.jd.domain.bo.JdOrderPushBo;
import cn.qihangerp.open.jd.service.OmsJdAfterSaleService;
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
@RequestMapping("/jd/after")
public class JdAfterSaleController extends BaseController {
    private final OmsJdAfterSaleService afterService;
    private final KafkaTemplate<String,Object> kafkaTemplate;
//    private final MqUtils mqUtils;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(JdAfterBo bo, PageQuery pageQuery) {
        PageResult<OmsJdAfterSale> result = afterService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody JdOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(String id: bo.getIds()) {
//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE, id));
                kafkaTemplate.send(MqType.REFUND_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE,id)));
            }
        }
        return success();
    }
}
