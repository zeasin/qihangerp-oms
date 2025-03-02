package cn.qihangerp.module.goods.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.goods.domain.OGoodsSupplier;
import cn.qihangerp.module.goods.service.OGoodsSupplierService;
import cn.qihangerp.module.goods.mapper.OGoodsSupplierMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author qilip
* @description 针对表【o_goods_supplier】的数据库操作Service实现
* @createDate 2024-09-07 16:35:43
*/
@AllArgsConstructor
@Service
public class OGoodsSupplierServiceImpl extends ServiceImpl<OGoodsSupplierMapper, OGoodsSupplier>
    implements OGoodsSupplierService{
    private final OGoodsSupplierMapper mapper;

    @Override
    public PageResult<OGoodsSupplier> queryPageList(OGoodsSupplier bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OGoodsSupplier> queryWrapper = new LambdaQueryWrapper<OGoodsSupplier>();

        queryWrapper.like(StringUtils.hasText(bo.getName()), OGoodsSupplier::getName, bo.getName());
        Page<OGoodsSupplier> pages = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }
}




