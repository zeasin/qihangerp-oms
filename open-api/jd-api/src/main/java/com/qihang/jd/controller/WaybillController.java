package com.qihang.jd.controller;


import cn.qihangerp.open.jd.WaybillAccountApiHelper;
import cn.qihangerp.open.jd.WaybillApiHelper;
import cn.qihangerp.open.jd.common.ApiResultVo;
import cn.qihangerp.open.jd.jdl.CloudPrintApiHelper;
import cn.qihangerp.open.jd.jdl.CloudPrintData;
import cn.qihangerp.open.jd.jdl.PullCloudPrintRequestDto;
import cn.qihangerp.open.jd.jdl.WayBillInfo;
import cn.qihangerp.open.jd.model.WaybillAccount;
import cn.qihangerp.open.jd.model.WaybillCodeResponse;
import cn.qihangerp.open.jd.request.WaybillAddress;
import cn.qihangerp.open.jd.request.WaybillReceiveRequest;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.enums.HttpStatus;
import com.qihang.jd.domain.ErpShipWaybill;
import com.qihang.jd.domain.OmsJdOrder;
import com.qihang.jd.domain.OmsJdWaybillAccount;
import com.qihang.jd.domain.bo.JdWaybillGetBo;
import com.qihang.jd.openApi.ApiCommon;
import com.qihang.jd.openApi.PullRequest;
import com.qihang.jd.service.ErpShipWaybillService;
import com.qihang.jd.service.OmsJdOrderService;
import com.qihang.jd.service.OmsJdWaybillAccountService;
import com.qihang.security.common.BaseController;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@Log
@AllArgsConstructor
@RestController
@RequestMapping("/ewaybill")
public class WaybillController extends BaseController {
    private final ApiCommon apiCommon;
    private final OmsJdWaybillAccountService waybillAccountService;
    private final OmsJdOrderService orderService;
    private final ErpShipWaybillService erpShipWaybillService;
    private final KafkaTemplate<String,Object> kafkaTemplate;

    @RequestMapping(value = "/get_waybill_account_list", method = RequestMethod.POST)
    public AjaxResult getWaybillAccountList(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        List<OmsJdWaybillAccount> list = waybillAccountService.list(new LambdaQueryWrapper<OmsJdWaybillAccount>().eq(OmsJdWaybillAccount::getShopId, params.getShopId()).eq(OmsJdWaybillAccount::getIsShow, 1));
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

        ApiResultVo<WaybillAccount> apiResultVo = WaybillAccountApiHelper.getWaybillAccount(appKey, appSecret, accessToken, sellId.toString());

        List<OmsJdWaybillAccount> list  = new ArrayList<>();
        if(apiResultVo.getCode()==0){
            for (var item : apiResultVo.getList()) {

                OmsJdWaybillAccount vo = new OmsJdWaybillAccount();
                vo.setShopId(params.getShopId());
                vo.setSellerId(sellId);
                vo.setIsShow(1);

                vo.setProviderId(item.getProviderId());
                vo.setProviderType(item.getProviderType());
                vo.setProviderName(item.getProviderName());
                vo.setProviderCode(item.getProviderCode());
                vo.setBranchCode(item.getBranchCode());
                vo.setBranchName(item.getBranchName());
                vo.setAmount(item.getAmount());
//                vo.setSupportCod();
                vo.setSettlementCode(item.getSettlementCode());
                if (item.getAddress()!=null) {
                    vo.setProvinceId(item.getAddress().getProvinceId());
                    vo.setProvinceName(item.getAddress().getProvinceName());
                    vo.setCityId(item.getAddress().getCityId());
                    vo.setCityName(item.getAddress().getCityName());
                    vo.setCountryId(item.getAddress().getCountryId());
                    vo.setCountryName(item.getAddress().getCountryName());
                    vo.setCountrysideId(item.getAddress().getCountrysideId());
                    vo.setCountrysideName(item.getAddress().getCountrysideName());
                    vo.setAddress(item.getAddress().getAddress());
                    list.add(vo);
                }

                waybillAccountService.save(vo);
                log.info("========添加jd电子面单账户信息==========");

            }
        }


        return AjaxResult.success(list);
    }

    @PostMapping("/get_waybill_code")
    @ResponseBody
    public AjaxResult getWaybillCode(@RequestBody JdWaybillGetBo req) {
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
        Long sellerShopId = checkResult.getData().getSellerShopId();

        // 获取电子面单账户信息(包含了发货地址信息)
        OmsJdWaybillAccount account = waybillAccountService.getById(req.getAccountId());

        for(String orderId:req.getIds()){
            if(StringUtils.hasText(orderId)){
                List<OmsJdOrder> list = orderService.list(new LambdaQueryWrapper<OmsJdOrder>().eq(OmsJdOrder::getOrderId, orderId));

                if(list!=null && list.size()>0) {
                    OmsJdOrder omsTaoOrder = list.get(0);
                    WaybillReceiveRequest request = new WaybillReceiveRequest();
                    request.setWaybillType(1);
                    request.setWaybillCount(1);
                    request.setProviderCode(account.getProviderCode());
                    request.setProviderId(account.getProviderId());
                    request.setSettlementCode(account.getSettlementCode());
                    request.setSalePlatform("0010001");
                    request.setPlatformOrderNo(omsTaoOrder.getOrderId());
                    request.setVendorCode(sellerShopId.toString());
                    request.setVendorName("xxxxxx");
                    request.setVendorOrderCode(omsTaoOrder.getOrderId());
                    request.setWeight(BigDecimal.ZERO);
                    request.setVolume(BigDecimal.ZERO);
                    request.setPayType(0);
                    request.setGoodsMoney(BigDecimal.ZERO);
                    request.setShouldPayMoney(BigDecimal.ZERO);
                    request.setNeedGuarantee(false);
                    request.setGuaranteeMoney(BigDecimal.ZERO);
                    request.setReceiveTimeType(0);

                    WaybillAddress fromAddress = new WaybillAddress();
                    fromAddress.setProvinceId(account.getProvinceId());
                    fromAddress.setProvinceName(account.getProvinceName());
                    fromAddress.setCityId(account.getCityId());
                    fromAddress.setCityName(account.getCityName());
                    fromAddress.setCountryId(account.getCountryId());
                    fromAddress.setCountryName(account.getCountryName());
                    fromAddress.setCountrysideId(account.getCountrysideId());
                    fromAddress.setCountrysideName(account.getCountrysideName());
                    fromAddress.setAddress(account.getAddress());
                    fromAddress.setContact(account.getName());
                    fromAddress.setMobile(account.getMobile());
                    fromAddress.setPhone(account.getPhone());
                    request.setFromAddress(fromAddress);

                    WaybillAddress toAddress = new WaybillAddress();
                    toAddress.setProvinceId(StringUtils.hasText(omsTaoOrder.getProvinceId())?Integer.parseInt(omsTaoOrder.getProvinceId()):0);
                    toAddress.setProvinceName(omsTaoOrder.getProvince());
                    toAddress.setCityId(StringUtils.hasText(omsTaoOrder.getCityId())?Integer.parseInt(omsTaoOrder.getCityId()):0);
                    toAddress.setCityName(omsTaoOrder.getCity());
                    toAddress.setCountryId(StringUtils.hasText(omsTaoOrder.getCountyId())?Integer.parseInt(omsTaoOrder.getCounty()):0);
                    toAddress.setCountryName(omsTaoOrder.getCounty());
                    toAddress.setCountrysideId(StringUtils.hasText(omsTaoOrder.getTownId())?Integer.parseInt(omsTaoOrder.getTownId()):0);
                    toAddress.setCountrysideName(omsTaoOrder.getTown());
                    toAddress.setAddress(omsTaoOrder.getFullAddress());
                    toAddress.setContact(omsTaoOrder.getFullname());
                    toAddress.setMobile(omsTaoOrder.getMobile());
                    toAddress.setPhone(omsTaoOrder.getTelephone());
                    request.setToAddress(toAddress);

                    ApiResultVo<WaybillCodeResponse> apiResultVo = WaybillApiHelper.getWaybillCode(appKey, appSecret, accessToken, request);
                    if(apiResultVo.getCode()==0){
                        // 保持数据

                            ErpShipWaybill waybill = new ErpShipWaybill();
                            waybill.setShopId(req.getShopId());
                            waybill.setOrderId(apiResultVo.getData().getPlatformOrderNo());
                            if(apiResultVo.getData().getWaybillCodeList()!=null&&apiResultVo.getData().getWaybillCodeList().size()>0) {
                                waybill.setWaybillCode(apiResultVo.getData().getWaybillCodeList().get(0));
                            }
                            waybill.setLogisticsCode(account.getProviderCode());
//                            waybill.setPrintData(result.getPrintData());
                            waybill.setStatus(1);//1已取号
                            erpShipWaybillService.waybillUpdate(waybill);
                            log.info("====保存電子面單信息jd========"+apiResultVo.getData().getPlatformOrderNo());

                    }else{
                        return AjaxResult.error(apiResultVo.getMsg());
                    }
                }
            }
        }





        return success();
    }

    @PostMapping("/get_print_data")
    @ResponseBody
    public AjaxResult getPrintData(@RequestBody JdWaybillGetBo req) {
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        if (req.getIds() == null || req.getIds().length <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有选择订单");
        }
        var checkResult = apiCommon.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
        Long sellerShopId = checkResult.getData().getSellerShopId();

        List<ErpShipWaybill> list = erpShipWaybillService.getListByOrderIds(req.getShopId(), req.getIds());
        List<PullCloudPrintRequestDto> dtos = new ArrayList<>();
        if(list!=null && list.size()>0) {
            for (var ship:list) {
                if(!StringUtils.hasText(ship.getPrintData())) {
                    PullCloudPrintRequestDto dto = new PullCloudPrintRequestDto();
                    dto.setCpCode(ship.getLogisticsCode());
                    dto.setObjectId(ship.getOrderId());
                    Map<String, String> map = new HashMap<>();
                    map.put("eCustomerCode", sellerShopId.toString());
                    dto.setParameters(map);
                    List<WayBillInfo> wayBillInfos = new ArrayList<>();
                    WayBillInfo w = new WayBillInfo();
                    w.setPopFlag(1);
                    w.setOrderNo(ship.getOrderId());
                    w.setWayBillCode(ship.getWaybillCode());
                    wayBillInfos.add(w);
                    dto.setWayBillInfos(wayBillInfos);
                    dtos.add(dto);
                }
            }
        }
        ApiResultVo<CloudPrintData> apiResultVo = CloudPrintApiHelper.pullCloudPrintData(appKey, appSecret, accessToken, dtos);
        if(apiResultVo.getCode()==0){
            // 更新数据
            for (var item:apiResultVo.getList()) {
                ErpShipWaybill waybillNew = new ErpShipWaybill();
                waybillNew.setPrintData(item.getPerPrintData());
                waybillNew.setUpdateBy("获取打印数据");
                waybillNew.setUpdateTime(new Date());
                erpShipWaybillService.update(waybillNew,new LambdaQueryWrapper<ErpShipWaybill>().eq(ErpShipWaybill::getWaybillCode,item.getWayBillNo()));
                log.info("====保存電子面單打印信息jd========"+item.getWayBillNo());
                ErpShipWaybill list1 =  list.stream().filter(x -> x.getWaybillCode().equals(item.getWayBillNo())).findFirst().get();
                if(list1!=null){
                    list1.setPrintData(item.getPerPrintData());
                }
            }



        }else{
            return AjaxResult.error(apiResultVo.getMsg());
        }
        return AjaxResult.success(list);
    }

    @PostMapping("/push_print_success")
    @ResponseBody
    public AjaxResult pushPrintSuccess(@RequestBody JdWaybillGetBo req) {
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
    public AjaxResult pushShipSend(@RequestBody JdWaybillGetBo req) {
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
