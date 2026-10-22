package cn.qihangerp.model.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 订单处理工作台-状态池订单行内嵌商品明细VO
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderPoolItemVo implements Serializable {
    /** 商品图片 */
    private String goodsImg;
    /** 商品标题 */
    private String goodsTitle;
    /** 商品规格 */
    private String goodsSpec;
    /** 商品规格编码 */
    private String skuNum;
    /** 商品编码 */
    private String goodsNum;
    /** 商品数量 */
    private Integer quantity;
}
