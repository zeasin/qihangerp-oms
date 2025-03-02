//package cn.qihangerp.open.jd.service;
//
//import cn.qihangerp.common.PageQuery;
//import cn.qihangerp.common.PageResult;
//import cn.qihangerp.common.ResultVo;
//import cn.qihangerp.open.jd.domain.JdVcPurchaseOrder;
//import com.baomidou.mybatisplus.extension.service.IService;
//import cn.qihangerp.open.jd.domain.bo.JdOrderBo;
//
///**
//* @author TW
//* @description 针对表【jd_vc_purchase_order(京东自营采购订单表)】的数据库操作Service
//* @createDate 2024-05-29 15:43:05
//*/
//public interface JdVcPurchaseOrderService extends IService<JdVcPurchaseOrder> {
//    PageResult<JdVcPurchaseOrder> queryPageList(JdOrderBo bo, PageQuery pageQuery);
//    ResultVo<Integer> saveOrder(Long shopId, JdVcPurchaseOrder order);
//}
