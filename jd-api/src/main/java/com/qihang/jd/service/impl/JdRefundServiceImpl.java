package com.qihang.jd.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.jd.domain.JdOrder;
import com.qihang.jd.domain.JdOrderItem;
import com.qihang.jd.domain.JdRefund;
import com.qihang.jd.service.JdRefundService;
import com.qihang.jd.mapper.JdRefundMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.Date;
import java.util.List;

/**
* @author qilip
* @description 针对表【jd_refund】的数据库操作Service实现
* @createDate 2024-03-09 11:29:59
*/
@AllArgsConstructor
@Service
public class JdRefundServiceImpl extends ServiceImpl<JdRefundMapper, JdRefund>
    implements JdRefundService{
    private final JdRefundMapper mapper;

    @Transactional
    @Override
    public ResultVo<Integer> saveRefund(Integer shopId, JdRefund refund) {
        try {
            List<JdRefund> jdRefunds = mapper.selectList(new LambdaQueryWrapper<JdRefund>().eq(JdRefund::getRefundId, refund.getRefundId()));
            if (jdRefunds != null && jdRefunds.size() > 0) {
                // 存在，修改
                JdRefund update = new JdRefund();
                update.setId(jdRefunds.get(0).getId());
                update.setCheckTime(refund.getCheckTime());
                update.setCheckUsername(refund.getCheckUsername());
                update.setStatus(refund.getStatus());
                mapper.updateById(update);
                return new ResultVo<>(ResultVoEnum.DataExist, "退款已经存在，更新成功");
            } else {
                // 不存在，新增
                refund.setShopId(shopId);
                mapper.insert(refund);
                return new ResultVo<>(ResultVoEnum.SUCCESS, "SUCCESS");
            }
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return new ResultVo<>(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
        }
    }
}




