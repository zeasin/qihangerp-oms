//package com.qihang.tao.service;
//
//import com.qihang.common.common.PageQuery;
//import com.qihang.common.common.PageResult;
//import com.qihang.common.common.ResultVo;
//import com.qihang.tao.domain.TaoGoods;
//import com.qihang.tao.domain.TaoOrder;
//import com.baomidou.mybatisplus.extension.service.IService;
//import com.qihang.tao.domain.bo.TaoGoodsBo;
//import com.qihang.tao.domain.bo.TaoOrderBo;
//
///**
//* @author TW
//* @description 针对表【tao_order(淘宝订单表)】的数据库操作Service
//* @createDate 2024-02-29 19:01:11
//*/
//public interface TaoOrderService extends IService<TaoOrder> {
//
//    PageResult<TaoOrder> queryPageList(TaoOrderBo bo, PageQuery pageQuery);
//    /**
//     * 保存店铺订单
//     * @param shopId
//     * @param order
//     * @return
//     */
//    ResultVo<Integer> saveOrder(Integer shopId, TaoOrder order);
//}
