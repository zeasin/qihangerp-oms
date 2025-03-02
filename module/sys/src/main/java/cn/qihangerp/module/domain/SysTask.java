//package cn.qihangerp.module.sys.domain;
//
//import java.io.Serializable;
//import java.util.Date;
//
///**
// *
// * @TableName sys_task
// */
//public class SysTask implements Serializable {
//    /**
//     *
//     */
//    private Integer id;
//
//    /**
//     *
//     */
//    private String taskName;
//
//    /**
//     *
//     */
//    private String cron;
//
//    /**
//     *
//     */
//    private String method;
//
//    /**
//     *
//     */
//    private String remark;
//
//    /**
//     *
//     */
//    private Date createTime;
//
//    private static final long serialVersionUID = 1L;
//
//    /**
//     *
//     */
//    public Integer getId() {
//        return id;
//    }
//
//    /**
//     *
//     */
//    public void setId(Integer id) {
//        this.id = id;
//    }
//
//    /**
//     *
//     */
//    public String getTaskName() {
//        return taskName;
//    }
//
//    /**
//     *
//     */
//    public void setTaskName(String taskName) {
//        this.taskName = taskName;
//    }
//
//    /**
//     *
//     */
//    public String getCron() {
//        return cron;
//    }
//
//    /**
//     *
//     */
//    public void setCron(String cron) {
//        this.cron = cron;
//    }
//
//    /**
//     *
//     */
//    public String getMethod() {
//        return method;
//    }
//
//    /**
//     *
//     */
//    public void setMethod(String method) {
//        this.method = method;
//    }
//
//    /**
//     *
//     */
//    public String getRemark() {
//        return remark;
//    }
//
//    /**
//     *
//     */
//    public void setRemark(String remark) {
//        this.remark = remark;
//    }
//
//    /**
//     *
//     */
//    public Date getCreateTime() {
//        return createTime;
//    }
//
//    /**
//     *
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
//        SysTask other = (SysTask) that;
//        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
//            && (this.getTaskName() == null ? other.getTaskName() == null : this.getTaskName().equals(other.getTaskName()))
//            && (this.getCron() == null ? other.getCron() == null : this.getCron().equals(other.getCron()))
//            && (this.getMethod() == null ? other.getMethod() == null : this.getMethod().equals(other.getMethod()))
//            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
//            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()));
//    }
//
//    @Override
//    public int hashCode() {
//        final int prime = 31;
//        int result = 1;
//        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
//        result = prime * result + ((getTaskName() == null) ? 0 : getTaskName().hashCode());
//        result = prime * result + ((getCron() == null) ? 0 : getCron().hashCode());
//        result = prime * result + ((getMethod() == null) ? 0 : getMethod().hashCode());
//        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
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
//        sb.append(", taskName=").append(taskName);
//        sb.append(", cron=").append(cron);
//        sb.append(", method=").append(method);
//        sb.append(", remark=").append(remark);
//        sb.append(", createTime=").append(createTime);
//        sb.append(", serialVersionUID=").append(serialVersionUID);
//        sb.append("]");
//        return sb.toString();
//    }
//}