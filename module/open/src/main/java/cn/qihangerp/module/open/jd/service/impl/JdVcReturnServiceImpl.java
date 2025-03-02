//package cn.qihangerp.open.jd.service.impl;
//
//import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
//import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
//import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
//import cn.qihangerp.common.PageQuery;
//import cn.qihangerp.common.PageResult;
//import cn.qihangerp.common.ResultVo;
//import cn.qihangerp.common.ResultVoEnum;
//import cn.qihangerp.open.jd.domain.JdVcReturn;
//import cn.qihangerp.open.jd.domain.JdVcReturnItem;
//import cn.qihangerp.open.jd.domain.bo.JdVcRefundBo;
//import cn.qihangerp.open.jd.mapper.JdVcReturnItemMapper;
//import cn.qihangerp.open.jd.service.JdVcReturnService;
//import cn.qihangerp.open.jd.mapper.JdVcReturnMapper;
//import lombok.AllArgsConstructor;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.Date;
//import java.util.List;
//
///**
//* @author TW
//* @description 针对表【jd_vc_return】的数据库操作Service实现
//* @createDate 2024-05-29 15:43:05
//*/
//@AllArgsConstructor
//@Service
//public class JdVcReturnServiceImpl extends ServiceImpl<JdVcReturnMapper, JdVcReturn>
//    implements JdVcReturnService{
//    private final JdVcReturnMapper mapper;
//    private final JdVcReturnItemMapper itemMapper;
//
//    @Override
//    public PageResult<JdVcReturn> queryPageList(JdVcRefundBo bo, PageQuery pageQuery) {
//        LambdaQueryWrapper<JdVcReturn> queryWrapper = new LambdaQueryWrapper<JdVcReturn>()
//                .eq(bo.getShopId()!=null,JdVcReturn::getShopId,bo.getShopId())
//                .eq(bo.getReturnId()!=null,JdVcReturn::getReturnId,bo.getReturnId())
//                ;
//
//        Page<JdVcReturn> page = mapper.selectPage(pageQuery.build(), queryWrapper);
//        if(page.getRecords()!=null){
//            for (var re:page.getRecords()) {
//                re.setItemList(itemMapper.selectList(new LambdaQueryWrapper<JdVcReturnItem>().eq(JdVcReturnItem::getReturnId,re.getReturnId())));
//            }
//        }
//
//        return PageResult.build(page);
//    }
//
//    @Transactional
//    @Override
//    public ResultVo<Integer> saveReturn(Integer shopId, JdVcReturn jdVcReturn) {
//        List<JdVcReturn> jdVcReturns = mapper.selectList(new LambdaQueryWrapper<JdVcReturn>().eq(JdVcReturn::getReturnId, jdVcReturn.getReturnId()));
//        if(jdVcReturns== null||jdVcReturns.size()==0){
//            // 不存在，新增
//            jdVcReturn.setShopId(shopId);
//            jdVcReturn.setCreateTime(new Date());
//            mapper.insert(jdVcReturn);
//            // 添加items
//            for (var item:jdVcReturn.getItemList()) {
//                item.setReturnId(jdVcReturn.getReturnId());
//                itemMapper.insert(item);
//            }
//            return ResultVo.success();
//
//        }else {
//            // 存在，修改
//            JdVcReturn update= new JdVcReturn();
//            update.setId(jdVcReturns.get(0).getId());
//            update.setTotalNum(jdVcReturn.getTotalNum());
//            update.setTotalPrice(jdVcReturn.getTotalPrice());
//            update.setWareVariety(jdVcReturn.getWareVariety());
//            update.setBalanceStateName(jdVcReturn.getBalanceStateName());
//            update.setBalanceDate(jdVcReturn.getBalanceDate());
//            update.setUpdateTime(new Date());
//            mapper.updateById(update);
//
//            // 删除item
//            itemMapper.delete(new LambdaQueryWrapper<JdVcReturnItem>().eq(JdVcReturnItem::getReturnId,jdVcReturn.getReturnId()));
//
//            // 添加items
//            for (var item:jdVcReturn.getItemList()) {
//                item.setReturnId(jdVcReturn.getReturnId());
//                itemMapper.insert(item);
//            }
//            return ResultVo.error(ResultVoEnum.DataExist, "已经存在，更新");
//        }
//
//    }
//}
//
//
//
//
