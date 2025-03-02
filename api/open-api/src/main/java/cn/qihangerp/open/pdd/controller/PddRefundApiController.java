package cn.qihangerp.open.pdd.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.enums.HttpStatus;
import cn.qihangerp.common.mq.MqMessage;
import cn.qihangerp.common.mq.MqType;
import cn.qihangerp.common.mq.MqUtils;
import cn.qihangerp.domain.OShopPullLasttime;
import cn.qihangerp.domain.OShopPullLogs;
import cn.qihangerp.module.open.pdd.domain.PddRefund;
import cn.qihangerp.module.open.pdd.service.PddRefundService;
import cn.qihangerp.module.service.OShopPullLasttimeService;
import cn.qihangerp.module.service.OShopPullLogsService;
import cn.qihangerp.open.PullRequest;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.pdd.ApiCommon;
import cn.qihangerp.open.pdd.PddRefundApiHelper;
import cn.qihangerp.open.pdd.model.AfterSale;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * 更新
 */
@AllArgsConstructor
@RestController
@RequestMapping("/pdd/refund")
public class PddRefundApiController {
    private static Logger log = LoggerFactory.getLogger(PddRefundApiController.class);

    private final PddRefundService refundService;
    private final ApiCommon apiCommon;
    private final MqUtils mqUtils;
    private final OShopPullLogsService pullLogsService;
    private final OShopPullLasttimeService pullLasttimeService;
    /**
     * 增量更新订单
     * @param req
     * @
     * @throws
     */
    @PostMapping("/pull_list")
    @ResponseBody
    public AjaxResult pullRefundList(@RequestBody PullRequest req) throws Exception {
        log.info("/**************增量拉取pdd退款****************/");
        if (req.getShopId() == null || req.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        long beginTime = System.currentTimeMillis();

        var checkResult = apiCommon.checkBefore(req.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(),checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();


        // 获取最后更新时间
        LocalDateTime startTime = null;
        LocalDateTime  endTime = null;
        OShopPullLasttime lasttime = pullLasttimeService.getLasttimeByShop(req.getShopId(), "REFUND");
        if(lasttime == null){
            endTime = LocalDateTime.now();
//            startTime = endTime.minusDays(1);
            startTime = endTime.minusMinutes(30);
        }else {
            startTime = lasttime.getLasttime().minusMinutes(5);//取上次结束5分钟前
            endTime = startTime.plusMinutes(30);//结束时间取开始时间之后30分钟
            if(endTime.isAfter(LocalDateTime.now())){
                endTime = LocalDateTime.now();
            }
        }
        String pullParams = "{startTime:"+startTime+",endTime:"+endTime+"}";

        ApiResultVo<AfterSale> upResult = PddRefundApiHelper.pullRefundList(appKey, appSecret, accessToken, 1716160072, 1716242872, 1, 20);
        //获取
//        ApiResultVo<PddRefundResponse> upResult = RefundApiHelper.pullRefundList(appKey, appSecret, accessToken,startTime, endTime);


        if(upResult.getCode() !=0 ){
            OShopPullLogs logs = new OShopPullLogs();
            logs.setShopId(req.getShopId());
            logs.setShopType(EnumShopType.DOU.getIndex());
            logs.setPullType("REFUND");
            logs.setPullWay("主动拉取退款");
            logs.setPullParams(pullParams);
            logs.setPullResult(upResult.getMsg());
            logs.setPullTime(currDateTime);
            logs.setDuration(System.currentTimeMillis() - beginTime);
            pullLogsService.save(logs);
            return AjaxResult.error("接口拉取错误："+upResult.getMsg());
        }

        int insertSuccess = 0;//新增成功的订单
        int totalError = 0;
        int hasExistOrder = 0;//已存在的订单数

        //循环插入订单数据到数据库
        for (var refund : upResult.getList()) {
            PddRefund pddRefund = new PddRefund();
            BeanUtils.copyProperties(refund,pddRefund);
            //插入订单数据
            var result = refundService.saveRefund(req.getShopId(), pddRefund);
            if (result.getCode() == ResultVoEnum.DataExist.getIndex()) {
                //已经存在
                log.info("/**************主动更新pdd退款：开始更新数据库：" + refund.getId() + "存在、更新************开始通知****/");
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.PDD, MqType.REFUND_MESSAGE,refund.getId()+""));
                hasExistOrder++;
            } else if (result.getCode() == ResultVoEnum.SUCCESS.getIndex()) {
                log.info("/**************主动更新pdd退款：开始更新数据库：" + refund.getId() + "不存在、新增************开始通知****/");
                mqUtils.sendApiMessage(MqMessage.build(EnumShopType.PDD,MqType.REFUND_MESSAGE,refund.getId()+""));
                insertSuccess++;
            } else {
                log.info("/**************主动更新pdd退款：开始更新数据库：" + refund.getId() + "报错****************/");
                totalError++;
            }
        }
        if(totalError==0) {
            if (lasttime == null) {
                // 新增
                OShopPullLasttime insertLasttime = new OShopPullLasttime();
                insertLasttime.setShopId(req.getShopId());
                insertLasttime.setCreateTime(new Date());
                insertLasttime.setLasttime(endTime);
                insertLasttime.setPullType("REFUND");
                pullLasttimeService.save(insertLasttime);

            } else {
                // 修改
                OShopPullLasttime updateLasttime = new OShopPullLasttime();
                updateLasttime.setId(lasttime.getId());
                updateLasttime.setUpdateTime(new Date());
                updateLasttime.setLasttime(endTime);
                pullLasttimeService.updateById(updateLasttime);
            }
        }
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        OShopPullLogs logs = new OShopPullLogs();
        logs.setShopType(EnumShopType.PDD.getIndex());
        logs.setShopId(req.getShopId());
        logs.setPullType("REFUND");
        logs.setPullWay("主动拉取退款");
        logs.setPullParams(pullParams);
        logs.setPullResult("{insert:"+insertSuccess+",update:"+hasExistOrder+",fail:"+totalError+"}");
        logs.setPullTime(currDateTime);
        logs.setDuration(System.currentTimeMillis() - beginTime);
        pullLogsService.save(logs);

        String msg = "成功{startTime:"+startTime.format(df)+",endTime:"+endTime.format(df)+"}总共找到：" + upResult.getTotalRecords() + "条，新增：" + insertSuccess + "条，添加错误：" + totalError + "条，更新：" + hasExistOrder + "条";
        log.info("/**************主动更新PDD退款：END：" + msg + "****************/");
        return AjaxResult.success(msg);
    }


}
