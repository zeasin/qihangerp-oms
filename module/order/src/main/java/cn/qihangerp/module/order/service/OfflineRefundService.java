package cn.qihangerp.module.order.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;

import cn.qihangerp.module.order.domain.OfflineRefund;
import cn.qihangerp.request.RefundSearchRequest;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【offline_refund(线下渠道退款表)】的数据库操作Service
* @createDate 2024-09-16 13:31:26
*/
public interface OfflineRefundService extends IService<OfflineRefund> {
    PageResult<OfflineRefund> queryPageList(RefundSearchRequest bo, PageQuery pageQuery);
}
