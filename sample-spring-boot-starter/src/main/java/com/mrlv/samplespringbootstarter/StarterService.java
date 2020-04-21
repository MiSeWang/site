package com.mrlv.samplespringbootstarter;

public class StarterService {
    private String config;

    public StarterService(String config) {
         this.config = config;
    }

    public String[] split(String separatorChar){
        return this.config.split(separatorChar);
    }
}
