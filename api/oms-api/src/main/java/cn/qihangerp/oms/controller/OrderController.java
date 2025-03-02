package cn.qihangerp.oms.controller;



import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.TableDataInfo;

import cn.qihangerp.module.order.service.OOrderItemService;
import cn.qihangerp.module.order.service.OOrderService;
import cn.qihangerp.request.OrderSearchRequest;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 店铺订单Controller
 *
 * @author qihang
 * @date 2023-12-31
 */
@AllArgsConstructor
@RestController
@RequestMapping("/order")
public class OrderController extends BaseController
{

    private final OOrderService orderService;
    private final OOrderItemService orderItemService;

    /**
     * 查询店铺订单列表
     */
    @PreAuthorize("@ss.hasPermi('shop:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(OrderSearchRequest bo, PageQuery pageQuery)
    {
        var pageList = orderService.queryPageList(bo,pageQuery);
        return getDataTable(pageList);
    }


    /**
     * 获取店铺订单详细信息
     */
    @PreAuthorize("@ss.hasPermi('shop:order:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(orderService.queryDetailById(id));
    }

    /**
     * 推送订单到ERP
     * @param ids
     * @return
     */
    @PostMapping("/pushErp/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
//        for (Long id : ids) {
//            OOrder oOrder = orderService.getById(id);
//            if (oOrder != null) {
//                oOrder.setItemList(orderItemService.getOrderItemListByOrderId(id));
//                ResultVo resultVo = erpPushHelper.pushOrderSingle(oOrder);
//                OOrder pushUpdate = new OOrder();
//                if (oOrder.getOrderStatus() == 1 || oOrder.getOrderStatus() == 2 || oOrder.getOrderStatus() == 3) {
//                    // 待发货、已发货、已完成 订单推送
//                    pushUpdate.setErpPushStatus(resultVo.getCode() == 0 ? 200 : resultVo.getCode());
//
//                } else if (oOrder.getOrderStatus() == 11) {
//                    pushUpdate.setErpPushStatus(resultVo.getCode() == 0 ? 100 : resultVo.getCode());//推送状态200 订单推送成功 100 取消订单推送成功
//                }
//                pushUpdate.setErpPushResult(resultVo.getMsg());
//                pushUpdate.setErpPushTime(new Date());
//                pushUpdate.setUpdateBy("手动推送到ERP");
//                pushUpdate.setUpdateTime(new Date());
//                pushUpdate.setId(id.toString());
//                orderService.updateById(pushUpdate);
//            }
//        }

        return success();
    }
//    @PostMapping
//    public AjaxResult add(@RequestBody OrderCreateBo order)
//    {
//        if(order.getGoodsAmount()==null)return new AjaxResult(1503,"请填写商品价格！");
//
//        int result = orderService.insertErpOrder(order,getUsername());
//        if(result == -1) return new AjaxResult(501,"订单号已存在！");
//        if(result == -2) return new AjaxResult(502,"请添加订单商品！");
//        if(result == -3) return new AjaxResult(503,"请完善订单商品明细！");
//        if(result == -4) return new AjaxResult(504,"请选择店铺！");
//        return toAjax(result);
//    }
//    /**
//     * 订单发货
//     * @param order
//     * @return
//     */
//    @Log(title = "店铺订单", businessType = BusinessType.UPDATE)
//    @PostMapping("/ship")
//    public AjaxResult ship(@RequestBody ErpOrder order)
//    {
//        order.setUpdateBy(getUsername());
//        int result = orderService.shipErpOrder(order);
//        if(result == -1) return new AjaxResult(501,"订单不存在！");
//        else if(result == -2) return new AjaxResult(502,"订单号已存在！");
//        return toAjax(result);
//    }

}
