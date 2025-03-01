package cn.qihangerp.module.goods.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;

import cn.qihangerp.module.goods.domain.OGoods;
import cn.qihangerp.module.goods.domain.OGoodsSku;
import cn.qihangerp.module.goods.domain.bo.GoodsAddBo;
import cn.qihangerp.module.goods.domain.bo.GoodsSkuAddBo;
import cn.qihangerp.module.goods.domain.vo.GoodsSpecListVo;
import com.baomidou.mybatisplus.extension.service.IService;



import java.util.List;

/**
* @author TW
* @description 针对表【o_goods(商品库存管理)】的数据库操作Service
* @createDate 2024-03-11 14:24:49
*/
public interface OGoodsService extends IService<OGoods> {

    PageResult<OGoodsSku> querySkuPageList(OGoodsSku bo, PageQuery pageQuery);
    PageResult<OGoods> queryPageList(OGoods bo, PageQuery pageQuery);

    List<GoodsSpecListVo> searchGoodsSpec(String keyword);
    List<OGoods> selectGoodsList(OGoods goods);
    OGoods selectGoodsById(Long id);
    /**
     * 新增商品管理
     *
     * @param goods 商品管理
     * @return 结果
     */
    public ResultVo<Long> insertGoods(String userName , GoodsAddBo goods);

    /**
     * 修改商品管理
     *
     * @param goods 商品管理
     * @return 结果
     */
    public int updateGoods(OGoods goods);

    /**
     * 批量删除商品管理
     *
     * @param ids 需要删除的商品管理主键集合
     * @return 结果
     */
    public int deleteGoodsByIds(Long[] ids);

    int insertGoodsSku(OGoodsSku goodsSku);
//    int saveGoodsSku(GoodsSkuAddBo addBo);
//    int batchSaveGoodsSku(List<GoodsSkuAddBo> list);
}
