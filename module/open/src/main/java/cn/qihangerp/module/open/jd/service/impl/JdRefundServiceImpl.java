package cn.qihangerp.module.open.jd.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.module.open.jd.domain.JdGoodsSku;
import cn.qihangerp.module.open.jd.domain.JdRefund;
import cn.qihangerp.module.open.jd.domain.bo.JdAfterBo;
import cn.qihangerp.module.open.jd.mapper.JdOrderItemMapper;
import cn.qihangerp.module.open.jd.mapper.JdOrderMapper;
import cn.qihangerp.module.open.jd.mapper.JdRefundMapper;
import cn.qihangerp.module.open.jd.mapper.JdGoodsSkuMapper;
import cn.qihangerp.module.open.jd.service.JdRefundService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
* @author qilip
* @description 针对表【oms_jd_after_sale(京东退款与售后表)】的数据库操作Service实现
* @createDate 2024-09-17 17:20:26
*/
@AllArgsConstructor
@Service
public class JdRefundServiceImpl extends ServiceImpl<JdRefundMapper, JdRefund>
    implements JdRefundService {
    private final JdRefundMapper mapper;
    private final JdOrderMapper orderMapper;
    private final JdOrderItemMapper orderItemMapper;
    private final JdGoodsSkuMapper goodsSkuMapper;
    @Override
    public PageResult<JdRefund> queryPageList(JdAfterBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<JdRefund> queryWrapper = new LambdaQueryWrapper<JdRefund>()
                .eq(bo.getShopId()!=null, JdRefund::getShopId,bo.getShopId())
                .eq(bo.getCustomerExpect()!=null, JdRefund::getCustomerExpect,bo.getCustomerExpect())
                .eq(bo.getOrderId()!=null, JdRefund::getOrderId,bo.getOrderId())
                .eq(StringUtils.hasText(bo.getServiceId()), JdRefund::getServiceId,bo.getServiceId())
                ;

        Page<JdRefund> page = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(page);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveRefund(Long shopId, JdRefund after) {
        try {
            List<JdRefund> afterSales = mapper.selectList(new LambdaQueryWrapper<JdRefund>()
                    .eq(JdRefund::getShopId, after.getShopId())
                    .eq( JdRefund::getServiceId, after.getServiceId()));
            if (afterSales != null && afterSales.size() > 0) {
                // 存在，修改
                JdRefund update = new JdRefund();
                update.setId(afterSales.get(0).getId());
                if(after.getCustomerExpect().intValue() == 1) {
                    after.setCustomerExpectName("订单取消");
                    //退款申请单状态 0、未审核 1、审核通过2、审核不通过 3、京东财务审核通过 4、京东财务审核不通过 5、人工审核通过
                    // 6、京东拦截并退款 7、青龙拦截成功 8、青龙拦截失败 9、强制关单并退款 10、物流待跟进(线下拦截) 11、用户撤销
                    // 16、拒收后退款 17、协商退货退款 18、协商关闭 19、纠纷介入 27、京东承诺拦截。不传是查询全部状态
                    if(after.getRefundStatus() == 3){
                        //服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭
                        // 10005-待收货 10006-待处理领取 10007-待处理 10009-待用户确认 10010-完成 10011-取消
                        // 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单 12000-上门维修中
                        // 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）
                        after.setServiceStatus(10010);
                    }else if(after.getRefundStatus()==0){
                        after.setServiceStatus(10001);
                    }else{
                        after.setServiceStatus(10007);
                    }
                    List<JdGoodsSku> jdGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<JdGoodsSku>().eq(JdGoodsSku::getSkuId, after.getSkuId()));
                    if(!jdGoodsSkus.isEmpty()){
                        after.setOGoodsId(jdGoodsSkus.get(0).getOGoodsId());
                        after.setOGoodsSkuId(jdGoodsSkus.get(0).getOGoodsSkuId());
                    }
                }else {
                    update.setServiceStatus(after.getServiceStatus());
                    update.setServiceStatusName(after.getServiceStatusName());
                    update.setApprovePin(after.getApprovePin());
                    update.setApproveName(after.getApproveName());
                    update.setApproveTime(after.getApproveTime());
                    update.setApproveResult(after.getApproveResult());
                    update.setApproveResultName(after.getApproveResultName());
                    update.setProcessPin(after.getProcessPin());
                    update.setProcessName(after.getProcessName());
                    update.setProcessTime(after.getProcessTime());
                    update.setProcessResult(after.getProcessResult());
                    update.setProcessResultName(after.getProcessResultName());
                }


                update.setUpdateTime(new Date());
                update.setUpdateBy("拉取更新");
                mapper.updateById(update);
                return ResultVo.error(ResultVoEnum.DataExist, "退款已经存在，更新成功");
            } else {
                // 新增
                after.setShopId(shopId);
                after.setCreateTime(new Date());
                after.setCreateBy("拉取插入");
                if(after.getCustomerExpect().intValue() == 1) {
                    after.setCustomerExpectName("订单取消");
                    //退款申请单状态 0、未审核 1、审核通过2、审核不通过 3、京东财务审核通过 4、京东财务审核不通过 5、人工审核通过
                    // 6、京东拦截并退款 7、青龙拦截成功 8、青龙拦截失败 9、强制关单并退款 10、物流待跟进(线下拦截) 11、用户撤销
                    // 16、拒收后退款 17、协商退货退款 18、协商关闭 19、纠纷介入 27、京东承诺拦截。不传是查询全部状态
                    if(after.getRefundStatus() == 3){
                        //服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭
                        // 10005-待收货 10006-待处理领取 10007-待处理 10009-待用户确认 10010-完成 10011-取消
                        // 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单 12000-上门维修中
                        // 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）
                        after.setServiceStatus(10010);
                    }else if(after.getRefundStatus()==0){
                        after.setServiceStatus(10001);
                    }else{
                        after.setServiceStatus(10007);
                    }
                    List<JdGoodsSku> jdGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<JdGoodsSku>().eq(JdGoodsSku::getSkuId, after.getSkuId()));
                    if(!jdGoodsSkus.isEmpty()){
                        after.setOGoodsId(jdGoodsSkus.get(0).getOGoodsId());
                        after.setOGoodsSkuId(jdGoodsSkus.get(0).getOGoodsSkuId());
                    }
                }
                mapper.insert(after);
                return ResultVo.success();
            }

        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return ResultVo.error(ResultVoEnum.SystemException, "系统异常：" + e.getMessage());
        }
    }
}




