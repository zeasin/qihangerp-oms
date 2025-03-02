package cn.qihangerp.module.order.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.order.domain.OfflineRefund;
import cn.qihangerp.module.order.mapper.OfflineRefundMapper;
import cn.qihangerp.module.order.service.OfflineRefundService;
import cn.qihangerp.request.RefundSearchRequest;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【offline_refund(线下渠道退款表)】的数据库操作Service实现
* @createDate 2024-09-16 13:31:26
*/
@AllArgsConstructor
@Service
public class OfflineRefundServiceImpl extends ServiceImpl<OfflineRefundMapper, OfflineRefund>
    implements OfflineRefundService {
    private final OfflineRefundMapper refundMapper;

    @Override
    public PageResult<OfflineRefund> queryPageList(RefundSearchRequest bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OfflineRefund> queryWrapper = new LambdaQueryWrapper<OfflineRefund>();

        Page<OfflineRefund> pages = refundMapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }
}




