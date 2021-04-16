package com.mrlv.api.anno;


import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 标注的接口不显示在Swagger文档内
 * @Target描述当前注解可以定义在什么资源上。
 * 属性 value
 * @Retention当前注解在什么时候生效。
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(value = { ElementType.METHOD, ElementType.TYPE_USE })
public @interface AnnotationNoSwagger {

    //自定义注解中的属性，相当于@AnnotationNoSwagger(value="")
    String value() default "";
}
