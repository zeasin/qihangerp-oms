//package com.qihang.tao.service;
//
//import com.qihang.common.common.PageQuery;
//import com.qihang.common.common.PageResult;
//import com.qihang.tao.domain.TaoRefund;
//import com.baomidou.mybatisplus.extension.service.IService;
//import com.qihang.tao.domain.bo.TaoOrderBo;
//import com.qihang.tao.domain.bo.TaoRefundBo;
//
///**
//* @author TW
//* @description 针对表【tao_refund(淘宝退款订单表)】的数据库操作Service
//* @createDate 2024-02-29 19:01:45
//*/
//public interface TaoRefundService extends IService<TaoRefund> {
//    PageResult<TaoRefund> queryPageList(TaoRefundBo bo, PageQuery pageQuery);
//    int saveAndUpdateRefund(Integer shopId,TaoRefund refund);
//}
