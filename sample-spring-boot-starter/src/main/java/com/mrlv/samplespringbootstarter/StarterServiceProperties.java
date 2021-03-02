package com.mrlv.samplespringbootstarter;


import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("test.service")
public class StarterServiceProperties {

    private String config;

    private Boolean enabled = true;

    public String getConfig() {
        return config;
    }

    public void setConfig(String config) {
        this.config = config;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
}
