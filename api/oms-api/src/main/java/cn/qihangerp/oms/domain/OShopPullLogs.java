//package cn.qihangerp.oms.domain;
//
//import com.baomidou.mybatisplus.annotation.IdType;
//import com.baomidou.mybatisplus.annotation.TableId;
//import lombok.Data;
//
//import java.io.Serializable;
//import java.util.Date;
//
///**
// * 店铺更新日志表
// * @TableName sys_shop_pull_logs
// */
//@Data
//public class OShopPullLogs implements Serializable {
//    /**
//     * 主键Id
//     */
//    @TableId(type = IdType.AUTO)
//    private Long id;
//
//    /**
//     * 店铺id
//     */
//    private Long shopId;
//
//    /**
//     * 平台id
//     */
//    private Integer shopType;
//
//    /**
//     * 类型（ORDER订单，GOODS商品，REFUND退款）
//     */
//    private String pullType;
//
//    /**
//     * 拉取方式（主动拉取、定时任务）
//     */
//    private String pullWay;
//
//    /**
//     * 拉取参数
//     */
//    private String pullParams;
//
//    /**
//     * 拉取结果
//     */
//    private String pullResult;
//
//    /**
//     * 拉取时间
//     */
//    private Date pullTime;
//
//    /**
//     * 耗时（毫秒）
//     */
//    private Long duration;
//
//    public OShopPullLogs(Long shopId, Integer shopType, String pullType, String pullWay, String pullParams, String pullResult, Date pullTime, Long duration) {
//        this.shopId = shopId;
//        this.shopType = shopType;
//        this.pullType = pullType;
//        this.pullWay = pullWay;
//        this.pullParams = pullParams;
//        this.pullResult = pullResult;
//        this.pullTime = pullTime;
//        this.duration = duration;
//    }
//
//    public OShopPullLogs(){}
//    private static final long serialVersionUID = 1L;
//}