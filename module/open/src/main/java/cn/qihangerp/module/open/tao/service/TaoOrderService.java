package cn.qihangerp.module.open.tao.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;

import cn.qihangerp.module.open.tao.domain.bo.TaoOrderBo;
import cn.qihangerp.module.open.tao.domain.TaoOrder;
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @author TW
* @description 针对表【tao_order(淘宝订单表)】的数据库操作Service
* @createDate 2024-02-29 19:01:11
*/
public interface TaoOrderService extends IService<TaoOrder> {

    PageResult<TaoOrder> queryPageList(TaoOrderBo bo, PageQuery pageQuery);

    TaoOrder queryDetailById(Long id);
    TaoOrder queryDetailByTid(String tid);
    /**
     * 保存店铺订单
     * @param shopId
     * @param order
     * @return
     */
    ResultVo<Long> saveOrder(Long shopId, TaoOrder order);
    ResultVo<Integer> updateOrder(TaoOrder order);
}
