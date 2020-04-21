package com.mrlv.samplespringbootstarter;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConditionalOnClass(StarterService.class)
@EnableConfigurationProperties({StarterServiceProperties.class})
public class StarterAutoConfiguration {

    @Autowired
    private StarterServiceProperties properties;


    @Bean
    @ConditionalOnMissingBean
    @ConditionalOnProperty(name="test.service.enabled", havingValue = "true", matchIfMissing = true)
    public StarterService starterService(){ return new StarterService(properties.getConfig());}
}
