package com.qihang.tao.api;

import com.qihang.common.common.ApiResult;
import com.qihang.tao.domain.TaoGoods;
import com.qihang.tao.domain.TaoGoodsSku;
import com.qihang.tao.domain.TaoOrder;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.Item;
import com.taobao.api.request.ItemSkusGetRequest;
import com.taobao.api.request.ItemsOnsaleGetRequest;
import com.taobao.api.response.ItemSkusGetResponse;
import com.taobao.api.response.ItemsOnsaleGetResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class GoodsApiHelper {
    private static Logger log = LoggerFactory.getLogger(GoodsApiHelper.class);
    private static final String LIST_FIELDS = "approve_status,num_iid,title,nick,type,cid,pic_url,num,props,props_name,valid_thru,list_time,price,has_discount,has_invoice,has_warranty," +
            "has_showcase,modified,delist_time,postage_id,seller_cids,outer_id,sold_quantity,skus";

    public static ApiResult<TaoGoods> pullGoods(Long pageNo, Long pageSize, String url, String appKey, String appSecret, String sessionKey) throws ApiException {
        log.info("=======开始全量商品数据{}=========", LocalDateTime.now());
        TaobaoClient client = new DefaultTaobaoClient(url, appKey, appSecret);
        ItemsOnsaleGetRequest req = new ItemsOnsaleGetRequest();
        req.setFields(LIST_FIELDS);
        req.setPageNo(pageNo);
        req.setPageSize(pageSize);
        ItemsOnsaleGetResponse rsp = client.execute(req, sessionKey);
        if (rsp.getItems() == null) {
            return ApiResult.build(0, new ArrayList());
        }
        List<TaoGoods> goodsList = new ArrayList<>();
        for (Item item : rsp.getItems()) {

            TaoGoods goods = new TaoGoods();
            goods.setNumIid(item.getNumIid());
            goods.setTitle(item.getTitle());
            goods.setNick(item.getNick());
            goods.setType(item.getType());
            goods.setCid(item.getCid());
            goods.setSellerCids(item.getSellerCids());
            goods.setPicUrl(item.getPicUrl());
            goods.setNum(item.getNum().intValue());
            goods.setValidThru(item.getValidThru().intValue());
            goods.setHasDiscount(item.getHasDiscount() + "");
            goods.setHasInvoice(item.getHasInvoice() + "");
            goods.setHasWarranty(item.getHasWarranty() + "");
            goods.setHasShowcase(item.getHasShowcase() + "");
            goods.setModified(item.getModified());
            goods.setCreateTime(item.getCreated());
            goods.setDelistTime(item.getDelistTime());
            goods.setPostageId(item.getPostageId() != null ? item.getPostageId().intValue() : 0);
            goods.setOuterId(item.getOuterId());
            goods.setListTime(item.getListTime());
            goods.setPrice(item.getPrice());
            goods.setSoldQuantity(item.getSoldQuantity() == null ? 0 : item.getSoldQuantity().intValue());
            goods.setFirstStartsTime(item.getFirstStartsTime());
            goods.setSkus(pullSku(client, sessionKey, item.getNumIid()));
            goodsList.add(goods);
        }
        return ApiResult.build(rsp.getTotalResults().intValue(), goodsList);
    }

    private static List<TaoGoodsSku> pullSku(TaobaoClient client, String sessionKey, Long numIid) {
        try {
            List<TaoGoodsSku> skus = new ArrayList<>();
            ItemSkusGetRequest req1 = new ItemSkusGetRequest();
            req1.setFields("sku_id,num_iid,properties,properties_name,quantity,price,outer_id,created,modified,status,sku_spec_id,barcode");
            req1.setNumIids(numIid + "");
            ItemSkusGetResponse rsp1 = client.execute(req1, sessionKey);
            if (rsp1.getSkus() != null) {
                for (var s : rsp1.getSkus()) {
                    TaoGoodsSku sku = new TaoGoodsSku();
                    sku.setNumIid(s.getNumIid());
                    sku.setSkuId(s.getSkuId());
                    sku.setProperties(s.getProperties());
                    sku.setPropertiesName(s.getPropertiesName());
                    sku.setQuantity(s.getQuantity());
                    sku.setPrice(StringUtils.hasText(s.getPrice())?Double.parseDouble(s.getPrice()):0.0);
                    sku.setOuterId(s.getOuterId());
                    sku.setStatus(s.getStatus());
                    sku.setCreated(s.getCreated());
                    sku.setModified(s.getModified());
                    skus.add(sku);
                }
                return skus;
            } else return null;
        } catch (Exception e) {
            return null;
        }
    }
}
