package cn.qihangerp.open.wei.controller;

import cn.qihangerp.open.wei.OrderApiHelper;
import cn.qihangerp.open.wei.WeiPullRequest;
import cn.qihangerp.open.wei.common.ApiResultVo;
import cn.qihangerp.open.wei.model.Order;
import cn.qihangerp.open.wei.model.OrderDetailDeliverInfoAddress;
import com.alibaba.fastjson2.JSONObject;
import cn.qihangerp.common.common.AjaxResult;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.HttpStatus;
import cn.qihangerp.security.common.BaseController;

import cn.qihangerp.open.wei.domain.OmsWeiOrder;
import cn.qihangerp.open.wei.domain.OmsWeiOrderItem;
import cn.qihangerp.open.wei.service.OmsWeiOrderService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/wei/order")
@RestController
@AllArgsConstructor
public class WeiOrderApiController extends BaseController {
    private final WeiApiCommon apiCommon;
    private final OmsWeiOrderService weiOrderService;

    /**
     * 拉取订单
     * @param params
     * @return
     */
    @RequestMapping(value = "/pull_order", method = RequestMethod.POST)
    public AjaxResult pullList(@RequestBody WeiPullRequest params) {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }

        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != ResultVoEnum.SUCCESS.getIndex()) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }

        String accessToken = checkResult.getData().getAccessToken();
//        String appKey = checkResult.getData().getAppKey();
//        String appSecret = checkResult.getData().getAppSecret();
        LocalDateTime  endTime = LocalDateTime.now();
        LocalDateTime startTime = endTime.minusHours(1);
        ApiResultVo<Order> apiResultVo = OrderApiHelper.pullOrderList(startTime, endTime, accessToken);
        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数
        if(apiResultVo.getCode() == 0){
            if(apiResultVo.getList()!=null) {
                // 拉取到了数据 拉取详情
                for (var orderInfo : apiResultVo.getList()) {

                    OmsWeiOrder order = new OmsWeiOrder();
                    order.setOrderId(orderInfo.getOrder_id());
                    order.setShopId(params.getShopId());
                    order.setOpenid(orderInfo.getOpenid());
                    order.setCreateTime(orderInfo.getCreate_time());
                    order.setUpdateTime(orderInfo.getUpdate_time());
                    order.setUnionid(orderInfo.getUnionid());
                    order.setStatus(orderInfo.getStatus());
                    order.setAftersaleDetail(JSONObject.toJSONString(orderInfo.getAftersale_detail()));
                    order.setPayInfo(JSONObject.toJSONString(orderInfo.getOrder_detail().getPay_info()));
                    order.setProductPrice(orderInfo.getOrder_detail().getPrice_info().getInteger("product_price"));
                    order.setOrderPrice(orderInfo.getOrder_detail().getPrice_info().getInteger("order_price"));
                    order.setFreight(orderInfo.getOrder_detail().getPrice_info().getInteger("freight"));
                    order.setDiscountedPrice(orderInfo.getOrder_detail().getPrice_info().getInteger("discounted_price"));

                    OrderDetailDeliverInfoAddress addressInfo = orderInfo.getOrder_detail().getDelivery_info().getAddress_info();
                    order.setUserName(addressInfo.getUser_name());
                    order.setPostalCode(addressInfo.getPostal_code());
                    order.setProvinceName(addressInfo.getProvince_name());
                    order.setCityName(addressInfo.getCity_name());
                    order.setCountyName(addressInfo.getCounty_name());
                    order.setDetailInfo(addressInfo.getDetail_info());
                    order.setTelNumber(addressInfo.getTel_number());
                    order.setHouseNumber(addressInfo.getHouse_number());
                    order.setVirtualOrderTelNumber(addressInfo.getVirtual_order_tel_number());
                    order.setTelNumberExtInfo(JSONObject.toJSONString(addressInfo.getTel_number_ext_info()));
                    order.setUseTelNumber(addressInfo.getUse_tel_number());
                    order.setHashCode(addressInfo.getHash_code());

                    order.setDeliveryProductInfo(JSONObject.toJSONString(orderInfo.getOrder_detail().getDelivery_info().getDelivery_product_info()));

                    order.setShipDoneTime(orderInfo.getOrder_detail().getDelivery_info().getShip_done_time());
                    order.setEwaybillOrderCode(orderInfo.getOrder_detail().getDelivery_info().getEwaybill_order_code());

                    order.setSettleInfo(JSONObject.toJSONString(orderInfo.getOrder_detail().getSettle_info()));

                    List<OmsWeiOrderItem> itemList = new ArrayList<>();
                    for (var item:orderInfo.getOrder_detail().getProduct_infos()) {
                        OmsWeiOrderItem oi = new OmsWeiOrderItem();
                        oi.setOrderId(order.getOrderId());
                        oi.setShopId(params.getShopId());
                        oi.setProductId(item.getProduct_id());
                        oi.setSkuId(item.getSku_id());
                        oi.setThumbImg(item.getThumb_img());
                        oi.setSkuCnt(item.getSku_cnt());
                        oi.setSalePrice(item.getSale_price());
                        oi.setTitle(item.getTitle());
                        oi.setOnAftersaleSkuCnt(item.getOn_aftersale_sku_cnt());
                        oi.setFinishAftersaleSkuCnt(item.getFinish_aftersale_sku_cnt());
                        oi.setSkuCode(item.getSku_code());
                        oi.setMarketPrice(item.getMarket_price());
                        oi.setRealPrice(item.getReal_price());
                        oi.setOutProductId(item.getOut_product_id());
                        oi.setOutSkuId(item.getOut_sku_id());
                        oi.setIsDiscounted(item.getIs_discounted() + "");
                        oi.setEstimatePrice(item.getEstimate_price());
                        oi.setIsChangePrice(item.getIs_change_price() + "");
                        oi.setChangePrice(item.getChange_price());
                        oi.setOutWarehouseId(item.getOut_warehouse_id());
                        oi.setUseDeduction(item.getUse_deduction() + "");

                        oi.setSkuAttrs(JSONObject.toJSONString(item.getSku_attrs()));
                        oi.setSkuDeliverInfo(JSONObject.toJSONString(item.getSku_deliver_info()));
                        oi.setExtraService(JSONObject.toJSONString(item.getExtra_service()));
                        oi.setOrderProductCouponInfoList(JSONObject.toJSONString(item.getOrder_product_coupon_info_list()));
                        itemList.add(oi);
                    }
                    order.setItems(itemList);
                    var result = weiOrderService.saveOrder(params.getShopId(),order);
                    if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                        //已经存在
                        hasExistOrder++;
                    } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                        insertSuccess++;
                    } else {
                        totalError++;
                    }
                }
            }
        }

        return AjaxResult.success();
    }

    /**
     * 拉取订单详情
     * @param params
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/pull_order_detail", method = RequestMethod.POST)
    public AjaxResult pullDetail(@RequestBody WeiPullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        if (params.getOrderId()==null || params.getOrderId()==0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有订单编号");
        }


        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != ResultVoEnum.SUCCESS.getIndex()) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        ApiResultVo<Order> apiResultVo = OrderApiHelper.pullOrderDetail(params.getOrderId(), accessToken);
        if(apiResultVo.getCode() == 0) {
            if (apiResultVo.getData() != null) {

                OmsWeiOrder order = new OmsWeiOrder();
                order.setOrderId(apiResultVo.getData().getOrder_id());
                order.setShopId(params.getShopId());
                order.setOpenid(apiResultVo.getData().getOpenid());
                order.setCreateTime(apiResultVo.getData().getCreate_time());
                order.setUpdateTime(apiResultVo.getData().getUpdate_time());
                order.setUnionid(apiResultVo.getData().getUnionid());
                order.setStatus(apiResultVo.getData().getStatus());
                order.setAftersaleDetail(JSONObject.toJSONString(apiResultVo.getData().getAftersale_detail()));
                order.setPayInfo(JSONObject.toJSONString(apiResultVo.getData().getOrder_detail().getPay_info()));
                order.setProductPrice(apiResultVo.getData().getOrder_detail().getPrice_info().getInteger("product_price"));
                order.setOrderPrice(apiResultVo.getData().getOrder_detail().getPrice_info().getInteger("order_price"));
                order.setFreight(apiResultVo.getData().getOrder_detail().getPrice_info().getInteger("freight"));
                order.setDiscountedPrice(apiResultVo.getData().getOrder_detail().getPrice_info().getInteger("discounted_price"));

                OrderDetailDeliverInfoAddress addressInfo = apiResultVo.getData().getOrder_detail().getDelivery_info().getAddress_info();
                order.setUserName(addressInfo.getUser_name());
                order.setPostalCode(addressInfo.getPostal_code());
                order.setProvinceName(addressInfo.getProvince_name());
                order.setCityName(addressInfo.getCity_name());
                order.setCountyName(addressInfo.getCounty_name());
                order.setDetailInfo(addressInfo.getDetail_info());
                order.setTelNumber(addressInfo.getTel_number());
                order.setHouseNumber(addressInfo.getHouse_number());
                order.setVirtualOrderTelNumber(addressInfo.getVirtual_order_tel_number());
                order.setTelNumberExtInfo(JSONObject.toJSONString(addressInfo.getTel_number_ext_info()));
                order.setUseTelNumber(addressInfo.getUse_tel_number());
                order.setHashCode(addressInfo.getHash_code());

                order.setDeliveryProductInfo(JSONObject.toJSONString(apiResultVo.getData().getOrder_detail().getDelivery_info().getDelivery_product_info()));

                order.setShipDoneTime(apiResultVo.getData().getOrder_detail().getDelivery_info().getShip_done_time());
                order.setEwaybillOrderCode(apiResultVo.getData().getOrder_detail().getDelivery_info().getEwaybill_order_code());

                order.setSettleInfo(JSONObject.toJSONString(apiResultVo.getData().getOrder_detail().getSettle_info()));

                List<OmsWeiOrderItem> itemList = new ArrayList<>();
                for (var item : apiResultVo.getData().getOrder_detail().getProduct_infos()) {
                    OmsWeiOrderItem oi = new OmsWeiOrderItem();
                    oi.setOrderId(order.getOrderId());
                    oi.setShopId(params.getShopId());
                    oi.setProductId(item.getProduct_id());
                    oi.setSkuId(item.getSku_id());
                    oi.setThumbImg(item.getThumb_img());
                    oi.setSkuCnt(item.getSku_cnt());
                    oi.setSalePrice(item.getSale_price());
                    oi.setTitle(item.getTitle());
                    oi.setOnAftersaleSkuCnt(item.getOn_aftersale_sku_cnt());
                    oi.setFinishAftersaleSkuCnt(item.getFinish_aftersale_sku_cnt());
                    oi.setSkuCode(item.getSku_code());
                    oi.setMarketPrice(item.getMarket_price());
                    oi.setRealPrice(item.getReal_price());
                    oi.setOutProductId(item.getOut_product_id());
                    oi.setOutSkuId(item.getOut_sku_id());
                    oi.setIsDiscounted(item.getIs_discounted() + "");
                    oi.setEstimatePrice(item.getEstimate_price());
                    oi.setIsChangePrice(item.getIs_change_price() + "");
                    oi.setChangePrice(item.getChange_price());
                    oi.setOutWarehouseId(item.getOut_warehouse_id());
                    oi.setUseDeduction(item.getUse_deduction() + "");

                    oi.setSkuAttrs(JSONObject.toJSONString(item.getSku_attrs()));
                    oi.setSkuDeliverInfo(JSONObject.toJSONString(item.getSku_deliver_info()));
                    oi.setExtraService(JSONObject.toJSONString(item.getExtra_service()));
                    oi.setOrderProductCouponInfoList(JSONObject.toJSONString(item.getOrder_product_coupon_info_list()));
                    itemList.add(oi);
                }
                order.setItems(itemList);
                weiOrderService.saveOrder(params.getShopId(), order);

            }
        }



        return AjaxResult.success();
    }
}
