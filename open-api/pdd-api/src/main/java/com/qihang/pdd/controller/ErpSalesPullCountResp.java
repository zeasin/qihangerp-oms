package com.qihang.pdd.controller;

/**
 * 更新erp销售订单数据统计
 */
public class ErpSalesPullCountResp {
    private int addCount;//新增
    private int failCount;//失败
    private int updCount;//更新
    private Integer totalRecords;//总记录数
    private String startTime;
    private String endTime;

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getAddCount() {
        return addCount;
    }

    public void setAddCount(int addCount) {
        this.addCount = addCount;
    }

    public int getFailCount() {
        return failCount;
    }

    public void setFailCount(int failCount) {
        this.failCount = failCount;
    }

    public int getUpdCount() {
        return updCount;
    }

    public void setUpdCount(int updCount) {
        this.updCount = updCount;
    }

    public Integer getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(Integer totalRecords) {
        this.totalRecords = totalRecords;
    }
}
