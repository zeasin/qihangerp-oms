package com.qihang.sys.api.task;

import com.qihang.sys.api.domain.SysTask;
import com.qihang.sys.api.feign.EchoService;
import com.qihang.sys.api.service.SysTaskService;
import com.qihang.sys.api.task.service.IPollableService;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class OrderTaskJD implements IPollableService {
    @Autowired
    private SysTaskService taskService;
    @Resource
    private EchoService echoService;
    @Override
    public void poll() {
        String echo = echoService.echo();
        System.out.printf("更新京东订单%s",echo);
    }

    @Override
    public String getCronExpression() {
        SysTask task = taskService.getById(2);
//        return "0/1 * * * * ?";
        return task.getCron();
    }
}