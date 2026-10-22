package cn.qihangerp.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.model.bo.OrderTagApplyBo;
import cn.qihangerp.model.entity.OrderTag;

import java.util.List;

/**
 * 订单处理工作台-用户自建标签服务
 * 标签按商户隔离（merchant_id=0 为总部公共标签）
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
public interface OrderWorkbenchTagService {

    PageResult<OrderTag> queryPageList(OrderTag bo, Long merchantId, PageQuery pageQuery);

    List<OrderTag> listEnabled(Long merchantId);

    /**
     * 按状态池查启用分类标签（转异常弹窗单选数据源）
     */
    List<OrderTag> listEnabledByPool(Integer bindPool);

    ResultVo<Long> add(OrderTag bo, Long merchantId, String username);

    ResultVo<Void> edit(OrderTag bo, String username);

    ResultVo<Void> setStatus(Long id, Integer status, String username);

    ResultVo<Void> remove(Long id, String username);

    /**
     * 批量打标/撤标：逐单读取 o_order.tag，按动作追加/移除去重后整串回写
     */
    ResultVo<String> applyTags(OrderTagApplyBo bo, List<Long> merchantIds, String username);

    /**
     * 按订单已打标签ID串解析标签列表（含已停用）
     */
    List<OrderTag> listByIds(String tagIds);
}
