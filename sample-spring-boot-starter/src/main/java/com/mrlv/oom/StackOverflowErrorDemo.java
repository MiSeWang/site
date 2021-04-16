package com.mrlv.oom;

import org.springframework.cglib.proxy.Enhancer;

public class StackOverflowErrorDemo {

    public static void main(String[] args) {
        //引爆方法栈
        //stackOverflowError();
//        Enhancer

    }

    private static void stackOverflowError(){
        stackOverflowError();
    }
}
