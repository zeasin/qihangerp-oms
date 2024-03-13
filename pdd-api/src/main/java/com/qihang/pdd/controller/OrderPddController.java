package com.qihang.pdd.controller;//package com.qihang.erp.api.controller.pdd;
//
//
//import com.b2c.common.api.ApiResult;
//import com.b2c.common.api.ApiResultEnum;
//import com.b2c.common.utils.DateUtil;
//import com.b2c.entity.datacenter.DcTmallOrderEntity;
//import com.b2c.entity.pdd.OrderPddEntity;
//import com.b2c.entity.pdd.OrderPddItemEntity;
//import com.b2c.entity.result.ResultVo;
//import com.b2c.oms.DataConfigObject;
//import com.b2c.oms.request.OrderConfirmReq;
//import com.b2c.repository.utils.OrderNumberUtils;
//import com.b2c.service.ShopService;
//import com.b2c.service.erp.ErpGoodsService;
//import com.b2c.service.oms.OrderPddService;
//import com.b2c.service.oms.SysThirdSettingService;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.util.StringUtils;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpServletRequest;
//import java.math.BigDecimal;
//import java.util.ArrayList;
//import java.util.List;
//
///**
// * 描述：
// *
// * @author qlp
// * @date 2019-11-13 14:44
// */
//@RequestMapping("/pdd")
//@Controller
//public class OrderPddController {
//    @Autowired
//    private ShopService shopService;
//    @Autowired
//    private OrderPddService orderPddService;
//    @Autowired
//    private ErpGoodsService erpGoodsService;
//    @Autowired
//    private SysThirdSettingService thirdSettingService;
//    private static Logger log = LoggerFactory.getLogger(OrderPddController.class);
//    /**
//     * 订单列表
//     * @param model
//     * @param shopId
//     * @param request
//     * @return
//     */
//    @RequestMapping("/orderList")
//    public String orderList(Model model, @RequestParam Integer shopId, HttpServletRequest request){
//        //查询店铺信息
//        var shop = shopService.getShop(shopId);
//        model.addAttribute("shop",shop);
//
//        String orderNum="";
//        if (!StringUtils.isEmpty(request.getParameter("orderNum")))
//        {orderNum = request.getParameter("orderNum"); model.addAttribute("orderNum",orderNum);}
//
//        String goodsSpecNum="";
//        if (!StringUtils.isEmpty(request.getParameter("goodsSpecNum"))) {goodsSpecNum = request.getParameter("goodsSpecNum"); model.addAttribute("goodsSpecNum",goodsSpecNum);}
//        String trackingNumber="";
//        if (!StringUtils.isEmpty(request.getParameter("trackingNumber"))) {trackingNumber = request.getParameter("trackingNumber"); model.addAttribute("trackingNumber",trackingNumber);}
//
//
//        Integer status = null;
//        if (!StringUtils.isEmpty(request.getParameter("status"))) {
//            try {
//                status = Integer.parseInt(request.getParameter("status"));
//                model.addAttribute("status",status);
//            }catch (Exception e){}
//        }
//        Integer refundStatus = null;
//        if (!StringUtils.isEmpty(request.getParameter("refundStatus"))) {
//            try {
//                refundStatus = Integer.parseInt(request.getParameter("refundStatus"));
//                model.addAttribute("refundStatus",refundStatus);
//            }catch (Exception e){}
//        }
//        if(status!=null && status.intValue() == 1){
//            if(refundStatus == null){
//                refundStatus = 1;
//                model.addAttribute("refundStatus",refundStatus);
//            }
//        }
//
//        Integer orderBy = 2;
//        if (!StringUtils.isEmpty(request.getParameter("orderBy"))) {
//            try {
//                orderBy = Integer.parseInt(request.getParameter("orderBy"));
//
//            }catch (Exception e){}
//        }
//        model.addAttribute("orderBy",orderBy);
//        Integer startTime = null;
//        if (!StringUtils.isEmpty(request.getParameter("startTime"))){
////            startTime = DateUtil.dateToStamp(request.getParameter("startTime")) ;
//            startTime = DateUtil.dateTimeToStamp(request.getParameter("startTime")) ;
//            model.addAttribute("startTime",request.getParameter("startTime"));
//        }
//
//        Integer endTime=null;
//        if (!StringUtils.isEmpty(request.getParameter("endTime"))) {
//            endTime = DateUtil.dateTimeToStamp(request.getParameter("endTime") );//+ " 23:59:59"
//            model.addAttribute("endTime",request.getParameter("endTime"));
//        }
//
//        Integer pageIndex = 1, pageSize = DataConfigObject.getInstance().getPageSize();
//        if (!StringUtils.isEmpty(request.getParameter("page"))) {
//            pageIndex = Integer.parseInt(request.getParameter("page"));
//        }
//
//        //查询订单
//        var result = orderPddService.getOrderViewList(pageIndex,pageSize,orderNum,goodsSpecNum,status,refundStatus,shopId,startTime,endTime,null,orderBy,trackingNumber);
////        var result = orderPddService.getOrderListAndItem(pageIndex, pageSize, orderNum, status, shopId, null, startTime, endTime,null);
//        model.addAttribute("pageIndex", pageIndex);
//        model.addAttribute("pageSize", pageSize);
//        model.addAttribute("totalSize", result.getTotalSize());
//        model.addAttribute("lists", result.getList());
//
//        model.addAttribute("menuId","order_list");
//
//
//        return "v3/order_list_pdd";
//    }
//
//
//    /**
//     * 订单详情
//     *
//     * @param model
//     * @param id
//     * @param shopId
//     * @param request
//     * @return
//     */
//    @RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
//    public String orderDetailTmall(Model model, @RequestParam Long id,@RequestParam Integer shopId, HttpServletRequest request) {
//
//        OrderPddEntity orderDetail = orderPddService.getOrderDetailAndItemsById(id);
//
//        model.addAttribute("orderVo", orderDetail);
//
//        //查询店铺信息
//        var shop = shopService.getShop(shopId);
//        model.addAttribute("shop", shop);
//        model.addAttribute("menuId", "order_list");
//
//        return "v3/order_detail_pdd";
//    }
//
//    /**
//     * 确定订单
//     * @param model
//     * @param orderId
//     * @param request
//     * @return
//     */
//    @RequestMapping(value = "/order_confirm", method = RequestMethod.GET)
//    public String orderConfirmGet(Model model, @RequestParam Long orderId,HttpServletRequest request) {
//        var order = orderPddService.getOrderDetailAndItemsById(orderId);
//        if (order == null) {
//            model.addAttribute("error", "没有找到订单");
//            model.addAttribute("orderVo", new DcTmallOrderEntity());
//
//        } else {
//            model.addAttribute("orderVo", order);
////            model.addAttribute("clientId", order.getClientUserId() != null ? order.getClientUserId() : 0);
//        }
//
//
//        return "v3/order_confirm_pdd";
//    }
//
//    /**
//     * 订单确认（进入仓库）
//     *
//     * @param req
//     * @return
//     */
//    @ResponseBody
//    @RequestMapping(value = "/order_confirm_post", method = RequestMethod.POST)
//    public ApiResult<String> confirmOrder(@RequestBody OrderConfirmReq req, HttpServletRequest request) {
//        if (req.getOrderId() == null || req.getOrderId() <= 0)
//            return new ApiResult<>(ApiResultEnum.ParamsError.getIndex(), "参数错误，缺少orderId");
//        if (StringUtils.isEmpty(req.getReceiver()))
//            return new ApiResult<>(ApiResultEnum.ParamsError.getIndex(), "参数错误，缺少receiver");
//        if (StringUtils.isEmpty(req.getMobile()))
//            return new ApiResult<>(ApiResultEnum.ParamsError.getIndex(), "参数错误，缺少mobile");
//        if (StringUtils.isEmpty(req.getAddress()))
//            return new ApiResult<>(ApiResultEnum.ParamsError.getIndex(), "参数错误，缺少address");
//
//        var order = orderPddService.getOrderDetailAndItemsById(req.getOrderId());
//
////        Integer shopId = order.getShopId();//拼多多shopId
////        String clientId = DataConfigObject.getInstance().getPddClientId();
////        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
////        var shop = shopService.getShop(shopId);
////        var settingEntity = thirdSettingService.getEntity(shop.getType());
////        PopClient client = new PopHttpClient(clientId, clientSecret);
////        PddOrderInformationGetRequest pddOrderRequest=new PddOrderInformationGetRequest();
////        pddOrderRequest.setOrderSn(order.getOrderSn());
////        Integer pddOrderStatus=1;
////        try {
////            PddOrderInformationGetResponse pddOrderResponse = client.syncInvoke(pddOrderRequest, settingEntity.getAccess_token());
////            if(!StringUtils.isEmpty(pddOrderResponse.getErrorResponse())){
////                return new ApiResult<>(ApiResultEnum.ParamsError.getIndex(),pddOrderResponse.getErrorResponse().getErrorMsg());
////            }
////            pddOrderStatus =  pddOrderResponse.getOrderInfoGetResponse().getOrderInfo().getOrderStatus();
////        }catch (Exception e){
////            return new ApiResult<>(ApiResultEnum.ParamsError.getIndex(), "拼多多接口查询订单状态异常");
////        }
//        log.info("/**********************订单状态判断" + order.getOrder_status() + "**********************/");
//        if (order == null)
//            return new ApiResult<>(404, "订单不存在");//检查是否已经确认
//        else if (order.getAuditStatus().intValue() > 0)
//            return new ApiResult<>(501, "订单已经确认过了");
////        else if (pddOrderStatus != EnumPddOrderStatus.WaitSend.getIndex())
////            return new ApiResult<>(402, "订单不是发货中的状态，不能操作");
//        else if(order.getAfter_sales_status() != 0){
//            return new ApiResult<>(409, "订单已退款，不能操作");
//        }
//        log.info("/**********************开始确认订单" + req.getOrderId() + "**********************/");
//        synchronized (this) {
//            //确认订单，加入到仓库系统待发货订单列表
//            ResultVo<Integer> result = orderPddService.orderConfirmAndJoinDeliveryQueueForPdd(req.getOrderId(), req.getReceiver(), req.getMobile(), req.getAddress(), req.getSellerMemo());
//
//            log.info("/**********************确认订单完成" + result + "**********************/");
//            return new ApiResult<>(result.getCode(), result.getMsg());
//        }
//    }
//
//    /**
//     * 创建订单
//     * @param model
//     * @param shopId
//     * @param request
//     * @return
//     */
//    @RequestMapping("/order_create")
//    public String orderCreate(Model model,@RequestParam Integer shopId, HttpServletRequest request){
//        model.addAttribute("orderNumber",OrderNumberUtils.getOrderIdByTime());
//        model.addAttribute("menuId", "order_create");
//        return "v3/order_create_pdd";
//    }
//    /**
//     * pdd创建订单
//     * @param model
//     * @param request
//     * @return
//     */
//    @RequestMapping(value = "/order_create", method = RequestMethod.POST)
//    public String postSystemOrder(Model model, HttpServletRequest request) {
//        model.addAttribute("menuId", "order_create");
//        /***商品信息****/
//        String[] specNumber = request.getParameterValues("specNumber");//规格编码组合
//        String[] goodsNumber = request.getParameterValues("goodsNumber");//商品编码组合
//        String[] goodsId = request.getParameterValues("goodsId");//商品id组合
//        String[] specsId = request.getParameterValues("specId");//商品规格id组合
//        String[] quantitys = request.getParameterValues("quantity");//数量组合
//        String[] prices = request.getParameterValues("note");//商品价格
//
//        String orderNumber = request.getParameter("orderNumber");
//        //收件人信息
//        String contactMobile = request.getParameter("contactMobile");
//        String contactPerson = request.getParameter("contactPerson");
//        String area = request.getParameter("area");
//        String address = request.getParameter("address");
//        Integer saleType = Integer.parseInt(request.getParameter("saleType"));
//        String shippingFee= StringUtils.isEmpty(request.getParameter("shippingFee")) ? "0" :request.getParameter("shippingFee");
//        String sellerMemo = request.getParameter("sellerMemo");
//
//        String[] areaNameArray = area.split(" ");
//
//        String provinceName = "";
//        if (areaNameArray.length > 0) provinceName = areaNameArray[0];
//        String cityName = "";
//        if (areaNameArray.length > 1) cityName = areaNameArray[1];
//        String districtName = "";
//        if (areaNameArray.length > 2) districtName = areaNameArray[2];
//
//        OrderPddEntity pddEntity = new OrderPddEntity();
//
//        List<OrderPddItemEntity> items = new ArrayList<>();
//        double goodsTotalAmount = 0;//商品总价
//        for (int i = 0,n=goodsId.length;i<n;i++) {
//            if(StringUtils.isEmpty(goodsId[i]))continue;
//            OrderPddItemEntity pddItem = new OrderPddItemEntity();
//            Integer specId=Integer.parseInt(specsId[i]);
//            BigDecimal price = new BigDecimal(prices[i]);
//            Integer count =Integer.parseInt(quantitys[i]);
//            var spec = erpGoodsService.getSpecBySpecId(specId);
//
//            goodsTotalAmount +=  price.doubleValue() * count;
//
//            pddItem.setErpGoodsId(spec.getGoodsId());
//            pddItem.setErpGoodsSpecId(spec.getId());
//            pddItem.setGoodsImg(spec.getColorImage());
//            pddItem.setGoodsName(spec.getGoodTitle());
//            pddItem.setGoodsNum(goodsNumber[i]);
//            pddItem.setGoodsPrice(price.doubleValue());
//            pddItem.setGoodsSpec(spec.getColorValue()+","+spec.getSizeValue());
//            pddItem.setGoodsSpecNum(specNumber[i]);
//            pddItem.setQuantity(count);
//            pddItem.setIsGift(saleType.intValue()==2 ? 1 : 0);
//            items.add(pddItem);
//        }
//        pddEntity.setItems(items);
//        double orderTotalAmount=goodsTotalAmount+Double.valueOf(shippingFee);
//        pddEntity.setAddress(new StringBuilder(provinceName).append(cityName).append(districtName).append(address).toString());
//        pddEntity.setAfter_sales_status(0);
//        pddEntity.setBuyer_memo("");
//        pddEntity.setCapital_free_discount(0d);
//        pddEntity.setCity(cityName);
//        pddEntity.setConfirm_status(1);
//        pddEntity.setConfirm_time("");
//        pddEntity.setCountry("中国");
//        pddEntity.setCreated_time(DateUtil.getCurrentDateTime());
//        pddEntity.setDiscount_amount(0d);
//        pddEntity.setFree_sf(0);
//        pddEntity.setGoods_amount(goodsTotalAmount);
//        pddEntity.setGroup_status(1);
//        pddEntity.setIs_lucky_flag(saleType);
//        pddEntity.setOrderSn(orderNumber);
//        pddEntity.setOrder_status(1);
//        pddEntity.setPay_amount(orderTotalAmount);
//        pddEntity.setPay_no("");
//        pddEntity.setPay_time("0");
//        pddEntity.setPay_type("");
//        pddEntity.setPlatform_discount(0d);
//        pddEntity.setPostage(Double.valueOf(shippingFee));
//        pddEntity.setProvince(provinceName);
//        pddEntity.setReceive_time("");
//        pddEntity.setReceiver_name(contactPerson);
//        pddEntity.setReceiver_phone(contactMobile);
//        pddEntity.setRefund_status(0);
//        pddEntity.setRemark(sellerMemo);
//        pddEntity.setSeller_discount(0d);
//        pddEntity.setShipping_time("");
//        pddEntity.setTown("");
//        pddEntity.setTracking_number("");
//        pddEntity.setTradeType(0);
//        pddEntity.setUpdated_at("");
//        pddEntity.setOrderConfirmTime(System.currentTimeMillis() / 1000);
//        orderPddService.orderCreatePdd(pddEntity);
//        return "redirect:/pdd/orderList?shopId=5";
//    }
//}
