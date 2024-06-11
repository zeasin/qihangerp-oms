package com.qihang.tao.controller;

import cn.qihangerp.open.tao.RefundApiHelper;
import cn.qihangerp.open.tao.common.ApiResultVo;
import cn.qihangerp.open.tao.model.Refund;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.common.mq.MqMessage;
import com.qihang.common.mq.MqType;
import com.qihang.common.mq.MqUtils;
import com.qihang.tao.domain.OmsTaoRefund;
import com.qihang.tao.domain.SysShopPullLasttime;
import com.qihang.tao.domain.SysShopPullLogs;
import com.qihang.tao.openApi.ApiCommon;
import com.qihang.tao.common.TaoRequest;
import com.qihang.tao.service.OmsTaoRefundService;
import com.qihang.tao.service.SysShopPullLasttimeService;
import com.qihang.tao.service.SysShopPullLogsService;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.Date;

@AllArgsConstructor
@RestController
@RequestMapping("/refund")
public class RefundApiController {
    private static Logger log = LoggerFactory.getLogger(RefundApiController.class);
    private final ApiCommon apiCommon;
    private final MqUtils mqUtils;
    private final SysShopPullLogsService pullLogsService;
    private final SysShopPullLasttimeService pullLasttimeService;
    private OmsTaoRefundService refundService;
    /**
     * 更新退货订单
     *
     * @return
     * @throws
     */
    @RequestMapping("/pull_refund")
    @ResponseBody
    public AjaxResult refundOrderPull(@RequestBody TaoRequest taoRequest){
        log.info("/**************主动更新tao退货订单****************/");
        if (taoRequest.getShopId() == null || taoRequest.getShopId() <= 0) {
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，没有店铺Id");
            return AjaxResult.error(HttpStatus.PARAMS_ERROR,  "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();


        var checkResult = apiCommon.checkBefore(taoRequest.getShopId());

        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg());
        }

        String sessionKey = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();


        // 获取最后更新时间
        LocalDateTime startTime = null;
        LocalDateTime  endTime = null;
        SysShopPullLasttime lasttime = pullLasttimeService.getLasttimeByShop(taoRequest.getShopId(), "REFUND");
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
//        Long pageSize = 100l;
//        Long pageIndex = 1l;

        //获取
//        ApiResultVo<TaoRefund> resultVo = refundApiService.pullRefundList(startTime, endTime, shopId, url, appKey, appSecret, sessionKey);
//        ResultVo<TaoRefund> upResult = RefundApiHelper.pullRefund(startTime,endTime, url, appKey, appSecret, sessionKey);
//        if (resultVo.getCode() != 0) {
//            log.info("/**************主动更新tao退货订单：第一次获取结果失败：" + resultVo.getMsg() + "****************/");
////            return new ApiResult<>(EnumResultVo.SystemException.getIndex(), upResult.getMsg());
//            return AjaxResult.error(HttpStatus.ERROR ,resultVo.getMsg());
//        }
        ApiResultVo<Refund> refundApiResultVo = RefundApiHelper.pullRefund(startTime, endTime, appKey, appSecret, sessionKey);
        log.info("/**************主动更新tao退货订单：第一次获取结果：总记录数" + refundApiResultVo.getTotalRecords() + "****************/");
        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数
        if(refundApiResultVo.getCode()==0) {
            //循环插入订单数据到数据库
            for (var refund : refundApiResultVo.getList()) {
                OmsTaoRefund taoRefund = new OmsTaoRefund();
                BeanUtils.copyProperties(refund,taoRefund);
                taoRefund.setShopId(taoRequest.getShopId());
                taoRefund.setDesc1(refund.getDesc());
                ResultVo<Integer> resultVo = refundService.saveAndUpdateRefund(taoRequest.getShopId(), taoRefund);

//                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.REFUND_MESSAGE, refund.getRefundId()));
                //插入订单数据
//                var result = refundService.saveAndUpdateRefund(shopId, refund);
                if (resultVo.getCode() == ResultVoEnum.DataExist.getIndex()) {
                    //已经存在
                    mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.REFUND_MESSAGE, refund.getRefundId()));
                    log.info("/**************主动更新tao退货订单：开始更新数据库：" + refund.getRefundId() + "存在、更新****************/");
                    hasExistOrder++;
                } else if (resultVo.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                    log.info("/**************主动更新tao退货订单：开始插入数据库：" + refund.getRefundId() + "不存在、新增****************/");
                    mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.REFUND_MESSAGE, refund.getRefundId()));
                    insertSuccess++;
                } else {
                    log.info("/**************主动更新tao退货订单：开始更新数据库：" + refund.getRefundId() + "报错****************/");
                    totalError++;
                }
            }

        }else{
            log.info("/**************主动更新tao退货订单：获取结果失败：" + refundApiResultVo.getMsg() + "****************/");
            return AjaxResult.error(refundApiResultVo.getCode(), refundApiResultVo.getMsg());
        }

        if(lasttime == null){
            // 新增
            SysShopPullLasttime insertLasttime = new SysShopPullLasttime();
            insertLasttime.setShopId(taoRequest.getShopId());
            insertLasttime.setCreateTime(new Date());
            insertLasttime.setLasttime(endTime);
            insertLasttime.setPullType("REFUND");
            pullLasttimeService.save(insertLasttime);

        }else {
            // 修改
            SysShopPullLasttime updateLasttime = new SysShopPullLasttime();
            updateLasttime.setId(lasttime.getId());
            updateLasttime.setUpdateTime(new Date());
            updateLasttime.setLasttime(endTime);
            pullLasttimeService.updateById(updateLasttime);
        }

        String msg = "成功，总共找到：" + refundApiResultVo.getTotalRecords() + "条订单";
        SysShopPullLogs logs = new SysShopPullLogs();
        logs.setShopType(EnumShopType.TAO.getIndex());
        logs.setShopId(taoRequest.getShopId());
        logs.setPullType("REFUND");
        logs.setPullWay("主动拉取");
        logs.setPullParams("{startTime:"+startTime+",endTime:"+endTime+"}");
        logs.setPullResult("{insert:"+insertSuccess+",update:"+hasExistOrder+",fail:"+totalError+"}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - beginTime);
        pullLogsService.save(logs);
        log.info("/**************主动更新tao订单：END：" + msg + "****************/");
//        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), msg);
        return AjaxResult.success(msg);
    }

    @RequestMapping("/refund/pull_refund_detail")
    @ResponseBody
    public AjaxResult refundOrderPullByNum(@RequestBody TaoRequest taoRequest){
        log.info("/**************主动更新tao退货订单by number****************/");
        if (taoRequest.getShopId() == null || taoRequest.getShopId() <= 0) {
            return AjaxResult.error(ResultVoEnum.ParamsError.getIndex(), "参数错误，没有店铺Id");
        }
        if (taoRequest.getRefundId() == null || taoRequest.getRefundId() <= 0) {
            return AjaxResult.error(ResultVoEnum.ParamsError.getIndex(), "参数错误，缺少退款单号");
        }

        var checkResult = apiCommon.checkBefore(taoRequest.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg());
        }

        String sessionKey = checkResult.getData().getAccessToken();
        String url = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();

        ApiResultVo<Refund> refundApiResultVo = RefundApiHelper.pullRefundDetail(taoRequest.getRefundId(), appKey, appSecret, sessionKey);
        if(refundApiResultVo.getCode()==0) {
            OmsTaoRefund taoRefund = new OmsTaoRefund();
            BeanUtils.copyProperties(refundApiResultVo.getData(), taoRefund);
            ResultVo<Integer> resultVo = refundService.saveAndUpdateRefund(taoRequest.getShopId(), taoRefund);
            if(resultVo.getCode()==0){
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.TAO, MqType.REFUND_MESSAGE, taoRequest.getRefundId().toString()));
            }
            return AjaxResult.success();
        }else{
            return AjaxResult.error(refundApiResultVo.getCode(), refundApiResultVo.getMsg());
        }
    }


}
