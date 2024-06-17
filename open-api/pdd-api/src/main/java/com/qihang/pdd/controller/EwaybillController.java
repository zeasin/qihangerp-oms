package com.qihang.pdd.controller;


import cn.qihangerp.open.pdd.WaybillAccountApiHelper;
import cn.qihangerp.open.pdd.common.ApiResultVo;
import cn.qihangerp.open.pdd.model.WaybillAccount;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.enums.HttpStatus;
import com.qihang.pdd.domain.OmsPddWaybillAccount;
import com.qihang.pdd.openapi.ApiCommon;
import com.qihang.pdd.openapi.PullRequest;
import com.qihang.pdd.service.ErpShipWaybillService;
import com.qihang.pdd.service.OmsPddWaybillAccountService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Log
@AllArgsConstructor
@RestController
@RequestMapping("/ewaybill")
public class EwaybillController extends BaseController {
    private final ApiCommon apiCommon;
    private final OmsPddWaybillAccountService waybillAccountService;
//    private final OmsTaoOrderService orderService;
    private final ErpShipWaybillService erpShipWaybillService;

    @GetMapping(value = "/get_waybill_account_list")
    public AjaxResult getWaybillAccountList(@RequestParam Long shopId) throws Exception {
//        if (params.getShopId() == null || params.getShopId() <= 0) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
//        }
        List<OmsPddWaybillAccount> list = waybillAccountService.list(
                new LambdaQueryWrapper<OmsPddWaybillAccount>().eq(OmsPddWaybillAccount::getShopId, shopId)
                        .eq(OmsPddWaybillAccount::getIsShow, 1));
        return AjaxResult.success(list);
    }

        /**
         * 拉取电子面单账号
         * @param params
         * @return
         * @throws Exception
         */
    @RequestMapping(value = "/pull_waybill_account", method = RequestMethod.POST)
    public AjaxResult pullWaybillAccount(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }

        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
        Long sellId = checkResult.getData().getSellerShopId();

        ApiResultVo<WaybillAccount> apiResultVo = WaybillAccountApiHelper.pullWaybillBranchAccountList(appKey, appSecret, accessToken);
        List<OmsPddWaybillAccount> list  = new ArrayList<>();
        if(apiResultVo.getCode()==0){
            for (var item : apiResultVo.getList()){
                for(var acc:item.getBranchAccountCols()){
                    OmsPddWaybillAccount vo = new OmsPddWaybillAccount();
                    vo.setShopId(params.getShopId());
                    vo.setSellerId(sellId);
                    vo.setIsShow(1);
                    vo.setCpCode(item.getWpCode());
                    vo.setCpType(item.getWpType());
                    vo.setAllocatedQuantity(acc.getAllocatedQuantity());
                    vo.setBranchCode(acc.getBranchCode());
                    vo.setBranchName(acc.getBranchName());
                    vo.setCancelQuantity(acc.getCancelQuantity());
//                    vo.setPrintQuantity(acc.getPrintQuantity());
                    vo.setQuantity(acc.getQuantity());
                    if(acc.getShippAddressCols().size()>0) {
                        vo.setAddressDetail(acc.getShippAddressCols().get(0).getDetail());
                        vo.setArea(acc.getShippAddressCols().get(0).getDistrict());
                        vo.setCity(acc.getShippAddressCols().get(0).getCity());
                        vo.setProvince(acc.getShippAddressCols().get(0).getProvince());
//                        vo.setWaybillAddressId(acc.getShippAddressCols().get(0).getWaybillAddressId().longValue());
                        list.add(vo);
                    }

                    waybillAccountService.save(vo);
                    log.info("========添加pdd电子面单账户信息==========");
                }
            }
        }


        return AjaxResult.success(list);
    }

//    @PostMapping("/get_waybill_code")
//    @ResponseBody
//    public AjaxResult getWaybillCode(@RequestBody TaoWaybillGetBo req) {
//        if (req.getAccountId() == null || req.getAccountId() <= 0) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，请选择电子面单账户");
//        }
//        if (req.getShopId() == null || req.getShopId() <= 0) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
//        }
//        if(req.getIds()==null || req.getIds().length<=0) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有选择订单");
//        }
//        var checkResult = apiCommon.checkBefore(req.getShopId());
//        if (checkResult.getCode() != HttpStatus.SUCCESS) {
//            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
//        }
//        String accessToken = checkResult.getData().getAccessToken();
//        String appKey = checkResult.getData().getAppKey();
//        String appSecret = checkResult.getData().getAppSecret();
//        Long sellerShopId = checkResult.getData().getSellerShopId();
//
//        // 获取电子面单账户信息(包含了发货地址信息)
//        OmsTaoWaybillAccount account = waybillAccountService.getById(req.getAccountId());
//
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
//                erpShipWaybillService.waybillUpdate(waybill);
//                log.info("====保存電子面單信息========"+result.getObjectId());
//            }
//        }else{
//            return AjaxResult.error(apiResultVo.getMsg());
//        }
//
//        return success();
//    }
//
//    @PostMapping("/get_print_data")
//    @ResponseBody
//    public AjaxResult getPrintData(@RequestBody TaoWaybillGetBo req) {
//        if (req.getShopId() == null || req.getShopId() <= 0) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
//        }
//        if (req.getIds() == null || req.getIds().length <= 0) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有选择订单");
//        }
//        List<ErpShipWaybill> listByOrderIds = erpShipWaybillService.getListByOrderIds(req.getShopId(), req.getIds());
//        return AjaxResult.success(listByOrderIds);
//    }
//
//    @PostMapping("/push_print_success")
//    @ResponseBody
//    public AjaxResult pushPrintSuccess(@RequestBody TaoWaybillGetBo req) {
//        if (req.getShopId() == null || req.getShopId() <= 0) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
//        }
//        if (req.getIds() == null || req.getIds().length <= 0) {
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有选择订单");
//        }
//        erpShipWaybillService.printSuccess(req.getShopId(), req.getIds());
//        return AjaxResult.success();
//    }
}
