package cn.qihangerp.open.dou.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.mq.MqMessage;
import cn.qihangerp.common.mq.MqType;
import cn.qihangerp.common.mq.MqUtils;
import cn.qihangerp.module.open.dou.domain.DouRefund;
import cn.qihangerp.module.open.dou.domain.bo.DouOrderPushBo;
import cn.qihangerp.module.open.dou.domain.bo.DouRefundBo;
import cn.qihangerp.module.open.dou.service.DouRefundService;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/dou/refund")
public class DouRefundController extends BaseController {
    private final DouRefundService refundService;
    private final MqUtils mqUtils;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(DouRefundBo bo, PageQuery pageQuery) {
        PageResult<DouRefund> result = refundService.queryPageList(bo, pageQuery);

        return getDataTable(result);
    }

    @PostMapping("/push_oms")
    @ResponseBody
    public AjaxResult pushOms(@RequestBody DouOrderPushBo bo) {
        // TODO:需要优化消息格式
        if(bo!=null && bo.getIds()!=null) {
            for(String id: bo.getIds()) {
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.DOU, MqType.REFUND_MESSAGE, id));
            }
        }
        return success();
    }
}
