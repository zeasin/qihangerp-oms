package cn.qihangerp.module.open.tao.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 
 * @TableName tao_goods
 */
@TableName("oms_tao_goods")
public class TaoGoods implements Serializable {
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
    private Integer erpGoodsId;

    /**
     * 创建时间
     */
    private Date createTime;

    @TableField(exist = false)
    private List<TaoGoodsSku> skus;

    private static final long serialVersionUID = 1L;

    public List<TaoGoodsSku> getSkus() {
        return skus;
    }

    public void setSkus(List<TaoGoodsSku> skus) {
        this.skus = skus;
    }

    /**
     * 
     */
    public Long getId() {
        return id;
    }

    /**
     * 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 商品id
     */
    public String getIid() {
        return iid;
    }

    /**
     * 商品id
     */
    public void setIid(String iid) {
        this.iid = iid;
    }

    /**
     * 商品数字id
     */
    public Long getNumIid() {
        return numIid;
    }

    /**
     * 商品数字id
     */
    public void setNumIid(Long numIid) {
        this.numIid = numIid;
    }

    /**
     * 商品标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 商品标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 卖家昵称
     */
    public String getNick() {
        return nick;
    }

    /**
     * 卖家昵称
     */
    public void setNick(String nick) {
        this.nick = nick;
    }

    /**
     * 商品类型(fixed:一口价;auction:拍卖)注：取消团购
     */
    public String getType() {
        return type;
    }

    /**
     * 商品类型(fixed:一口价;auction:拍卖)注：取消团购
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 商品所属的叶子类目 id
     */
    public Long getCid() {
        return cid;
    }

    /**
     * 商品所属的叶子类目 id
     */
    public void setCid(Long cid) {
        this.cid = cid;
    }

    /**
     * 商品所属的店铺内卖家自定义类目列表
     */
    public String getSellerCids() {
        return sellerCids;
    }

    /**
     * 商品所属的店铺内卖家自定义类目列表
     */
    public void setSellerCids(String sellerCids) {
        this.sellerCids = sellerCids;
    }

    /**
     * 主图
     */
    public String getPicUrl() {
        return picUrl;
    }

    /**
     * 主图
     */
    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    /**
     * 商品数量
     */
    public Integer getNum() {
        return num;
    }

    /**
     * 商品数量
     */
    public void setNum(Integer num) {
        this.num = num;
    }

    /**
     * 商品属性 格式：pid:vid;pid:vid
     */
    public String getProps() {
        return props;
    }

    /**
     * 商品属性 格式：pid:vid;pid:vid
     */
    public void setProps(String props) {
        this.props = props;
    }

    /**
     * 有效期,7或者14（默认是7天）
     */
    public Integer getValidThru() {
        return validThru;
    }

    /**
     * 有效期,7或者14（默认是7天）
     */
    public void setValidThru(Integer validThru) {
        this.validThru = validThru;
    }

    /**
     * 支持会员打折,true/false
     */
    public String getHasDiscount() {
        return hasDiscount;
    }

    /**
     * 支持会员打折,true/false
     */
    public void setHasDiscount(String hasDiscount) {
        this.hasDiscount = hasDiscount;
    }

    /**
     * 是否有发票,true/false
     */
    public String getHasInvoice() {
        return hasInvoice;
    }

    /**
     * 是否有发票,true/false
     */
    public void setHasInvoice(String hasInvoice) {
        this.hasInvoice = hasInvoice;
    }

    /**
     * 是否有保修,true/false
     */
    public String getHasWarranty() {
        return hasWarranty;
    }

    /**
     * 是否有保修,true/false
     */
    public void setHasWarranty(String hasWarranty) {
        this.hasWarranty = hasWarranty;
    }

    /**
     * 橱窗推荐,true/false
     */
    public String getHasShowcase() {
        return hasShowcase;
    }

    /**
     * 橱窗推荐,true/false
     */
    public void setHasShowcase(String hasShowcase) {
        this.hasShowcase = hasShowcase;
    }

    /**
     * 商品修改时间（格式：yyyy-MM-dd HH:mm:ss）
     */
    public Date getModified() {
        return modified;
    }

    /**
     * 商品修改时间（格式：yyyy-MM-dd HH:mm:ss）
     */
    public void setModified(Date modified) {
        this.modified = modified;
    }

    /**
     * 下架时间（格式：yyyy-MM-dd HH:mm:ss）
     */
    public Date getDelistTime() {
        return delistTime;
    }

    /**
     * 下架时间（格式：yyyy-MM-dd HH:mm:ss）
     */
    public void setDelistTime(Date delistTime) {
        this.delistTime = delistTime;
    }

    /**
     * 宝贝所属的运费模板ID，如果没有返回则说明没有使用运费模板
     */
    public Long getPostageId() {
        return postageId;
    }

    /**
     * 宝贝所属的运费模板ID，如果没有返回则说明没有使用运费模板
     */
    public void setPostageId(Long postageId) {
        this.postageId = postageId;
    }

    /**
     * 商家外部编码(可与商家外部系统对接)。需要授权才能获取。
     */
    public String getOuterId() {
        return outerId;
    }

    /**
     * 商家外部编码(可与商家外部系统对接)。需要授权才能获取。
     */
    public void setOuterId(String outerId) {
        this.outerId = outerId;
    }

    /**
     * 上架时间（格式：yyyy-MM-dd HH:mm:ss）
     */
    public Date getListTime() {
        return listTime;
    }

    /**
     * 上架时间（格式：yyyy-MM-dd HH:mm:ss）
     */
    public void setListTime(Date listTime) {
        this.listTime = listTime;
    }

    /**
     * 商品价格，格式：5.00；单位：元；精确到：分
     */
    public String getPrice() {
        return price;
    }

    /**
     * 商品价格，格式：5.00；单位：元；精确到：分
     */
    public void setPrice(String price) {
        this.price = price;
    }

    /**
     * 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 是否在外部网店显示
     */
    public String getIsEx() {
        return isEx;
    }

    /**
     * 是否在外部网店显示
     */
    public void setIsEx(String isEx) {
        this.isEx = isEx;
    }

    /**
     * 虚拟商品的状态字段
     */
    public String getIsVirtual() {
        return isVirtual;
    }

    /**
     * 虚拟商品的状态字段
     */
    public void setIsVirtual(String isVirtual) {
        this.isVirtual = isVirtual;
    }

    /**
     * 是否在淘宝显示
     */
    public String getIsTaobao() {
        return isTaobao;
    }

    /**
     * 是否在淘宝显示
     */
    public void setIsTaobao(String isTaobao) {
        this.isTaobao = isTaobao;
    }

    /**
     * 商品销量
     */
    public Integer getSoldQuantity() {
        return soldQuantity;
    }

    /**
     * 商品销量
     */
    public void setSoldQuantity(Integer soldQuantity) {
        this.soldQuantity = soldQuantity;
    }

    /**
     * 是否为达尔文挂接成功了的商品
     */
    public String getIsCspu() {
        return isCspu;
    }

    /**
     * 是否为达尔文挂接成功了的商品
     */
    public void setIsCspu(String isCspu) {
        this.isCspu = isCspu;
    }

    /**
     * 商品首次上架时间
     */
    public Date getFirstStartsTime() {
        return firstStartsTime;
    }

    /**
     * 商品首次上架时间
     */
    public void setFirstStartsTime(Date firstStartsTime) {
        this.firstStartsTime = firstStartsTime;
    }

    /**
     * 店铺id
     */
    public Long getShopId() {
        return shopId;
    }

    /**
     * 店铺id
     */
    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    /**
     * erp商品id
     */
    public Integer getErpGoodsId() {
        return erpGoodsId;
    }

    /**
     * erp商品id
     */
    public void setErpGoodsId(Integer erpGoodsId) {
        this.erpGoodsId = erpGoodsId;
    }

    /**
     * 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        TaoGoods other = (TaoGoods) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getIid() == null ? other.getIid() == null : this.getIid().equals(other.getIid()))
            && (this.getNumIid() == null ? other.getNumIid() == null : this.getNumIid().equals(other.getNumIid()))
            && (this.getTitle() == null ? other.getTitle() == null : this.getTitle().equals(other.getTitle()))
            && (this.getNick() == null ? other.getNick() == null : this.getNick().equals(other.getNick()))
            && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
            && (this.getCid() == null ? other.getCid() == null : this.getCid().equals(other.getCid()))
            && (this.getSellerCids() == null ? other.getSellerCids() == null : this.getSellerCids().equals(other.getSellerCids()))
            && (this.getPicUrl() == null ? other.getPicUrl() == null : this.getPicUrl().equals(other.getPicUrl()))
            && (this.getNum() == null ? other.getNum() == null : this.getNum().equals(other.getNum()))
            && (this.getProps() == null ? other.getProps() == null : this.getProps().equals(other.getProps()))
            && (this.getValidThru() == null ? other.getValidThru() == null : this.getValidThru().equals(other.getValidThru()))
            && (this.getHasDiscount() == null ? other.getHasDiscount() == null : this.getHasDiscount().equals(other.getHasDiscount()))
            && (this.getHasInvoice() == null ? other.getHasInvoice() == null : this.getHasInvoice().equals(other.getHasInvoice()))
            && (this.getHasWarranty() == null ? other.getHasWarranty() == null : this.getHasWarranty().equals(other.getHasWarranty()))
            && (this.getHasShowcase() == null ? other.getHasShowcase() == null : this.getHasShowcase().equals(other.getHasShowcase()))
            && (this.getModified() == null ? other.getModified() == null : this.getModified().equals(other.getModified()))
            && (this.getDelistTime() == null ? other.getDelistTime() == null : this.getDelistTime().equals(other.getDelistTime()))
            && (this.getPostageId() == null ? other.getPostageId() == null : this.getPostageId().equals(other.getPostageId()))
            && (this.getOuterId() == null ? other.getOuterId() == null : this.getOuterId().equals(other.getOuterId()))
            && (this.getListTime() == null ? other.getListTime() == null : this.getListTime().equals(other.getListTime()))
            && (this.getPrice() == null ? other.getPrice() == null : this.getPrice().equals(other.getPrice()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
            && (this.getIsEx() == null ? other.getIsEx() == null : this.getIsEx().equals(other.getIsEx()))
            && (this.getIsVirtual() == null ? other.getIsVirtual() == null : this.getIsVirtual().equals(other.getIsVirtual()))
            && (this.getIsTaobao() == null ? other.getIsTaobao() == null : this.getIsTaobao().equals(other.getIsTaobao()))
            && (this.getSoldQuantity() == null ? other.getSoldQuantity() == null : this.getSoldQuantity().equals(other.getSoldQuantity()))
            && (this.getIsCspu() == null ? other.getIsCspu() == null : this.getIsCspu().equals(other.getIsCspu()))
            && (this.getFirstStartsTime() == null ? other.getFirstStartsTime() == null : this.getFirstStartsTime().equals(other.getFirstStartsTime()))
            && (this.getShopId() == null ? other.getShopId() == null : this.getShopId().equals(other.getShopId()))
            && (this.getErpGoodsId() == null ? other.getErpGoodsId() == null : this.getErpGoodsId().equals(other.getErpGoodsId()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getIid() == null) ? 0 : getIid().hashCode());
        result = prime * result + ((getNumIid() == null) ? 0 : getNumIid().hashCode());
        result = prime * result + ((getTitle() == null) ? 0 : getTitle().hashCode());
        result = prime * result + ((getNick() == null) ? 0 : getNick().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getCid() == null) ? 0 : getCid().hashCode());
        result = prime * result + ((getSellerCids() == null) ? 0 : getSellerCids().hashCode());
        result = prime * result + ((getPicUrl() == null) ? 0 : getPicUrl().hashCode());
        result = prime * result + ((getNum() == null) ? 0 : getNum().hashCode());
        result = prime * result + ((getProps() == null) ? 0 : getProps().hashCode());
        result = prime * result + ((getValidThru() == null) ? 0 : getValidThru().hashCode());
        result = prime * result + ((getHasDiscount() == null) ? 0 : getHasDiscount().hashCode());
        result = prime * result + ((getHasInvoice() == null) ? 0 : getHasInvoice().hashCode());
        result = prime * result + ((getHasWarranty() == null) ? 0 : getHasWarranty().hashCode());
        result = prime * result + ((getHasShowcase() == null) ? 0 : getHasShowcase().hashCode());
        result = prime * result + ((getModified() == null) ? 0 : getModified().hashCode());
        result = prime * result + ((getDelistTime() == null) ? 0 : getDelistTime().hashCode());
        result = prime * result + ((getPostageId() == null) ? 0 : getPostageId().hashCode());
        result = prime * result + ((getOuterId() == null) ? 0 : getOuterId().hashCode());
        result = prime * result + ((getListTime() == null) ? 0 : getListTime().hashCode());
        result = prime * result + ((getPrice() == null) ? 0 : getPrice().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getIsEx() == null) ? 0 : getIsEx().hashCode());
        result = prime * result + ((getIsVirtual() == null) ? 0 : getIsVirtual().hashCode());
        result = prime * result + ((getIsTaobao() == null) ? 0 : getIsTaobao().hashCode());
        result = prime * result + ((getSoldQuantity() == null) ? 0 : getSoldQuantity().hashCode());
        result = prime * result + ((getIsCspu() == null) ? 0 : getIsCspu().hashCode());
        result = prime * result + ((getFirstStartsTime() == null) ? 0 : getFirstStartsTime().hashCode());
        result = prime * result + ((getShopId() == null) ? 0 : getShopId().hashCode());
        result = prime * result + ((getErpGoodsId() == null) ? 0 : getErpGoodsId().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", iid=").append(iid);
        sb.append(", numIid=").append(numIid);
        sb.append(", title=").append(title);
        sb.append(", nick=").append(nick);
        sb.append(", type=").append(type);
        sb.append(", cid=").append(cid);
        sb.append(", sellerCids=").append(sellerCids);
        sb.append(", picUrl=").append(picUrl);
        sb.append(", num=").append(num);
        sb.append(", props=").append(props);
        sb.append(", validThru=").append(validThru);
        sb.append(", hasDiscount=").append(hasDiscount);
        sb.append(", hasInvoice=").append(hasInvoice);
        sb.append(", hasWarranty=").append(hasWarranty);
        sb.append(", hasShowcase=").append(hasShowcase);
        sb.append(", modified=").append(modified);
        sb.append(", delistTime=").append(delistTime);
        sb.append(", postageId=").append(postageId);
        sb.append(", outerId=").append(outerId);
        sb.append(", listTime=").append(listTime);
        sb.append(", price=").append(price);
        sb.append(", remark=").append(remark);
        sb.append(", isEx=").append(isEx);
        sb.append(", isVirtual=").append(isVirtual);
        sb.append(", isTaobao=").append(isTaobao);
        sb.append(", soldQuantity=").append(soldQuantity);
        sb.append(", isCspu=").append(isCspu);
        sb.append(", firstStartsTime=").append(firstStartsTime);
        sb.append(", shopId=").append(shopId);
        sb.append(", erpGoodsId=").append(erpGoodsId);
        sb.append(", createTime=").append(createTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}