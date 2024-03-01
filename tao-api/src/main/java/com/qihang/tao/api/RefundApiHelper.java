package com.qihang.tao.api;

import com.qihang.common.utils.DateUtils;
import com.qihang.tao.domain.TaoRefund;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.RefundsReceiveGetRequest;
import com.taobao.api.response.RefundsReceiveGetResponse;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class RefundApiHelper {
    private static final String REFUND_FIELDS = "refund_id, tid, title, buyer_nick, seller_nick, total_fee, status, created,num, refund_fee, oid, good_status," +
            " company_name, sid, payment, reason, desc, has_good_return, modified, order_status,refund_phase,sku";
    /**
     * 拉取淘系退货订单
     * @param pageNo
     * @param pageSize
     * @param url
     * @param appKey
     * @param appSecret
     * @param sessionKey
     * @return
     * @throws ApiException
     */
    public static ApiResult<TaoRefund> pullRefund(Long pageNo, Long pageSize, String url, String appKey, String appSecret, String sessionKey) throws ApiException {
        TaobaoClient client = new DefaultTaobaoClient(url, appKey, appSecret);
        List<TaoRefund> list = new ArrayList<>();

//        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
//        RefundGetRequest req1 = new RefundGetRequest();
//        req1.setFields("title,address,good_return_time,created");
//        req1.setRefundId(44929186648087305L);
//        RefundGetResponse rsp1 = client.execute(req1, sessionKey);
//        System.out.println(rsp1.getBody());
//        RefundsApplyGetRequest raReq = new RefundsApplyGetRequest();
//        raReq.setFields("refund_id, tid, title, buyer_nick, seller_nick, total_fee, status, created, refund_fee");
//        raReq.setPageNo(1L);
//        raReq.setPageSize(10L);
//////        raReq.setStatus("SUCCESS");
////
//        RefundsApplyGetResponse raRsp = client.execute(raReq,sessionKey);

        RefundsReceiveGetRequest req = new RefundsReceiveGetRequest();
        req.setFields(REFUND_FIELDS);
//        req.setStatus("WAIT_SELLER_AGREE");
//        req.setSellerNick("hz0799");
//        req.setBuyerNick("juan20108810");
//        req.setType("fixed");
//        req.setType("fixed");
        req.setPageNo(pageNo);
        req.setPageSize(pageSize);
        RefundsReceiveGetResponse rsp = client.execute(req, sessionKey);
        if (rsp.getTotalResults() > 0) {
            //查到了数据
            for (var item : rsp.getRefunds()) {
                //循环插入退货数据
                TaoRefund refund = new TaoRefund();
                refund.setRefundId(item.getRefundId());
                refund.setTid(item.getTid());
                refund.setOid(item.getOid());
                refund.setSellerNick(item.getSellerNick());
                refund.setTotalFee(Double.parseDouble(item.getTotalFee()));
                refund.setRefundFee(Double.parseDouble(item.getRefundFee()));
                refund.setCreated(item.getCreated());
                refund.setStatus(item.getStatus());
                refund.setTitle(item.getTitle());
                refund.setDesc(item.getDesc());
                refund.setBuyerNick(item.getBuyerNick());
                refund.setBuyerOpenUid(item.getBuyerOpenUid());
                refund.setGoodStatus(item.getGoodStatus());
                refund.setHasGoodReturn(item.getHasGoodReturn() == true ? 1 : 0);
//                refund.setLogisticsCode(item.getSid());
//                refund.setLogisticsCompany(item.getCompanyName());
                refund.setModified(item.getModified());
                refund.setReason(item.getReason());
                refund.setNum(item.getNum());
                refund.setRefundPhase(item.getRefundPhase());
                list.add(refund);
            }
        }
        return new ApiResult(rsp.getTotalResults().intValue(), list);
    }

}
