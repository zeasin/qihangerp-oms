package com.qihang.jd.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.jd.domain.JdRefund;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.jd.domain.bo.JdAfterBo;

/**
* @author qilip
* @description 针对表【jd_refund】的数据库操作Service
* @createDate 2024-03-09 11:29:59
*/
public interface JdRefundService extends IService<JdRefund> {
    PageResult<JdRefund> queryPageList(JdAfterBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveRefund(Integer shopId, JdRefund refund);
}
