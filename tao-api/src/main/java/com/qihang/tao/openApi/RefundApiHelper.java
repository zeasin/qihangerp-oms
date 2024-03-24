package com.qihang.tao.openApi;

import com.qihang.common.common.ResultVo;
import com.qihang.common.enums.HttpStatus;
import com.qihang.common.utils.DateUtils;
import com.qihang.common.utils.StringUtils;
import com.qihang.tao.domain.TaoRefund;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.Refund;
import com.taobao.api.request.RefundGetRequest;
import com.taobao.api.request.RefundsApplyGetRequest;
import com.taobao.api.request.RefundsReceiveGetRequest;
import com.taobao.api.response.RefundGetResponse;
import com.taobao.api.response.RefundsReceiveGetResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RefundApiHelper {
    private static Logger log = LoggerFactory.getLogger(RefundApiHelper.class);

    private static final String REFUND_FIELDS = "refund_id, tid, title, buyer_nick, seller_nick, total_fee, status, created,num, refund_fee, oid, good_status," +
            " company_name, sid, payment, reason, desc, has_good_return, modified, order_status,refund_phase,sku,combineItemInfo,sku_info,skuInfo,combine_item_info";
    /**
     * 拉取淘系退货单
     * @param url
     * @param appKey
     * @param appSecret
     * @param sessionKey
     * @return
     * @throws ApiException
     */
    public static ResultVo<TaoRefund> pullRefund(LocalDateTime startTime,LocalDateTime endTime,  String url, String appKey, String appSecret, String sessionKey) throws ApiException {
        TaobaoClient client = new DefaultTaobaoClient(url, appKey, appSecret);
        List<TaoRefund> list = new ArrayList<>();
        Long pageNo = 1L;
        Long pageSize = 100L;
        // 取当前时间30分钟前
//        LocalDateTime endTime = LocalDateTime.now();
//        LocalDateTime startTime = endTime.minus(60 * 24, ChronoUnit.MINUTES);

        RefundsReceiveGetRequest req = new RefundsReceiveGetRequest();
        req.setFields(REFUND_FIELDS);
        req.setStartModified(Date.from(startTime.toInstant(ZoneOffset.UTC)));
//        req.setStartModified(DateUtils.dateTime("yyyy-MM-dd HH:mm:ss","2024-03-01 00:00:00"));
        req.setEndModified(Date.from(endTime.toInstant(ZoneOffset.UTC)));
        req.setUseHasNext(true);
//        req.setStatus("WAIT_SELLER_AGREE");
//        req.setSellerNick("hz0799");
//        req.setBuyerNick("juan20108810");
//        req.setType("fixed");
//        req.setType("fixed");
        req.setPageNo(pageNo);
        req.setPageSize(pageSize);
        RefundsReceiveGetResponse rsp = client.execute(req, sessionKey);
        if (rsp.getRefunds() == null) {
            if (!org.springframework.util.StringUtils.isEmpty(rsp.getErrorCode())) {
                //接口查询错误
                return ResultVo.error(HttpStatus.ERROR, "接口调用错误：" + rsp.getMsg() + rsp.getSubMsg());
            }
            log.info("========增量拉取退款：无退款,{}==========", LocalDateTime.now());
            return ResultVo.success(0, new ArrayList());
        }

        //查到了数据
        for (var item : rsp.getRefunds()) {
            TaoRefund refund = assembleRefund(item);
            Refund detail = pullRefundDetail(client,sessionKey,Long.parseLong(item.getRefundId()));
            if(detail!=null) {
                refund.setDisputeType(detail.getDisputeType());
                refund.setNumIid(detail.getNumIid());
                refund.setNum(detail.getNum());
            }
            //循环插入退货数据
            list.add(refund);
        }

        // 有分页，继续拉取
        while (rsp.getHasNext()) {
            pageNo++;
            req.setPageNo(pageNo);
            rsp = client.execute(req, sessionKey);
            //有数据
            for (var item : rsp.getRefunds()) {
                TaoRefund refund = assembleRefund(item);
                Refund detail = pullRefundDetail(client,sessionKey,Long.parseLong(item.getRefundId()));
                if(detail!=null) {
                    refund.setDisputeType(detail.getDisputeType());
                    refund.setNumIid(detail.getNumIid());
                    refund.setNum(detail.getNum());
                }
                //循环插入退货数据
                list.add(refund);
            }
        }
        return ResultVo.success(list.size(), list);
    }

    /**
     * 获取退款详情
     * @param client
     * @param sessionKey
     * @param refundId
     * @return
     */
    public static Refund pullRefundDetail(TaobaoClient client,String sessionKey,Long refundId){
        try {
            RefundGetRequest req1 = new RefundGetRequest();
            req1.setFields("refund_id, alipay_no, tid, oid, buyer_nick, seller_nick, total_fee, status, created, refund_fee, good_status, has_good_return, " +
                    "payment, reason, desc, num_iid, title, price, num, good_return_time, company_name, sid, address, shipping_type, refund_remind_timeout, refund_phase, " +
                    "refund_version, operation_contraint, attribute, outer_id,dispute_type,sku,end_time,combineItemInfo,sku_info,skuInfo,combine_item_info");
            req1.setRefundId(refundId);
            RefundGetResponse rsp1 = client.execute(req1, sessionKey);
            return rsp1.getRefund();
        }catch (ApiException e){
            return null;
        }
    }

    private static TaoRefund assembleRefund(Refund item){
        TaoRefund refund = new TaoRefund();
        refund.setRefundId(item.getRefundId());
        refund.setTid(item.getTid());
        refund.setOid(item.getOid());
        refund.setSellerNick(item.getSellerNick());
        refund.setPayment(StringUtils.isEmpty(item.getPayment()) ?0.0:Double.parseDouble(item.getPayment()));
        refund.setTotalFee(Double.parseDouble(item.getTotalFee()));
        refund.setRefundFee(Double.parseDouble(item.getRefundFee()));
        refund.setCreated(item.getCreated());
        refund.setStatus(item.getStatus());
        refund.setTitle(item.getTitle());
        refund.setDesc1(item.getDesc());
        refund.setBuyerNick(item.getBuyerNick());
        refund.setBuyerOpenUid(item.getBuyerOpenUid());
        refund.setGoodStatus(item.getGoodStatus());
        refund.setHasGoodReturn(item.getHasGoodReturn() == true ? 1 : 0);
        refund.setOrderStatus(item.getOrderStatus());
        refund.setModified(item.getModified());
        refund.setReason(item.getReason());
        refund.setNum(item.getNum());
        refund.setRefundPhase(item.getRefundPhase());
        refund.setSid(item.getSid());
        refund.setSku(item.getSku());
        return refund;
    }

}
