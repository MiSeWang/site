package com.mrlv.juc;

import java.util.concurrent.CountDownLatch;

/**
 * java.util.concurrent包中提供了多种并发容器类来改进同步容器的性能。
 * ContDownLatch是一个同步辅助类，在完成某些运算时，只有其他所有线程的运算全部完成，当前运算才继续执行，这就叫闭锁。看下面代码：
 */
public class TestCountDownLatch {

    public static void main(String[] args) {
        final CountDownLatch countDownLatch = new CountDownLatch(10);
        LatchDemo latchDemo = new LatchDemo(countDownLatch);
        long start = System.currentTimeMillis();
        for (int i = 0; i < 10; i++) {
            new Thread(latchDemo).start();
        }
        try {
            countDownLatch.await();
        } catch (InterruptedException e) { }
        long end = System.currentTimeMillis();
        System.out.println("耗时: " + (end - start) + "秒");
    }
}

class LatchDemo implements  Runnable{

    private CountDownLatch countDownLatch;

    public LatchDemo(CountDownLatch countDownLatch){
        this.countDownLatch = countDownLatch;
    }

    @Override
    public void run() {
        synchronized (this) {
            try {
                for (int i = 0; i < 5000; i++) {
                    if (i%2 == 0){
                        System.out.println(i);  //输出5000以内的偶数
                    }
                }
            } finally {
                countDownLatch.countDown();//每执行完一个就递减一个
            }
        }
    }
}
