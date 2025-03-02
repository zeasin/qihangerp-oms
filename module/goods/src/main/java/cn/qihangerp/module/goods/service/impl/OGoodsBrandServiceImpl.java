package cn.qihangerp.module.goods.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.goods.domain.OGoodsBrand;
import cn.qihangerp.module.goods.service.OGoodsBrandService;
import cn.qihangerp.module.goods.mapper.OGoodsBrandMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author qilip
* @description 针对表【o_goods_brand】的数据库操作Service实现
* @createDate 2024-09-07 16:11:56
*/
@AllArgsConstructor
@Service
public class OGoodsBrandServiceImpl extends ServiceImpl<OGoodsBrandMapper, OGoodsBrand>
    implements OGoodsBrandService {
    private final OGoodsBrandMapper mapper;

    @Override
    public PageResult<OGoodsBrand> queryPageList(OGoodsBrand bo, PageQuery pageQuery) {

        LambdaQueryWrapper<OGoodsBrand> queryWrapper = new LambdaQueryWrapper<OGoodsBrand>();

        queryWrapper.like(StringUtils.hasText(bo.getName()), OGoodsBrand::getName, bo.getName());
        Page<OGoodsBrand> pages = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }

}




