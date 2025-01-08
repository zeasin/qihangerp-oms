package cn.qihangerp.open.tao.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 淘宝商品表
 * @TableName oms_tao_goods
 */
@Data
public class OmsTaoGoods implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 商品id
     */
    private String iid;

    /**
     * 商品数字id
     */
    private Long numIid;

    /**
     * 商品标题
     */
    private String title;

    /**
     * 卖家昵称
     */
    private String nick;

    /**
     * 商品类型(fixed:一口价;auction:拍卖)注：取消团购
     */
    private String type;

    /**
     * 商品所属的叶子类目 id
     */
    private Long cid;

    /**
     * 商品所属的店铺内卖家自定义类目列表
     */
    private String sellerCids;

    /**
     * 主图
     */
    private String picUrl;

    /**
     * 商品数量
     */
    private Integer num;

    /**
     * 商品属性 格式：pid:vid;pid:vid
     */
    private String props;

    /**
     * 有效期,7或者14（默认是7天）
     */
    private Integer validThru;

    /**
     * 支持会员打折,true/false
     */
    private String hasDiscount;

    /**
     * 是否有发票,true/false
     */
    private String hasInvoice;

    /**
     * 是否有保修,true/false
     */
    private String hasWarranty;

    /**
     * 橱窗推荐,true/false
     */
    private String hasShowcase;

    /**
     * 商品修改时间（格式：yyyy-MM-dd HH:mm:ss）
     */
    private Date modified;

    /**
     * 下架时间（格式：yyyy-MM-dd HH:mm:ss）
     */
    private Date delistTime;

    /**
     * 宝贝所属的运费模板ID，如果没有返回则说明没有使用运费模板
     */
    private Long postageId;

    /**
     * 商家外部编码(可与商家外部系统对接)。需要授权才能获取。
     */
    private String outerId;

    /**
     * 上架时间（格式：yyyy-MM-dd HH:mm:ss）
     */
    private Date listTime;

    /**
     * 商品价格，格式：5.00；单位：元；精确到：分
     */
    private String price;

    /**
     * 备注
     */
    private String remark;

    /**
     * 是否在外部网店显示
     */
    private String isEx;

    /**
     * 虚拟商品的状态字段
     */
    private String isVirtual;

    /**
     * 是否在淘宝显示
     */
    private String isTaobao;

    /**
     * 商品销量
     */
    private Integer soldQuantity;

    /**
     * 是否为达尔文挂接成功了的商品
     */
    private String isCspu;

    /**
     * 商品首次上架时间
     */
    private Date firstStartsTime;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * erp商品id
     */
    private Long erpGoodsId;

    /**
     * erp系统供应商ID
     */
    private Long erpSupplierId;

    /**
     * 创建时间
     */
    private Date createTime;

    @TableField(exist = false)
    private List<OmsTaoGoodsSku> skuList;

    private static final long serialVersionUID = 1L;
}