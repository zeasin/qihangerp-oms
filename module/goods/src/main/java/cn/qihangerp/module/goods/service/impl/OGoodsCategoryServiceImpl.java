package cn.qihangerp.module.goods.service.impl;

import cn.qihangerp.module.goods.domain.OGoodsCategoryAttribute;
import cn.qihangerp.module.goods.domain.OGoodsCategoryAttributeValue;
import cn.qihangerp.module.goods.mapper.OGoodsCategoryAttributeMapper;
import cn.qihangerp.module.goods.mapper.OGoodsCategoryAttributeValueMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.module.goods.domain.OGoodsCategory;
import cn.qihangerp.module.goods.service.OGoodsCategoryService;
import cn.qihangerp.module.goods.mapper.OGoodsCategoryMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
* @author qilip
* @description 针对表【o_goods_category】的数据库操作Service实现
* @createDate 2024-09-07 16:11:56
*/
@AllArgsConstructor
@Service
public class OGoodsCategoryServiceImpl extends ServiceImpl<OGoodsCategoryMapper, OGoodsCategory>
    implements OGoodsCategoryService{
    private final OGoodsCategoryMapper oGoodsCategoryMapper;
    private final OGoodsCategoryAttributeMapper attributeMapper;
    private final OGoodsCategoryAttributeValueMapper attributeValueMapper;
    @Transactional
    @Override
    public void addCategory(OGoodsCategory category) {
        // 添加分类
        if(category.getSort()==null){
            category.setSort(0);
        }
        if(category.getParentId()==null){
            category.setParentId(0L);
        }
        category.setCreateTime(new Date());
        category.setIsdelete(0);
        oGoodsCategoryMapper.insert(category);
        // 如果是已经分类，添加默认规格
        if(category.getParentId()==0) {
            // 添加颜色规格
            OGoodsCategoryAttribute att1 = new OGoodsCategoryAttribute();
            att1.setCategoryId(category.getId());
            att1.setType(1);
            att1.setTitle("颜色");
            att1.setCode("color");
            attributeMapper.insert(att1);
            // 添加颜色规格值
            OGoodsCategoryAttributeValue av1 = new OGoodsCategoryAttributeValue();
            av1.setCategoryAttributeId(att1.getId());
            av1.setValue("默认");
            av1.setSkuCode("00");
            av1.setOrdernum(0);
            av1.setIsdelete(0);
            attributeValueMapper.insert(av1);

        }
    }
}




