package cn.qihangerp.oms.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.module.order.domain.OShipment;
import cn.qihangerp.module.order.domain.bo.OrderShipBo;
import cn.qihangerp.module.order.service.OOrderService;
import cn.qihangerp.module.order.service.OShipmentService;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/shipping")
public class ShipmentController extends BaseController {
    private final OShipmentService shippingService;

    private final OOrderService orderService;
    @GetMapping("/list")
    public TableDataInfo list(OShipment shipping, PageQuery pageQuery)
    {
        return getDataTable(shippingService.queryPageList(shipping,pageQuery));
    }


    @GetMapping("/searchOrderConsignee")
    public TableDataInfo searchOrderConsignee(String consignee)
    {
        return getDataTable(orderService.searchOrderConsignee(consignee));
    }

    @GetMapping("/searchOrderItemByReceiverMobile")
    public TableDataInfo searchOrderItemByReceiverMobile(String receiverMobile)
    {
        return getDataTable(orderService.searchOrderItemByReceiverMobile(receiverMobile));
    }

    /**
     * 订单发货
     * @param shipping
     * @return
     */
    @PostMapping("/handShip")
    public AjaxResult orderHandShip(@RequestHeader("Authorization") String authorization,@RequestBody OrderShipBo shipping)
    {

        var result = shippingService.handOrderShip(shipping);
//        if(result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
//            // 发货
//            TaoOrderShipBo bo = new TaoOrderShipBo();
//            bo.setShopId(shipping.getShopId());
////            bo.setTid(shipping.getOrderId());
//            bo.setWaybillCode(shipping.getShipCode());
//            bo.setWaybillCompany(shipping.getShipCompany());
//
//            JSONObject jsonObject = taoApiService.orderShip(authorization, bo);
//            return AjaxResult.success();
//        }else{
//            return AjaxResult.error(result.getCode(),result.getMsg());
//        }

        return AjaxResult.success();
    }
}
