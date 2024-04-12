package com.qihang.tao.controller;

import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.common.mq.MqUtils;
import com.qihang.tao.common.BaseController;
import com.qihang.tao.domain.bo.TaoOrderBo;
import com.qihang.tao.domain.bo.TaoOrderPushBo;
import com.qihang.tao.domain.bo.TaoRefundBo;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;
import tech.qihangec.open.tao.common.PageQuery;
import tech.qihangec.open.tao.common.PageResult;
import tech.qihangec.open.tao.domain.TaoRefund;
import tech.qihangec.open.tao.service.TaoRefundService;

@AllArgsConstructor
@RestController
@RequestMapping("/refund")
public class RefundContoller extends BaseController {
    private final TaoRefundService refundService;
    private final MqUtils mqUtils;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(TaoRefundBo bo, PageQuery pageQuery) throws Exception {
        TaoRefund refund = new TaoRefund();
        refund.setShopId(bo.getShopId());
        refund.setRefundId(bo.getRefundId());
        if(StringUtils.isNotEmpty(bo.getTid())) {
            refund.setTid(Long.parseLong(bo.getTid()));
        }
        PageResult<TaoRefund> result = refundService.queryPageList(refund, pageQuery);

        return getDataTable(result);
    }

    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody TaoOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(String id: bo.getIds()) {
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.REFUND_MESSAGE, id));
            }
        }
        return success();
    }
}
