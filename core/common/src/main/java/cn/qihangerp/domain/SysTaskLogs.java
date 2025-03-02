package cn.qihangerp.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 后台任务运行日志表
 * @TableName sys_task_logs
 */
@Data
public class SysTaskLogs implements Serializable {
    /**
     * 主键ID
     */
    private Long id;

    /**
     * 任务ID
     */
    private Integer taskId;

    /**
     * 结果
     */
    private String result;

    /**
     * 开始运行时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * 状态1运行中，2已结束
     */
    private Integer status;

    /**
     * 创建时间
     */
    private Date createTime;

    private static final long serialVersionUID = 1L;
}