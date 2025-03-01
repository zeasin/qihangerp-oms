package cn.qihangerp.oms.controller;


import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.common.TableDataInfo;
import cn.qihangerp.oms.service.ErpSaleOrderItemService;
import cn.qihangerp.oms.domain.bo.OrderItemListBo;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
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
