package com.qihang.tao.controller;

import com.qihang.common.common.ApiResult;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.HttpStatus;
import com.qihang.tao.api.ApiCommon;
//import com.qihang.tao.api.ApiResult;
import com.qihang.tao.api.OrderApiHelper;
import com.qihang.tao.common.TaoRequest;
import com.qihang.tao.domain.TaoOrder;
import com.qihang.tao.service.TaoOrderService;
import com.taobao.api.ApiException;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

/**
 * 淘系订单更新
 */
@AllArgsConstructor
@RestController
@RequestMapping("/order")
public class OrderApiController {
    private static Logger log = LoggerFactory.getLogger(OrderApiController.class);

    private final TaoOrderService orderService;
    private final ApiCommon apiCommon;


    /**
     * 增量更新订单
     * @param req
     * @return
     * @throws ApiException
     */
    @GetMapping("/pull_order_tao")
    @ResponseBody
    public ApiResult<Object> pullIncrementOrder(TaoRequest req) throws ApiException {
        log.info("/**************增量拉取tao订单****************/");
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return ApiResult.build(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        var checkResult = apiCommon.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return ApiResult.build(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }
        String sessionKey = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getApiRequestUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();

        log.info("/**************增量更新tao订单，条件判断完成，开始更新。。。。。。****************/");
        Long pageSize = 10l;
        Long pageIndex = 1l;

        //第一次获取
        ApiResult<TaoOrder> upResult = OrderApiHelper.pullIncrementOrder(pageIndex, pageSize, url, appKey, appSecret, sessionKey);

        if (upResult.getCode() != 0) {
            log.info("/**************主动更新tao订单：第一次获取结果失败：" + upResult.getMsg() + "****************/");
            if(upResult.getCode() == HttpStatus.UNAUTHORIZED){
                return ApiResult.build(HttpStatus.UNAUTHORIZED, "Token已过期，请重新授权",checkResult.getData());
            }
            return ApiResult.build(HttpStatus.SYSTEM_EXCEPTION, upResult.getMsg());
        }

        log.info("/**************主动更新tao订单：第一次获取结果：总记录数" + upResult.getTotalRecords() + "****************/");
        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数

        //循环插入订单数据到数据库
        for (var order : upResult.getList()) {
            //插入订单数据
            var result = orderService.saveOrder(req.getShopId(), order);
            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                //已经存在
                log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "存在、更新****************/");
                hasExistOrder++;
            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "不存在、新增****************/");
                insertSuccess++;
            } else {
                log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "报错****************/");
                totalError++;
            }
        }

        String msg = "成功，总共找到：" + upResult.getTotalRecords() + "条订单，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        log.info("/**************主动更新tao订单：END：" + msg + "****************/");
        return ApiResult.build(HttpStatus.SUCCESS, msg);
    }

    /**
     * 拉取天猫订单（所有）
     *
     * @param req
     * @return
     * @throws ApiException
     */
    @GetMapping("/pull_order_tao_all")
    @ResponseBody
    public ApiResult<Object> orderPull(TaoRequest req) throws ApiException {
        log.info("/**************主动更新tao订单****************/");
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return ApiResult.build(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        var checkResult = apiCommon.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return ApiResult.build(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }
        String sessionKey = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getApiRequestUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();

//        var shop = shopService.getShop(req.getShopId());
//        if (shop == null) return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，没有找到店铺");
//        else if (shop.getType().intValue() != EnumShopType.Tmall.getIndex())
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，店铺不是淘系店铺");
//        else if (StringUtils.isEmpty(shop.getSessionKey()))
//            return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "Token已过期，请重新授权");
//
//        String sessionKey = shop.getSessionKey();
//
//        var thirdConfig = thirdSettingService.getEntity(shop.getType());
//        if (thirdConfig == null) return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "系统错误，没有找到第三方平台的配置信息");
//        else if (StringUtils.isEmpty(thirdConfig.getAppKey())) return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "系统错误，第三方平台配置信息不完整，缺少appkey");
//        else if (StringUtils.isEmpty(thirdConfig.getAppSecret())) return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "系统错误，第三方平台配置信息不完整，缺少appSecret");
//        else if (StringUtils.isEmpty(thirdConfig.getRequest_url())) return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "系统错误，第三方平台配置信息不完整，缺少request_url");
//
//
//        String url = thirdConfig.getRequest_url();
//        String appkey = thirdConfig.getAppKey();
//        String secret = thirdConfig.getAppSecret();
//
//        /****************先查询卖家对不对***************/
//        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
//        UserSellerGetRequest reqSeller = new UserSellerGetRequest();
//        reqSeller.setFields("nick,user_id");
//        UserSellerGetResponse rsp = client.execute(reqSeller, sessionKey);
////        System.out.println(rsp.getBody());
//        if (shop.getSellerUserId().longValue() != rsp.getUser().getUserId().longValue()) {
//            return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "当前用户是：" + rsp.getUser().getNick() + "，请重新授权");
//        }

        log.info("/**************主动更新tao订单，条件判断完成，开始更新。。。。。。****************/");
        Long pageSize = 50l;
        Long pageIndex = 1l;

        //第一次获取
        ApiResult<TaoOrder> upResult = OrderApiHelper.pullOrder(pageIndex, pageSize, url, appKey, appSecret, sessionKey);

        if (upResult.getCode() != 0) {
            log.info("/**************主动更新tao订单：第一次获取结果失败：" + upResult.getMsg() + "****************/");
            if(upResult.getCode() == HttpStatus.UNAUTHORIZED){
                return ApiResult.build(HttpStatus.UNAUTHORIZED, "Token已过期，请重新授权",checkResult.getData());
            }
            return ApiResult.build(HttpStatus.SYSTEM_EXCEPTION, upResult.getMsg());
        }

        log.info("/**************主动更新tao订单：第一次获取结果：总记录数" + upResult.getTotalRecords() + "****************/");
        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数

        //循环插入订单数据到数据库
        for (var order : upResult.getList()) {

            //插入订单数据
            var result = orderService.saveOrder(req.getShopId(), order);
            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                //已经存在
                log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "存在、更新****************/");
                hasExistOrder++;
            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "不存在、新增****************/");
                insertSuccess++;
            } else {
                log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "报错****************/");
                totalError++;
            }
        }

        //计算总页数
        int totalPage = (upResult.getTotalRecords() % pageSize == 0) ? upResult.getTotalRecords() / pageSize.intValue() : (upResult.getTotalRecords() / pageSize.intValue()) + 1;
        pageIndex++;

        while (pageIndex <= totalPage) {

            ApiResult<TaoOrder> upResult1 = OrderApiHelper.pullOrder(pageIndex, pageSize, url, appKey, appSecret, sessionKey);
            //循环插入订单数据到数据库
            for (var order : upResult1.getList()) {
                //插入订单数据
                var result = orderService.saveOrder(req.getShopId(), order);
                if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                    //已经存在
                    log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "存在、更新****************/");
                    hasExistOrder++;
                } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                    log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "不存在、新增****************/");
                    insertSuccess++;
                } else {
                    log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "报错****************/");
                    totalError++;
                }
            }
            pageIndex++;
        }
        String msg = "成功，总共找到：" + upResult.getTotalRecords() + "条订单，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        log.info("/**************主动更新tao订单：END：" + msg + "****************/");
        return ApiResult.build(HttpStatus.SUCCESS, msg);

    }

    /**
     * 更新单个订单
     *
     * @param taoRequest
     * @param model
     * @param request
     * @return
     * @throws ApiException
     */
//    @RequestMapping("/order/pull_order_by_num")
//    @ResponseBody
//    public com.qihang.tao.common.ApiResult<String> getOrderPullByNum(@RequestBody TaoRequest taoRequest) throws ApiException {
//        log.info("/**************主动更新tao订单by number****************/");
//        if (taoRequest.getShopId() == null || taoRequest.getShopId() <= 0) {
//            return new com.qihang.tao.common.ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，没有店铺Id");
//        }
//        if (taoRequest.getOrderId() == null || taoRequest.getOrderId() <= 0) {
//            return new com.qihang.tao.common.ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，缺少orderId");
//        }
//
//        Integer shopId = taoRequest.getShopId();
//        var checkResult = this.checkBefore(shopId);
//
//        if (checkResult.getCode() != HttpStatus.SUCCESS) {
//            return new com.qihang.tao.common.ApiResult<>(checkResult.getCode(), checkResult.getMsg());
//        }
//
//        String sessionKey = checkResult.getData().getAccessToken();
//        String url = checkResult.getData().getApiRequestUrl();
//        String appKey = checkResult.getData().getAppKey();
//        String appSecret = checkResult.getData().getAppSecret();
//
//        TaobaoClient client = new DefaultTaobaoClient(url, appKey, appSecret);
//
//        TradeFullinfoGetRequest req = new TradeFullinfoGetRequest();
////        req.setFields("tid,type,status,payment,orders,promotion_details,post_fee");
//        req.setFields("tid,post_fee,receiver_name,receiver_state,receiver_city,receiver_district,receiver_address,receiver_mobile,receiver_phone,received_payment,num," +
//                "type,status,payment,orders,rx_audit_status,sellerMemo,pay_time,created,buyer_nick");
//        req.setTid(taoRequest.getOrderId());
//        TradeFullinfoGetResponse rsp = client.execute(req, sessionKey);
//        System.out.println(rsp.getBody());
//
//        var trade = rsp.getTrade();
//        if (trade == null) {
//            //没有找到退款单
//            log.info("/**************主动更新tao订单：END： 没有找到退单****************/");
//            return new com.qihang.tao.common.ApiResult<>(EnumResultVo.DataError.getIndex(), "没有找到退单" + taoRequest.getOrderId());
//        }
//
//        //TODO:开始更新
//        TaoOrder order = new TaoOrder();
//        order.setId(trade.getTid().toString());
//        order.setOrderCreateTime(trade.getCreated());
//        order.setOrderModifyTime(trade.getModified());
//        order.setPayTime(trade.getPayTime());
//        order.setTotalAmount(BigDecimal.valueOf(Double.parseDouble(trade.getPayment())));
//        order.setShippingFee(BigDecimal.valueOf(Double.parseDouble(trade.getPostFee())));
//        order.setPayAmount(BigDecimal.valueOf(Double.parseDouble(trade.getPayment())));
//        order.setBuyerName(trade.getBuyerNick());
//        order.setSellerMemo(trade.getSellerMemo());
//        order.setProvince(trade.getReceiverState());
//        order.setCity(trade.getReceiverCity());
//        order.setDistrict(trade.getReceiverDistrict());
//        order.setStatus(EnumTmallOrderStatus.getStatus(trade.getStatus()));
//        order.setStatusStr(trade.getStatus());
//        List<TaoOrderItem> items = new ArrayList<>();
//        for (var item : trade.getOrders()) {
//            TaoOrderItem orderItem = new TaoOrderItem();
//            orderItem.setSpecNumber(item.getOuterSkuId());
//            orderItem.setGoodsNumber(item.getOuterIid());
//            orderItem.setProductImgUrl(item.getPicPath());
//            orderItem.setGoodsTitle(item.getTitle());
//            orderItem.setPrice(BigDecimal.valueOf(Double.parseDouble(item.getPrice())));
//            orderItem.setQuantity(item.getNum());
//            orderItem.setSubItemId(item.getOid().toString());
//            orderItem.setSkuInfo(item.getSkuPropertiesName());
//            orderItem.setItemAmount(BigDecimal.valueOf(Double.parseDouble(item.getPayment())));
//            orderItem.setDiscountFee(new BigDecimal(item.getDiscountFee()));
//            orderItem.setAdjustFee(new BigDecimal(item.getAdjustFee()));
//
//            orderItem.setRefundStatusStr(item.getRefundStatus());
//            items.add(orderItem);
//        }
//        order.setTaoOrderItemList(items);
//
//        var result = orderService.updateTmallOrderForOpenTaobao(taoRequest.getShopId(), order);
//        if (result.getCode() == EnumResultVo.DataExist.getIndex()) {
//            //已经存在
//            log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "存在、更新****************/");
//        } else if (result.getCode() == EnumResultVo.SUCCESS.getIndex()) {
//            log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "不存在、新增****************/");
//        } else {
//            log.info("/**************主动更新tao订单：开始更新数据库：" + order.getId() + "报错****************/");
//        }
//        String msg = "";
//
//        log.info("/**************主动更新tao订单：END：" + msg + "****************/");
//        return new com.qihang.tao.common.ApiResult<>(EnumResultVo.SUCCESS.getIndex(), msg);
//    }




}
