//package cn.qihangerp.oms.service.impl;
//
//import cn.qihangerp.common.PageQuery;
//import cn.qihangerp.common.PageResult;
//import cn.qihangerp.common.enums.EnumShopType;
//
//import cn.qihangerp.oms.domain.OShop;
//import cn.qihangerp.oms.domain.OShopPullLasttime;
//import cn.qihangerp.oms.mapper.OShopMapper;
//import cn.qihangerp.oms.service.OShopPullLasttimeService;
//import cn.qihangerp.oms.service.OShopService;
//import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
//import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
//import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
//import lombok.AllArgsConstructor;
//import org.springframework.stereotype.Service;
//import org.springframework.util.StringUtils;
//
//import java.util.Arrays;
//import java.util.List;
//
///**
//* @author qilip
//* @description 针对表【sys_shop(数据中心-店铺)】的数据库操作Service实现
//* @createDate 2024-03-17 15:17:34
//*/
//@AllArgsConstructor
//@Service
//public class OShopServiceImpl extends ServiceImpl<OShopMapper, OShop>
//    implements OShopService {
//    private final OShopMapper mapper;
//    private final OShopPullLasttimeService pullLasttimeService;
//
//    @Override
//    public PageResult<OShop> queryPageList(OShop bo, PageQuery pageQuery) {
//        LambdaQueryWrapper<OShop> queryWrapper = new LambdaQueryWrapper<OShop>()
//                .likeRight(StringUtils.hasText(bo.getName()), OShop::getName, bo.getName())
//                .eq(bo.getType()!=null, OShop::getType, bo.getType());
//
//
//        Page<OShop> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
//        return PageResult.build(pages);
//    }
//
//    @Override
//    public List<OShop> selectShopList(OShop shop) {
//        LambdaQueryWrapper<OShop> qw = new LambdaQueryWrapper<OShop>()
//                .eq(shop.getType()!=null, OShop::getType,shop.getType())
//
//                ;
//        return mapper.selectList(qw);
//    }
//
//    @Override
//    public OShop selectShopById(Long id) {
//        return mapper.selectById(id);
//    }
//
//    @Override
//    public int updateShopById(OShop shop) {
//        return mapper.updateById(shop);
//    }
//
//    @Override
//    public int insertShop(OShop shop) {
//        return mapper.insert(shop);
//    }
//
//    @Override
//    public int deleteShopByIds(Long[] ids) {
//        //删除pulllasttime
//        pullLasttimeService.remove(new LambdaQueryWrapper<OShopPullLasttime>().in(OShopPullLasttime::getShopId,ids));
//        return mapper.deleteBatchIds(Arrays.asList(ids));
//    }
//
//
//    @Override
//    public List<OShop> selectShopByShopType(EnumShopType shopType) {
//        LambdaQueryWrapper<OShop> qw = new LambdaQueryWrapper<OShop>()
//                .eq(OShop::getType,shopType.getIndex())
//                .eq(OShop::getStatus,1);
//        return mapper.selectList(qw);
//    }
//
//    @Override
//    public void updateSessionKey(Long shopId, String sessionKey) {
//        OShop shop = new OShop();
//        shop.setId(shopId);
//        shop.setAccessToken(sessionKey);
//        mapper.updateById(shop);
//    }
//
////    @Override
////    public void updateShopManage(Long shopId, Long userId, Long groupId) {
////        OShop shop = new OShop();
////        shop.setId(shopId);
////        shop.setManageUserId(userId);
////        shop.setShopGroupId(groupId);
////        shop.setModifyOn(System.currentTimeMillis()/1000);
////        mapper.updateById(shop);
////    }
////    @Override
////    public List<SysPlatform> selectShopPlatformList() {
////        return platformMapper.selectList(new LambdaQueryWrapper<>());
////    }
////
////    @Override
////    public SysPlatform selectShopPlatformById(Long id) {
////        return platformMapper.selectById(id);
////    }
////
////    @Override
////    public int updateShopPlatformById(SysPlatform platform) {
////        return platformMapper.updateById(platform);
////    }
//}
//
//
//
//
