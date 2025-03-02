package cn.qihangerp.common.annotation;

import java.lang.annotation.*;

/**
 * 自定义操作日志记录注解
 * 
 * @author qihang
 *
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ErpEchoLogger
{
    /**
     * 标题
     */
    public String title() default "";

    /**
     * 业务类型
     */
    public BusinessType businessType() default BusinessType.OTHER;

}
