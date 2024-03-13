package com.qihang.pdd.controller;//package com.qihang.erp.api.controller.pdd;
//
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONObject;
//import com.b2c.common.jdbc.DbUtil;
//import com.b2c.common.utils.DateUtil;
//import com.b2c.oms.DataConfigObject;
//import com.b2c.oms.PddWsClient;
//import com.b2c.service.oms.OrderPddService;
//import com.pdd.pop.sdk.common.util.JsonUtil;
//import com.pdd.pop.sdk.http.PopClient;
//import com.pdd.pop.sdk.http.PopHttpClient;
//import com.pdd.pop.sdk.http.api.pop.request.PddPmcUserGetRequest;
//import com.pdd.pop.sdk.http.api.pop.request.PddPmcUserPermitRequest;
//import com.pdd.pop.sdk.http.api.pop.response.PddPmcUserGetResponse;
//import com.pdd.pop.sdk.http.api.pop.response.PddPmcUserPermitResponse;
//import com.pdd.pop.sdk.message.MessageHandler;
//import com.pdd.pop.sdk.message.WsClient;
//import com.pdd.pop.sdk.message.model.Message;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import java.io.IOException;
//import java.sql.*;
//
//@Controller
//public class PddSocketController {
//
//    private static Logger log = LoggerFactory.getLogger(PddSocketController.class);
//
//    @Autowired
//    private OrderPddService orderPddService;
//
//    @RequestMapping("/pddSockettest")
//    @ResponseBody
//    public String pddSoceketTest() throws Exception {
//        String clientId = "dc953bcf16d24b27abf3e64a59e1ecd1";
//        String clientSecret = "de296599e194a08cbfbb2b3b340e11fec7a1bacc";
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//
//
////        Connection conn = null;
////        Statement stmt = null;
////        ResultSet rs = null;
////        try{
////            String jdbcUrl = DataConfigObject.getInstance().getJdbcURL();
////            String jdbcUser= DataConfigObject.getInstance().getJdbcUSER();
////            String jdbcPwd = DataConfigObject.getInstance().getJdbcPASSWORD();
////            DbUtil  dbUtil = new DbUtil(jdbcUrl,jdbcUser,jdbcPwd);
////            conn = dbUtil.getConnection();
////        }
////        catch (Exception e){
////            log.info("数据库链接异常");
////        }
////        String sql = "insert into dc_pdd_message (mall_id,type,content) value(?,?,?)";
////        if(conn != null) {
////            try {
////                log.info("开始数据库操作");
////                PreparedStatement pst = conn.prepareStatement(sql);
////                //为占位符设置具体内容
////                pst.setLong(1, 1);
////                pst.setString(2, "pdd_trade_TradeConfirmed");
////                pst.setString(3," {\"content\":\"{\\\"mall_id\\\":171504183,\\\"refund_fee\\\":1990,\\\"bill_type\\\":1,\\\"modified\\\":1625637425016,\\\"refund_id\\\":7381745730,\\\"operation\\\":1000,\\\"tid\\\":\\\"210707-339507978993455\\\"}\",\"mallID\":171504183,\"type\":\"pdd_refund_RefundCreated\"}");
////
////                var dataResult = pst.executeUpdate();
////                log.info("数据插入成功"+dataResult);
//////                //3.操作数据库，实现增删改查
//////                stmt = conn.createStatement();
//////                rs = stmt.executeQuery("insert into user_name, age FROM imooc_goddess");
//////                //如果有数据，rs.next()返回true
//////                while (rs.next()) {
//////                    System.out.println(rs.getString("user_name") + " 年龄：" + rs.getInt("age"));
//////                }
////            } catch (Exception e) {
////                if (rs != null && !rs.isClosed()) {
////                    rs.close();
////                    log.info("ResultSet is close " + rs.isClosed());
////                }
////                if (stmt != null && !stmt.isClosed()) {
////                    stmt.close();
////                    log.info("Statement is close " + stmt.isClosed());
////                }
////                if (conn != null && !conn.isClosed()) {
////                    conn.close();
////                    log.info("Connection is close " + conn.isClosed());
////                }
////            }
////        }
//
//
//
////        String accessToken = "8386f04e132d486fa3eec27481614e43f4fabe66";
////        PddPmcUserPermitRequest request1 = new PddPmcUserPermitRequest();
////        request1.setTopics("pdd_trade_TradeConfirmed");
////        PddPmcUserPermitResponse response1 = client.syncInvoke(request1, accessToken);
////        System.out.println(JsonUtil.transferToJson(response1));
//
//
//        PddPmcUserGetRequest request = new PddPmcUserGetRequest();
//        request.setOwnerId("171504183");
//        PddPmcUserGetResponse response = client.syncInvoke(request);
//        System.out.println(JsonUtil.transferToJson(response));
//
//        return JsonUtil.transferToJson(response);
//    }
//
//    @RequestMapping("/pddSocket")
//    @ResponseBody
//    public String pddSocket(Model model) throws Exception {
//
//
//        log.info("开启拼多多消息长连接");
//        String clientId = "dc953bcf16d24b27abf3e64a59e1ecd1";
//        String clientSecret = "de296599e194a08cbfbb2b3b340e11fec7a1bacc";
//        String accessToken = "5f3ed4cddf99491e883bc6dfd867bed3b1ec90a4";
//        String accessToken1 = "c99a5f0233e44b93bcf8ebd9cd02313f95c56cf2";
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//
//
//
//
//
//        PddPmcUserPermitRequest request = new PddPmcUserPermitRequest();
////        request.setTopics("pdd_trade_TradeConfirmed,pdd_refund_RefundCreated");
//        request.setTopics("pdd_trade_TradeConfirmed,pdd_refund_RefundCreated,pdd_refund_RefundBuyerReturnGoods");
//
//        PddPmcUserPermitResponse response = client.syncInvoke(request, accessToken);
//        System.out.println(JsonUtil.transferToJson(response));
//
//        PddPmcUserPermitResponse response1 = client.syncInvoke(request, accessToken1);
//        System.out.println(JsonUtil.transferToJson(response1));
//
//        String jdbcUrl = DataConfigObject.getInstance().getJdbcURL();
//        String jdbcUser= DataConfigObject.getInstance().getJdbcUSER();
//        String jdbcPwd = DataConfigObject.getInstance().getJdbcPASSWORD();
//
//
//
//
//
//        WsClient ws = PddWsClient.getInstance().getWsClient();
//        ws.setMessageHandler(new MessageHandler() {
//                                 @Override
//                                 public void onMessage(Message message) throws InterruptedException, IOException {
//                                     log.info("拼多多新消息：" + JSON.toJSONString(message));
//                                     DbUtil dbUtil = null;
//                                     Connection conn = null;
//                                     Statement stmt = null;
//
//                                     try{
//                                         dbUtil =new DbUtil(jdbcUrl,jdbcUser,jdbcPwd);
//                                         conn = DbUtil.getConnection();
//                                         stmt = conn.createStatement();
//                                     }catch (Exception e){
//                                         conn = null;
//                                         stmt = null;
//                                        log.info("数据库连接池初始化错误");
//                                     }
//                                     if (message.getType().equals("pdd_refund_RefundCreated")) {
//                                        //新退货订单,插入退货表
////                                        log.info("接收到拼多多新退款，插入退货表：" );
//                                        Integer shopId = 0;
//                                        if(message.getMallID().longValue() == 171504183L){
//                                            shopId = 18;
//                                        } else if(message.getMallID().longValue() == 593374804L){
//                                            shopId = 5;
//                                        }
//                                         JSONObject jsonObject = JSON.parseObject(message.getContent());
//                                         Long refundId = jsonObject.getLong("refund_id");
//                                         Integer billType = jsonObject.getInteger("bill_type");
//                                         Long refundFee = jsonObject.getLong("refund_fee");
//                                         Integer operation=jsonObject.getInteger("operation");
//                                         String orderSn = jsonObject.getString("tid");
//                                         Long modified = jsonObject.getLong("modified");
//                                         String sql = "SELECT count(0) FROM dc_pdd_refund WHERE id="+refundId;//查询
//
//                                         try {
//                                             if(stmt == null){
//                                                 log.info("链接断开了");
//                                             }
//                                             ResultSet rs = stmt.executeQuery(sql);
//                                             int isExist = 0;
//                                            //如果有数据，rs.next()返回true
//                                            if(rs.next()){
//                                                isExist = rs.getInt(1);
//                                            }
//                                            if(isExist > 0){
//                                                log.info(refundId + "存在，不操作");
//                                            }else{
//                                                //插入数据，简单数据
//                                                StringBuilder sb = new StringBuilder();
//                                                sb.append("INSERT INTO dc_pdd_refund SET id="+refundId);
//                                                sb.append(",order_sn='"+orderSn+"'");
//                                                sb.append(",shopId="+shopId);
//                                                sb.append(",after_sales_type=0");
//                                                sb.append(",after_sales_status=0");
//                                                sb.append(",after_sale_reason=''");
//                                                sb.append(",confirm_time=0");
//                                                sb.append(",created_time=0");
//                                                sb.append(",discount_amount=0");
//                                                sb.append(",order_amount=0");
//                                                sb.append(",refund_amount="+refundFee.doubleValue() / 100);
//                                                sb.append(",quantity=0");
//                                                sb.append(",goods_price=0");
//                                                sb.append(",updated_time='"+DateUtil.getCurrentDateTime()+"'");
//                                                sb.append(",auditStatus=-9");
//
//
//                                                int r = stmt.executeUpdate(sb.toString());
////                                                log.info(refundId+"新增成功");
//                                                log.info("处理拼多多新退款消息：{refundId:" + refundId + ",order_sn:" + orderSn + "}，添加成功");
//                                            }
//                                           if(rs.isClosed()==false) rs.close();
//
//                                         } catch (SQLException e) {
//                                             e.printStackTrace();
//                                         }finally {
//                                             try {
//                                                 if(stmt!=null && stmt.isClosed()==false ) stmt.close();
//                                                 if (conn != null && conn.isClosed()) conn.close();
//                                             }catch (Exception ee){}
//                                         }
//
////                                         RefundPddEntity refundPdd = new RefundPddEntity();
////                                        refundPdd.setId(refundId);
////                                        refundPdd.setShopId(shopId);
////                                        refundPdd.setAfter_sales_type(billType+1);
////                                        refundPdd.setAfter_sales_status(2);
////                                        refundPdd.setAfter_sale_reason(operation+"");
////                                        refundPdd.setAuditStatus(-9);//带拉取状态
////                                        refundPdd.setConfirm_time(0L);
////                                        refundPdd.setCreated_time(modified);
////                                        refundPdd.setDescribe("");
////                                        refundPdd.setDiscount_amount(0.0);
////                                        refundPdd.setGoods_id(0);
////                                        refundPdd.setGoods_image("");
////                                        refundPdd.setGoods_name("");
////                                        refundPdd.setGoods_number("");
////                                        refundPdd.setGoods_price(0.0);
////                                        refundPdd.setOrder_amount(0.0);
////                                        refundPdd.setOrder_sn(orderSn);
////                                        refundPdd.setQuantity(0);
////                                        refundPdd.setRefund_amount(refundFee.doubleValue() / 100);
////                                        refundPdd.setShippingStatus(0);
////                                        refundPdd.setSkuId(0);
////                                        refundPdd.setSkuInfo("");
////                                        refundPdd.setSkuNumber("");
////                                        refundPdd.setTracking_company("");
////                                        refundPdd.setTracking_number("");
////                                        refundPdd.setUpdated_time(DateUtil.getCurrentDateTime());
////                                        var result = orderPddService.editRefundPddOrder(refundPdd);
////                                        log.info("开始处理退货单消息：{refundId:"+refundId+",status:"+operation+"}，处理结果："+result.getMsg());
//
//                                     }else if (message.getType().equals("pdd_trade_TradeConfirmed")){
////                                         log.info("接收到拼多多新订单，插入订单表：" );
//                                         try {
//                                             Integer shopId = 0;
//                                             if (message.getMallID().longValue() == 171504183L) {
//                                                 shopId = 18;
//                                             } else if(message.getMallID().longValue() == 593374804L){
//                                                 shopId = 5;
//                                             }
//                                             //{"content":"{\"mall_id\":171504183,\"tid\":\"210822-038440825871540\"}","mallID":171504183,"type":"pdd_trade_TradeConfirmed"}
//                                             JSONObject jsonObject = JSON.parseObject(message.getContent());
//                                             String tid = jsonObject.getString("tid");
//                                             String sql = "SELECT COUNT(0) FROM dc_pdd_orders WHERE order_sn=" + tid + " and shopId =" + shopId;
//                                             ResultSet rs = stmt.executeQuery(sql);
//                                             int isExist = 0;
//                                             //如果有数据，rs.next()返回true
//                                             if (rs.next()) {
//                                                 isExist = rs.getInt(1);
//                                             }
//                                             if (isExist > 0) {
//                                                 log.info(tid + "存在，不操作");
//                                             } else {
//
//                                                 // 开始写入数据库
//                                                 /*****1、添加order*****/
//                                                 StringBuilder orderInsertSQL = new StringBuilder();
//                                                 orderInsertSQL.append("INSERT INTO dc_pdd_orders");
//                                                 orderInsertSQL.append(" SET ");
//                                                 orderInsertSQL.append(" order_sn='"+tid+"'");
//                                                 orderInsertSQL.append(",shopId="+shopId);
//                                                 orderInsertSQL.append(",trade_type=0,");
//                                                 orderInsertSQL.append(" confirm_status=0,");
//                                                 orderInsertSQL.append(" free_sf=0,");
//                                                 orderInsertSQL.append(" group_status=0,");
//                                                 orderInsertSQL.append(" capital_free_discount=0.0,");
//                                                 orderInsertSQL.append(" seller_discount=0.0,");
//                                                 orderInsertSQL.append(" platform_discount=0.0,");
//                                                 orderInsertSQL.append(" updated_at='"+DateUtil.getCurrentDateTime()+"'");
//                                                 orderInsertSQL.append(",refund_status=0,");
//                                                 orderInsertSQL.append(" is_lucky_flag=0,");
//                                                 orderInsertSQL.append(" order_status=0,");
//                                                 orderInsertSQL.append(" postage=0.0,");
//                                                 orderInsertSQL.append(" discount_amount=0.0,");
//                                                 orderInsertSQL.append(" goods_amount=0.0,");
//                                                 orderInsertSQL.append(" pay_amount=0.0,");
//                                                 orderInsertSQL.append(" after_sales_status=0,");
//                                                 orderInsertSQL.append(" order_confirm_time=0, ");
//                                                 orderInsertSQL.append(" auditStatus=-9 ");
//
//                                                 PreparedStatement pst = conn.prepareStatement(orderInsertSQL.toString(),Statement.RETURN_GENERATED_KEYS);
//                                                 pst.executeUpdate();
//                                                 ResultSet rs1 = pst.getGeneratedKeys();
//                                                 Long orderId = 0l;
//                                                 if(rs1.next()){
//                                                     orderId= rs1.getLong(1);
//                                                 }
//
////                                                 int r = stmt.executeUpdate(orderInsertSQL.toString());
//
////                                                 var result = orderPddService.insertOrderForMessage(shopId, tid);
//
//                                                 log.info("处理拼多多新订单消息：{tid:" + tid + ",id:" + orderId + "}，添加成功");
//
//                                                 if(rs.isClosed()==false) rs.close();
//                                                 if(rs1.isClosed()==false) rs1.close();
//                                             }
//
//                                         }catch (Exception e){
//                                             log.info("处理拼多多新订单消息错误"+e.getMessage());
//                                         } finally {
//                                             try {
//                                                 if(stmt!=null && stmt.isClosed()==false ) stmt.close();
//                                                 if (conn != null && conn.isClosed()) conn.close();
//                                             }catch (Exception ee){}
//                                         }
//                                     }else if (message.getType().equals("pdd_refund_RefundBuyerReturnGoods")) {
//                                         log.info("----------------------------------------------------------");
//                                         log.info("接收到拼多多退货订单买家发货消息"+JSON.toJSONString(message));
//                                     }
//                                 }
//                             });
////            );
////        WsClient ws = new WsClient(
////                "wss://message-api.pinduoduo.com", clientId,
////                clientSecret, new MessageHandler() {
////            @Override
////            public void onMessage(Message message) throws InterruptedException {
////                log.info("接收拼多多消息中");
////                try {
////                    //业务处理
////                    Long mallId = message.getMallID();
//////                    String tid = message.getContent();
////
////                    if(message.getType().equals("pdd_refund_RefundCreated")){
////                        //新退货订单
////                        log.info("接收到拼多多新退款：" + JSON.toJSONString(message));
////                    }
////
////                    if(message.getType().equals("pdd_trade_TradeConfirmed")){
////                        //新退货订单
////                        log.info("接收到拼多多新订单：" + JSON.toJSONString(message));
////                    }
////
////                }catch (Exception e){
////                    log.info("异常");
////                }
////            }
////        });
////        ws.connect();
////        ws.close();
//        Boolean isRu = PddWsClient.getInstance().getWsClient().isOnline();
//        if(isRu) return "OK";
//        else return "Error";
//
//    }
//
//    @RequestMapping("/pddSocketClose")
//    @ResponseBody
//    public String pddSocketColse(Model model){
//        Boolean isRu = PddWsClient.getInstance().getWsClient().isOnline();
//        if(isRu) {
//            log.info("运行中,手动关闭");
//            PddWsClient.getInstance().getWsClient().close();
//            return "运行中,手动关闭";
//        }
//        else {
//            log.info("关闭中");
//            return "关闭中";
//        }
//    }
//
//
//}
