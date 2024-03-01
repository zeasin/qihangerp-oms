package com.qihang.tao.controller;

import com.qihang.common.common.EnumResultVo;
import com.qihang.common.enums.HttpStatus;
import com.qihang.tao.api.ApiCommon;
import com.qihang.tao.api.ApiResult;
import com.qihang.tao.api.RefundApiHelper;
import com.qihang.tao.common.TaoRequest;
import com.qihang.tao.domain.TaoRefund;
import com.qihang.tao.service.TaoRefundService;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.RefundGetRequest;
import com.taobao.api.response.RefundGetResponse;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

@AllArgsConstructor
@RestController
@RequestMapping("/refund")
public class RefundApiController {
    private static Logger log = LoggerFactory.getLogger(RefundApiController.class);
    private final ApiCommon apiCommon;
    private final TaoRefundService refundService;
    /**
     * 更新退货订单
     *
     * @return
     * @throws ApiException
     */
    @RequestMapping("/pull_refund")
    @ResponseBody
    public ApiResult<String> refundOrderPull(@RequestBody TaoRequest taoRequest) throws ApiException {
        log.info("/**************主动更新tao退货订单****************/");
        if (taoRequest.getShopId() == null || taoRequest.getShopId() <= 0) {
            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，没有店铺Id");
        }
        Integer shopId = taoRequest.getShopId();
        var checkResult = apiCommon.checkBefore(shopId);

        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return new ApiResult<>(checkResult.getCode(), checkResult.getMsg());
        }

        String sessionKey = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getApiRequestUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();


        Long pageSize = 50l;
        Long pageIndex = 1l;

        //第一次获取
        ApiResult<TaoRefund> upResult = RefundApiHelper.pullRefund(pageIndex, pageSize, url, appKey, appSecret, sessionKey);

        if (upResult.getCode().intValue() != 0) {
            log.info("/**************主动更新tao退货订单：第一次获取结果失败：" + upResult.getMsg() + "****************/");
            return new ApiResult<>(EnumResultVo.SystemException.getIndex(), upResult.getMsg());
        }

        log.info("/**************主动更新tao退货订单：第一次获取结果：总记录数" + upResult.getTotalRecords() + "****************/");
        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数

        //循环插入订单数据到数据库
        for (var refund : upResult.getList()) {

            //插入订单数据
            var result = refundService.saveAndUpdateRefund(shopId, refund);
            if (result == EnumResultVo.DataExist.getIndex()) {
                //已经存在
                log.info("/**************主动更新tao退货订单：开始更新数据库：" + refund.getRefundId() + "存在、更新****************/");
                hasExistOrder++;
            } else if (result == EnumResultVo.SUCCESS.getIndex()) {
                log.info("/**************主动更新tao退货订单：开始插入数据库：" + refund.getRefundId() + "不存在、新增****************/");
                insertSuccess++;
            } else {
                log.info("/**************主动更新tao退货订单：开始更新数据库：" + refund.getRefundId() + "报错****************/");
                totalError++;
            }
        }

        String msg = "成功，总共找到：" + upResult.getTotalRecords() + "条订单，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        log.info("/**************主动更新tao订单：END：" + msg + "****************/");
        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), msg);
    }

    /**
     * 更新单条退货单
     *
     * @param taoRequest
     * @param model
     * @param request
     * @return
     * @throws ApiException
     */
//    @RequestMapping("/refund/pull_refund_order_by_num")
//    @ResponseBody
//    public com.qihang.tao.common.ApiResult<String> refundOrderPullByNum(@RequestBody TaoRequest taoRequest, Model model, HttpServletRequest request) throws ApiException {
//        log.info("/**************主动更新tao退货订单by number****************/");
//        if (taoRequest.getShopId() == null || taoRequest.getShopId() <= 0) {
//            return new com.qihang.tao.common.ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，没有店铺Id");
//        }
//        if (taoRequest.getOrderId() == null || taoRequest.getOrderId() <= 0) {
//            return new com.qihang.tao.common.ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，缺少退款单号");
//        }
//
//        Long shopId = taoRequest.getShopId();
//        var checkResult = this.checkBefore(shopId);
//
//        if (checkResult.getCode() != EnumResultVo.SUCCESS.getIndex()) {
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
//        RefundGetRequest req1 = new RefundGetRequest();
//        req1.setFields("refund_id, alipay_no, tid, oid, buyer_nick, seller_nick, total_fee, status, created, refund_fee, good_status, " +
//                "has_good_return, payment, reason, desc,order_status, num_iid, title, price, num, good_return_time, company_name, sid, address, " +
//                "shipping_type, refund_remind_timeout, refund_phase, refund_version, operation_contraint, attribute, outer_id, sku");
//        req1.setRefundId(taoRequest.getOrderId());
//        RefundGetResponse rsp1 = client.execute(req1, sessionKey);
//        System.out.println(rsp1.getBody());
//
//        var item = rsp1.getRefund();
//        if (item == null) {
//            //没有找到退款单
//            log.info("/**************主动更新tao订单：END： 没有找到退单****************/");
//            return new com.qihang.tao.common.ApiResult<>(EnumResultVo.DataError.getIndex(), "没有找到退单" + taoRequest.getOrderId());
//        }
//
//        if (item.getHasGoodReturn()) {
//            log.info("/**************主动更新tao退货订单：买家需要退货，处理快递公司和快递单号处理*********************/");
//            //买家需要退货，处理快递公司和快递单号处理
//            if (StringUtils.isEmpty(item.getCompanyName())) {
//                log.info("/**************主动更新tao退货订单：买家需要退货，处理快递公司和快递单号处理，主数据中没有快递公司和单号*********************/");
//                String companyName = "";
//                if (rsp1.getRefund().getAttribute().indexOf("logisticsCompanyName:") > -1) {
//                    Integer companyNameStart = rsp1.getRefund().getAttribute().indexOf("logisticsCompanyName:") + 21;
//                    companyName = rsp1.getRefund().getAttribute().substring(companyNameStart, companyNameStart + 4);
//                }
//                String logisticsCode = "";
//                if (rsp1.getRefund().getAttribute().indexOf("logisticsOrderCode:") > -1) {
//                    Integer logisticsCodeStart = rsp1.getRefund().getAttribute().indexOf("logisticsOrderCode:") + 19;
//                    logisticsCode = rsp1.getRefund().getAttribute().substring(logisticsCodeStart, logisticsCodeStart + 15);
//                }
//                if (StringUtils.isEmpty(companyName) == false) {
//                    item.setCompanyName(companyName);
//                }
//
//                if (StringUtils.isEmpty(logisticsCode) == false) {
//                    if (logisticsCode.indexOf(";") >= 0) {
//                        logisticsCode = logisticsCode.substring(0, logisticsCode.indexOf(";"));
//                    }
//                    item.setSid(logisticsCode);
//                }
//            }
//        }
//        TaoOrderRefund tmallOrderRefund = new TaoOrderRefund();
////        tmallOrderRefund.setBuyer_nick(item.getBuyerNick());
//        tmallOrderRefund.setCreated(DateUtil.dateToStamp(item.getCreated()));
//        tmallOrderRefund.setRemark(item.getDesc());
//        tmallOrderRefund.setGoodStatus(item.getGoodStatus());
//        tmallOrderRefund.setHasGoodReturn(item.getHasGoodReturn() == true ? 1 : 0);
//        tmallOrderRefund.setLogisticsCode(item.getSid());
//        tmallOrderRefund.setLogisticsCompany(item.getCompanyName());
//        tmallOrderRefund.setModified(DateUtil.dateToStamp(item.getModified()));
//        tmallOrderRefund.setOid(item.getOid());
////        tmallOrderRefund.setOrderStatus(item.getOrderStatus());
//        tmallOrderRefund.setReason(item.getReason());
//        tmallOrderRefund.setRefundFee(BigDecimal.valueOf(Double.parseDouble(item.getRefundFee())));
//        tmallOrderRefund.setRefundId(item.getRefundId());
//        tmallOrderRefund.setStatus(item.getStatus());
//        tmallOrderRefund.setTid(item.getTid());
////        tmallOrderRefund.setTotal_fee(item.getTotalFee());
//        tmallOrderRefund.setNum(item.getNum());
//        tmallOrderRefund.setRefundPhase(item.getRefundPhase());
//
//        //插入订单数据
//        var result1 = tmallOrderReturnService.updOrderRefund(shopId, tmallOrderRefund);
//        String msg = "SUCCESS";
//        if (result1 == EnumResultVo.DataExist.getIndex()) {
//            //已经存在
//            log.info("/**************主动更新tao退货订单：开始更新数据库：" + tmallOrderRefund.getRefundId() + "存在、更新****************/");
//            msg = "更新成功";
//        } else if (result1 == EnumResultVo.SUCCESS.getIndex()) {
//            log.info("/**************主动更新tao退货订单：开始更新数据库：" + tmallOrderRefund.getRefundId() + "不存在、新增****************/");
//            msg = "新增成功";
//        } else {
//            log.info("/**************主动更新tao退货订单：开始更新数据库：" + tmallOrderRefund.getRefundId() + "报错****************/");
//            msg = "更新报错";
//        }
//
//
//        log.info("/**************主动更新tao订单：END：" + msg + "****************/");
//        return new com.qihang.tao.common.ApiResult<>(EnumResultVo.SUCCESS.getIndex(), msg);
//    }
}
