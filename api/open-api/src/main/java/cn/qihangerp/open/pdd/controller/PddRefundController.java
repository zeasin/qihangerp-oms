package cn.qihangerp.open.pdd.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.mq.MqMessage;
import cn.qihangerp.common.mq.MqType;
import cn.qihangerp.common.mq.MqUtils;
import cn.qihangerp.module.open.pdd.domain.PddRefund;
import cn.qihangerp.module.open.pdd.domain.bo.PddOrderPushBo;
import cn.qihangerp.module.open.pdd.domain.bo.PddRefundBo;
import cn.qihangerp.module.open.pdd.service.PddRefundService;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/pdd/refund")
public class PddRefundController extends BaseController {
    private final PddRefundService refundService;
    private final MqUtils mqUtils;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(PddRefundBo bo, PageQuery pageQuery) {
        PageResult<PddRefund> result = refundService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody PddOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(String id: bo.getIds()) {
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.PDD, MqType.REFUND_MESSAGE, id));
            }
        }
        return success();
    }
}
