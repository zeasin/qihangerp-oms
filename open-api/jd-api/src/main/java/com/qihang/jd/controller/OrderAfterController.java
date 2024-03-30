package com.qihang.jd.controller;

import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.common.mq.MqUtils;
import com.qihang.jd.domain.JdOrderAfter;
import com.qihang.jd.domain.JdRefund;
import com.qihang.jd.domain.bo.JdAfterBo;
import com.qihang.jd.domain.bo.JdOrderPushBo;
import com.qihang.jd.service.JdOrderAfterService;
import com.qihang.jd.service.JdOrderService;
import com.qihang.jd.service.JdRefundService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/after")
public class OrderAfterController extends BaseController {
    private final JdOrderService orderService;
    private final JdRefundService refundService;
    private final JdOrderAfterService afterService;
    private final MqUtils mqUtils;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(JdAfterBo bo, PageQuery pageQuery) {
        PageResult<JdOrderAfter> result = afterService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody JdOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(String id: bo.getIds()) {
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.JD, MqType.REFUND_MESSAGE, id));
            }
        }
        return success();
    }
}
