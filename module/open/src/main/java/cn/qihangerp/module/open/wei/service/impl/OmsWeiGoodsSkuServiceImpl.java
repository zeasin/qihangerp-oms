package cn.qihangerp.module.open.wei.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.open.wei.domain.OmsWeiGoodsSku;
import cn.qihangerp.module.open.wei.mapper.OmsWeiGoodsSkuMapper;
import cn.qihangerp.module.open.wei.service.OmsWeiGoodsSkuService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【oms_wei_goods_sku】的数据库操作Service实现
* @createDate 2024-06-03 16:51:29
*/
@AllArgsConstructor
@Service
public class OmsWeiGoodsSkuServiceImpl extends ServiceImpl<OmsWeiGoodsSkuMapper, OmsWeiGoodsSku>
    implements OmsWeiGoodsSkuService {
    private final  OmsWeiGoodsSkuMapper mapper;

    @Override
    public PageResult<OmsWeiGoodsSku> queryPageList(OmsWeiGoodsSku bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OmsWeiGoodsSku> queryWrapper = new LambdaQueryWrapper<OmsWeiGoodsSku>()
                .eq(bo.getShopId()!=null,OmsWeiGoodsSku::getShopId,bo.getShopId())
                ;

        Page<OmsWeiGoodsSku> page = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(page);
    }
}




