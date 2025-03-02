//package cn.qihangerp.common.aspect;
//import com.alibaba.fastjson2.JSONObject;
//import cn.qihangerp.common.annotation.ErpEchoLogger;
//import cn.qihangerp.common.utils.SpringUtils;
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.annotation.AfterReturning;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Pointcut;
//import org.springframework.stereotype.Component;
//
//import java.util.Date;
//
//@Aspect
//@Component
//public class ErpEchoLogAspect {
//
//    @Pointcut("@annotation(cn.qihangerp.common.annotation.ErpEchoLogger)")
//    public void loggableMethods() {
//    }
//
//    //    @AfterReturning(pointcut = "loggableMethods()", returning = "result")
////    public void logAfterReturning(JoinPoint joinPoint, Object result) {
//    @AfterReturning(pointcut = "@annotation(controllerLog)", returning = "result")
//    public void doAfterReturning(JoinPoint joinPoint, ErpEchoLogger controllerLog, Object result) {
//        // 这里将日志信息保存到数据库
//        handleLog(joinPoint, controllerLog, result);
//    }
//
//    private void handleLog(final JoinPoint joinPoint, ErpEchoLogger controllerLog, Object result) {
//        String methodName = joinPoint.getSignature().getName();
//        String className = joinPoint.getTarget().getClass().getName();
//        String logMessage = "Method " + className + "." + methodName + " executed successfully. Returned: " + result.toString();
//        // 实现将日志信息保存到数据库的逻辑
//        ErpEchoLog log = new ErpEchoLog();
//        log.setTitle(controllerLog.title());
//        log.setMethod(className + "." + methodName);
//        log.setBusinessType(controllerLog.businessType().name());
//        log.setResult(JSONObject.toJSONString(result));
//        log.setCreateTime(new Date());
//        // LogEntity logEntity = new LogEntity(logMessage);
//        // logRepository.save(logEntity);
//        SpringUtils.getBean(ErpEchoLogService.class).save(log);
//        System.out.println("Log saved to database: " + logMessage);
//    }
//}
