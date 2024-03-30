package com.qihang.pdd.controller;//package com.qihang.erp.api.controller.pdd;
//
//import com.alibaba.fastjson.JSON;
//import com.b2c.common.api.ApiResult;
//import com.b2c.common.api.ApiResultEnum;
//import com.b2c.common.utils.DateUtil;
//import com.b2c.common.utils.JsonUtil;
//import com.b2c.entity.DataRow;
//import com.b2c.entity.enums.EnumPddLogistics;
//import com.b2c.entity.erp.ErpPullOrderLogEntity;
//import com.b2c.entity.erp.vo.ErpSalesPullCountResp;
//import com.b2c.entity.pdd.OrderPddEntity;
//import com.b2c.entity.pdd.OrderPddItemEntity;
//import com.b2c.entity.pdd.RefundPddEntity;
//import com.b2c.entity.result.EnumResultVo;
//import com.b2c.oms.DataConfigObject;
//import com.b2c.service.ShopService;
//import com.b2c.service.erp.ErpSalesOrderService;
//import com.b2c.service.oms.OrderPddRefundService;
//import com.b2c.service.oms.OrderPddService;
//import com.b2c.service.oms.SysThirdSettingService;
//import com.pdd.pop.sdk.http.PopClient;
//import com.pdd.pop.sdk.http.PopHttpClient;
//import com.pdd.pop.sdk.http.api.pop.request.PddOrderInformationGetRequest;
//import com.pdd.pop.sdk.http.api.pop.request.PddRefundInformationGetRequest;
//import com.pdd.pop.sdk.http.api.pop.request.PddRefundListIncrementGetRequest;
//import com.pdd.pop.sdk.http.api.pop.response.PddOrderInformationGetResponse;
//import com.pdd.pop.sdk.http.api.pop.response.PddRefundInformationGetResponse;
//import com.pdd.pop.sdk.http.api.pop.response.PddRefundListIncrementGetResponse;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.util.StringUtils;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.ArrayList;
//import java.util.List;
//
//@RequestMapping("/ajax_pdd")
//@RestController
//public class AjaxRefundPddController {
//    private static Logger log = LoggerFactory.getLogger(AjaxRefundPddController.class);
//
//    @Autowired
//    private SysThirdSettingService thirdSettingService;
//    @Autowired
//    private OrderPddService orderPddService;
//    @Autowired
//    private ErpSalesOrderService salesOrderService;
//
//    @Autowired
//    private OrderPddRefundService refundService;
//
//    @Autowired
//    private ShopService shopService;
//    /**
//     * pdd退货订单更新
//     * @param model
//     * @param req
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/pull_refund")
//    public ApiResult<ErpSalesPullCountResp> getOrderList(Model model,@RequestBody DataRow data, HttpServletRequest req) throws Exception {
//        String startDate = data.getString("startTime");
//        String endDate = data.getString("endTime");
//        Integer shopId = data.getInt("shopId");//拼多多shopId
//
//        String clientId = DataConfigObject.getInstance().getPddClientId();
//        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
//
//       var shop = shopService.getShop(shopId);
//
//        ErpSalesPullCountResp resp=new ErpSalesPullCountResp();//返回结果
//
//        // var settingEntity = thirdSettingService.getEntity(shop.getType());
//
//
//
//        Long startTime = 0L;
//        Long endTime = System.currentTimeMillis() / 1000;
//        if(StringUtils.isEmpty(startDate)) {
//            //没有选择开始日期
//            ErpPullOrderLogEntity pullOrderLog = null;//salesOrderService.getErpOrderPullLogByShopId(shopId, 1);
//            if (pullOrderLog != null) {
//                startTime = pullOrderLog.getEndTime() - 60 * 10;
////                endTime = startTime + 60 * 30;
////                if (endTime > System.currentTimeMillis() / 1000) {
////                    //如果结束时间大于当前时间，那么将开始时间和结算时间改成当前24小时内
////                    endTime = System.currentTimeMillis() / 1000;
////                    startTime = endTime - 60 * 60 * 24;
////                }
//            }else{
//                startTime = endTime - 60 * 60 * 24;//(24小时前)
//                // return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "请选择开始拉取时间");
//            }
//        }else {
//            //选择了开始日期,从开始时间直接循环更新到结束时间
////            startTime  = DateUtil.dateToStamp(startDate).longValue();
//            startTime  = DateUtil.dateTimeToStamp(startDate).longValue();
//
//            if(StringUtils.isEmpty(endDate)) endTime =  System.currentTimeMillis() / 1000;
//            else
//                endTime = DateUtil.dateTimeToStamp(endDate).longValue();
////                endTime = DateUtil.dateTimeToStamp(endDate+" 23:59:00").longValue();
////        startTime = 1587966628L;endTime = startTime + 60 * 30;
//        }
//
//        /****************循环更新，直到结束,30分钟一次****************/
//
//        long kaishidaojiesu = endTime - startTime;
//        long forSize = (kaishidaojiesu % 1800 == 0)?kaishidaojiesu / 1800 : kaishidaojiesu / 1800 +1;//计算需要循环的次数
//        log.info("开始循环更新拼多多退货。开始时间："+DateUtil.unixTimeStampToDate(startTime)+"结束时间："+DateUtil.unixTimeStampToDate(endTime)+"总共循环"+forSize);
//        int updCount = 0;
//        int insertCount = 0;
//        int failCount = 0;
//
//        //开始循环更新
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//        for(int i=0;i<forSize;i++) {
//            Long startTime1 = startTime + i*1800;
//            Long endTime1 = startTime1 +1800;
//
//            PddRefundListIncrementGetRequest request = new PddRefundListIncrementGetRequest();
//            request.setAfterSalesStatus(1);
//            request.setAfterSalesType(1);
//            request.setStartUpdatedAt(startTime1);//1586239200L
//            request.setEndUpdatedAt(endTime1);//1586241000L
//            request.setPage(1);
//            request.setPageSize(100);
//
//            PddRefundListIncrementGetResponse response = client.syncInvoke(request, shop.getSessionKey());
//
//            if (response.getErrorResponse() != null) {
//                if (response.getErrorResponse().getErrorCode().intValue() == 10019) {
//                    log.info("更新失败，Token过期");
//                    //token过期
//                    return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "Token过期");
//                } else {
//                    log.info("更新失败："+response.getErrorResponse().getErrorMsg());
//                    return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "接口调用失败：" + response.getErrorResponse().getErrorMsg());
//                }
//            } else {
//                //获取到了数据
//                if (response.getRefundIncrementGetResponse().getTotalCount() == 0) {
//                    //return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "获取到0条数据");
//                } else {
//                    //开始处理订单数据
//                    for (var item : response.getRefundIncrementGetResponse().getRefundList()) {
//
//                        RefundPddEntity entity = new RefundPddEntity();
//                        entity.setAfter_sale_reason(item.getAfterSaleReason());
//                        entity.setAfter_sales_status(item.getAfterSalesStatus());
//                        entity.setAfter_sales_type(item.getAfterSalesType());
//                        entity.setConfirm_time(DateUtil.strToLongGo(item.getConfirmTime()));
//                        entity.setCreated_time(DateUtil.strToLongGo(item.getCreatedTime()));
//                        entity.setDiscount_amount(Double.parseDouble(item.getDiscountAmount()));
//                        entity.setGoods_id(0);
//                        entity.setGoods_number(item.getOuterGoodsId());
//                        entity.setSkuNumber(item.getOuterId());
//                        entity.setGoods_image(item.getGoodImage());
//                        entity.setGoods_name(item.getGoodsName());
//                        entity.setGoods_price(Double.parseDouble(item.getGoodsPrice()));
//                        entity.setSkuInfo("");
//                        entity.setId(item.getId());
//                        entity.setOrder_amount(Double.parseDouble(item.getOrderAmount()));
//                        entity.setOrder_sn(item.getOrderSn());
//                        entity.setQuantity(Integer.parseInt(item.getGoodsNumber()));
//                        entity.setRefund_amount(Double.parseDouble(item.getRefundAmount()));
//                        entity.setShopId(shopId);
//                        entity.setTracking_number(item.getTrackingNumber());
//                        entity.setUpdated_time(item.getUpdatedTime());
//                        var result = orderPddService.editRefundPddOrder(entity);
//                        log.info("开始处理退货单{refundId:"+item.getId()+",status:"+item.getAfterSalesStatus()+"}，处理结果："+result.getMsg());
//                        if (result.getCode() == EnumResultVo.DataExist.getIndex()) {
//                            updCount++;//修改
//                        } else if (result.getCode() == EnumResultVo.SUCCESS.getIndex()) {
//                            insertCount++;
//                        } else {
//                            failCount++;
//                        }
//                    }
//                }
//
//            }
//
//        }
//        resp.setStartTime(DateUtil.unixTimeStampToDate(startTime));
//        resp.setEndTime(DateUtil.unixTimeStampToDate(endTime));
//        resp.setAddCount(insertCount);
//        resp.setFailCount(failCount);
//        resp.setUpdCount(updCount);
//        salesOrderService.addErpSalesPullOrderLog(startTime, endTime, shopId, insertCount, failCount, updCount, 1);
//        log.info("退货订单处理完成。"+ JsonUtil.objToString(resp));
//        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "SUCCESS",resp);
//    }
//
//    /**
//     * 更新退款订单
//     * @param model
//     * @param data
//     * @param req
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/upd_refund_by_id")
//    public ApiResult<ErpSalesPullCountResp> updRefundById(Model model, @RequestBody DataRow data, HttpServletRequest req) throws Exception {
//        Long refId = data.getLong("id");
//        if (refId == null || refId <= 0) {
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，缺少id");
//        }
//        Integer shopId = data.getInt("shopId");
//        if (shopId == null || shopId <= 0) {
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，缺少shopId");
//        }
//
//        var refund = refundService.getEntityById(refId);
//        if(refund == null)  return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，不存在refund");
//
//        log.info("/***********开始更新拼多多退货"+refId+"***********/");
//
//        String clientId = DataConfigObject.getInstance().getPddClientId();
//        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
////        Integer shopId = 5;//拼多多shopId
//        var shop = shopService.getShop(shopId);
//
////        ErpSalesPullCountResp resp=new ErpSalesPullCountResp();//返回结果
//
//        var settingEntity = thirdSettingService.getEntity(shop.getType());
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//
//        PddRefundInformationGetRequest request = new PddRefundInformationGetRequest();
//        request.setAfterSalesId(refId);
//        request.setOrderSn(refund.getOrder_sn());
//        PddRefundInformationGetResponse response = client.syncInvoke(request, shop.getSessionKey());
//
//        if (response.getErrorResponse() != null) {
//            if (response.getErrorResponse().getErrorCode().intValue() == 10019) {
//                //token过期
//                return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "Token过期");
//            } else {
//                return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "接口调用失败：" + response.getErrorResponse().getErrorMsg());
//            }
//        }else {
//
//            //获取到了数据
//            RefundPddEntity entity = new RefundPddEntity();
//            entity.setAfter_sale_reason(response.getAfterSalesReason());
//            entity.setAfter_sales_status(response.getAfterSalesStatus());
//            entity.setAfter_sales_type(response.getAfterSalesType());
//            entity.setId(response.getId());
//            entity.setRefund_amount(Double.parseDouble((response.getRefundAmount() / 100)+""));
//            entity.setShippingStatus(response.getShippingStatus());
//            entity.setTracking_number(response.getExpressNo());
//            entity.setTracking_company(response.getShippingName());
//            entity.setDescribe(response.getRemark());
//
//            var result = orderPddService.updRefundPddOrder(entity);
//        }
//        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "SUCCESS");
////
////        PddRefundListIncrementGetRequest request = new PddRefundListIncrementGetRequest();
////        request.setAfterSalesStatus(1);
////        request.setAfterSalesType(1);
////
////        Long startTime=0L;
////        Long endTime=System.currentTimeMillis() / 1000;
////        var pullOrderLog=salesOrderService.getErpOrderPullLogByShopId(shopId,1);
////        if(pullOrderLog!=null){
////            startTime=pullOrderLog.getEndTime() - 60 * 10;
////            endTime = startTime + 60 * 30;
////        }else startTime=endTime-60 * 29;
////
////        startTime = 1587966628L;
////        endTime = startTime + 60 * 30;
////
////        request.setStartUpdatedAt(startTime);//1586239200L
////        request.setEndUpdatedAt(endTime);//1586241000L
////
////        request.setPage(1);
////        request.setPageSize(100);
////
////        PddRefundListIncrementGetResponse response = client.syncInvoke(request, settingEntity.getAccess_token());
////
////        int updCount = 0;
////        int insertCount = 0;
////        int failCount=0;
////
////        if (response.getErrorResponse() != null) {
////            if (response.getErrorResponse().getErrorCode().intValue() == 10019) {
////                //token过期
////                return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "Token过期");
////            } else {
////                return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "接口调用失败：" + response.getErrorResponse().getErrorMsg());
////            }
////        } else {
////            //获取到了数据
////            if (response.getRefundIncrementGetResponse().getTotalCount() == 0) {
////                //return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "获取到0条数据");
////            } else {
////                //开始处理订单数据
////                for (var item : response.getRefundIncrementGetResponse().getRefundList()) {
////                    RefundPddEntity entity = new RefundPddEntity();
////                    entity.setAfter_sale_reason(item.getAfterSaleReason());
////                    entity.setAfter_sales_status(item.getAfterSalesStatus());
////                    entity.setAfter_sales_type(item.getAfterSalesType());
////                    entity.setConfirm_time(DateUtil.strToLongGo(item.getConfirmTime()));
////                    entity.setCreated_time(DateUtil.strToLongGo(item.getCreatedTime()));
////                    entity.setDiscount_amount(Double.parseDouble(item.getDiscountAmount()));
////                    entity.setGoods_id(0);
////                    entity.setGoods_number(item.getOuterGoodsId());
////                    entity.setSkuNumber(item.getOuterId());
////                    entity.setGoods_image(item.getGoodImage());
////                    entity.setGoods_name(item.getGoodsName());
////                    entity.setGoods_price(Double.parseDouble(item.getGoodsPrice()));
////                    entity.setSkuInfo("");
////                    entity.setId(item.getId());
////                    entity.setOrder_amount(Double.parseDouble(item.getOrderAmount()));
////                    entity.setOrder_sn(item.getOrderSn());
////                    entity.setQuantity(Integer.parseInt(item.getGoodsNumber()));
////                    entity.setRefund_amount(Double.parseDouble(item.getRefundAmount()));
////                    entity.setShopId(shopId);
////                    entity.setTracking_number(item.getTrackingNumber());
////                    entity.setUpdated_time(item.getUpdatedTime());
////                    var result =  orderPddService.editRefundPddOrder(entity);
////                    if (result.getCode() == EnumResultVo.DataExist.getIndex()){
////                        updCount++;//修改
////                    } else if (result.getCode() == EnumResultVo.SUCCESS.getIndex()){
////                        insertCount ++;
////                    }else{
////                        failCount++;
////                    }
////                }
////            }
////            resp.setStartTime(DateUtil.unixTimeStampToDate(startTime));
////            resp.setEndTime(DateUtil.unixTimeStampToDate(endTime));
////            resp.setAddCount(insertCount);
////            resp.setFailCount(failCount);
////            resp.setUpdCount(updCount);
////
////            salesOrderService.addErpSalesPullOrderLog(startTime,endTime,shopId,insertCount,failCount,updCount,1);
////        }
////
////        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "SUCCESS",resp);
//    }
//
//
//    /**
//     * 批量更新未处理的退货订单
//     * @param model
//     * @param data
//     * @param req
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/upd_refund_by_audit")
//    public ApiResult<ErpSalesPullCountResp> updRefundByAudit(Model model, @RequestBody DataRow data, HttpServletRequest req) throws Exception {
//        Integer shopId = data.getInt("shopId");
//        if (shopId == null || shopId <= 0) {
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，缺少shopId");
//        }
//        var refundList = refundService.getList(1, 20000, null, null, null,0,shopId,3,null,null,null);
//
//
//        log.info("/***********开始更新拼多多退货，总共"+refundList.getTotalSize()+"条***********/");
//
//        String clientId = DataConfigObject.getInstance().getPddClientId();
//        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
////        Integer shopId = 5;//拼多多shopId
//        var shop = shopService.getShop(shopId);
//
////        ErpSalesPullCountResp resp=new ErpSalesPullCountResp();//返回结果
//
//        var settingEntity = thirdSettingService.getEntity(shop.getType());
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//        int total=0;
//        for (var refund:refundList.getList()) {
//            total++;
//            PddRefundInformationGetRequest request = new PddRefundInformationGetRequest();
//            request.setAfterSalesId(refund.getId());
//            request.setOrderSn(refund.getOrder_sn());
//            PddRefundInformationGetResponse response = client.syncInvoke(request,shop.getSessionKey());
//
//            if (response.getErrorResponse() != null) {
//                if (response.getErrorResponse().getErrorCode().intValue() == 10019) {
//                    //token过期
//                    return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "Token过期");
//                } else {
//                    return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "接口调用失败：" + response.getErrorResponse().getErrorMsg());
//                }
//            }else {
//                log.info("更新退货订单"+refund.getId()+",订单号"+refund.getOrder_sn()+"状态"+response.getAfterSalesStatus());
//                //获取到了数据
//                RefundPddEntity entity = new RefundPddEntity();
//                entity.setAfter_sale_reason(response.getAfterSalesReason());
//                entity.setAfter_sales_status(response.getAfterSalesStatus());
//                entity.setAfter_sales_type(response.getAfterSalesType());
//                entity.setId(response.getId());
//                entity.setRefund_amount(Double.parseDouble((response.getRefundAmount() / 100)+""));
//                entity.setShippingStatus(response.getShippingStatus());
//                entity.setTracking_number(response.getExpressNo());
//                entity.setTracking_company(response.getShippingName());
//                entity.setDescribe(response.getRemark());
//
//                var result = orderPddService.updRefundPddOrder(entity);
//            }
//        }
//
//        log.info("更新退货订单完成，总共更新"+total);
//        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "更新退货订单完成，总共更新"+total);
//    }
//
//
//
//
//
//    /**
//     * 确认到仓库
//     *
//     * @param req
//     * @return
//     */
//    @RequestMapping(value = "/confirm_refund", method = RequestMethod.POST)
//    public ApiResult<String> reviewRefund(@RequestBody DataRow data, HttpServletRequest req) throws Exception {
//        Long refId = data.getLong("id");
//        if(refId == null || refId<=0){
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，缺少id");
//        }
////        if (StringUtils.isEmpty(data.getString("companyCode")))
////            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "请选择快递公司");
////        if (StringUtils.isEmpty(data.getString("code")))
////            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "请输入快递单号");
//
//        var detail = refundService.getEntityById(refId);
//        if(detail == null) return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "退货不存在");
//        if(detail.getAfter_sales_type().intValue()!=3 && detail.getAuditStatus().intValue()!=0) return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "已经处理过了");
//        if(StringUtils.isEmpty(detail.getTracking_number())) return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "还没有物流信息，请更新退货订单");
//
//        var result = refundService.confirmRefund(refId);
///*        if(result.getMsg().equals("订单不存在")){
//            DataRow reqData=new DataRow();
//            reqData.set("shopId",detail.getShopId());
//            reqData.set("orderSn",detail.getOrder_sn());
//            var results = upd_pdd_order_by_num_(reqData);
//            return new ApiResult<>(results.getCode(),results.getMsg().equals("更新成功") ? "订单拉取成功,请重新确认" : "订单拉取失败原因："+results.getMsg());
//        }*/
//        return new ApiResult<>(result.getCode(), result.getMsg());
////        return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "未实现");
//    }
//
//    /**
//     * 订单拦截
//     * @param data
//     * @param req
//     * @return
//     */
//    @RequestMapping(value = "/order_intercept", method = RequestMethod.POST)
//    public ApiResult<String> orderIntercept(@RequestBody DataRow data, HttpServletRequest req) throws Exception {
//        String orderSn = data.getString("orderSn");
//        if(StringUtils.isEmpty(orderSn)){
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，缺少orderSn");
//        }
//        Integer shopId = data.getInt("shopId");
//        if(shopId == null || shopId<=0){
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，缺少shopId");
//        }
//
//
//        RefundPddEntity refund = refundService.getEntityByOrderSn(orderSn);
//        if(refund==null){
//            //本地库没有退货单，去拼多多接口拉取
//            log.info("/***********开始拉取拼多多退货，"+orderSn+"***********/");
//            String clientId = DataConfigObject.getInstance().getPddClientId();
//            String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
//            var shop = shopService.getShop(shopId);
//            var settingEntity = thirdSettingService.getEntity(shop.getType());
//            PopClient client = new PopHttpClient(clientId, clientSecret);
//
////            PddRefundInformationGetRequest request = new PddRefundInformationGetRequest();
////            request.setOrderSn(orderSn);
////            PddRefundInformationGetResponse response = client.syncInvoke(request, settingEntity.getAccess_token());
//            PddRefundListIncrementGetRequest request = new PddRefundListIncrementGetRequest();
//            request.setAfterSalesStatus(1);
//            request.setAfterSalesType(1);
//            request.setStartUpdatedAt(1586239200L);//1586239200L
//            request.setEndUpdatedAt(1586241000L);//1586241000L
//            request.setPage(1);
//            request.setPageSize(100);
//            request.setOrderSn(orderSn);
//
//            PddRefundListIncrementGetResponse response = client.syncInvoke(request,shop.getSessionKey());
//
//            if (response.getErrorResponse() != null) {
//                if (response.getErrorResponse().getErrorCode().intValue() == 10019) {
//                    //token过期
//                    return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "Token过期");
//                }
//                else {
//                    return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "接口调用失败：" + response.getErrorResponse().getErrorMsg());
//                }
//            }else {
//                log.info("从拼多多拉取到退货订单，开始处理退货订单");
//                if(response.getRefundIncrementGetResponse().getTotalCount() > 0) {
//                    for (var item : response.getRefundIncrementGetResponse().getRefundList()) {
//                        RefundPddEntity entity = new RefundPddEntity();
//                        entity.setAfter_sale_reason(item.getAfterSaleReason());
//                        entity.setAfter_sales_status(item.getAfterSalesStatus());
//                        entity.setAfter_sales_type(item.getAfterSalesType());
//                        entity.setConfirm_time(DateUtil.strToLongGo(item.getConfirmTime()));
//                        entity.setCreated_time(DateUtil.strToLongGo(item.getCreatedTime()));
//                        entity.setDiscount_amount(Double.parseDouble(item.getDiscountAmount()));
//                        entity.setGoods_id(0);
//                        entity.setGoods_number(item.getOuterGoodsId());
//                        entity.setSkuNumber(item.getOuterId());
//                        entity.setGoods_image(item.getGoodImage());
//                        entity.setGoods_name(item.getGoodsName());
//                        entity.setGoods_price(Double.parseDouble(item.getGoodsPrice()));
//                        entity.setSkuInfo("");
//                        entity.setId(item.getId());
//                        entity.setOrder_amount(Double.parseDouble(item.getOrderAmount()));
//                        entity.setOrder_sn(item.getOrderSn());
//                        entity.setQuantity(Integer.parseInt(item.getGoodsNumber()));
//                        entity.setRefund_amount(Double.parseDouble(item.getRefundAmount()));
//                        entity.setShopId(shopId);
//                        entity.setTracking_number(item.getTrackingNumber());
//                        entity.setUpdated_time(item.getUpdatedTime());
//
//                        refund = new RefundPddEntity();
//                        refund.setId(entity.getId());
//                        orderPddService.editRefundPddOrder(entity);
//                    }
//                }else{
//                    var order = orderPddService.getOrder(orderSn);
//                    var goods = order.getItems().get(0);
//                    Long refundId = refundService.getRefundIdMin() - 1;
//                    RefundPddEntity entity = new RefundPddEntity();
//                    entity.setAfter_sale_reason("订单拦截");
//                    entity.setAfter_sales_status(3);
//                    entity.setAfter_sales_type(9);
//                    entity.setConfirm_time(0l);
//                    entity.setCreated_time(System.currentTimeMillis() / 1000);
//                    entity.setDiscount_amount(0.0);
//                    entity.setGoods_id(0);
//                    entity.setGoods_number(goods.getGoodsNum());
//                    entity.setSkuNumber(goods.getGoodsSpecNum());
//                    entity.setGoods_image(goods.getGoodsImg());
//                    entity.setGoods_name(goods.getGoodsName());
//                    entity.setGoods_price(goods.getGoodsPrice());
//                    entity.setSkuInfo(goods.getGoodsSpec());
//                    entity.setId(refundId);
//                    entity.setOrder_amount(order.getPay_amount());
//                    entity.setOrder_sn(orderSn);
//                    entity.setQuantity(goods.getQuantity());
//                    entity.setRefund_amount(order.getPay_amount());
//                    entity.setShopId(shopId);
//                    entity.setTracking_number(order.getTracking_number());
//                    entity.setUpdated_time("");
//                    refund = new RefundPddEntity();
//                    refund.setId(entity.getId());
//                    orderPddService.editRefundPddOrder(entity);
//                }
//
//            }
//        }
//
//        //更新快递信息到退货数据中
//        var result = orderPddService.interceptOrder(orderSn,refund.getId());
//        log.info("拦截订单，结果："+ JSON.toJSONString(result));
//        if(result.getCode() == EnumResultVo.SUCCESS.getIndex()){
//            //拦截成功，开始推送到仓库
//            var result1 = refundService.confirmRefund(result.getData());
//            log.info("拦截成功，推送到仓库。推送结果："+ JSON.toJSONString(result1));
//            return new ApiResult<>(result1.getCode(), result1.getMsg());
//        }
//
//        return new ApiResult<>(ApiResultEnum.SystemException, "系统异常");
//    }
//    /**
//     * 标记已处理
//     *
//     * @param req
//     * @return
//     */
//    @RequestMapping(value = "/sign_refund", method = RequestMethod.POST)
//    public ApiResult<String> signRefund(@RequestBody DataRow data, HttpServletRequest req) {
//        Long refId = data.getLong("id");
//        if(refId == null || refId<=0){
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，缺少id");
//        }
//
////        if (StringUtils.isEmpty(data.getString("companyCode")))
////            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "请选择快递公司");
////        if (StringUtils.isEmpty(data.getString("code")))
////            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "请输入快递单号");
//
////        var detail = refundService.getEntityById(refId);
////        if(detail == null) return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "退货不存在");
////        if(detail.getAfter_sales_type().intValue()!=3 && detail.getAuditStatus().intValue()!=0) return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "已经处理过了");
////        if(StringUtils.isEmpty(detail.getTracking_number())) return new ApiResult<>(EnumResultVo.SystemException.getIndex(), "还没有物流信息，请更新退货订单");
//
////        var result = refundService.confirmRefund(refId);
////        return new ApiResult<>(result.getCode(), result.getAuditStatustMsg());
//        refundService.signRefund(refId);
//        return new ApiResult<>(ApiResultEnum.SUCCESS, "SUCCESS");
//    }
//
//    @RequestMapping(value = "/refund_apply_pdd_submit", method = RequestMethod.POST)
//    public ApiResult<Integer> addOrderCancel(HttpServletRequest request) {
///*            String logisticsCompany="";
//            if(!StringUtils.isEmpty(request.getParameter("logisticsCompany"))){
//                logisticsCompany=request.getParameter("logisticsCompany");
//            }
//            String logisticsCode="";
//            if(!StringUtils.isEmpty(request.getParameter("logisticsCode"))){
//                logisticsCode=request.getParameter("logisticsCode");
//            }
//            Long orderId = Long.parseLong(request.getParameter("order_id"));
//            ErpSalesOrderRefundReq applyVo=new ErpSalesOrderRefundReq();
//            applyVo.setOrderId(orderId);
//            applyVo.setLogisticsCompany(logisticsCompany);
//            applyVo.setLogisticsCode(logisticsCode);
//            List<ErpSalesOrderItemEntity>  itemVoList = new ArrayList<>();
//
//            String[] idDataArr = request.getParameterValues("item[]");
//            String[] nums = request.getParameterValues("count[]");
//            //循环查找选中的item
//            for (int i = 0; i < idDataArr.length; i++) {
//                String[] idData = idDataArr[i].split(":");
//                ErpSalesOrderItemEntity itemVo = new ErpSalesOrderItemEntity();
//                itemVo.setId(Long.parseLong(idData[1]));
//                itemVo.setRefundCount(Integer.parseInt(nums[Integer.parseInt(idData[0])]));
//                itemVoList.add(itemVo);
//            }
//            applyVo.setItems(itemVoList);
//
//            var result= refundService.addPddOrderRefund(applyVo);
//            return new ApiResult<>(result.getCode(), result.getMsg());*/
//
//         return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "功能暂时禁用");
//
//    }
//    @RequestMapping(value = "/upd_pdd_order_by_num", method = RequestMethod.POST)
//    public ApiResult<String> upd_pdd_order_by_num(@RequestBody DataRow data, HttpServletRequest req) throws Exception{
//        if(StringUtils.isEmpty(data.get("orderSn")))return new ApiResult<>(ApiResultEnum.ParamsError,"订单号不能为空");
//        var result = upd_pdd_order_by_num_(data);
//        return new ApiResult<>(result.getCode(), result.getMsg());
//
//    }
//
//    public ApiResult<String> upd_pdd_order_by_num_(DataRow data) throws Exception{
//        var shop = shopService.getShop(data.getInt("shopId"));
//        String clientId = DataConfigObject.getInstance().getPddClientId();
//        String clientSecret = DataConfigObject.getInstance().getPddClientSecret();
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//        PddOrderInformationGetRequest pddOrderRequest=new PddOrderInformationGetRequest();
//        pddOrderRequest.setOrderSn(data.getString("orderSn").trim());
//        PddOrderInformationGetResponse pddOrderResponse = client.syncInvoke(pddOrderRequest,shop.getSessionKey());
//        if(!StringUtils.isEmpty(pddOrderResponse.getErrorResponse())){
//            return new ApiResult<>(ApiResultEnum.Fail, pddOrderResponse.getErrorResponse().getErrorMsg());
//        }
//        var item = pddOrderResponse.getOrderInfoGetResponse().getOrderInfo();
//        String company=StringUtils.isEmpty(item.getLogisticsId()) ? "" : EnumPddLogistics.getName(item.getLogisticsId().intValue());
//        OrderPddEntity pddEntity = new OrderPddEntity();
//        pddEntity.setOrder_status(item.getOrderStatus());
//        pddEntity.setOrderSn(item.getOrderSn().trim());
//        pddEntity.setShipping_time(item.getShippingTime());
//        pddEntity.setTracking_company(company);
//        pddEntity.setTracking_number(item.getTrackingNumber());
//        pddEntity.setProvince(item.getProvince());
//        pddEntity.setCity(item.getCity());
//        pddEntity.setTown(item.getTown());
//        pddEntity.setShopId(shop.getId());
//
//        pddEntity.setAddress(item.getAddress());
//        pddEntity.setAfter_sales_status(item.getAfterSalesStatus());
//        pddEntity.setBuyer_memo(item.getBuyerMemo());
//        pddEntity.setCapital_free_discount(item.getCapitalFreeDiscount());
//        pddEntity.setConfirm_status(item.getConfirmStatus());
//        pddEntity.setConfirm_time(item.getConfirmTime());
//        pddEntity.setCountry(item.getCountry());
//        pddEntity.setCreated_time(item.getCreatedTime());
//        pddEntity.setDiscount_amount(item.getDiscountAmount());
//        pddEntity.setFree_sf(item.getFreeSf());
//        pddEntity.setGoods_amount(item.getGoodsAmount());
//        pddEntity.setGroup_status(item.getGroupStatus());
//        pddEntity.setIs_lucky_flag(item.getIsLuckyFlag());
//        pddEntity.setPay_amount(item.getPayAmount());
//        pddEntity.setPay_no(item.getPayNo());
//        pddEntity.setPay_time(item.getPayTime());
//        pddEntity.setPay_type(item.getPayType());
//        pddEntity.setPlatform_discount(item.getPlatformDiscount());
//        pddEntity.setPostage(item.getPostage());
//        pddEntity.setReceive_time(item.getReceiveTime());
//        pddEntity.setReceiver_name(item.getReceiverName());
//        pddEntity.setReceiver_phone(item.getReceiverPhone());
//        pddEntity.setRefund_status(item.getRefundStatus());
//        pddEntity.setRemark(item.getRemark());
//        pddEntity.setSeller_discount(item.getSellerDiscount());
//        pddEntity.setTradeType(item.getTradeType());
//        pddEntity.setUpdated_at(item.getUpdatedAt());
//        pddEntity.setOrderConfirmTime(DateUtil.strToLongGo(item.getConfirmTime()));
//        pddEntity.setExcelLogId(0);
//
//
//        List<OrderPddItemEntity> items = new ArrayList<>();
//        for (var it: item.getItemList()) {
//            OrderPddItemEntity pddItem = new OrderPddItemEntity();
//            pddItem.setGoodsImg(it.getGoodsImg());
//            pddItem.setGoodsName(it.getGoodsName());
//            pddItem.setGoodsNum(it.getOuterGoodsId());
//            pddItem.setGoodsPrice(it.getGoodsPrice());
//            pddItem.setGoodsSpec(it.getGoodsSpec());
//            pddItem.setGoodsSpecNum(it.getOuterId());
//            pddItem.setQuantity(it.getGoodsCount());
//            items.add(pddItem);
//        }
//        pddEntity.setItems(items);
//        //开始写入数据库
//        orderPddService.insertOrder(pddEntity,data.getInt("shopId"));
//
//        PddRefundListIncrementGetRequest request = new PddRefundListIncrementGetRequest();
//        request.setAfterSalesStatus(1);
//        request.setAfterSalesType(1);
//        request.setStartUpdatedAt(1586239200L);//
//        request.setEndUpdatedAt(1586241000L);//
//        request.setPage(1);
//        request.setPageSize(100);
//        request.setOrderSn(data.getString("orderSn"));
//
//        PddRefundListIncrementGetResponse response = client.syncInvoke(request, shop.getSessionKey());
//
//        if(!StringUtils.isEmpty(response.getErrorResponse())){
//            return new ApiResult<>(ApiResultEnum.Fail, response.getErrorResponse().getErrorMsg());
//        }
//        //开始处理订单数据
//        var ritem = response.getRefundIncrementGetResponse().getRefundList().get(0);
//        RefundPddEntity entity = new RefundPddEntity();
//        entity.setAfter_sale_reason(ritem.getAfterSaleReason());
//        entity.setAfter_sales_status(ritem.getAfterSalesStatus());
//        entity.setAfter_sales_type(ritem.getAfterSalesType());
//        entity.setConfirm_time(DateUtil.strToLongGo(ritem.getConfirmTime()));
//        entity.setCreated_time(DateUtil.strToLongGo(ritem.getCreatedTime()));
//        entity.setDiscount_amount(Double.parseDouble(ritem.getDiscountAmount()));
//        entity.setGoods_id(0);
//        entity.setGoods_number(ritem.getOuterGoodsId());
//        entity.setSkuNumber(ritem.getOuterId());
//        entity.setGoods_image(ritem.getGoodImage());
//        entity.setGoods_name(ritem.getGoodsName());
//        entity.setGoods_price(Double.parseDouble(ritem.getGoodsPrice()));
//        entity.setSkuInfo("");
//        entity.setId(ritem.getId());
//        entity.setOrder_amount(Double.parseDouble(ritem.getOrderAmount()));
//        entity.setOrder_sn(ritem.getOrderSn());
//        entity.setQuantity(Integer.parseInt(ritem.getGoodsNumber()));
//        entity.setRefund_amount(Double.parseDouble(ritem.getRefundAmount()));
//        entity.setShopId(shop.getId());
//        entity.setTracking_number(ritem.getTrackingNumber());
//        entity.setUpdated_time(ritem.getUpdatedTime());
//        entity.setAuditStatus(0);
//        var result = orderPddService.editRefundPddOrder(entity);
//        return new ApiResult<>(result.getCode(), result.getMsg());
//    }
//}
