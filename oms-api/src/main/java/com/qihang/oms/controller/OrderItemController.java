package com.qihang.oms.controller;


import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.TableDataInfo;
import com.qihang.oms.domain.ErpSaleOrderItem;
import com.qihang.oms.domain.bo.OrderItemListBo;
import com.qihang.oms.service.ErpSaleOrderItemService;
import com.qihang.oms.service.ErpSaleOrderService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.StringUtils;
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
public class OrderItemController extends BaseController
{
    private final ErpSaleOrderItemService itemService;

    /**
     * 查询店铺订单列表
     */
    @GetMapping("/item_list")
    public TableDataInfo list(OrderItemListBo bo, PageQuery pageQuery)
    {
        var pageList = itemService.selectPageVo(pageQuery,bo);
        return getDataTable(pageList);
    }

//    /**
//     * 更新erp sku id
//     * @param orderItem
//     * @return
//     */
//    @PostMapping("/updateErpSkuId")
//    public AjaxResult ship(@RequestBody ErpSaleOrderItem orderItem)
//    {
//        if(StringUtils.isEmpty(orderItem.getId()) || orderItem.getGoodsSkuId()==null){
//            return AjaxResult.error("确少必要参数");
//        }
//        itemService.updateErpSkuId(orderItem.getId(), orderItem.getGoodsSkuId());
//        return AjaxResult.success();
//    }
}
