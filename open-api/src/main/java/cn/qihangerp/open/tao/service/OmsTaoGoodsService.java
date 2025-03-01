package cn.qihangerp.open.tao.service;

import cn.qihangerp.open.tao.domain.OmsTaoGoods;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;


/**
* @author TW
* @description 针对表【oms_tao_goods(淘宝商品表)】的数据库操作Service
* @createDate 2024-05-09 16:15:39
*/
public interface OmsTaoGoodsService extends IService<OmsTaoGoods> {
    PageResult<OmsTaoGoods> queryPageList(OmsTaoGoods bo, PageQuery pageQuery);

    int saveAndUpdateGoods(Long shopId,OmsTaoGoods goods);
}
