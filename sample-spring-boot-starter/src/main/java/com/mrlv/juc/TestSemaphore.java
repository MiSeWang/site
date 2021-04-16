package com.mrlv.juc;

import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

public class TestSemaphore {
    public static void main(String[] args) {
        Semaphore semaphore = new Semaphore(3);
        for (int i = 0; i < 6; i++) {
            final int tempInt = i;
            new Thread(() -> {
                try {
                    semaphore.acquire();
                    System.out.println("车辆" + Thread.currentThread().getName() + "：抢到车位");
                    TimeUnit.SECONDS.sleep(3);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
                    System.out.println("车辆" + Thread.currentThread().getName() + "：停车三秒后离开了车位");
                    semaphore.release();
                }
            }, String.valueOf(tempInt)).start();
        }
    }
}
