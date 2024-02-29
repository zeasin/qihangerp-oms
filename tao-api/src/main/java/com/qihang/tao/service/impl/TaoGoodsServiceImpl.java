package com.qihang.tao.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.tao.common.PageQuery;
import com.qihang.tao.common.PageResult;
import com.qihang.tao.domain.TaoGoods;
import com.qihang.tao.domain.bo.TaoGoodsBo;
import com.qihang.tao.service.TaoGoodsService;
import com.qihang.tao.mapper.TaoGoodsMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【tao_goods】的数据库操作Service实现
* @createDate 2024-02-29 09:28:38
*/
@AllArgsConstructor
@Service
public class TaoGoodsServiceImpl extends ServiceImpl<TaoGoodsMapper, TaoGoods>
    implements TaoGoodsService {

    private final TaoGoodsMapper mapper;

    @Override
    public PageResult<TaoGoods> queryPageList(TaoGoodsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<TaoGoods> queryWrapper = new LambdaQueryWrapper<>();
        Page<TaoGoods> taoGoodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(taoGoodsPage);
    }
}




