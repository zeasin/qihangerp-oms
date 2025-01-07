package cn.qihangerp.open.dou;

public class DouRequest {
    private Long shopId;//店铺Id
    private Long orderId;//订单id
    private Integer updType;//更新类型0拉取新订单1更新订单
    private String startDate;
    private String endDate;

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Integer getUpdType() {
        return updType;
    }

    public void setUpdType(Integer updType) {
        this.updType = updType;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getShopId() {
        return shopId;
    }

    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }
}
