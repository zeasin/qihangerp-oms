//package com.qihang.jd.service.impl;
//
//import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
//import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
//import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
//import com.qihang.common.common.PageQuery;
//import com.qihang.common.common.PageResult;
//import com.qihang.common.common.ResultVo;
//import com.qihang.common.common.ResultVoEnum;
//import com.qihang.jd.domain.bo.JdAfterBo;
//import com.qihang.jd.service.JdRefundService;
//import lombok.AllArgsConstructor;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.transaction.interceptor.TransactionAspectSupport;
//
//import java.util.List;
//
///**
//* @author qilip
//* @description 针对表【jd_refund】的数据库操作Service实现
//* @createDate 2024-03-09 11:29:59
//*/
//@AllArgsConstructor
//@Service
//public class JdRefundServiceImpl extends ServiceImpl<JdRefundMapper, JdRefund>
//    implements JdRefundService{
//    private final JdRefundMapper mapper;
//
//    @Override
//    public PageResult<JdRefund> queryPageList(JdAfterBo bo, PageQuery pageQuery) {
//        LambdaQueryWrapper<JdRefund> queryWrapper = new LambdaQueryWrapper<JdRefund>()
//                .eq(bo.getShopId()!=null,JdRefund::getShopId,bo.getShopId());
//
//        Page<JdRefund> page = mapper.selectPage(pageQuery.build(), queryWrapper);
//
//        return PageResult.build(page);
//    }
//
//    @Transactional
//    @Override
//    public ResultVo<Integer> saveRefund(Integer shopId, JdRefund refund) {
//        try {
//            List<JdRefund> jdRefunds = mapper.selectList(new LambdaQueryWrapper<JdRefund>().eq(JdRefund::getRefundId, refund.getRefundId()));
//            if (jdRefunds != null && jdRefunds.size() > 0) {
//                // 存在，修改
//                JdRefund update = new JdRefund();
//                update.setId(jdRefunds.get(0).getId());
//                update.setCheckTime(refund.getCheckTime());
//                update.setCheckUsername(refund.getCheckUsername());
//                update.setStatus(refund.getStatus());
//                mapper.updateById(update);
//                return ResultVo.error(ResultVoEnum.DataExist, "退款已经存在，更新成功");
//            } else {
//                // 不存在，新增
//                refund.setShopId(shopId);
//                mapper.insert(refund);
//                return  ResultVo.success();
//            }
//        } catch (Exception e) {
//            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//            return ResultVo.error(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
//        }
//    }
//}
//
//
//
//
