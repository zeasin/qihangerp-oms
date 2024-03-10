package com.qihang.jd.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.jd.domain.JdOrderAfter;
import com.qihang.jd.service.JdOrderAfterService;
import com.qihang.jd.mapper.JdOrderAfterMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.List;

/**
* @author qilip
* @description 针对表【jd_order_after(京东售后)】的数据库操作Service实现
* @createDate 2024-03-10 18:37:36
*/
@AllArgsConstructor
@Service
public class JdOrderAfterServiceImpl extends ServiceImpl<JdOrderAfterMapper, JdOrderAfter>
    implements JdOrderAfterService{
    private final JdOrderAfterMapper mapper;
    @Override
    public ResultVo<Integer> saveAfter(Integer shopId, JdOrderAfter after) {
       try {
           List<JdOrderAfter> jdOrderAfters = mapper.selectList(new LambdaQueryWrapper<JdOrderAfter>().eq(JdOrderAfter::getApplyId, after.getApplyId()));
           if (jdOrderAfters != null && jdOrderAfters.size() > 0) {
               // 存在，修改
               JdOrderAfter update = new JdOrderAfter();
               update.setId(jdOrderAfters.get(0).getId());
               update.setServiceStatus(after.getServiceStatus());
               update.setServiceStatusName(after.getServiceStatusName());
               update.setApprovePin(after.getApprovePin());
               update.setApproveName(after.getApproveName());
               update.setApproveTime(after.getApproveTime());
               update.setApproveResult(after.getApproveResult());
               update.setApproveResultName(after.getApproveResultName());
               update.setProcessPin(after.getProcessPin());
               update.setProcessName(after.getProcessName());
               update.setProcessTime(after.getProcessTime());
               update.setProcessResult(after.getProcessResult());
               update.setProcessResultName(after.getProcessResultName());
               mapper.updateById(update);
               return new ResultVo<>(ResultVoEnum.DataExist, "退款已经存在，更新成功");
           } else {
               // 新增
               after.setShopId(shopId);
               mapper.insert(after);
               return new ResultVo<>(ResultVoEnum.SUCCESS, "SUCCESS");
           }

       } catch (Exception e) {
           TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
           return new ResultVo<>(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
       }
    }
}




