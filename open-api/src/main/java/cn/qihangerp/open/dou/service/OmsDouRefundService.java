package cn.qihangerp.open.dou.service;

import com.baomidou.mybatisplus.extension.service.IService;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.open.dou.domain.OmsDouRefund;
import cn.qihangerp.open.dou.domain.bo.DouRefundBo;

/**
* @author TW
* @description 针对表【oms_dou_refund(抖店退款表)】的数据库操作Service
* @createDate 2024-06-20 16:59:03
*/
public interface OmsDouRefundService extends IService<OmsDouRefund> {
    PageResult<OmsDouRefund> queryPageList(DouRefundBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveRefund(Long shopId, OmsDouRefund refund);
}
