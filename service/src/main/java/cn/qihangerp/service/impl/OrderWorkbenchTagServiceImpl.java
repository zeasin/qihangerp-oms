package cn.qihangerp.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.enums.EnumEnableStatus;
import cn.qihangerp.mapper.OOrderMapper;
import cn.qihangerp.mapper.OrderTagMapper;
import cn.qihangerp.model.bo.OrderTagApplyBo;
import cn.qihangerp.model.entity.OOrder;
import cn.qihangerp.model.entity.OrderTag;
import cn.qihangerp.service.OrderWorkbenchTagService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 订单处理工作台-用户自建标签服务实现
 * 打标/撤标：逐单读取 o_order.tag → 追加/移除标签ID（LinkedHashSet 保序去重）→ 整串回写
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Slf4j
@Service
@AllArgsConstructor
public class OrderWorkbenchTagServiceImpl implements OrderWorkbenchTagService {

    private final OrderTagMapper tagMapper;
    private final OOrderMapper orderMapper;

    @Override
    public PageResult<OrderTag> queryPageList(OrderTag bo, Long merchantId, PageQuery pageQuery) {
        if (bo == null) bo = new OrderTag();
        LambdaQueryWrapper<OrderTag> wrapper = new LambdaQueryWrapper<OrderTag>()
                .eq(merchantId != null, OrderTag::getMerchantId, merchantId)
                .like(StringUtils.hasText(bo.getName()), OrderTag::getName, bo.getName())
                .eq(bo.getStatus() != null, OrderTag::getStatus, bo.getStatus())
                .orderByAsc(OrderTag::getSort)
                .orderByAsc(OrderTag::getId);
        Page<OrderTag> page = tagMapper.selectPage(pageQuery.build(), wrapper);
        return PageResult.build(page);
    }

    @Override
    public List<OrderTag> listEnabled(Long merchantId) {
        LambdaQueryWrapper<OrderTag> wrapper = new LambdaQueryWrapper<OrderTag>()
                .eq(OrderTag::getStatus, EnumEnableStatus.ENABLED.getIndex());
        if (merchantId != null) {
            wrapper.and(w -> w.eq(OrderTag::getMerchantId, merchantId).or().eq(OrderTag::getMerchantId, 0L));
        }
        wrapper.orderByAsc(OrderTag::getSort)
                .orderByAsc(OrderTag::getId);
        return tagMapper.selectList(wrapper);
    }

    @Override
    public List<OrderTag> listEnabledByPool(Integer bindPool) {
        if (bindPool == null) return new ArrayList<>();
        return tagMapper.selectList(new LambdaQueryWrapper<OrderTag>()
                .eq(OrderTag::getBindPool, bindPool)
                .eq(OrderTag::getStatus, EnumEnableStatus.ENABLED.getIndex())
                .orderByAsc(OrderTag::getSort)
                .orderByAsc(OrderTag::getId));
    }

    @Override
    public ResultVo<Long> add(OrderTag bo, Long merchantId, String username) {
        if (!StringUtils.hasText(bo.getName())) return ResultVo.error("标签名称不能为空");
        if (bo.getName().length() > 50) return ResultVo.error("标签名称不能超过50个字符");
        Long count = tagMapper.selectCount(new LambdaQueryWrapper<OrderTag>()
                .eq(OrderTag::getName, bo.getName())
                .eq(OrderTag::getMerchantId, merchantId == null ? 0L : merchantId));
        if (count != null && count > 0) return ResultVo.error("标签名称已存在：" + bo.getName());

        bo.setMerchantId(merchantId == null ? 0L : merchantId);
        bo.setOpBy(username);
        bo.setStatus(bo.getStatus() != null ? bo.getStatus() : EnumEnableStatus.ENABLED.getIndex());
        bo.setBindPool(bo.getBindPool() == null ? 0 : bo.getBindPool());
        bo.setCreateTime(LocalDateTime.now());
        tagMapper.insert(bo);
        return ResultVo.success(bo.getId());
    }

    @Override
    public ResultVo<Void> edit(OrderTag bo, String username) {
        if (bo.getId() == null) return ResultVo.error("ID不能为空");
        OrderTag exist = tagMapper.selectById(bo.getId());
        if (exist == null) return ResultVo.error("标签不存在");
        if (StringUtils.hasText(bo.getName()) && !bo.getName().equals(exist.getName())) {
            Long count = tagMapper.selectCount(new LambdaQueryWrapper<OrderTag>()
                    .eq(OrderTag::getName, bo.getName())
                    .eq(OrderTag::getMerchantId, exist.getMerchantId())
                    .ne(OrderTag::getId, bo.getId()));
            if (count != null && count > 0) return ResultVo.error("标签名称已存在：" + bo.getName());
        }

        LambdaUpdateWrapper<OrderTag> upd = new LambdaUpdateWrapper<OrderTag>()
                .eq(OrderTag::getId, bo.getId())
                .set(OrderTag::getName, StringUtils.hasText(bo.getName()) ? bo.getName() : exist.getName())
                .set(OrderTag::getColor, StringUtils.hasText(bo.getColor()) ? bo.getColor() : exist.getColor())
                .set(OrderTag::getSort, bo.getSort() == null ? exist.getSort() : bo.getSort())
                .set(OrderTag::getBindPool, bo.getBindPool() == null ? exist.getBindPool() : bo.getBindPool())
                .set(OrderTag::getUpdateTime, LocalDateTime.now());
        tagMapper.update(null, upd);
        return ResultVo.success();
    }

    @Override
    public ResultVo<Void> setStatus(Long id, Integer status, String username) {
        if (id == null) return ResultVo.error("ID不能为空");
        if (status == null || (status != EnumEnableStatus.DISABLED.getIndex() && status != EnumEnableStatus.ENABLED.getIndex())) {
            return ResultVo.error("状态值不正确");
        }
        OrderTag update = new OrderTag();
        update.setId(id);
        update.setStatus(status);
        update.setUpdateTime(LocalDateTime.now());
        tagMapper.updateById(update);
        return ResultVo.success();
    }

    @Override
    public ResultVo<Void> remove(Long id, String username) {
        if (id == null) return ResultVo.error("ID不能为空");
        OrderTag exist = tagMapper.selectById(id);
        if (exist == null) return ResultVo.error("标签不存在");
        tagMapper.deleteById(id);
        return ResultVo.success();
    }

    @Override
    public ResultVo<String> applyTags(OrderTagApplyBo bo, List<Long> merchantIds, String username) {
        if (bo.getAction() == null || (bo.getAction() != 1 && bo.getAction() != 0)) {
            return ResultVo.error("动作不正确：1=打标，0=撤标");
        }
        if (bo.getOrderIds() == null || bo.getOrderIds().isEmpty()) return ResultVo.error("请先勾选订单");
        if (bo.getTagIds() == null || bo.getTagIds().isEmpty()) return ResultVo.error("请选择标签");

        Map<Long, OrderTag> tagMap = tagMapper.selectBatchIds(bo.getTagIds()).stream()
                .collect(Collectors.toMap(OrderTag::getId, Function.identity()));
        for (Long tagId : bo.getTagIds()) {
            OrderTag tag = tagMap.get(tagId);
            if (tag == null) return ResultVo.error("标签不存在：ID=" + tagId);
            if (bo.getAction() == 1 && tag.getStatus() != EnumEnableStatus.ENABLED.getIndex()) {
                return ResultVo.error("标签已停用，不能打标：" + tag.getName());
            }
        }

        Set<String> tagIdSet = bo.getTagIds().stream().map(String::valueOf).collect(Collectors.toSet());
        List<OOrder> orders = orderMapper.selectBatchIds(bo.getOrderIds());
        if (orders.size() != new LinkedHashSet<>(bo.getOrderIds()).size()) {
            return ResultVo.error("存在无效订单ID，请刷新列表后重试");
        }

        int updated = 0;
        int skipped = 0;
        LocalDateTime now = LocalDateTime.now();
        for (OOrder order : orders) {
            if (merchantIds != null && !merchantIds.contains(order.getMerchantId())) {
                skipped++;
                continue;
            }
            LinkedHashSet<String> ids = parseTagIds(order.getTag());
            if (bo.getAction() == 1) {
                ids.addAll(tagIdSet);
            } else {
                ids.removeAll(tagIdSet);
            }
            String joined = String.join(",", ids);
            if (joined.equals(order.getTag() == null ? "" : order.getTag())) {
                continue;
            }
            orderMapper.update(null, new LambdaUpdateWrapper<OOrder>()
                    .eq(OOrder::getId, order.getId())
                    .set(OOrder::getTag, joined)
                    .set(OOrder::getUpdateTime, now));
            updated++;
        }
        log.info("======订单批量{}======操作人={}，选中={}单，更新={}单，越权跳过={}单",
                bo.getAction() == 1 ? "打标" : "撤标", username, orders.size(), updated, skipped);
        String msg = bo.getAction() == 1 ? "打标" : "撤标";
        if (skipped > 0) {
            return ResultVo.success(String.format("%s成功 %d 单，%d 单无权限已跳过", msg, updated, skipped));
        }
        return ResultVo.success(String.format("%s成功 %d 单", msg, updated));
    }

    @Override
    public List<OrderTag> listByIds(String tagIds) {
        if (!StringUtils.hasText(tagIds)) return new ArrayList<>();
        List<Long> ids = parseTagIds(tagIds).stream()
                .map(Long::valueOf)
                .filter(id -> id > 0)
                .collect(Collectors.toList());
        if (ids.isEmpty()) return new ArrayList<>();
        return tagMapper.selectBatchIds(ids);
    }

    /** 解析订单标签串（逗号分隔ID）为保序去重集合，过滤非法片段 */
    private LinkedHashSet<String> parseTagIds(String tag) {
        LinkedHashSet<String> result = new LinkedHashSet<>();
        if (!StringUtils.hasText(tag)) return result;
        Arrays.stream(tag.split(","))
                .map(String::trim)
                .filter(s -> s.matches("\\d+"))
                .forEach(result::add);
        return result;
    }
}
