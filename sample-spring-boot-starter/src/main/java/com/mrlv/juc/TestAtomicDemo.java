package com.mrlv.juc;

import java.util.concurrent.atomic.AtomicInteger;

/***
 * JDK 1.5之后，Java提供了原子变量，在java.util.concurrent.atomic包下。原子变量具备如下特点：
 *
 * 有volatile保证内存可见性。
 * 用CAS算法保证原子性。
 */
public class TestAtomicDemo {
    public static void main(String[] args) {
        AtomicDemo atomicDemo = new AtomicDemo();
        for (int x = 0; x < 20; x++){
            new Thread(atomicDemo, "飞机" + x).start();
        }
    }
}

class AtomicDemo implements  Runnable{

    //1.private int i = 0;

    //1.使用原子变量改进 i++ 问题：
    AtomicInteger i = new AtomicInteger();

    @Override
    public void run() {
        try {
            Thread.sleep(200) ;
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(Thread.currentThread().getName() + ":" + getI());
    }

    public int getI() {
        //2.return i ++;
        return i.getAndIncrement();
    }
}
