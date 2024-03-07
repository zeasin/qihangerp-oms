package com.qihang.common.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.CronTask;
import org.springframework.scheduling.config.ScheduledTask;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

@Configuration
@EnableAsync
@EnableScheduling
public class SchedulingConfiguration implements SchedulingConfigurer, ApplicationContextAware {
    private static final Logger log = LoggerFactory.getLogger(SchedulingConfiguration.class);
    private static ApplicationContext appCtx;
    private final ConcurrentMap<String, ScheduledTask> scheduledTaskHolder = new ConcurrentHashMap<>(16);
    private final ConcurrentMap<String, String> cronExpressionHolder = new ConcurrentHashMap<>(16);
    private ScheduledTaskRegistrar taskRegistrar;

    public static synchronized void setAppCtx(ApplicationContext appCtx) {
        SchedulingConfiguration.appCtx = appCtx;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        setAppCtx(applicationContext);
    }

    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
        this.taskRegistrar = taskRegistrar;
    }

    /**
     * 刷新定时任务表达式
     */
    public void refresh() {
        Map<String, IPollableService> beanMap = appCtx.getBeansOfType(IPollableService.class);
        if (beanMap.isEmpty() || taskRegistrar == null) {
            return;
        }
        beanMap.forEach((beanName, task) -> {
            String expression = task.getCronExpression();
            String taskName = task.getTaskName();
            if (null == expression) {
                log.warn("定时任务[{}]的任务表达式未配置或配置错误，请检查配置", taskName);
                return;
            }
            // 如果策略执行时间发生了变化，则取消当前策略的任务，并重新注册任务
            boolean unmodified = scheduledTaskHolder.containsKey(beanName) && cronExpressionHolder.get(beanName).equals(expression);
            if (unmodified) {
                log.info("定时任务[{}]的任务表达式未发生变化，无需刷新", taskName);
                return;
            }
            Optional.ofNullable(scheduledTaskHolder.remove(beanName)).ifPresent(existTask -> {
                existTask.cancel();
                cronExpressionHolder.remove(beanName);
            });
            if (ScheduledTaskRegistrar.CRON_DISABLED.equals(expression)) {
                log.warn("定时任务[{}]的任务表达式配置为禁用，将被不会被调度执行", taskName);
                return;
            }
            CronTask cronTask = new CronTask(task::poll, expression);
            ScheduledTask scheduledTask = taskRegistrar.scheduleCronTask(cronTask);
            if (scheduledTask != null) {
                log.info("定时任务[{}]已加载，当前任务表达式为[{}]", taskName, expression);
                scheduledTaskHolder.put(beanName, scheduledTask);
                cronExpressionHolder.put(beanName, expression);
            }
        });
    }
}
