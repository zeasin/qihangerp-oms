package com.qihang.common.task;

public interface IPollableService {
    /**
     * 执行方法
     */
    void poll();

    /**
     * 获取周期表达式
     *
     * @return CronExpression
     */
    default String getCronExpression() {
        return null;
    }

    /**
     * 获取任务名称
     *
     * @return 任务名称
     */
    default String getTaskName() {
        return this.getClass().getSimpleName();
    }
}
