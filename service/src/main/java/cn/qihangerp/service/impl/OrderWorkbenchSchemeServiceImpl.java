package cn.qihangerp.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.enums.EnumEnableStatus;
import cn.qihangerp.mapper.OrderSearchSchemeMapper;
import cn.qihangerp.model.entity.OrderSearchScheme;
import cn.qihangerp.service.OrderWorkbenchSchemeService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 订单处理工作台-组合条件方案服务实现
 * conditions 为前端筛选面板生成的 JSON，服务端只校验非空与长度并原样存储
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Slf4j
@Service
@AllArgsConstructor
public class OrderWorkbenchSchemeServiceImpl implements OrderWorkbenchSchemeService {

    private final OrderSearchSchemeMapper schemeMapper;

    @Override
    public PageResult<OrderSearchScheme> queryPageList(OrderSearchScheme bo, Long merchantId, PageQuery pageQuery) {
        if (bo == null) bo = new OrderSearchScheme();
        LambdaQueryWrapper<OrderSearchScheme> wrapper = new LambdaQueryWrapper<OrderSearchScheme>()
                .eq(merchantId != null, OrderSearchScheme::getMerchantId, merchantId)
                .like(StringUtils.hasText(bo.getName()), OrderSearchScheme::getName, bo.getName())
                .eq(bo.getStatus() != null, OrderSearchScheme::getStatus, bo.getStatus())
                .orderByAsc(OrderSearchScheme::getSort)
                .orderByAsc(OrderSearchScheme::getId);
        Page<OrderSearchScheme> page = schemeMapper.selectPage(pageQuery.build(), wrapper);
        return PageResult.build(page);
    }

    @Override
    public List<OrderSearchScheme> listEnabled(Long merchantId) {
        LambdaQueryWrapper<OrderSearchScheme> wrapper = new LambdaQueryWrapper<OrderSearchScheme>()
                .eq(OrderSearchScheme::getStatus, EnumEnableStatus.ENABLED.getIndex());
        if (merchantId != null) {
            wrapper.and(w -> w.eq(OrderSearchScheme::getMerchantId, merchantId).or().eq(OrderSearchScheme::getMerchantId, 0L));
        }
        wrapper.orderByAsc(OrderSearchScheme::getSort)
                .orderByAsc(OrderSearchScheme::getId);
        return schemeMapper.selectList(wrapper);
    }

    @Override
    public OrderSearchScheme getInfo(Long id) {
        return schemeMapper.selectById(id);
    }

    @Override
    public ResultVo<Long> add(OrderSearchScheme bo, Long merchantId, String username) {
        ResultVo<Void> check = validate(bo);
        if (check.getCode() != 0) return ResultVo.error(check.getMsg());
        if (StringUtils.hasText(bo.getName())) {
            Long count = schemeMapper.selectCount(new LambdaQueryWrapper<OrderSearchScheme>()
                    .eq(OrderSearchScheme::getName, bo.getName())
                    .eq(OrderSearchScheme::getMerchantId, merchantId == null ? 0L : merchantId));
            if (count != null && count > 0) return ResultVo.error("方案名称已存在：" + bo.getName());
        }

        bo.setMerchantId(merchantId == null ? 0L : merchantId);
        bo.setOpBy(username);
        bo.setStatus(bo.getStatus() != null ? bo.getStatus() : EnumEnableStatus.ENABLED.getIndex());
        bo.setCreateTime(LocalDateTime.now());
        schemeMapper.insert(bo);
        return ResultVo.success(bo.getId());
    }

    @Override
    public ResultVo<Void> edit(OrderSearchScheme bo, Long merchantId, String username) {
        if (bo.getId() == null) return ResultVo.error("ID不能为空");
        OrderSearchScheme exist = schemeMapper.selectById(bo.getId());
        if (exist == null) return ResultVo.error("方案不存在");
        ResultVo<Void> ownership = checkOwnership(exist, merchantId);
        if (ownership.getCode() != 0) return ownership;
        String name = StringUtils.hasText(bo.getName()) ? bo.getName() : exist.getName();
        String conditions = StringUtils.hasText(bo.getConditions()) ? bo.getConditions() : exist.getConditions();

        OrderSearchScheme check = new OrderSearchScheme();
        check.setName(name);
        check.setConditions(conditions);
        ResultVo<Void> checkResult = validate(check);
        if (checkResult.getCode() != 0) return checkResult;
        if (!name.equals(exist.getName())) {
            Long count = schemeMapper.selectCount(new LambdaQueryWrapper<OrderSearchScheme>()
                    .eq(OrderSearchScheme::getName, name)
                    .eq(OrderSearchScheme::getMerchantId, exist.getMerchantId())
                    .ne(OrderSearchScheme::getId, bo.getId()));
            if (count != null && count > 0) return ResultVo.error("方案名称已存在：" + name);
        }

        LambdaUpdateWrapper<OrderSearchScheme> upd = new LambdaUpdateWrapper<OrderSearchScheme>()
                .eq(OrderSearchScheme::getId, bo.getId())
                .set(OrderSearchScheme::getName, name)
                .set(OrderSearchScheme::getConditions, conditions)
                .set(OrderSearchScheme::getSort, bo.getSort() == null ? exist.getSort() : bo.getSort())
                .set(OrderSearchScheme::getUpdateTime, LocalDateTime.now());
        schemeMapper.update(null, upd);
        return ResultVo.success();
    }

    @Override
    public ResultVo<Void> remove(Long id, Long merchantId) {
        if (id == null) return ResultVo.error("ID不能为空");
        OrderSearchScheme exist = schemeMapper.selectById(id);
        if (exist == null) return ResultVo.error("方案不存在");
        ResultVo<Void> ownership = checkOwnership(exist, merchantId);
        if (ownership.getCode() != 0) return ownership;
        schemeMapper.deleteById(id);
        return ResultVo.success();
    }

    @Override
    public ResultVo<Void> setStatus(Long id, Integer status, Long merchantId, String username) {
        if (id == null) return ResultVo.error("ID不能为空");
        if (status == null || (status != EnumEnableStatus.DISABLED.getIndex() && status != EnumEnableStatus.ENABLED.getIndex())) {
            return ResultVo.error("状态值不正确");
        }
        OrderSearchScheme exist = schemeMapper.selectById(id);
        if (exist == null) return ResultVo.error("方案不存在");
        ResultVo<Void> ownership = checkOwnership(exist, merchantId);
        if (ownership.getCode() != 0) return ownership;
        OrderSearchScheme update = new OrderSearchScheme();
        update.setId(id);
        update.setStatus(status);
        update.setUpdateTime(LocalDateTime.now());
        schemeMapper.updateById(update);
        return ResultVo.success();
    }

    /**
     * 归属守卫：总部身份（merchantId=null）不限；商户身份仅可操作本商户自建方案
     */
    private ResultVo<Void> checkOwnership(OrderSearchScheme exist, Long merchantId) {
        if (merchantId != null && !merchantId.equals(exist.getMerchantId())) {
            return ResultVo.error("无权操作该方案");
        }
        return ResultVo.success();
    }

    /** 名称与条件 JSON 基础校验 */
    private ResultVo<Void> validate(OrderSearchScheme bo) {
        if (!StringUtils.hasText(bo.getName())) return ResultVo.error("方案名称不能为空");
        if (bo.getName().length() > 50) return ResultVo.error("方案名称不能超过50个字符");
        if (!StringUtils.hasText(bo.getConditions())) return ResultVo.error("筛选条件不能为空");
        if (bo.getConditions().length() > 5000) return ResultVo.error("筛选条件过长，请精简后保存");
        return ResultVo.success();
    }
}
