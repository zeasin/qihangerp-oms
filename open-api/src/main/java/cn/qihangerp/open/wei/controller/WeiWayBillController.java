package cn.qihangerp.open.wei.controller;

import cn.qihangerp.open.domain.ErpShipWaybill;
import cn.qihangerp.open.service.ErpShipWaybillService;
import cn.qihangerp.open.wei.EwaybillAccountApiHelper;
import cn.qihangerp.open.wei.EwaybillApiHelper;
import cn.qihangerp.open.wei.WeiPullRequest;
import cn.qihangerp.open.wei.bo.ewaybill.EcOrderInfo;
import cn.qihangerp.open.wei.bo.ewaybill.GoodsInfo;
import cn.qihangerp.open.wei.bo.ewaybill.SenderAddressBo;
import cn.qihangerp.open.wei.bo.ewaybill.WaybillRequest;
import cn.qihangerp.open.wei.common.ApiResultVo;
import cn.qihangerp.open.wei.vo.ewaybill.AccountVo;
import cn.qihangerp.open.wei.vo.ewaybill.EwaybillOrderCreateVo;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.HttpStatus;

import cn.qihangerp.open.wei.bo.WeiWaybillGetBo;

import cn.qihangerp.open.wei.domain.OmsWeiOrder;
import cn.qihangerp.open.wei.domain.OmsWeiWaybillAccount;

import cn.qihangerp.open.wei.service.OmsWeiOrderService;
import cn.qihangerp.open.wei.service.OmsWeiWaybillAccountService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Log
@RequestMapping("/wei/ewaybill")
@RestController
@AllArgsConstructor
public class WeiWayBillController {
    private final WeiApiCommon apiCommon;
    private final OmsWeiWaybillAccountService waybillAccountService;
    private final OmsWeiOrderService orderService;
    private final ErpShipWaybillService erpShipWaybillService;
    @RequestMapping(value = "/get_waybill_account_list", method = RequestMethod.POST)
    public AjaxResult getWaybillAccountList(@RequestBody WeiPullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        List<OmsWeiWaybillAccount> list = waybillAccountService.list(new LambdaQueryWrapper<OmsWeiWaybillAccount>().eq(OmsWeiWaybillAccount::getShopId, params.getShopId()).eq(OmsWeiWaybillAccount::getIsShow, 1));
        return AjaxResult.success(list);
    }

    @RequestMapping(value = "/pull_waybill_account", method = RequestMethod.POST)
    public AjaxResult pull_waybill_account(@RequestBody WeiPullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
//            return ApiResul new ApiResult(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        long startTime = System.currentTimeMillis();
        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != ResultVoEnum.SUCCESS.getIndex()) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String serverUrl = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();

//        ApiResultVo<DeliveryVo> apiResultVo = EwaybillApiHelper.getDeliveryList(appKey, appSecret, accessToken);
        ApiResultVo<AccountVo> apiResultVo = EwaybillAccountApiHelper.getAccountList(appKey, appSecret, accessToken);

        List<OmsWeiWaybillAccount> list  = new ArrayList<>();
        if(apiResultVo.getCode()==0){
            for (var item : apiResultVo.getList()) {

                OmsWeiWaybillAccount vo = new OmsWeiWaybillAccount();
                vo.setShopId(params.getShopId());
                vo.setSellerShopId(item.getShopId());
                vo.setIsShow(1);
                vo.setDeliveryId(item.getDeliveryId());
                vo.setCompanyType(item.getCompanyType());
                vo.setAcctId(item.getAcctId());
                vo.setAcctType(item.getAcctType());
                vo.setStatus(item.getStatus());
                vo.setAvailable(item.getAvailable());
                vo.setAllocated(item.getAllocated());
                vo.setCancel(item.getCancel());
                vo.setRecycled(item.getRecycled());
                vo.setMonthlyCard(item.getMonthlyCard());
                vo.setSiteInfo(JSONObject.toJSONString(item.getSiteInfo()));

                if (item.getSenderAddress()!=null) {
                    vo.setSenderAddress(item.getSenderAddress().getAddress());
                    vo.setSenderProvince(item.getSenderAddress().getProvince());
                    vo.setSenderCity(item.getSenderAddress().getCity());
                    vo.setSenderCounty(item.getSenderAddress().getCounty());
                }
                if(item.getSiteInfo()!=null){
                    vo.setSiteCode(item.getSiteInfo().getSiteCode());
                    vo.setSiteName(item.getSiteInfo().getSiteName());
                    vo.setSenderStreet(item.getSiteInfo().getAddress().getStreetName());
                }
                list.add(vo);
                waybillAccountService.save(vo);
                log.info("========添加wei电子面单账户信息==========");

            }
        }


        return AjaxResult.success(list);
//        return AjaxResult.success(apiResultVo.getList());
    }

    @PostMapping("/get_waybill_code")
    @ResponseBody
    public AjaxResult getWaybillCode(@RequestBody WeiWaybillGetBo req) {
        if (req.getAccountId() == null || req.getAccountId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，请选择电子面单账户");
        }
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        if (req.getIds() == null || req.getIds().length <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有选择订单");
        }
        var checkResult = apiCommon.checkBefore(req.getShopId());
        if (checkResult.getCode() != 0) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
//        Long sellerShopId = checkResult.getData().getSellerShopId();

        // 获取电子面单账户信息(包含了发货地址信息)
        OmsWeiWaybillAccount account = waybillAccountService.getById(req.getAccountId());

        WaybillRequest apiBo = new WaybillRequest();

        apiBo.setDelivery_id(account.getDeliveryId());
        apiBo.setEwaybill_acct_id(account.getAcctId());

        SenderAddressBo sender = new SenderAddressBo();
        sender.setName(account.getName());
        sender.setMobile(account.getMobile());
        sender.setProvince(account.getSenderProvince());
        sender.setCity(account.getSenderCity());
        sender.setCounty(account.getSenderCounty());
        sender.setStreet(account.getSenderStreet());
        sender.setAddress(account.getSenderAddress());
        apiBo.setSender(sender);

        for (String orderId : req.getIds()) {
            if (StringUtils.hasText(orderId)) {
                OmsWeiOrder order = orderService.queryDetailByOrderId(orderId);
                if (order != null) {

                    SenderAddressBo receiver = new SenderAddressBo();
                    receiver.setName(order.getUserName());
                    receiver.setMobile(order.getTelNumber());
                    receiver.setProvince(order.getProvinceName());
                    receiver.setCity(order.getCityName());
                    receiver.setCounty(order.getCountyName());
                    receiver.setStreet("");
                    receiver.setAddress("****");
                    apiBo.setReceiver(receiver);

                    List<EcOrderInfo> orderInfos = new ArrayList<>();
                    // 订单信息
                    EcOrderInfo orderInfo = new EcOrderInfo();
                    orderInfo.setEc_order_id(Long.parseLong(order.getOrderId()));

                    List<GoodsInfo> goodsInfos = new ArrayList<>();
                    if(order.getItems()!=null&&order.getItems().size()>0) {
                        for (var item:order.getItems()) {
                            GoodsInfo gi = new GoodsInfo();
                            gi.setProduct_id(Long.parseLong(item.getProductId()));
                            gi.setSku_id(Long.parseLong(item.getSkuId()));
                            gi.setGood_name(item.getTitle());
                            gi.setGood_count(item.getSkuCnt());
                            goodsInfos.add(gi);
                        }

                    }

                    orderInfo.setGoods_list(goodsInfos);
                    orderInfos.add(orderInfo);

                    apiBo.setEc_order_list(orderInfos);

                    apiBo.setShop_id(account.getSellerShopId());

                    ApiResultVo<EwaybillOrderCreateVo> apiResultVo = EwaybillApiHelper.getWaybillCode(appKey, appSecret, accessToken, apiBo);
                    if (apiResultVo.getCode() == 0) {
                        // 保持数据
                        ErpShipWaybill waybill = new ErpShipWaybill();
                        waybill.setShopId(req.getShopId());
                        waybill.setOrderId(order.getOrderId());
//                        waybill.setWaybillCode(apiResultVo.getData().getEwaybill_order_id());
                        waybill.setWaybillCode(apiResultVo.getData().getWaybill_id());
                        waybill.setLogisticsCode(account.getDeliveryId());
                        waybill.setPrintData(apiResultVo.getData().getPrint_info());
                        waybill.setStatus(1);//1已取号
                        erpShipWaybillService.waybillUpdate(waybill);
                        log.info("====保存wei電子面單信息========" + order.getOrderId());

                    } else {
                        return AjaxResult.error(apiResultVo.getMsg());
                    }
                }
            }
        }
        return AjaxResult.success();
    }

    @PostMapping("/get_print_data")
    @ResponseBody
    public AjaxResult getPrintData(@RequestBody WeiWaybillGetBo req) {
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        if (req.getIds() == null || req.getIds().length <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有选择订单");
        }
        List<ErpShipWaybill> listByOrderIds = erpShipWaybillService.getListByOrderIds(req.getShopId(), req.getIds());
        return AjaxResult.success(listByOrderIds);
    }

    @PostMapping("/push_print_success")
    @ResponseBody
    public AjaxResult pushPrintSuccess(@RequestBody WeiWaybillGetBo req) {
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        if (req.getIds() == null || req.getIds().length <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有选择订单");
        }
        erpShipWaybillService.printSuccess(req.getShopId(), req.getIds());

        return AjaxResult.success();
    }

    /**
     * 发货
     * @param req
     * @return
     */
    @PostMapping("/push_ship_send")
    @ResponseBody
    public AjaxResult pushShipSend(@RequestBody WeiWaybillGetBo req) {
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        if (req.getIds() == null || req.getIds().length <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有选择订单");
        }
        erpShipWaybillService.pushShipSend(req.getShopId(), req.getIds());

        return AjaxResult.success();
    }
}
