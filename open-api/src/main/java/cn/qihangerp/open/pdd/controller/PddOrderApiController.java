package cn.qihangerp.open.pdd.controller;


import cn.qihangerp.open.domain.SysShopPullLasttime;
import cn.qihangerp.open.pdd.PddApiCommon;
import cn.qihangerp.open.pdd.OrderApiHelper;
import cn.qihangerp.open.pdd.PddPullRequest;
import cn.qihangerp.open.pdd.common.ApiResultVo;
import cn.qihangerp.open.pdd.domain.OmsPddOrder;
import cn.qihangerp.open.pdd.domain.OmsPddOrderItem;
import cn.qihangerp.open.pdd.model.OrderListResultVo;
import cn.qihangerp.open.pdd.service.OmsPddGoodsService;
import cn.qihangerp.open.pdd.service.OmsPddOrderService;
import cn.qihangerp.open.service.SysShopPullLasttimeService;
import cn.qihangerp.open.service.SysShopPullLogsService;
import com.alibaba.fastjson2.JSONObject;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@RequestMapping("/pdd/order")
@RestController
public class PddOrderApiController {
    private static Logger logger = LoggerFactory.getLogger(PddOrderApiController.class);
    private final OmsPddGoodsService goodsService;
    private final OmsPddOrderService orderService;
    private final PddApiCommon pddApiHelper;
    private final SysShopPullLasttimeService pullLasttimeService;
    private final SysShopPullLogsService pullLogsService;
    private final KafkaTemplate<String,Object> kafkaTemplate;
    /**
     * 接口拉取订单
     *
     * @param
     * @param
     * @return
     * @throws Exception
     */
    @PostMapping ("/pull_order")
    public AjaxResult getOrderList(@RequestBody PddPullRequest req) throws Exception {

        Long shopId = req.getShopId();// 拼多多shopId
        var checkResult = pddApiHelper.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();

//        Long endTime = System.currentTimeMillis() / 1000;// 订单更新结束时间(默认值)
//        Long startTime = endTime - 60 * 60 * 24 + 10;// 订单更新开始时间(默认值)

        // 查询上次更新时间
        // 获取最后更新时间
        LocalDateTime startTime = null;
        LocalDateTime  endTime = null;
        SysShopPullLasttime lasttime = pullLasttimeService.getLasttimeByShop(req.getShopId(), "ORDER");
        if(lasttime == null){
            endTime = LocalDateTime.now();
            startTime = endTime.minusDays(1);
        }else{
            startTime = lasttime.getLasttime().minusHours(1);//取上次结束一个小时前
            endTime = startTime.plusDays(1);//取24小时
            if(endTime.isAfter(LocalDateTime.now())){
                endTime = LocalDateTime.now();
            }
        }
        String startTimeStr = startTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String endTimeStr = endTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        Long startTimestamp = startTime.toEpochSecond(ZoneOffset.ofHours(8));
        Long endTimestamp = endTime.toEpochSecond(ZoneOffset.ofHours(8));

        logger.info("开始循环更新拼多多订单。开始时间：" + startTimeStr + "结束时间：" + endTimeStr);
        int hasExistOrder = 0;
        int insertSuccess = 0;
        int totalError = 0;



        ApiResultVo<OrderListResultVo> apiResultVo = OrderApiHelper.pullOrderList(appKey, appSecret, accessToken, startTimestamp.intValue(), endTimestamp.intValue(), 1, 20);
        if (apiResultVo.getCode() != 0) return AjaxResult.error(apiResultVo.getCode(), apiResultVo.getMsg());
        //成功
        if (apiResultVo.getData().getOrderList() != null) {
            //循环插入订单数据到数据库
            for (var trade : apiResultVo.getData().getOrderList()) {
                OmsPddOrder order = new OmsPddOrder();
                BeanUtils.copyProperties(trade,order);
                List<OmsPddOrderItem> items = new ArrayList<>();
                for (var it:trade.getItemList()) {
                    OmsPddOrderItem item = new OmsPddOrderItem();
                    BeanUtils.copyProperties(it,item);
                    items.add(item);
                }
                order.setItemList(items);
                //插入订单数据
                var result = orderService.saveOrder(req.getShopId(), order);
                if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                    //已经存在
                    logger.info("/**************主动更新pdd订单：开始更新数据库：" + order.getId() + "存在、更新****************/");
                    kafkaTemplate.send(MqType.ORDER_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.PDD, MqType.ORDER_MESSAGE,order.getOrderSn())));
                    hasExistOrder++;
                } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                    logger.info("/**************主动更新pdd订单：开始更新数据库：" + order.getId() + "不存在、新增****************/");
                    kafkaTemplate.send(MqType.ORDER_MQ, JSONObject.toJSONString(MqMessage.build(EnumShopType.PDD, MqType.ORDER_MESSAGE,order.getOrderSn())));
                    insertSuccess++;
                } else {
                    logger.info("/**************主动更新pdd订单：开始更新数据库：" + order.getId() + "报错****************/");
                    totalError++;
                }
            }
        }
        String msg = "成功，总共找到：" + apiResultVo.getData().getOrderList().size() + "条商品数据，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        logger.info(msg);

        return AjaxResult.success(msg);

    }




//    /**
//     * 更新订单状态（根据订单号）
//     *
//     * @param reqData
//     * @param req
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/pull_order_status", method = RequestMethod.POST)
//    public ApiResult<ErpSalesPullCountResp> updOrderStatus(@RequestBody DataRow reqData, HttpServletRequest req)
//            throws Exception {
//        // String startDate = reqData.getString("startTime");
//        // String endDate = reqData.getString("endTime");
//        log.info("开始接口更新订单状态");
//        Integer shopId = reqData.getInt("shopId");// 拼多多shopId
//        String orderS = reqData.getString("orderS");//
//
//        ApiResult<ErpSalesPullCountResp> result = null;// 返回结果
//
//        String clientId = DataConfigObject.getInstance().getPddClientId();
//        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
//        var shop = shopService.getShop(shopId);
//        // var settingEntity = thirdSettingService.getEntity(shop.getType());
//
//        String accessToken = shop.getSessionKey();// settingEntity.getAccess_token();
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//
//        PddOrderStatusGetRequest request = new PddOrderStatusGetRequest();
//        request.setOrderSns(orderS);
//        PddOrderStatusGetResponse response = client.syncInvoke(request, accessToken);
//        // System.out.println(JsonUtil.transferToJson(response));
//        // 更新订单状态
//        if (response.getErrorResponse() != null) {
//            if (response.getErrorResponse().getErrorCode().intValue() == 10019) {
//                return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "Token过期");
//            } else
//                return new ApiResult<>(EnumResultVo.SystemException.getIndex(),
//                        "接口调用失败：" + response.getErrorResponse().getErrorMsg());
//        } else {
//            // 获取到了数据
//            if (response.getOrderStatusGetResponse().getOrderStatusList().size() > 0) {
//                for (var item : response.getOrderStatusGetResponse().getOrderStatusList()) {
//                    orderPddService.updPddOrderStatus(item.getOrderSn(), item.getOrderStatus(), item.getRefundStatus());
//                    log.info("更新订单状态：" + JsonUtil.transferToJson(item));
//                }
//            }
//
//            log.info("更新订单状态 完成");
//            return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "SUCCESS");
//
//        }
//    }
//
//    @RequestMapping(value = "/pull_order_status_all", method = RequestMethod.POST)
//    public ApiResult<ErpSalesPullCountResp> updOrderStatusAll(@RequestBody DataRow reqData, HttpServletRequest req)
//            throws Exception {
//        log.info("开始接口更新订单状态ALL");
//        Integer shopId = reqData.getInt("shopId");// 拼多多shopId
//        var shop = shopService.getShop(shopId);
//        String clientId = DataConfigObject.getInstance().getPddClientId();
//        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
//        // 获取店铺信息，判断店铺是否一致
//        var shopResult = PddApiUtils.getShopInfo(clientId, clientSecret, shop.getSessionKey());
//        if (shopResult.getCode() != EnumResultVo.SUCCESS.getIndex())
//            return new ApiResult<>(shopResult.getCode(), shopResult.getMsg());
//
//        if (shopResult.getData().getMallId().longValue() != shop.getSellerUserId().longValue()) {
//            return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "该店铺不是授权店铺");
//        }
//
//        String orderStatus = reqData.getString("orderStatus");
//        String refundStatusStr = reqData.getString("refundStatus");
//        Integer status = null;
//        Integer refundStatus = null;
//        if (!StringUtils.isEmpty(orderStatus)) {
//            try {
//                status = Integer.parseInt(orderStatus);
//            } catch (Exception e) {
//            }
//        }
//        if (!StringUtils.isEmpty(refundStatusStr)) {
//            try {
//                refundStatus = Integer.parseInt(refundStatusStr);
//            } catch (Exception e) {
//            }
//        }
//
//        Integer pageIndex = 1;
//        Integer pageSize = 50;
//
//        // 查询订单
//        var result = orderPddService.getOrderListByStatus(pageIndex, pageSize, shopId, status, refundStatus);
//        log.info("查询到" + result.getTotalPage() + "页需要更新，总共" + result.getTotalSize() + "条记录");
//
//        String orderS = "";
//        for (var o : result.getList()) {
//            orderS += o.getOrderSn() + ",";
//        }
//        log.info("开始更新第1页");
//        upd(shopId, orderS);
//
//        while (result.isHasNextPage()) {
//            pageIndex++;
//            log.info("开始更新第" + pageIndex + "页");
//            result = orderPddService.getOrderListByStatus(pageIndex, pageSize, shopId, status, refundStatus);
//
//            String orderS1 = "";
//            for (var o : result.getList()) {
//                orderS1 += o.getOrderSn() + ",";
//            }
//            upd(shopId, orderS1);
//        }
//        log.info("已更新" + pageIndex + "页，总计：" + result.getTotalSize() + "条，更新完成");
//        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "SUCCESS");
//    }

//    private ApiResult<String> upd(Integer shopId, String orderS) throws Exception {
//        String clientId = DataConfigObject.getInstance().getPddClientId();
//        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
//        var shop = shopService.getShop(shopId);
//        // var settingEntity = thirdSettingService.getEntity(shop.getType());
//
//        String accessToken = shop.getSessionKey();// settingEntity.getAccess_token();
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//
//        PddOrderStatusGetRequest request = new PddOrderStatusGetRequest();
//        request.setOrderSns(orderS);
//        PddOrderStatusGetResponse response = client.syncInvoke(request, accessToken);
//        // System.out.println(JsonUtil.transferToJson(response));
//        // 更新订单状态
//        if (response.getErrorResponse() != null) {
//            if (response.getErrorResponse().getErrorCode().intValue() == 10019) {
//                return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "Token过期");
//            } else
//                return new ApiResult<>(EnumResultVo.SystemException.getIndex(),
//                        "接口调用失败：" + response.getErrorResponse().getErrorMsg());
//        } else {
//            // 获取到了数据
//            if (response.getOrderStatusGetResponse().getOrderStatusList().size() > 0) {
//                for (var item : response.getOrderStatusGetResponse().getOrderStatusList()) {
//                    orderPddService.updPddOrderStatus(item.getOrderSn(), item.getOrderStatus(), item.getRefundStatus());
//                    log.info("更新订单状态：" + JsonUtil.transferToJson(item));
//                }
//            }
//
//            log.info("更新订单状态 完成");
//            return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "SUCCESS");
//
//        }
//    }

//    /**
//     * 重复打印
//     *
//     * @param reqData
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/pdd_order_repeat_print", method = RequestMethod.POST)
//    public ApiResult<String> pdd_order_repeat_print(@RequestBody DataRow reqData) throws Exception {
//        if (StringUtils.isEmpty(reqData.get("printName")))
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "请选择打印机");
//        var orders = orderPddService.getPrintOrderRepeat(reqData.getString("orderNo"));
//        if (orders.size() == 0)
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "订单物流打印信息不存在");
//        Integer total = 0;
//        StringBuilder sb = new StringBuilder("");
//        for (var order : orders) {
//            total += order.getQuantity();
//            sb.append(order.getGoodsSpecNum());
//            sb.append("(" + order.getGoodsSpec() + ")");
//            sb.append(order.getQuantity()).append("件");
//            sb.append("[" + order.getLocationNumber() + "]").append("\\n");
//        }
//        var shop = shopService.getShop(orders.get(0).getShopId());
//        StringBuilder remark = new StringBuilder("【" + shop.getNickName() + "】").append("订单:").append(orders.size())
//                .append("商品:").append(total).append("件").append("\\n");
//
//        if (!StringUtils.isEmpty(orders.get(0).getEncryptedData())) {
//            // templateUrl=EnumPddPrintCompany.getValueByName(orders.get(0).getTrackingCompany());
//            remark.append(sb.toString()).append("备注:").append(orders.get(0).getRemark());
//            String taskId = orders.get(0).getTrackingNumber() + "_" + OrderNumberUtils.getOrderIdByTime();
//            StringBuilder printStr = new StringBuilder(
//                    "{\"ERPId\":303379400,\"cmd\":\"print\",\"requestID\":\"90E06437\",\"task\":{\"documents\":[{\"contents\":[{\"addData\":{\"sender\":{\"address\":{\"city\":\"东莞市\",\"detail\":\"聚新二路42号华衣云商科技\",\"district\":\"大朗镇\",\"province\":\"广东省\"},\"mobile\":\"13018605585\",\"name\":\"杨辉\"}},");
//            printStr.append("\"encryptedData\": \"").append(orders.get(0).getEncryptedData()).append("\",");
//            printStr.append("\"signature\": \"").append(orders.get(0).getSignature()).append("\",");
//            printStr.append(
//                    "\"templateUrl\":\"http://pinduoduoimg.yangkeduo.com/print_template/2019-08-01/4f0d85f35ca5729ad7df47314c990c31.xml\",\"userid\":\"593374804\",\"ver\":\"3\"},");
//            // printStr.append("\"templateUrl\":
//            // \"").append("https://commfile.pddpic.com/galerie-go/logistics/9238dbb5-1c4e-445e-bac6-45a6832b4e47.xml").append("\",\"userid\":\"593374804\",\"ver\":\"3\"},");
//            printStr.append("{\"data\":{\"height\":120,\"list\":[{\"fontSize\":29,\"height\":120,\"left\":2.08,");
//            printStr.append("\"text\": \"").append(remark.toString()).append("\",");
//            printStr.append(
//                    "\"top\":10,\"width\":600}],\"waterdata\":{\"text\":\"\"},\"width\":560},\"templateURL\":\"http://pinduoduoimg.yangkeduo.com/logistics/2019-07-14/5d7e8b5969d954539fcfba3268bbeb3a.xml\"}],");
//            // printStr.append("\"top\":10,\"width\":413.52}],\"waterdata\":{\"text\":\"\"},\"width\":560},\"templateURL\":\"").append("https://commfile.pddpic.com/galerie-go/logistics/9238dbb5-1c4e-445e-bac6-45a6832b4e47.xml").append("\"}],");
//            printStr.append("\"documentID\": \"").append(taskId).append("\"}],");
//            printStr.append("\"notifyType\": [\"print\"],\"preview\": false,\"previewType\": \"image\",");
//            printStr.append("\"printer\": \"").append(reqData.getString("printName")).append("\",");
//            printStr.append("\"taskID\": \"").append(taskId).append("\"},");
//            printStr.append("\"version\": \"1.0\"}");
//            return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "成功", printStr.toString());
//        }
//        return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "没有原始打单数据");
//
//    }
//
//    @RequestMapping(value = "/pdd_order_print", method = RequestMethod.POST)
//    public ApiResult<String> pdd_order_print(@RequestBody DataRow reqData) throws Exception {
//        if (StringUtils.isEmpty(reqData.get("printName")))
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "请选择打印机");
//        var orders = orderPddService.getPrintOrderRepeatNumber(reqData.getString("trackingNumber"));
//        if (orders.size() == 0)
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "订单物流打印信息不存在");
//        Integer total = 0;
//        StringBuilder sb = new StringBuilder("");
//        for (var order : orders) {
//            total += order.getQuantity();
//            sb.append(order.getGoodsSpecNum());
//            sb.append("(" + order.getGoodsSpec() + ")");
//            sb.append(order.getQuantity()).append("件,");
//            sb.append("[" + order.getLocationNumber() + "]").append("\\n");
//        }
//        var shop = shopService.getShop(orders.get(0).getShopId());
//        StringBuilder remark = new StringBuilder("【" + shop.getNickName() + "】").append("订单:").append(orders.size())
//                .append("商品:").append(total).append("件").append("\\n");
//
//        if (!StringUtils.isEmpty(orders.get(0).getEncryptedData())) {
//            // String
//            // templateUrl=EnumPddPrintCompany.getValueByName(orders.get(0).getTrackingCompany());
//            remark.append(sb.toString()).append("备注:").append(orders.get(0).getRemark());
//            String taskId = orders.get(0).getTrackingNumber() + "_" + OrderNumberUtils.getOrderIdByTime();
//            StringBuilder printStr = new StringBuilder(
//                    "{\"ERPId\":303379400,\"cmd\":\"print\",\"requestID\":\"90E06437\",\"task\":{\"documents\":[{\"contents\":[{\"addData\":{\"sender\":{\"address\":{\"city\":\"东莞市\",\"detail\":\"聚新二路42号华衣云商科技\",\"district\":\"大朗镇\",\"province\":\"广东省\"},\"mobile\":\"13018605585\",\"name\":\"杨辉\"}},");
//            printStr.append("\"encryptedData\": \"").append(orders.get(0).getEncryptedData()).append("\",");
//            printStr.append("\"signature\": \"").append(orders.get(0).getSignature()).append("\",");
//            printStr.append(
//                    "\"templateUrl\":\"http://pinduoduoimg.yangkeduo.com/print_template/2019-08-01/4f0d85f35ca5729ad7df47314c990c31.xml\",\"userid\":\"593374804\",\"ver\":\"3\"},");
//            // printStr.append("\"templateUrl\":
//            // \"").append("http://pinduoduoimg.yangkeduo.com/print_template/2019-08-01/4f0d85f35ca5729ad7df47314c990c31.xml").append("\",\"userid\":\"593374804\",\"ver\":\"3\"},");
//            printStr.append("{\"data\":{\"height\":120,\"list\":[{\"fontSize\":29,\"height\":120,\"left\":2.08,");
//            printStr.append("\"text\": \"").append(remark.toString()).append("\",");
//            printStr.append(
//                    "\"top\":10,\"width\":600}],\"waterdata\":{\"text\":\"\"},\"width\":560},\"templateURL\":\"http://pinduoduoimg.yangkeduo.com/logistics/2019-07-14/5d7e8b5969d954539fcfba3268bbeb3a.xml\"}],");
//            // printStr.append("\"top\":10,\"width\":413.52}],\"waterdata\":{\"text\":\"\"},\"width\":560},\"templateURL\":\"").append("http://pinduoduoimg.yangkeduo.com/print_template/2019-08-01/4f0d85f35ca5729ad7df47314c990c31.xml").append("\"}],");
//            printStr.append("\"documentID\": \"").append(taskId).append("\"}],");
//            printStr.append("\"notifyType\": [\"print\"],\"preview\": false,\"previewType\": \"image\",");
//            printStr.append("\"printer\": \"").append(reqData.getString("printName")).append("\",");
//            printStr.append("\"taskID\": \"").append(taskId).append("\"},");
//            printStr.append("\"version\": \"1.0\"}");
//            for (var order : orders) {
//                orderPddService.updPddOrderResult(order.getOrderId(), "打印成功", 1, DateUtil.getCurrentDateTime());
//            }
//            return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "成功", printStr.toString());
//        }
//        return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "没有原始打单数据");
//
//    }
//
//    @RequestMapping(value = "/pdd_order_print_code", method = RequestMethod.POST)
//    public ApiResult<String> testPddPrint(@RequestBody DataRow reqData) throws Exception {
//        if (StringUtils.isEmpty(reqData.get("company")))
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "请选择快递公司");
//
//        String clientId = DataConfigObject.getInstance().getPddClientId();
//        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
//
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//        // 使用东方概念旗舰店授权打单，所有要用东方概念旗舰店accessToken获取电子面单
//        /*
//         * var dfgnShop = shopService.getShop(5); //检查获取单号的token是否过期 String accessToken5
//         * = dfgnShop.getSessionKey(); PddOrderStatusGetRequest request5 = new
//         * PddOrderStatusGetRequest(); request5.setOrderSns("");
//         * PddOrderStatusGetResponse response5 = client.syncInvoke(request5,
//         * accessToken5);
//         *
//         * if (response5.getErrorResponse() != null &&
//         * response5.getErrorResponse().getErrorCode() ==10019) { return new
//         * ApiResult<>(EnumResultVo.TokenFail.getIndex(),"东方符号店铺token过期","5"); }
//         *
//         * var checkTokenResult =
//         * PddApiUtils.getShopInfo(clientId,clientSecret,accessToken5);
//         * if(checkTokenResult.getData().getMallId().longValue() != 593374804L){ return
//         * new ApiResult<>(EnumResultVo.TokenFail.getIndex(),"东方符号店铺token过期","5"); }
//         */
//        Integer shopId = reqData.getInt("shopId");
//        var shop = shopService.getShop(shopId);
//        synchronized (this) {
//            var orders = (ArrayList) reqData.getObject("orders");
//            for (var orderSn : orders) {
//                // 查询需要打印的订单
//                var printOrderRes = orderPddService.getPrintOrderList(String.valueOf(orderSn),
//                        reqData.getInt("isHebing"), reqData.getString("goodsNum"));
//                if (printOrderRes.getCode() > 0) {
//                    log.info("订单不符号打印条件：" + printOrderRes.getMsg());
//                    continue;
//                }
//                var orderList = printOrderRes.getData().getOrders();
//                System.out.println("订单数：" + orderList.size());
//                String accessToken = shop.getSessionKey();// settingEntity.getAccess_token();
//                PddOrderStatusGetRequest request = new PddOrderStatusGetRequest();
//
//                StringBuilder orderSns = new StringBuilder();
//                for (var order : orderList) {
//                    orderSns.append(order.getOrderSn()).append(",");
//                }
//                request.setOrderSns(orderSns.toString());
//
//                PddOrderStatusGetResponse response = client.syncInvoke(request, accessToken);
//
//                // 检查订单状态是否存在退款
//                if (response.getErrorResponse() != null) {
//                    if (response.getErrorResponse().getErrorCode() == 10019) {
//                        return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "token过期", shopId.toString());
//                    } else {
//                        log.error("拼多多订单打印接口请求错误：" + orderSns.toString() + response.getErrorResponse().getErrorMsg());
//                        continue;
//                    }
//                }
//
//                for (var o : response.getOrderStatusGetResponse().getOrderStatusList()) {
//                    if (o.getOrderStatus().intValue() != 1 || o.getRefundStatus().intValue() != 1) {
//                        orderPddService.updPddOrderStatus(o.getOrderSn(), o.getOrderStatus(), o.getRefundStatus());
//                        continue;
//                    }
//                }
//
//                String encryptedData = "";
//                String signature = "";
//                String billCode = "";
//                var printRes = getPddPrint(orderList, reqData.getString("company"));
//                if (!StringUtils.isEmpty(printRes.getJSONObject("error"))) {
//                    orderList.forEach(o -> orderPddService.updPddOrderResult(o.getOrderId(),
//                            printRes.getJSONObject("error").getString("sub_msg"), 0, null));
//                    continue;
//                }
//                if (!StringUtils.isEmpty(printRes.getString("waybill_code"))) {
//                    encryptedData = printRes.getString("encryptedData");
//                    signature = printRes.getString("signature");
//                    billCode = printRes.getString("waybill_code");
//                    // 3.更新库存确认到仓库
//                    for (var o : orderList) {
//                        String company = EnumPddPrintCompany.getName(reqData.getString("company"));
//                        var result = orderPddService.updPddOrderPrint(o, company, billCode, encryptedData, signature);
//                        log.info("拼多多订单：" + o.getOrderSn() + "物流：" + billCode + "结果：" + result.getMsg());
//                    }
//                }
//            }
//            return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "订单取号完成");
//        }
//
//    }
//
//    public JSONObject getPddPrint(List<OrderViewModel> orders, String company) throws Exception {
//        String clientId = DataConfigObject.getInstance().getPddClientId();
//        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
//
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//        var order = orders.get(0);
//        var dfgnShop = shopService.getShop(order.getShopId());// 固定使用东方概念旗舰店accessToken
//        String accessToken = dfgnShop.getSessionKey();// thirdSettingService.getEntity(5).getAccess_token();
//
//        PddWaybillGetRequest request = new PddWaybillGetRequest();
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequest paramWaybillCloudPrintApplyNewRequest = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequest();
//        paramWaybillCloudPrintApplyNewRequest.setNeedEncrypt(false);
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestSender sender = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestSender();
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestSenderAddress address = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestSenderAddress();
//
//        address.setProvince("广东省");
//        address.setCity("东莞市");
//        address.setDistrict("大朗镇");
//        // 百货店地址
//        if(order.getShopId()==18){
//            address.setDetail(company.equals("JTSD") ? "聚新2路42号" : "聚新二路42号华衣云商科技");
//        }
//        // 东方店地址
//        if(order.getShopId()==5){
//            address.setDetail("聚新二路42号华衣云商科技");
//        }
//
//        sender.setAddress(address);
//        sender.setMobile("15920623872");
//        sender.setName("胡生");
//        sender.setPhone("15920623872");
//
//        paramWaybillCloudPrintApplyNewRequest.setSender(sender);
//        List<PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItem> tradeOrderInfoDtos = new ArrayList<>();
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItem item = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItem();
//        // item.setLogisticsServices("{ "SVC-COD": { "value": "200" } }");
//        item.setObjectId("str");
//
//        PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemOrderInfo orderInfo = new PddWaybillGetRequest.ParamWaybillCloudPrintApplyNewRequestTradeOrderInfoDtosItemOrderInfo();
//        orderInfo.setOrderChannelsType("PDD");
//        List<String> tradeOrderList = new ArrayList<String>();
//        orders.forEach(i -> tradeOrderList.add(i.getOrderSn()));
//        // tradeOrderList.add(order.getOrderSn());
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
//        address1.setCountry("中国");
//        address1.setProvince(order.getProvince());
//        address1.setCity(order.getCity());
//        address1.setDistrict(order.getTown());
//        address1.setDetail(order.getAddress());
//        // address.setTown();
//        recipient.setAddress(address1);
//        recipient.setMobile(order.getReceiverPhone());
//        recipient.setName(order.getReceiverName());
//        recipient.setPhone(order.getReceiverPhone());
//        item.setRecipient(recipient);
//        item.setTemplateUrl(EnumPddPrintCompany.getValue(company));
//        item.setUserId(0L);
//        tradeOrderInfoDtos.add(item);
//        paramWaybillCloudPrintApplyNewRequest.setTradeOrderInfoDtos(tradeOrderInfoDtos);
//        paramWaybillCloudPrintApplyNewRequest.setWpCode(company);
//        request.setParamWaybillCloudPrintApplyNewRequest(paramWaybillCloudPrintApplyNewRequest);
//        try {
//            JSONObject resObj = new JSONObject();
//
//            // log.info(JsonUtil.transferToJson(request));
//
//            PddWaybillGetResponse response = client.syncInvoke(request, accessToken);
//            String jsonStr = JsonUtil.transferToJson(response);
//            var res = JSONObject.parseObject(jsonStr);
//            if (!StringUtils.isEmpty(res.getJSONObject("error_response"))) {
//                resObj.put("error", res.getJSONObject("error_response"));
//                return resObj;
//            }
//            // log.info("获取面单密文结果："+res);
//            var resObjs = res.getJSONObject("pdd_waybill_get_response").getJSONArray("modules");
//            for (int i = 0; i < resObjs.size(); i++) {
//                resObj = JSONObject.parseObject(resObjs.getJSONObject(i).getString("print_data"));
//                resObj.put("waybill_code", resObjs.getJSONObject(i).getString("waybill_code"));
//            }
//            // String
//            // resJsonStr="{\"pdd_waybill_get_response\":{\"modules\":[{\"object_id\":\"str\",\"print_data\":\"{\\\"encryptedData\\\":\\\"a67d4819d0cd21554e9437e0bc2caa629864b0effd1aec65833023f78e93733ca9eec3468dc487b24682b9d64f176ca6bb3f602c2b383571c725bae8ff84957579b574f231f3f4bff51447906ce0566b74210e61bb9379a1ad3647cd9c5648fc1e2a627dde855be135aeadb4dffd020554bf84a05f39d50f49bf8875895fc79ec23933bbf375987929f129b6bd30521b8259c104e564a45b5d2c4d3ccd45aa9dae43e27c34c91c6be269d3028ff1f579a866bed94696a9d697851edb30ee8411975486bc993fee8c4cad2525e0e33638978c8fcb8dea75a1d05d2b586ff0174bc18a3a0680e0ae48d73444fc440fb55f7b2a0485f4d2d7396601ba9ea295d895023b4d2299cb87cca5be2a147bc62f078e716dcce4f563215d8098b6eefe7df465c05a88f80098f6175441f711f5ca193c60b61435c58c5d32fa6a39b9b8a3699c4411dca8921be94ba5fd5de113a76c34eb0bad6fcbbfcfe4eacd400a1ff63e51d603c8aaada8969165607d149c0e6bcf724924fcacc9248818a219719e2c46199ced5ada6f6b42a2c3555fddcfe2fb5309cae5dca4a0c5d389ecee8bcf66062ff3aa7c09ee6aa9ebfa86139a7a4adce21cceb4729e0a448f762f6d5b379790093943651240f93932eb106d25341df44bb4dfb2e9b5ed3c827a6c063585cf2fbd9b5886886efea7ac89fb734130da262a22b282c8a8bbddc2d79fcd35814e3fa24c3538dac9bbdb096054263f7f2541191c0b1aa5207f8be1ae1292aea443d3fabf1fb837b58758738eebe494941af774ace3ac436420fc4c15b41b97c5553c1483ecfb87c3691e80f0d30e75d4339bc7e5d9de6ccf3e65d1008ba61d6803b0e8b874ab353ccb368536cc35b4ddde1f43d509ee8146ffd6b7a4841299dba4512af7b533a44fcabce1224c91ca9785659abf2f5f4f8dd2ccc6c264f7ed25587ab5b023ae2089e748bdf34eca6948198d366e879863b41cfe558bd0ce9f6c5361c1ea29d905e5e73b42f945e573cd9b519f17629fa8134a8dd4cdfd48aac911ea2140ece7269d71e8230ab6fff4ab9f08771f849cf3eb3a34f41743fd7b4f3e5532c6fc98a38cd63f7a48750d056fd25fad54f31ce2e8c3f4a679baf83f18202280c8069fe3c5c942cc5d95412b9ca707c62c0ba3c19f88bd4c518a6bdfda6670cf84a7ab6b23d4a8bb996fc9c6d8dc65318a82e5e637eb2aa2a91e3a146f01fecb2d02f6e768c90f72296d56563e9cf1e7d6d377ffcd7817c00d9db2e5abc93e515b23218e92df1f23e774580caee71824adfcc4a7d3c36f9113954f03eb84b7acecee2eb77d38935af1ec1ff0f7a5c965616166a5d9f427b5f5d497f83dfe67acb745f1e887e9c2af61f79fa802293e18a7d6a1f4666ff4913249f708623d5b619e7824c199474395b26cc26613b74d00a653ec4d3bcb580629a1716610a5341242ffbc10b176cddd186aa336f9cbe3fbaa2e9904c52c9e92da89f36539aba33e8883dd4b2b0792b8c93ec80508fb476d96fa689c3171135a3c03ee17c5e7f20387b2948bc4b9c371c1bbe57f4efa3b75054d77e191bcb8339c61c7d4efac045455da183eed3e331ec26fcc60e768f5\\\",\\\"signature\\\":\\\"g/C/uwNK5sTXC07e9z4KGoykKqoEuAL/txQtIGKCM6UMBkY1WmTpM43T8ylaoq0nsa3pEQBoWuu1QreS7kUAXU8egugpr8PMGnVg5plrDkAa/zaOAV+8q8xv3dR/7vU/VBmCWcR3z3dmlRBXNomyW6KNmXTeH1vh3tQPtPllho4=\\\",\\\"templateUrl\\\":\\\"https://file-link.pinduoduo.com/jtsd_one\\\",\\\"ver\\\":\\\"3\\\"}\",\"waybill_code\":\"JT5049988959708\"}]}}";
//            /*
//             * var resObjs=
//             * JSONObject.parseObject(resJsonStr).getJSONObject("pdd_waybill_get_response").
//             * getJSONArray("modules"); for(int i=0;i<resObjs.size();i++) { resObj =
//             * JSONObject.parseObject(resObjs.getJSONObject(i).getString("print_data"));
//             * resObj.put("waybill_code",resObjs.getJSONObject(i).getString("waybill_code"))
//             * ; }
//             */
//            return resObj;
//        } catch (Exception e) {
//            return null;
//        }
//    }
//
//    @RequestMapping(value = "/pdd_order_print_select_hebing", method = RequestMethod.POST)
//    public ApiResult<String> pdd_order_print_select_hebing(@RequestBody DataRow reqData) throws Exception {
//        if (StringUtils.isEmpty(reqData.get("company")))
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "请选择快递公司");
//        var orders = (ArrayList) reqData.getObject("orders");
//        if (orders.isEmpty())
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "请选择需要发货的订单");
//
//        String clientId = DataConfigObject.getInstance().getPddClientId();
//        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
//
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//        // 检查获取单号的token是否过期
///*        var dfgnShop = shopService.getShop(5);
//        String accessToken5 = dfgnShop.getSessionKey();
//        PddOrderStatusGetRequest request5 = new PddOrderStatusGetRequest();
//        request5.setOrderSns("");
//        PddOrderStatusGetResponse response5 = client.syncInvoke(request5, accessToken5);
//
//        if (response5.getErrorResponse() != null && response5.getErrorResponse().getErrorCode() == 10019) {
//            return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "东方符号店铺token过期", "5");
//        }
//
//        var checkTokenResult = PddApiUtils.getShopInfo(clientId, clientSecret, accessToken5);
//        if (checkTokenResult.getData().getMallId().longValue() != 593374804L) {
//            return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "东方符号店铺token过期", "5");
//        }*/
//
//        Integer shopId = reqData.getInt("shopId");
//        var shop = shopService.getShop(shopId);
//
//        var printOrders = orderPddService.getPrintOrderSelectList(orders);
//
//        String accessToken = shop.getSessionKey();// settingEntity.getAccess_token();
//        PddOrderStatusGetRequest request = new PddOrderStatusGetRequest();
//
//        StringBuilder orderSns = new StringBuilder();
//        for (var order : printOrders.getData()) {
//            orderSns.append(order.getOrderSn()).append(",");
//        }
//        request.setOrderSns(orderSns.toString());
//
//        PddOrderStatusGetResponse response = client.syncInvoke(request, accessToken);
//
//        // 检查订单状态是否存在退款
//        if (response.getErrorResponse() != null) {
//            if (response.getErrorResponse().getErrorCode() == 10019) {
//                return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "token过期", shopId.toString());
//            } else {
//                return new ApiResult<>(EnumResultVo.Fail.getIndex(),
//                        "拼多多接口请求错误" + response.getErrorResponse().getErrorMsg());
//            }
//        }
//
//        for (var o : response.getOrderStatusGetResponse().getOrderStatusList()) {
//            if (o.getOrderStatus().intValue() != 1 || o.getRefundStatus().intValue() != 1) {
//                orderPddService.updPddOrderStatus(o.getOrderSn(), o.getOrderStatus(), o.getRefundStatus());
//                return new ApiResult<>(EnumResultVo.SystemException.getIndex(), orderSns.toString() + "订单状态已发货或已申请退款");
//            }
//        }
//
//        var checkRes = orderPddService.checkPrint(printOrders.getData());
//
//        if (checkRes.getCode() > 0)
//            return new ApiResult<>(checkRes.getCode(), checkRes.getMsg());
//        // 取电子面单号
//        var printRes = getPddPrint(printOrders.getData(), reqData.getString("company"));
//        if (!StringUtils.isEmpty(printRes.getJSONObject("error"))) {
//            printOrders.getData().forEach(o -> orderPddService.updPddOrderResult(o.getOrderId(),
//                    printRes.getJSONObject("error").getString("sub_msg"), 0, null));
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(),
//                    orderSns.toString() + printRes.getJSONObject("error").getString("sub_msg"));
//        }
//        String billCode = "";
//        String encryptedData = "";
//        String signature = "";
//        if (!StringUtils.isEmpty(printRes.getString("waybill_code"))) {
//            billCode = printRes.getString("waybill_code");
//            encryptedData = printRes.getString("encryptedData");
//            signature = printRes.getString("signature");
//            // 3.更新库存确认到仓库
//            for (var o : printOrders.getData()) {
//                var result = orderPddService.updPddOrderPrint(o,
//                        EnumPddPrintCompany.getName(reqData.getString("company")), billCode, encryptedData, signature);
//                log.info("拼多多订单：" + o.getOrderSn() + "物流：" + billCode + "结果：" + result.getMsg());
//            }
//        }
//        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "订单取号完成");
//    }
//
//    @RequestMapping(value = "/pdd_order_send", method = RequestMethod.POST)
//    public ApiResult<String> pdd_order_send(@RequestBody DataRow reqData) throws Exception {
//        String clientId = DataConfigObject.getInstance().getPddClientId();
//        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
//        var shop = shopService.getShop(reqData.getInt("shopId"));
//
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//
//        String accessToken = shop.getSessionKey();
//        // 获取店铺信息，判断店铺是否一致
//        var shopResult = PddApiUtils.getShopInfo(clientId, clientSecret, accessToken);
//        if (shopResult.getCode() != EnumResultVo.SUCCESS.getIndex())
//            return new ApiResult<>(shopResult.getCode(), shopResult.getMsg());
//
//        if (shopResult.getData().getMallId().longValue() != shop.getSellerUserId().longValue()) {
//            return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "该店铺不是授权店铺");
//        }
//
//        var orders = (ArrayList) reqData.getObject("orders");
//        if (orders.isEmpty())
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "请选择需要发货的订单");
//        for (var orderNo : orders) {
//            var order = orderPddService.getOrder((String) orderNo);
//            PddLogisticsOnlineSendRequest request = new PddLogisticsOnlineSendRequest();
//            request.setLogisticsId(orderPddService.getPddLogisticsCompanyId(order.getTracking_company()).longValue());// 快递公司编号
//            request.setOrderSn(order.getOrderSn());// 订单编号
//            request.setTrackingNumber(order.getTracking_number());// 快递公司单号
//            PddLogisticsOnlineSendResponse response = client.syncInvoke(request, accessToken);
//            if (!StringUtils.isEmpty(response.getErrorResponse())) {
//                orderPddService.updPddOrderResult(order.getId(), response.getErrorResponse().getErrorMsg(), 1, null);
//                continue;
//            }
//            if (response.getLogisticsOnlineSendResponse().getIsSuccess()) {
//                var result = orderPddService.orderSend(order);
//                log.info("PDD订单发货：" + result.getMsg());
//            }
//        }
//        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "成功");
//    }
//
//    /**
//     * 回收单号
//     *
//     * @param reqData
//     * @return
//     */
//    @RequestMapping(value = "/pdd_cancel_print", method = RequestMethod.POST)
//    public ApiResult<String> pdd_cancel_print(@RequestBody DataRow reqData) {
//        String clientId = DataConfigObject.getInstance().getPddClientId();
//        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//        // 固定使用东方概念旗舰店accessToken
//        var dfgnShop = shopService.getShop(18);
//        String accessToken = dfgnShop.getSessionKey();
//        var orders = orderPddService.getPrintOrderRepeat(reqData.getString("orderNo"));
//        try {
//            // 取消电子面单
//            PddWaybillCancelRequest request = new PddWaybillCancelRequest();
//            request.setWaybillCode(orders.get(0).getTrackingNumber());
//            request.setWpCode(EnumPddPrintCompany.getIndexByName(orders.get(0).getTrackingCompany()));
//            PddWaybillCancelResponse response = client.syncInvoke(request, accessToken);
//            String jsonStr = JsonUtil.transferToJson(response);
//            var res = JSONObject.parseObject(jsonStr);
//            if (!StringUtils.isEmpty(res.getJSONObject("error_response"))) {
//                return new ApiResult<>(EnumResultVo.ParamsError.getIndex(),
//                        res.getJSONObject("error_response").getString("sub_msg"));
//            }
//            if (!StringUtils.isEmpty(res.getJSONObject("pdd_waybill_cancel_response"))) {
//                if (res.getJSONObject("pdd_waybill_cancel_response").getBoolean("cancel_result")) {
//                    for (var order : orders) {
//                        orderPddService.cancelOrderPrint(order.getOrderId());
//                    }
//                    return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "成功");
//                } else
//                    return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "取消电子面单失败");
//            }
//        } catch (Exception e) {
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "系统异常");
//        }
//        return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "取消电子面单失败");
//
//    }
//


}
