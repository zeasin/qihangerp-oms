package com.qihang.wei.controller;

import cn.qihangerp.open.wei.EwaybillApiHelper;
import cn.qihangerp.open.wei.common.ApiResultVo;
import cn.qihangerp.open.wei.vo.ewaybill.AccountVo;
import cn.qihangerp.open.wei.vo.ewaybill.DeliveryVo;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.HttpStatus;
import com.qihang.wei.bo.PullRequest;

import com.qihang.wei.bo.WeiWaybillGetBo;
import com.qihang.wei.domain.OmsWeiWaybillAccount;
import com.qihang.wei.service.OmsWeiWaybillAccountService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Log
@RequestMapping("/ewaybill")
@RestController
@AllArgsConstructor
public class WayBillController {
    private final WeiApiCommon apiCommon;
    private final OmsWeiWaybillAccountService waybillAccountService;
    @RequestMapping(value = "/get_waybill_account_list", method = RequestMethod.POST)
    public AjaxResult getWaybillAccountList(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        List<OmsWeiWaybillAccount> list = waybillAccountService.list(new LambdaQueryWrapper<OmsWeiWaybillAccount>().eq(OmsWeiWaybillAccount::getShopId, params.getShopId()).eq(OmsWeiWaybillAccount::getIsShow, 1));
        return AjaxResult.success(list);
    }

    @RequestMapping(value = "/pull_waybill_account", method = RequestMethod.POST)
    public AjaxResult pull_waybill_account(@RequestBody PullRequest params) throws Exception {
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
        ApiResultVo<AccountVo> apiResultVo = EwaybillApiHelper.getAccountList(appKey, appSecret, accessToken);

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
        if(req.getIds()==null || req.getIds().length<=0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有选择订单");
        }
        var checkResult = apiCommon.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
//        Long sellerShopId = checkResult.getData().getSellerShopId();

        // 获取电子面单账户信息(包含了发货地址信息)
        OmsWeiWaybillAccount account = waybillAccountService.getById(req.getAccountId());

//        WaybillCloudPrintApplyNewRequest request = new WaybillCloudPrintApplyNewRequest();
//        request.setCp_code(account.getCpCode());
//
//        WaybillCloudPrintApplyNewRequestSender sender = new WaybillCloudPrintApplyNewRequestSender();
//        sender.setName(account.getName());
//        sender.setMobile(account.getMobile());
//        WaybillCloudPrintApplyNewRequestSender.AddressDTO addressDTO = new WaybillCloudPrintApplyNewRequestSender.AddressDTO();
//        addressDTO.setCity(account.getCity());
//        addressDTO.setProvince(account.getProvince());
//        addressDTO.setDistrict(account.getArea());
//        addressDTO.setTown("");
//        addressDTO.setDetail(account.getAddressDetail());
//        sender.setAddress(addressDTO);
//        request.setSender(sender);
//
//        // 组合取号的订单信息trade_order_info_dtos
//        List<WaybillCloudPrintApplyNewRequestTradeOrderInfoDto> orderList = new ArrayList<>();
//
//        for(String orderId:req.getIds()){
//            if(StringUtils.hasText(orderId)){
//                OmsTaoOrder omsTaoOrder = orderService.queryDetailByTid(orderId);
//                if(omsTaoOrder!=null) {
//                    WaybillCloudPrintApplyNewRequestTradeOrderInfoDto dto = new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto();
//                    dto.setObjectId(omsTaoOrder.getTid());
//                    dto.setTemplateUrl("http://cloudprint.cainiao.com/template/standard/101");
//                    dto.setUserId(sellerShopId.intValue());
//
//                    WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.OrderInfoDTO orderInfoDTO = new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.OrderInfoDTO();
//                    orderInfoDTO.setOrderChannelsType("TB");
//                    orderInfoDTO.setTradeOrderList(omsTaoOrder.getTid());
//                    dto.setOrderInfo(orderInfoDTO);
//
//                    WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.PackageInfoDTO packageInfoDTO = new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.PackageInfoDTO();
//                    List<WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.PackageInfoDTO.ItemsDTO> items = new ArrayList<>();
//                    for (var orderItem : omsTaoOrder.getItems()) {
//                        WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.PackageInfoDTO.ItemsDTO itemsDTO = new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.PackageInfoDTO.ItemsDTO();
//                        itemsDTO.setCount(orderItem.getNum());
//                        itemsDTO.setName(orderItem.getTitle());
//                        items.add(itemsDTO);
//                    }
//                    packageInfoDTO.setItems(items);
//                    dto.setPackageInfo(packageInfoDTO);
//
//                    WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.RecipientDTO recipientDTO = new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.RecipientDTO();
//                    WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.RecipientDTO.AddressDTO addressDTO1 = new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.RecipientDTO.AddressDTO();
//                    addressDTO1.setCity(omsTaoOrder.getReceiverCity());
//                    addressDTO1.setTown(omsTaoOrder.getReceiverTown());
//                    addressDTO1.setProvince(omsTaoOrder.getReceiverState());
//                    addressDTO1.setDistrict(omsTaoOrder.getReceiverDistrict());
//                    addressDTO1.setDetail(omsTaoOrder.getReceiverAddress());
//                    recipientDTO.setAddress(addressDTO1);
//                    recipientDTO.setName(omsTaoOrder.getReceiverName());
//                    recipientDTO.setOaid(omsTaoOrder.getOaid());
//                    recipientDTO.setTid(omsTaoOrder.getTid());
//                    dto.setRecipient(recipientDTO);
//                    orderList.add(dto);
//                }
//            }
//        }
//
//        request.setTrade_order_info_dtos(orderList);
//
//        ApiResultVo<WaybillCloudPrint> apiResultVo = WaybillApiHelper.waybillCloudPrintApplyNew(appKey, appSecret, accessToken, request);
//        if(apiResultVo.getCode()==0){
//            // 保持数据
//            for(var result: apiResultVo.getList()){
//                ErpShipWaybill waybill = new ErpShipWaybill();
//                waybill.setShopId(req.getShopId());
//                waybill.setOrderId(result.getObjectId());
//                waybill.setWaybillCode(result.getWaybillCode());
//                waybill.setLogisticsCode(result.getCpCode());
//                waybill.setPrintData(result.getPrintData());
//                waybill.setStatus(1);//1已取号
//                erpShipWaybillService.waybillUpdate(waybill);
//                log.info("====保存電子面單信息========"+result.getObjectId());
//            }
//        }else{
//            return AjaxResult.error(apiResultVo.getMsg());
//        }

        return AjaxResult.success();
    }
}
