package com.qihang.pdd.controller;//package com.qihang.erp.api.controller.pdd;
//
//import com.alibaba.fastjson.JSONObject;
//import com.b2c.common.utils.DateUtil;
//import com.b2c.service.erp.ErpOrderService;
//import com.b2c.service.oms.OrderPddService;
//import com.pdd.pop.sdk.common.util.JsonUtil;
//import com.pdd.pop.sdk.http.PopClient;
//import com.pdd.pop.sdk.http.PopHttpClient;
//import com.pdd.pop.sdk.http.api.pop.request.PddCloudprintCmdprintRenderRequest;
//import com.pdd.pop.sdk.http.api.pop.request.PddWaybillGetRequest;
//import com.pdd.pop.sdk.http.api.pop.request.PddWaybillSearchRequest;
//import com.pdd.pop.sdk.http.api.pop.response.PddCloudprintCmdprintRenderResponse;
//import com.pdd.pop.sdk.http.api.pop.response.PddWaybillGetResponse;
//import com.pdd.pop.sdk.http.api.pop.response.PddWaybillSearchResponse;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.util.StringUtils;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.ArrayList;
//import java.util.List;
//
///**
// * 订单打印controller
// */
//@RequestMapping("/fahuo")
//@Controller
//public class OrderPrintPddController {
//    @Autowired
//    private ErpOrderService orderService;
//    @Autowired
//    private OrderPddService pddService;
//    private static Logger log = LoggerFactory.getLogger(OrderPddController.class);
//
//    @RequestMapping(value = "/order_pdd", method = RequestMethod.GET)
//    public String getOrderStockOutList(Model model, HttpServletRequest request) {
//        Integer pageIndex = 1;
//        Integer pageSize = 100;
//
//        if (StringUtils.isEmpty(request.getParameter("page")) == false) {
//            try {
//                pageIndex = Integer.parseInt(request.getParameter("page"));
//            } catch (Exception e) {
//            }
//        }
//
//        Integer startTime = 0;
//        Integer endTime = 0;
//        String startTimeTemp= request.getParameter("startTime");
//        if (StringUtils.isEmpty(startTimeTemp) == false) {
//            startTime = DateUtil.dateTimeToStamp(request.getParameter("startTime"));
//        }
//        String endTimeTemp = request.getParameter("endTime");
//        if (StringUtils.isEmpty(endTimeTemp) == false) {
//            endTime =  DateUtil.dateTimeToStamp(request.getParameter("endTime"));
//        }
//        String goodsSpecNum="";
//        if (!StringUtils.isEmpty(request.getParameter("goodsSpecNum"))) {goodsSpecNum = request.getParameter("goodsSpecNum"); model.addAttribute("goodsSpecNum",goodsSpecNum);}
//        String orderNum="";
//        if (!StringUtils.isEmpty(request.getParameter("orderNum")))
//        {orderNum = request.getParameter("orderNum"); model.addAttribute("orderNum",orderNum);}
//
//        String goodsNum="";
//        if (!StringUtils.isEmpty(request.getParameter("goodsNum"))) {
//            goodsNum = request.getParameter("goodsNum");
//        }
//        Integer shopId=18;
//        if(!StringUtils.isEmpty(request.getParameter("shopId"))){
//            shopId= Integer.parseInt(request.getParameter("shopId"));
//        }
//        //快递单状态
//        //EnumErpOrderlogisticsPrintStatus printStatus = EnumErpOrderlogisticsPrintStatus.NotPrint;
//        Integer printStatus = 0;
//        if (!StringUtils.isEmpty(request.getParameter("print"))) {
//            printStatus = Integer.parseInt(request.getParameter("print"));
//        }
//       // Integer isHebing = 0;
//        model.addAttribute("printStatus", printStatus);
//        model.addAttribute("pageIndex", pageIndex);
//        model.addAttribute("pageSize", pageSize);
//        model.addAttribute("shopId",shopId);
//        model.addAttribute("isHebing",0);
//        model.addAttribute("goodsNum",goodsNum);
//
//        //PagingResponse<OrderWaitSendListVo> result = orderService.getWaitPrintOrderList(pageIndex, pageSize, printStatus, startTime, endTime,shopId);
//        //var result = pddService.getOrderViewListPrintWdy(shopId,pageIndex,pageSize,orderNum,goodsNum,goodsSpecNum,0,startTime,endTime);
//        var result = pddService.getOrderViewList(pageIndex,pageSize,orderNum,goodsSpecNum,null,shopId,startTime,endTime,0,1,"",goodsNum);
//
//        model.addAttribute("list", result.getList());
//        model.addAttribute("totalSize", result.getTotalSize());
//
//        model.addAttribute("menuId","print_order_list");
//        return "fahuo/order_fahuo_pdd";
//    }
//    @RequestMapping(value = "/order_fahuo_pdd_hebing", method = RequestMethod.GET)
//    public String order_fahuo_pdd_hebing(Model model, HttpServletRequest request) {
//        Integer printStatus = 0;
//        if (!StringUtils.isEmpty(request.getParameter("print"))) {
//            printStatus = Integer.parseInt(request.getParameter("print"));
//        }
//        Integer startTime = 0;
//        Integer endTime = 0;
//        String date = request.getParameter("date");
//        if (StringUtils.isEmpty(date) == false) {
//            //时间筛选了2020-02-07 - 2020-02-14
//            String[] st = date.split(" - ");
//            if (st.length > 0) {
//                startTime = DateUtil.dateToStamp(st[0]);
//            }
//            if (st.length > 1) {
//                endTime = DateUtil.dateTimeToStamp(st[1] + " 23:59:59");
//            }
//
//        }
//        String goodsNum="";
//        if (!StringUtils.isEmpty(request.getParameter("goodsNum"))) {
//            goodsNum = request.getParameter("goodsNum");
//            model.addAttribute("goodsNum",goodsNum);
//        }
//        Integer shopId=18;
//        if(!StringUtils.isEmpty(request.getParameter("shopId"))){
//            shopId= Integer.parseInt(request.getParameter("shopId"));
//        }
//        Integer isHebing=1;
//        model.addAttribute("printStatus", printStatus);
//        model.addAttribute("isHebing",isHebing);
//        model.addAttribute("goodsNum",goodsNum);
//        model.addAttribute("shopId",shopId);
//        var result = pddService.getPddOrderHebing(shopId,printStatus,goodsNum);
//
//        model.addAttribute("list", result);
//        model.addAttribute("totalSize", result.size());
//
//        model.addAttribute("menuId","print_order_list");
//        return "fahuo/order_fahuo_pdd_hebing";
//    }
//    @RequestMapping(value = "/order_fahuo_pdd_code", method = RequestMethod.GET)
//    public String order_fahuo_pdd_code(Model model, HttpServletRequest request) {
//        var result = pddService.getPddOrderCodePrint(null);
//
//        model.addAttribute("list", result);
//        model.addAttribute("totalSize", result.size());
//        model.addAttribute("printStatus",2);
//        model.addAttribute("isHebing",0);
//
//        return "fahuo/order_fahuo_pdd_code";
//    }
//
//    @RequestMapping(value = "/order_fahuo_pdd_ydd", method = RequestMethod.GET)
//    public String order_fahuo_pdd_ydd(Model model, HttpServletRequest request) {
//        Integer pageIndex = 1;
//        Integer pageSize = 100;
//
//        if (StringUtils.isEmpty(request.getParameter("page")) == false) {
//            try {
//                pageIndex = Integer.parseInt(request.getParameter("page"));
//            } catch (Exception e) {
//            }
//        }
//        String trackingNumber="";
//        Integer status=1;
//        if (!StringUtils.isEmpty(request.getParameter("trackingNumber"))) {
//            trackingNumber = request.getParameter("trackingNumber");
//            status=null;
//        }
//        String printStartTime="";
//        String printEndTime="";
//        if (!StringUtils.isEmpty(request.getParameter("printStartTime"))) {
//            printStartTime = request.getParameter("printStartTime");
//        }
//        if (!StringUtils.isEmpty(request.getParameter("printEndTime"))) {
//            printEndTime = request.getParameter("printEndTime");
//        }
//        Integer shopId=null;
//        if(!StringUtils.isEmpty(request.getParameter("shopId"))){
//            shopId=Integer.parseInt(request.getParameter("shopId"));
//        }
//
//        model.addAttribute("shopId",shopId);
//        var result=pddService.getOrderViewListByPrint(pageIndex,pageSize,shopId,1,trackingNumber,printStartTime,printEndTime);
//        model.addAttribute("printStatus",1);
//        model.addAttribute("isHebing",0);
//        model.addAttribute("trackingNumber",trackingNumber);
//        model.addAttribute("list", result.getList());
//        model.addAttribute("totalSize", result.getTotalSize());
//        model.addAttribute("printStartTime",printStartTime);
//        model.addAttribute("printEndTime",printEndTime);
//
//        model.addAttribute("menuId","print_order_list");
//        return "fahuo/order_fahuo_pdd_ydd";
//    }
//    @RequestMapping(value = "/test", method = RequestMethod.GET)
//    public void test() throws Exception{
//        String clientId = "dc953bcf16d24b27abf3e64a59e1ecd1";
//        String clientSecret = "de296599e194a08cbfbb2b3b340e11fec7a1bacc";
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//
///*        PddCloudprintStdtemplatesGetRequest request2 = new PddCloudprintStdtemplatesGetRequest();
//        PddCloudprintStdtemplatesGetResponse response2 = client.syncInvoke(request2);
//        System.out.println(JsonUtil.transferToJson(response2));*/
//        PddWaybillSearchRequest request = new PddWaybillSearchRequest();
//        PddWaybillSearchResponse response = client.syncInvoke(request, "1d8739f5222942288d7d39fb4e29f1e4e279be81");
//        System.out.println(JsonUtil.transferToJson(response));
//
//    }
//
//    @RequestMapping(value = "/order_print", method = RequestMethod.GET)
//    public void testPddPrint() throws Exception{
//        String clientId = "dc953bcf16d24b27abf3e64a59e1ecd1";
//        String clientSecret = "de296599e194a08cbfbb2b3b340e11fec7a1bacc";
//        String accessToken = "bbaf1f7176d04785bae3809d309cb3215da6ca2f";
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//        PddWaybillGetRequest request = new PddWaybillGetRequest();
//
//        var order = pddService.getOrder("210617-119055350582012");
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequest paramWaybillCloudPrintApplyNewRequest = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequest();
//        paramWaybillCloudPrintApplyNewRequest.setNeedEncrypt(false);
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestSender sender = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestSender();
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestSenderAddress address = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestSenderAddress();
//        //东方店铺发货地址
///*        address.setCity("东莞市");
//        address.setDetail("聚新二路42号华衣云商科技");
//        address.setDistrict("大朗镇");
//        address.setProvince("广东省");
//        sender.setAddress(address);
//        sender.setMobile("15920623872");
//        sender.setName("胡生");
//        sender.setPhone("15920623872");*/
//        //百货店发货地址
//        address.setProvince("广东省");
//        address.setCity("东莞市");
//        address.setDistrict("大朗镇");
//        address.setDetail("聚新2路42号");
//        sender.setName("胡生");
//        sender.setPhone("15920623872");
//        paramWaybillCloudPrintApplyNewRequest.setSender(sender);
//        List<PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItem> tradeOrderInfoDtos = new ArrayList<>();
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItem item = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItem();
//        //item.setLogisticsServices("{ "SVC-COD": { "value": "200" } }");
//        item.setObjectId("str");
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemOrderInfo orderInfo = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemOrderInfo();
//        orderInfo.setOrderChannelsType("PDD");
//        List<String> tradeOrderList = new ArrayList<String>();
//        tradeOrderList.add(order.getOrderSn());
//        orderInfo.setTradeOrderList(tradeOrderList);
//        item.setOrderInfo(orderInfo);
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemPackageInfo packageInfo = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemPackageInfo();
//        packageInfo.setGoodsDescription("str");
//        packageInfo.setId("str");
//        List<PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemPackageInfoItemsItem> items = new ArrayList<>();
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemPackageInfoItemsItem item1 = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemPackageInfoItemsItem();
//        item1.setCount(1);
//        item1.setName("衣服");
//        items.add(item1);
//        packageInfo.setItems(items);
//        packageInfo.setPackagingDescription("");
//        packageInfo.setTotalPackagesCount(0);
//        packageInfo.setVolume(0L);
//        packageInfo.setWeight(0L);
//        item.setPackageInfo(packageInfo);
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemRecipient recipient = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemRecipient();
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemRecipientAddress address1 = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemRecipientAddress();
//        address1.setCountry(order.getCountry());
//        address1.setProvince(order.getProvince());
//        address1.setCity(order.getCity());
//        address1.setDistrict(order.getTown());
//        address1.setDetail(order.getAddress());
//        //address.setTown();
//        recipient.setAddress(address1);
//        recipient.setMobile(order.getReceiver_phone());
//        recipient.setName(order.getReceiver_name());
//        recipient.setPhone(order.getReceiver_phone());
//        item.setRecipient(recipient);
//        item.setTemplateUrl("https://file-link.pinduoduo.com/jtsd_one");
//        item.setUserId(0L);
//        tradeOrderInfoDtos.add(item);
//        paramWaybillCloudPrintApplyNewRequest.setTradeOrderInfoDtos(tradeOrderInfoDtos);
//        paramWaybillCloudPrintApplyNewRequest.setWpCode("JTSD");
//        request.setParamWaybillCloudPrintApplyNewRequest(paramWaybillCloudPrintApplyNewRequest);
//        try {
//            PddWaybillGetResponse response = client.syncInvoke(request, accessToken);
//            String jsonStr =JsonUtil.transferToJson(response);
//            System.out.println("res0:"+jsonStr);
//            var resObjs= JSONObject.parseObject(jsonStr).getJSONObject("pdd_waybill_get_response").getJSONArray("modules");
//
//            PddCloudprintCmdprintRenderRequest requestP = new PddCloudprintCmdprintRenderRequest();
//
//            PddCloudprintCmdprintRenderRequest.Request request1 = new PddCloudprintCmdprintRenderRequest.Request();
//            //目前暂未对这两个字段进行校验，服务商可以传入与服务相关的固定值。
//            request1.setClientSideId("PC_PRINT");
//            request1.setClientType("PC");
//
//            PddCloudprintCmdprintRenderRequest.RequestConfig config = new PddCloudprintCmdprintRenderRequest.RequestConfig();
//            config.setHorizontalOffset((double) 0.0);
//            config.setNeedBottomLogo(false);
//            config.setNeedMiddleLogo(false);
//            config.setNeedTopLogo(false);
//            config.setOrientation("str");
//            config.setVerticalOffset((double) 0.0);
//            request1.setConfig(config);
//
//            PddCloudprintCmdprintRenderRequest.RequestDocument document = new PddCloudprintCmdprintRenderRequest.RequestDocument();
//            List<PddCloudprintCmdprintRenderRequest.RequestDocumentContentsItem> contents = new ArrayList<>();
//
//            String printStr="";
//            for(int i=0;i<resObjs.size();i++) {
//                printStr=resObjs.getJSONObject(i).get("print_data").toString();
//            }
//            PddCloudprintCmdprintRenderRequest.RequestDocumentContentsItem itemP = new PddCloudprintCmdprintRenderRequest.RequestDocumentContentsItem();
//            //item.setAddData("str");
//            itemP.setEncrypted(false);
//            itemP.setPrintData(printStr);
//            //item.setSignature("str");
//            //标准模板：https://file-link.pinduoduo.com/jtsd_std
//            //模板一：https://file-link.pinduoduo.com/jtsd_one
//            itemP.setTemplateUrl("https://file-link.pinduoduo.com/jtsd_one");
//            //item.setVer("3");
//            contents.add(itemP);
//            document.setContents(contents);
//            request1.setDocument(document);
//            request1.setPrinterName("QR-386A");
//            request1.setPrintCommandType("CPCL");
//            //request1.setCmdEncoding("gzip_byte");
//            requestP.setRequest(request1);
//
//            PddCloudprintCmdprintRenderResponse responseP = client.syncInvoke(requestP, accessToken);
//            System.out.println(JsonUtil.transferToJson(responseP));
//
//        }catch (Exception e){
//
//        }
//    }
////    @RequestMapping(value = "/print_code", method = RequestMethod.GET)
////    public void printCode(){
////        String clientId = "dc953bcf16d24b27abf3e64a59e1ecd1";
////        String clientSecret = "de296599e194a08cbfbb2b3b340e11fec7a1bacc";
////        String accessToken = "50bb3b8f8a1a4fbdbc8da52e99b7beb31ab4a001";
////        PopClient client = new PopHttpClient(clientId, clientSecret);
////
////        PddCloudprintCmdprintRenderRequest request = new PddCloudprintCmdprintRenderRequest();
////
////        PddCloudprintCmdprintRenderRequest.Request request1 = new PddCloudprintCmdprintRenderRequest.Request();
////        request1.setClientSideId("wx8e023a4836a52f22");
////        request1.setClientType("weixin");
////
////        PddCloudprintCmdprintRenderRequest.RequestConfig config = new PddCloudprintCmdprintRenderRequest.RequestConfig();
////
////        config.setHorizontalOffset((double) 0.0);
////        config.setNeedBottomLogo(false);
////        config.setNeedMiddleLogo(false);
////        config.setNeedTopLogo(false);
////        config.setOrientation("normal");
////        config.setVerticalOffset((double) 0.0);
////
//////        config.setHorizontalOffset((double) 0.0);
//////        config.setNeedBottomLogo(false);
//////        config.setNeedMiddleLogo(false);
//////        config.setNeedTopLogo(false);
////        config.setOrientation("normal");
//////        config.setVerticalOffset((double) 0.0);
////
////        request1.setConfig(config);
////
////        PddCloudprintCmdprintRenderRequest.RequestDocument document = new PddCloudprintCmdprintRenderRequest.RequestDocument();
////        List<PddCloudprintCmdprintRenderRequest.RequestDocumentContentsItem> contents = new ArrayList<>();
////
////        String resJsonStr="{\"pdd_waybill_get_response\":{\"modules\":[{\"object_id\":\"str\",\"print_data\":\"{\\\"encryptedData\\\":\\\"a67d4819d0cd21554e9437e0bc2caa629864b0effd1aec65833023f78e93733ca9eec3468dc487b24682b9d64f176ca6bb3f602c2b383571c725bae8ff84957579b574f231f3f4bff51447906ce0566b74210e61bb9379a1ad3647cd9c5648fc1e2a627dde855be135aeadb4dffd020554bf84a05f39d50f49bf8875895fc79ec23933bbf375987929f129b6bd30521b8259c104e564a45b5d2c4d3ccd45aa9dae43e27c34c91c6be269d3028ff1f579a866bed94696a9d697851edb30ee8411975486bc993fee8c4cad2525e0e33638978c8fcb8dea75a1d05d2b586ff0174bc18a3a0680e0ae48d73444fc440fb55f7b2a0485f4d2d7396601ba9ea295d895023b4d2299cb87cca5be2a147bc62f078e716dcce4f563215d8098b6eefe7df465c05a88f80098f6175441f711f5ca193c60b61435c58c5d32fa6a39b9b8a3699c4411dca8921be94ba5fd5de113a76c34eb0bad6fcbbfcfe4eacd400a1ff63e51d603c8aaada8969165607d149c0e6bcf724924fcacc9248818a219719e2c46199ced5ada6f6b42a2c3555fddcfe2fb5309cae5dca4a0c5d389ecee8bcf66062ff3aa7c09ee6aa9ebfa86139a7a4adce21cceb4729e0a448f762f6d5b379790093943651240f93932eb106d25341df44bb4dfb2e9b5ed3c827a6c063585cf2fbd9b5886886efea7ac89fb734130da262a22b282c8a8bbddc2d79fcd35814e3fa24c3538dac9bbdb096054263f7f2541191c0b1aa5207f8be1ae1292aea443d3fabf1fb837b58758738eebe494941af774ace3ac436420fc4c15b41b97c5553c1483ecfb87c3691e80f0d30e75d4339bc7e5d9de6ccf3e65d1008ba61d6803b0e8b874ab353ccb368536cc35b4ddde1f43d509ee8146ffd6b7a4841299dba4512af7b533a44fcabce1224c91ca9785659abf2f5f4f8dd2ccc6c264f7ed25587ab5b023ae2089e748bdf34eca6948198d366e879863b41cfe558bd0ce9f6c5361c1ea29d905e5e73b42f945e573cd9b519f17629fa8134a8dd4cdfd48aac911ea2140ece7269d71e8230ab6fff4ab9f08771f849cf3eb3a34f41743fd7b4f3e5532c6fc98a38cd63f7a48750d056fd25fad54f31ce2e8c3f4a679baf83f18202280c8069fe3c5c942cc5d95412b9ca707c62c0ba3c19f88bd4c518a6bdfda6670cf84a7ab6b23d4a8bb996fc9c6d8dc65318a82e5e637eb2aa2a91e3a146f01fecb2d02f6e768c90f72296d56563e9cf1e7d6d377ffcd7817c00d9db2e5abc93e515b23218e92df1f23e774580caee71824adfcc4a7d3c36f9113954f03eb84b7acecee2eb77d38935af1ec1ff0f7a5c965616166a5d9f427b5f5d497f83dfe67acb745f1e887e9c2af61f79fa802293e18a7d6a1f4666ff4913249f708623d5b619e7824c199474395b26cc26613b74d00a653ec4d3bcb580629a1716610a5341242ffbc10b176cddd186aa336f9cbe3fbaa2e9904c52c9e92da89f36539aba33e8883dd4b2b0792b8c93ec80508fb476d96fa689c3171135a3c03ee17c5e7f20387b2948bc4b9c371c1bbe57f4efa3b75054d77e191bcb8339c61c7d4efac045455da183eed3e331ec26fcc60e768f5\\\",\\\"signature\\\":\\\"g/C/uwNK5sTXC07e9z4KGoykKqoEuAL/txQtIGKCM6UMBkY1WmTpM43T8ylaoq0nsa3pEQBoWuu1QreS7kUAXU8egugpr8PMGnVg5plrDkAa/zaOAV+8q8xv3dR/7vU/VBmCWcR3z3dmlRBXNomyW6KNmXTeH1vh3tQPtPllho4=\\\",\\\"templateUrl\\\":\\\"https://file-link.pinduoduo.com/jtsd_one\\\",\\\"ver\\\":\\\"3\\\"}\",\"waybill_code\":\"JT5049988959708\"}]}}";
////        var resObjs= JSONObject.parseObject(resJsonStr).getJSONObject("pdd_waybill_get_response").getJSONArray("modules");
////        String printStr="";
////        for(int i=0;i<resObjs.size();i++) {
////            printStr=resObjs.getJSONObject(i).get("print_data").toString();
////        }
////        String str_="{\\\"data\\\":{\\\"list\\\":[{\\\"fontSize\\\":16,\\\"height\\\":22,\\\"left\\\":12,\\\"text\\\":\\\"测试店铺\\\",\\\"top\\\":2,\\\"width\\\":270},{\\\"fontSize\\\":16,\\\"height\\\":22,\\\"left\\\":322,\\\"text\\\":\\\"2019-07-25 08:23:67\\\",\\\"top\\\":2,\\\"width\\\":270},{\\\"fontSize\\\":16,\\\"height\\\":22,\\\"left\\\":12,\\\"text\\\":\\\"190321-254553812462731270\\\",\\\"top\\\":24,\\\"width\\\":270},{\\\"fontSize\\\":16,\\\"height\\\":22,\\\"left\\\":332,\\\"text\\\":\\\"高级发胶\\\",\\\"top\\\":24,\\\"width\\\":270},{\\\"fontSize\\\":16,\\\"height\\\":22,\\\"left\\\":12,\\\"text\\\":\\\"231000333\\\",\\\"top\\\":46,\\\"width\\\":270},{\\\"fontSize\\\":16,\\\"height\\\":22,\\\"left\\\":180,\\\"text\\\":\\\"黑色\\\",\\\"top\\\":46,\\\"width\\\":270},{\\\"fontSize\\\":16,\\\"height\\\":22,\\\"left\\\":340,\\\"text\\\":\\\"总计：10件 8.8元\\\",\\\"top\\\":46,\\\"width\\\":270}],\\\"waterdata\\\":{\\\"left\\\":566,\\\"text\\\":\\\"1件\\\",\\\"top\\\":128}}}";
////        System.out.println(str_);
////        PddCloudprintCmdprintRenderRequest.RequestDocumentContentsItem item = new PddCloudprintCmdprintRenderRequest.RequestDocumentContentsItem();
////        //item.setAddData("str");
////        item.setEncrypted(false);
////        item.setPrintData(str_);
////        //item.setSignature("str");
////        //标准模板：https://file-link.pinduoduo.com/jtsd_std
////        //模板一：https://file-link.pinduoduo.com/jtsd_one
////        item.setTemplateUrl("https://file-link.pinduoduo.com/jtsd_one");
////        //item.setVer("3");
////        contents.add(item);
////        document.setContents(contents);
////        request1.setDocument(document);
////        request1.setPrinterName("FUJI XEROX DocuCentre S2110");//FUJI XEROX DocuCentre S2110
////        request1.setPrintCommandType("CPCL");
////        request1.setCmdEncoding("gzip_byte");
////        request.setRequest(request1);
////        try {
////            PddCloudprintCmdprintRenderResponse response = client.syncInvoke(request, accessToken);
////            System.out.println(JsonUtil.transferToJson(response));
////        }catch (Exception e){
////
////        }
////
////    }
//
//
//}
