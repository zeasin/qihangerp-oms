package cn.qihangerp.module.order.service.impl;

import cn.qihangerp.module.order.domain.OShipStockUp;
import cn.qihangerp.module.order.domain.bo.ShipStockUpBo;
import cn.qihangerp.module.order.domain.bo.ShipStockUpCompleteBo;
import cn.qihangerp.module.order.mapper.OShipStockUpMapper;
import cn.qihangerp.module.order.service.OShipStockUpService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
* @author qilip
* @description 针对表【o_ship_stock_up(备货表（打单加入备货清单）)】的数据库操作Service实现
* @createDate 2024-07-28 18:29:53
*/
@AllArgsConstructor
@Service
public class OShipStockUpServiceImpl extends ServiceImpl<OShipStockUpMapper, OShipStockUp>
    implements OShipStockUpService {
    private final OShipStockUpMapper mapper;

    @Override
    public PageResult<OShipStockUp> queryPageList(ShipStockUpBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OShipStockUp> queryWrapper = new LambdaQueryWrapper<OShipStockUp>()
                .eq(bo.getShopId()!=null,OShipStockUp::getShopId,bo.getShopId())
                .eq(bo.getStatus()!=null,OShipStockUp::getStatus,bo.getStatus())
                .eq(StringUtils.hasText(bo.getOrderNum()),OShipStockUp::getOrderNum,bo.getOrderNum())
                ;
        Page<OShipStockUp> pages = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }

    /**
     * 备货完成
     * @param bo
     * @return
     */
    @Override
    public int stockUpComplete(ShipStockUpCompleteBo bo) {

        if(bo.getIds() == null || bo.getIds().length == 0) return -1;

        int total=0;
        // 循环判断状态
        for (Long id:bo.getIds()) {
            OShipStockUp up = mapper.selectById(id);
            if (up != null) {
                if (up.getStatus() == 0 || up.getStatus() == 1) {
                    OShipStockUp update = new OShipStockUp();
                    update.setId(id.toString());
                    update.setStatus(2);//备货完成
                    update.setUpdateBy("备货完成");
                    update.setUpdateTime(new Date());
                    mapper.updateById(update);
                }
            }
        }

        return 1;
    }

    /**
     * 备货完成 by Order
     * @param bo
     * @return
     */
    @Override
    public int stockUpCompleteByOrder(ShipStockUpCompleteBo bo) {

        if(bo.getOrderNums() == null || bo.getOrderNums().length == 0) return -1;

        int total=0;
        // 循环判断状态
        for (String orderNum:bo.getOrderNums()) {
            List<OShipStockUp> upList = mapper.selectList(new LambdaQueryWrapper<OShipStockUp>().eq(OShipStockUp::getOrderNum,orderNum));
            if (upList != null) {
                for(OShipStockUp up : upList) {
                    if (up.getStatus() == 0 || up.getStatus() == 1) {
                        OShipStockUp update = new OShipStockUp();
                        update.setId(up.getId());
                        update.setStatus(2);//备货完成
                        update.setUpdateBy("备货完成");
                        update.setUpdateTime(new Date());
                        mapper.updateById(update);
                    }
                }
            }
        }

        return 1;
    }
}




