package cn.qihangerp.module.open.jd.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.open.jd.domain.JdGoodsSku;
import cn.qihangerp.module.open.jd.domain.bo.JdGoodsBo;
import cn.qihangerp.module.open.jd.domain.vo.JdGoodsSkuListVo;
import cn.qihangerp.module.open.jd.service.JdGoodsSkuService;
import cn.qihangerp.module.open.jd.mapper.JdGoodsSkuMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author qilip
* @description 针对表【jd_goods_sku】的数据库操作Service实现
* @createDate 2024-03-09 20:44:11
*/
@AllArgsConstructor
@Service
public class JdGoodsSkuServiceImpl extends ServiceImpl<JdGoodsSkuMapper, JdGoodsSku>
    implements JdGoodsSkuService{
    private final JdGoodsSkuMapper mapper;
    @Override
    public PageResult<JdGoodsSkuListVo> queryPageList(JdGoodsBo bo, PageQuery pageQuery) {
        if(StringUtils.hasText(bo.getOuterId())){
            bo.setOuterId(bo.getOuterId().trim());
        }
        IPage<JdGoodsSkuListVo> result = mapper.selectSkuPageList(pageQuery.build(), bo.getShopId(),bo.getWareId(),bo.getSkuId(),bo.getOuterId(),bo.getHasLink());
        return PageResult.build(result);
    }
}




