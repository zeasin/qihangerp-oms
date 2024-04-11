package com.qihang.tao.controller;

import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.TableDataInfo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.common.mq.MqUtils;
import com.qihang.tao.common.BaseController;
import com.qihang.tao.common.TaoRequest;
import com.qihang.tao.domain.TaoGoods;
import com.qihang.tao.domain.bo.TaoGoodsBo;
import com.qihang.tao.domain.bo.TaoOrderBo;
import com.qihang.tao.domain.bo.TaoOrderPushBo;

import com.taobao.api.ApiException;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import tech.qihangec.open.tao.common.PageQuery;
import tech.qihangec.open.tao.common.PageResult;
import tech.qihangec.open.tao.domain.TaoOrder;
import tech.qihangec.open.tao.service.TaoOrderService;

import java.util.ArrayList;

@AllArgsConstructor
@RestController
@RequestMapping("/order")
public class OrderContoller extends BaseController {
    private final TaoOrderService orderService;
    private final MqUtils mqUtils;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public TableDataInfo goodsList(TaoOrderBo bo, PageQuery pageQuery)   {
        TaoOrder taoOrder = new TaoOrder();
        taoOrder.setShopId(bo.getShopId());
        try {
            PageResult<TaoOrder> result = orderService.queryPageList(taoOrder, pageQuery);

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
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.ORDER_MESSAGE, id));
            }
        }
        return success();
    }
}
