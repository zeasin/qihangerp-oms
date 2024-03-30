package com.qihang.pdd.controller;//package com.qihang.erp.api.controller.pdd;
//
//import com.b2c.common.utils.DateUtil;
//import com.b2c.oms.DataConfigObject;
//import com.b2c.service.ExpressCompanyService;
//import com.b2c.service.ShopService;
//import com.b2c.service.oms.OrderPddRefundService;
//import com.b2c.service.oms.OrderPddService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.util.StringUtils;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import javax.servlet.http.HttpServletRequest;
//
///**
// * 描述：
// *
// * @author qlp
// * @date 2019-09-24 16:05
// */
//@RequestMapping("/pdd")
//@Controller
//public class RefundPddController {
//    @Autowired
//    private ShopService shopService;
//    @Autowired
//    private ExpressCompanyService expressCompanyService;
//    @Autowired
//    private OrderPddRefundService refundService;
//    @Autowired
//    private OrderPddService orderPddService;
//
//
//    /**
//     * 退货订单
//     *
//     * @param model
//     * @param request
//     * @return
//     */
//    @RequestMapping(value = "/refund_list", method = RequestMethod.GET)
//    public String list(Model model, @RequestParam Integer shopId, HttpServletRequest request) {
//        //查询店铺信息
//        var shop = shopService.getShop(shopId);
//        model.addAttribute("shop",shop);
//        model.addAttribute("shopId",shopId);
//        Integer type = null;
//        if (!StringUtils.isEmpty(request.getParameter("type"))) {
//            try {
//                type = Integer.parseInt(request.getParameter("type"));
//            }catch (Exception e){}
//        }
//        model.addAttribute("menuId", "refund_list");
//        model.addAttribute("type", type);
//
//        String page = request.getParameter("page");
//        Integer pageIndex = 1;
//        Integer pageSize = DataConfigObject.getInstance().getPageSize();
//
//        Long refundId = 0l;
//        String orderNum = "";
//        String logisticsCode = "";//退货物流单号
//
//        Integer startTime = 0;
//        Integer endTime = 0;
//
//        Integer status = null;
//        Integer auditStatus = null;
//
//        if (!StringUtils.isEmpty(page)) {
//            pageIndex = Integer.parseInt(page);
//        }
//
//        if (!StringUtils.isEmpty(request.getParameter("orderNum"))) {
//            orderNum = request.getParameter("orderNum");
//            model.addAttribute("orderNum",orderNum);
//        }
//
//        if (!StringUtils.isEmpty(request.getParameter("refundNum"))) {
//            refundId = Long.parseLong(request.getParameter("refundNum"));
//            model.addAttribute("refundNum",refundId);
//        }
//
//
//        if (!StringUtils.isEmpty(request.getParameter("logisticsCode"))) {
//            logisticsCode = request.getParameter("logisticsCode");
//            model.addAttribute("logisticsCode",logisticsCode);
//        }
//
//        if (!StringUtils.isEmpty(request.getParameter("status"))) {
//            status = Integer.parseInt(request.getParameter("status"));
//            model.addAttribute("status",status);
//        }
//        if (!StringUtils.isEmpty(request.getParameter("auditStatus"))) {
//            auditStatus = Integer.parseInt(request.getParameter("auditStatus"));
//            model.addAttribute("auditStatus",auditStatus);
//        }
//
//        if (!StringUtils.isEmpty(request.getParameter("startTime"))) {
//            startTime = DateUtil.dateToStamp(request.getParameter("startTime"));
//        }
//        if (!StringUtils.isEmpty(request.getParameter("endTime"))) {
//            endTime = DateUtil.dateTimeToStamp(request.getParameter("endTime") + " 23:59:59");
//        }
//
//
//        model.addAttribute("pageIndex", pageIndex);
//        model.addAttribute("pageSize", pageSize);
//        var result = refundService.getList(pageIndex, pageSize, refundId, orderNum, status,auditStatus,shopId,type,logisticsCode, startTime, endTime);
//        model.addAttribute("orderNum",orderNum);
//        model.addAttribute("totalSize", result.getTotalSize());
//        model.addAttribute("list", result.getList());
//
//        model.addAttribute("company", expressCompanyService.getExpressCompany());
//
//        return "v3/refund_list_pdd";
//    }
//
//
//    /**
//     * 退货详情
//     *
//     * @param model
//     * @param id
//     * @param request
//     * @return
//     */
//    @RequestMapping(value = "/refund_detail", method = RequestMethod.GET)
//    public String getOrderDetailYg(Model model, @RequestParam Long id, HttpServletRequest request) {
//        model.addAttribute("menuId", "refund_list");
//        var detail = refundService.getEntityById(id);
//
//        if(detail == null) return "redirect:/pdd/refund_list";
//
//        model.addAttribute("orderVo", detail);
//
//        model.addAttribute("menuId", "refund_list");
//
//        return "v3/refund_detail_pdd";
//    }
//
//    @RequestMapping(value = "/apply_refund_pdd", method = RequestMethod.GET)
//    public String getOrderRefundOffline(Model model,@RequestParam Integer shopId, HttpServletRequest request) {
//        //查询订单信息
//        Long orderId = Long.parseLong(request.getParameter("id"));
//        var orderDetail = orderPddService.getOrderDetailAndItemsById(orderId);
//        model.addAttribute("menuId", "refund_list");
//        model.addAttribute("items", orderDetail.getItems());
//        model.addAttribute("orderId", orderId);
//        model.addAttribute("shopId", shopId);
//        return "v3/order_apply_refund_pdd";
//    }
//
//}
