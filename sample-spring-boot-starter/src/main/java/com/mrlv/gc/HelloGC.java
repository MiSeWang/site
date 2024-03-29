package com.mrlv.gc;

public class HelloGC {

    public static void main(String[] args) {

        long totalMemory = Runtime.getRuntime().totalMemory();  //返回 Java 虚拟机中的内存总量
        long maxMemory = Runtime.getRuntime().maxMemory();      //返回 Java 虚拟机试图使用的最大内存量

        System.out.println("TOTAL_MEMORY(-Xms) = " + totalMemory + "(字节)、" + (totalMemory / 1024d / 1024d) + "MB");

        System.out.println("MAX_MEMORY(-Xmx) = " + maxMemory + "(字节)、" + (maxMemory / 1024d / 1024d) + "MB");

    }
}
