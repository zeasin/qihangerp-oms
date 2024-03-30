package com.qihang.jd.task;

import com.qihang.common.task.SchedulingConfiguration;
import lombok.extern.java.Log;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.concurrent.atomic.AtomicBoolean;
@Log
@Component
public class CronTaskLoader implements ApplicationRunner {
//    private static final Logger log = LoggerFactory.getLogger(CronTaskLoader.class);
    private final SchedulingConfiguration schedulingConfiguration;
    private final AtomicBoolean appStarted = new AtomicBoolean(false);
    private final AtomicBoolean initializing = new AtomicBoolean(false);

    public CronTaskLoader(SchedulingConfiguration schedulingConfiguration) {
        this.schedulingConfiguration = schedulingConfiguration;
    }

    /**
     * 定时任务配置刷新(10分钟刷新一次)
     */
    @Scheduled(fixedDelay = 600000)
    public void cronTaskConfigRefresh() {
        if (appStarted.get() && initializing.compareAndSet(false, true)) {
            log.info("定时调度任务动态加载开始>>>JD>>>");
            try {
                schedulingConfiguration.refresh();
            } finally {
                initializing.set(false);
            }
//            log.info("定时调度任务动态加载结束<<<<<<");
        }
    }

    @Override
    public void run(ApplicationArguments args) {
        if (appStarted.compareAndSet(false, true)) {
            cronTaskConfigRefresh();
        }
    }
}