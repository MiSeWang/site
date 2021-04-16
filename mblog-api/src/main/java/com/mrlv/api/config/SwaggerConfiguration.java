package com.mrlv.api.config;

import com.mrlv.api.anno.AnnotationNoSwagger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

import com.google.common.base.Predicates;


@Configuration
public class SwaggerConfiguration {

    /**
     * 创建Docket类型的对象，并使用spring容器管理。
     * Docket是Swagger中的全局配置对象
     * @return
     */
    @Bean
    public Docket docket(){
        Docket docket = new Docket(DocumentationType.SWAGGER_2);
        //API帮助文档的描述信息。information
        ApiInfo apiInfo = new ApiInfoBuilder()
                .contact(new Contact("测试", "http://127.0.0.1:8088/api/", "826303461@qq.com"))        //配置Swagger文档主题内容
                .title("Swagger接口帮助文档")
                .description("项目的具体说明文档。")
                .version("1.1.0")
                .build();
        docket
                .select()       //获取docket中的选择器。    返回ApiSelectorBuilder。构建选择器的。 如：扫描什么包注解。
                .apis(
                        Predicates.and(
                                Predicates.not( //取反。 false -> true
                                        RequestHandlerSelectors.withMethodAnnotation(AnnotationNoSwagger.class) //当方法上有注解的时候返回true
                                        ),
                                RequestHandlerSelectors.basePackage("com.mrlv.api.controller")                  //设定扫描哪个包（包括子包）
                        )
                )
                .paths(
                        Predicates.or(
                            PathSelectors.any(),
                            PathSelectors.regex("/swagger/.*"),                 //使用正则表达式，约束生成API文档的路径地址。
                            PathSelectors.regex("/.*")
                        )
                )
                .build();
        docket.apiInfo(apiInfo);
        return docket;
    }
}
