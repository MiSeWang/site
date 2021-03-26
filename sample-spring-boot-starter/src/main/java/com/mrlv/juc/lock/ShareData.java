package com.mrlv.juc.lock;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class ShareData {
    private int number = 0;
    private Lock lock = new ReentrantLock();
    private Condition condition  = lock.newCondition();

    public void increment() {
        lock.lock();
        try {
            //判断如果符合增加则增加，否则挂起
            while (number != 0) { //while,是为了防止虚假唤醒，官方文档推荐使用while
                //等待，不能生产
                condition.await();
            }
            number++;
            System.out.println(Thread.currentThread().getName() + ":" + number);
            condition.signalAll();
        } catch (Exception e){
        } finally {
            lock.unlock();
        }
    }

    public void decrement() {
        lock.lock();
        try {
            //判断如果符合增加则增加，否则挂起
            while (number == 0) { //while,是为了防止虚假唤醒，官方文档推荐使用while
                //等待，不能消费
                condition.await();
            }
            number--;
            System.out.println(Thread.currentThread().getName() + ":" + number);
            condition.signalAll();
        } catch (Exception e){
        } finally {
            lock.unlock();
        }
    }

    public static void main(String[] args) {
        ShareData shareData = new ShareData();
        new Thread(() -> {
            for (int i = 0; i < 5; i++) {
                try {
                    shareData.increment();
                } catch (Exception e) { }
            }
        }, "A").start();

        new Thread(() -> {
            for (int i = 0; i < 5; i++) {
                try {
                    TimeUnit.SECONDS.sleep(3);
                    shareData.decrement();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }, "B").start();
    }
}
