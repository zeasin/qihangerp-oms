package cn.qihangerp.module.open.dou.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;

import cn.qihangerp.module.open.dou.domain.DouRefund;
import cn.qihangerp.module.open.dou.domain.bo.DouRefundBo;
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @author TW
* @description 针对表【dou_refund(抖店退款表)】的数据库操作Service
* @createDate 2024-06-06 16:48:38
*/
public interface DouRefundService extends IService<DouRefund> {
    PageResult<DouRefund> queryPageList(DouRefundBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveRefund(Long shopId, DouRefund refund);
    DouRefund queryByAftersaleId(String aftersaleId);
}
