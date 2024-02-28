package com.qihang.tao.controller;

import org.springframework.web.bind.annotation.RestController;

@RestController
public class GoodsApiController {
/**
        * @api {post} /api/v1/pull_goods 更新店铺商品列表
     * @apiVersion 1.0.0
            * @apiName pullGoods
     * @apiGroup taoGood
     * @apiParam {String}  startTime 开始时间
     * @apiParam {String}  endTime 结束时间
     * @apiParam {Number}  shopId 店铺id(东方符号：7)
     * @apiSuccessExample {json} Success-Response:
            * HTTP/1.1 200 OK{
        "code": "0成功其他失败",
                "msg": "成功或失败信息"
    }
     */
    @RequestMapping(value = "/pull_goods", method = RequestMethod.POST)
    public ApiResult<Integer> getOrderList(@RequestBody DataRow reqData, HttpServletRequest request) throws Exception {
        String startDate = reqData.getString("startTime");
        String endDate = reqData.getString("endTime");
        Integer shopId=reqData.getInt("shopId");
        var checkResult = this.check(shopId);
        if (checkResult.getCode() != EnumResultVo.SUCCESS.getIndex()) {
            return new ApiResult<>(checkResult.getCode(), checkResult.getMsg());
        }
        Integer pageIndex = 1;
        Integer pageSize = 40;
        Long endTime = System.currentTimeMillis() / 1000;//更新结束时间
        Long startTime = endTime-(60 * 60 * 24 * 7);//更新开始时间
        if(!StringUtils.isEmpty(startDate))startTime = DateUtil.dateToStamp(startDate).longValue();

        if (!StringUtils.isEmpty(endDate)) endTime = DateUtil.dateTimeToStamp(endDate + " 23:59:00").longValue();

        long kaishidaojiesu = endTime - startTime;
        long forSize = (kaishidaojiesu % (60 * 60 * 24 * 7) == 0) ? kaishidaojiesu / (60 * 60 * 24 * 7) : kaishidaojiesu / (60 * 60 * 24 * 7) + 1;//计算需要循环的次数
        for (int i = 0; i < forSize; i++) {
            Long startTime1 = startTime + i * 60 * 60 * 24 * 7;
            Long endTime1 = startTime1 + 60 * 60 * 24 * 7;
            Integer totalCount = pullGoods(checkResult.getData(),pageIndex,pageSize,startTime1,endTime1);
            int totalPage = (totalCount % pageSize == 0) ? totalCount / pageSize : (totalCount / pageSize) + 1;
            while (pageIndex < totalPage) {
                pageIndex++;
                pullGoods(checkResult.getData(),pageIndex,pageSize,startTime1,endTime1);
            }
            pageIndex=1;
        }
        return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(), "SUCCESS");
    }

    public Integer pullGoods(DcSysThirdSettingEntity result, Integer pageNo, Integer pageSize, Long startTime, Long endTime) throws Exception{
        String sendUrl="http://gw.api.taobao.com/router/rest";
        Map<String, String> params = new HashMap<>();
        params.put("method","taobao.items.onsale.get");
        params.put("app_key",result.getAppKey());
        params.put("sign_method","md5");
        params.put("timestamp",String.valueOf(System.currentTimeMillis()));
        params.put("session",result.getAccess_token());
        params.put("v","2.0");
        params.put("fields","approve_status,num_iid,title,pic_url,num,list_time,price,delist_time,outer_id,sold_quantity,modified");
        params.put("nick",result.getName());
        params.put("page_no",String.valueOf(pageNo));
        params.put("page_size",String.valueOf(pageSize));
        params.put("start_modified",DateUtil.stampToDateTime(startTime));
        params.put("end_modified",DateUtil.stampToDateTime(endTime));
        params.put("sign",ExpressClient.buildSign(params,result.getAppSecret()));
        HttpResponse<String> response = HttpUtil.doPost(sendUrl,HttpUtil.map2Url(params));
        var dd = XmlUtil.xmlToJson(response.body());
        if(dd.getInteger("total_results").intValue()>0){
            var jsonArray= dd.getJSONObject("items").getJSONArray("item");
            taoGoodService.addTaoGoods(jsonArray);
        }
        return dd.getInteger("total_results");
    }

    /**
     * @api {post} /pull_goods_comment 更新商品评价
     * @apiVersion 1.0.0
     * @apiName pullGoodsComment
     * @apiGroup taoGood
     * @apiSuccessExample {json} Success-Response:
     * HTTP/1.1 200 OK
     * {
     *  "code": 0:成功,
     *  "msg": "信息"
     * }
     */
/*    @RequestMapping(value = "/pull_goods_comment", method = RequestMethod.POST)
    public ApiResult<Integer> pullGoodsComments(HttpServletRequest request){
        Integer shopId=7;
        Integer pageIndex = 1;
        Integer pageSize = 100;
        Date startDate=StringUtils.isEmpty(taoGoodService.getGoodCommentDate()) ? DateUtil.beforeDayDate(180) : taoGoodService.getGoodCommentDate();
        System.out.println(startDate);
        var result = pullTaoGoodsComment(shopId,pageIndex,pageSize,startDate);
        if(result.getCode()==0){
            while (result.getData().intValue()>pageSize.intValue()) {
                pageIndex++;
                System.out.println(pageIndex);
                pullTaoGoodsComment(shopId,pageIndex,pageSize,startDate);
            }
            return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(),"成功");
        }else return new ApiResult<>(EnumResultVo.Fail.getIndex(),"失败");

    }*/
/*    public ApiResult<Integer> pullTaoGoodsComment(Integer shopId,Integer pageIndex,Integer pageSize,Date startDate){
        var result = this.check(shopId).getData();
        TaobaoClient client = new DefaultTaobaoClient(result.getRequest_url(), result.getAppKey(), result.getAppSecret());
        TraderatesGetRequest req = new TraderatesGetRequest();
        req.setFields("tid,oid,role,nick,result,totalResults,hasNext,created,rated_nick,item_title,item_price,content,reply,num_iid");
        req.setRateType("get");
        req.setRole("buyer");
        req.setStartDate(startDate);
        req.setPageNo(pageIndex.longValue());
        req.setPageSize(pageSize.longValue());
        req.setUseHasNext(true);
        try {
            TraderatesGetResponse rsp = client.execute(req, result.getAccess_token());
            if(rsp.getTradeRates().size()>0){
                List<DcTaoGoodsCommentEntity> list =new ArrayList<>();
                rsp.getTradeRates().forEach(c->{
                    DcTaoGoodsCommentEntity comment=new DcTaoGoodsCommentEntity();
                    comment.setNumIid(c.getNumIid());
                    comment.setBuyer(c.getNick());
                    comment.setCreated(c.getCreated());
                    comment.setTid(c.getTid());
                    comment.setOid(c.getOid());
                    comment.setComment(c.getContent());
                    comment.setResult(c.getResult());
                    list.add(comment);
                });
                taoGoodService.addGoodComment(list);
                return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(),"成功",rsp.getTradeRates().size());
            }else return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(),"失败");
        }catch (Exception e){
            return new ApiResult<>(EnumResultVo.Fail.getIndex(),"失败",0);
        }
    }*/
}
