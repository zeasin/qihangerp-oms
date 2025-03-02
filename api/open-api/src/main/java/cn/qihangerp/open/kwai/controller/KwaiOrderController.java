package cn.qihangerp.open.kwai.controller;//package com.qihang.kwai.controller;
//
//import com.qihang.kwai.service.KwaiOrderService;
//import com.qihang.kwai.service.SysShopService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.util.StringUtils;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
///**
// * 描述：
// *
// * @author qlp
// * @date 2019-11-13 14:44
// */
//@RestController
//@RequestMapping("/kwai")
//public class KwaiOrderController {
//    @Autowired
//    private SysShopService shopService;
//    @Autowired
//    private KwaiOrderService kwaiOrderService;
//    /**
//     * 订单列表
//     * @param model
//     * @param request
//     * @return
//     */
//    @RequestMapping("/order_list")
//    public String orderList(){
//        Integer shopId= 13;
//        //查询店铺信息
//        var shop = shopService.getShop(shopId);
//        model.addAttribute("shop",shop);
//
//        model.addAttribute("menuId","order_list");
//        model.addAttribute("shopId",shopId);
//        String orderNum="";
//        if (!StringUtils.isEmpty(request.getParameter("orderNum"))) {
//            orderNum = request.getParameter("orderNum");
//            model.addAttribute("orderNum", orderNum);
//        }
//        String status="";
//        if (!StringUtils.isEmpty(request.getParameter("status"))) status = request.getParameter("status");
//        Integer startTime=null;
//        if (!StringUtils.isEmpty(request.getParameter("startTime"))){
//            startTime = DateUtil.dateToStamp(request.getParameter("startTime")) ;
//            model.addAttribute("startTime",request.getParameter("startTime"));
//        }
//        Integer endTime=null;
//        if (!StringUtils.isEmpty(request.getParameter("endTime"))) {
//            endTime = DateUtil.dateTimeToStamp(request.getParameter("endTime") + " 23:59:59");
//            model.addAttribute("endTime",request.getParameter("endTime"));
//        }
//        Integer pageIndex = 1, pageSize = DataConfigObject.getInstance().getPageSize();
//        if (!StringUtils.isEmpty(request.getParameter("page"))) {
//            pageIndex = Integer.parseInt(request.getParameter("page"));
//        }
//
//        PagingResponse<DcKwaiOrderEntity> result =kwaiOrderService.getKwaiOrders(pageIndex,pageSize,orderNum,startTime,endTime,status);
//        model.addAttribute("pageIndex", pageIndex);
//        model.addAttribute("pageSize", pageSize);
//        model.addAttribute("totalSize", result.getTotalSize());
//        model.addAttribute("lists", result.getList());
//
//        return "v3/order_list_kwai";
//    }
//    /**
//     * 订单详情（douyin）
//     *
//     * @param model
//     * @param id
//     * @param shopId
//     * @param request
//     * @return
//     */
//    @RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
//    public String orderDetailTmall(Model model, @RequestParam Long id, @RequestParam Integer shopId, HttpServletRequest request) {
//
//        DcKwaiOrderEntity orderDetail = kwaiOrderService.getOderDetailByOrderId(id);
//
//        model.addAttribute("orderVo", orderDetail);
//
//        //查询店铺信息
//        var shop = shopService.getShop(shopId);
//        model.addAttribute("shop", shop);
//        model.addAttribute("menuId", "order_list");
//
//        return "v3/order_detail_kwai";
//    }
//
//    /**
//     * 订单确认页面
//     * @param model
//     * @param orderId
//     * @param request
//     * @return
//     */
//    @RequestMapping("/order_confirm")
//    public String orderList(Model model,@RequestParam Long orderId, HttpServletRequest request){
//        DcKwaiOrderEntity orderDetail = kwaiOrderService.getOderDetailByOrderId(orderId);
//        model.addAttribute("orderVo", orderDetail);
//
//        return "v3/order_confirm_kwai";
//    }
//}
