//package cn.qihangerp.open.jd.service;
//
//import cn.qihangerp.common.PageQuery;
//import cn.qihangerp.common.PageResult;
//import cn.qihangerp.common.ResultVo;
//import cn.qihangerp.open.jd.domain.JdOrderAfter;
//import com.baomidou.mybatisplus.extension.service.IService;
//import cn.qihangerp.open.jd.domain.bo.JdAfterBo;
//
///**
//* @author qilip
//* @description 针对表【jd_order_after(京东售后)】的数据库操作Service
//* @createDate 2024-03-10 18:37:36
//*/
//public interface JdOrderAfterService extends IService<JdOrderAfter> {
//    PageResult<JdOrderAfter> queryPageList(JdAfterBo bo, PageQuery pageQuery);
//    ResultVo<Integer> saveAfter(Integer shopId,JdOrderAfter after);
//    ResultVo<Long> updateAfterStatusByServiceId(JdOrderAfter after);
//}
