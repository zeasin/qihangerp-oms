//package cn.qihangerp.module.sys.domain;
//
//import java.io.Serializable;
//import java.util.Date;
//
///**
// *
// * @TableName sys_task_logs
// */
//public class SysTaskLogs implements Serializable {
//    /**
//     * 主键ID
//     */
//    private Long id;
//
//    /**
//     * 任务ID
//     */
//    private Integer taskId;
//
//    /**
//     * 结果
//     */
//    private String result;
//
//    /**
//     * 开始运行时间
//     */
//    private Date startTime;
//
//    /**
//     * 结束时间
//     */
//    private Date endTime;
//
//    /**
//     * 状态1运行中，2已结束
//     */
//    private Integer status;
//
//    /**
//     * 创建时间
//     */
//    private Date createTime;
//
//    private static final long serialVersionUID = 1L;
//
//    /**
//     * 主键ID
//     */
//    public Long getId() {
//        return id;
//    }
//
//    /**
//     * 主键ID
//     */
//    public void setId(Long id) {
//        this.id = id;
//    }
//
//    /**
//     * 任务ID
//     */
//    public Integer getTaskId() {
//        return taskId;
//    }
//
//    /**
//     * 任务ID
//     */
//    public void setTaskId(Integer taskId) {
//        this.taskId = taskId;
//    }
//
//    /**
//     * 结果
//     */
//    public String getResult() {
//        return result;
//    }
//
//    /**
//     * 结果
//     */
//    public void setResult(String result) {
//        this.result = result;
//    }
//
//    /**
//     * 开始运行时间
//     */
//    public Date getStartTime() {
//        return startTime;
//    }
//
//    /**
//     * 开始运行时间
//     */
//    public void setStartTime(Date startTime) {
//        this.startTime = startTime;
//    }
//
//    /**
//     * 结束时间
//     */
//    public Date getEndTime() {
//        return endTime;
//    }
//
//    /**
//     * 结束时间
//     */
//    public void setEndTime(Date endTime) {
//        this.endTime = endTime;
//    }
//
//    /**
//     * 状态1运行中，2已结束
//     */
//    public Integer getStatus() {
//        return status;
//    }
//
//    /**
//     * 状态1运行中，2已结束
//     */
//    public void setStatus(Integer status) {
//        this.status = status;
//    }
//
//    /**
//     * 创建时间
//     */
//    public Date getCreateTime() {
//        return createTime;
//    }
//
//    /**
//     * 创建时间
//     */
//    public void setCreateTime(Date createTime) {
//        this.createTime = createTime;
//    }
//
//    @Override
//    public boolean equals(Object that) {
//        if (this == that) {
//            return true;
//        }
//        if (that == null) {
//            return false;
//        }
//        if (getClass() != that.getClass()) {
//            return false;
//        }
//        SysTaskLogs other = (SysTaskLogs) that;
//        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
//            && (this.getTaskId() == null ? other.getTaskId() == null : this.getTaskId().equals(other.getTaskId()))
//            && (this.getResult() == null ? other.getResult() == null : this.getResult().equals(other.getResult()))
//            && (this.getStartTime() == null ? other.getStartTime() == null : this.getStartTime().equals(other.getStartTime()))
//            && (this.getEndTime() == null ? other.getEndTime() == null : this.getEndTime().equals(other.getEndTime()))
//            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
//            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()));
//    }
//
//    @Override
//    public int hashCode() {
//        final int prime = 31;
//        int result = 1;
//        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
//        result = prime * result + ((getTaskId() == null) ? 0 : getTaskId().hashCode());
//        result = prime * result + ((getResult() == null) ? 0 : getResult().hashCode());
//        result = prime * result + ((getStartTime() == null) ? 0 : getStartTime().hashCode());
//        result = prime * result + ((getEndTime() == null) ? 0 : getEndTime().hashCode());
//        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
//        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
//        return result;
//    }
//
//    @Override
//    public String toString() {
//        StringBuilder sb = new StringBuilder();
//        sb.append(getClass().getSimpleName());
//        sb.append(" [");
//        sb.append("Hash = ").append(hashCode());
//        sb.append(", id=").append(id);
//        sb.append(", taskId=").append(taskId);
//        sb.append(", result=").append(result);
//        sb.append(", startTime=").append(startTime);
//        sb.append(", endTime=").append(endTime);
//        sb.append(", status=").append(status);
//        sb.append(", createTime=").append(createTime);
//        sb.append(", serialVersionUID=").append(serialVersionUID);
//        sb.append("]");
//        return sb.toString();
//    }
//}