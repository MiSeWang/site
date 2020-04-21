package com.mrlv.juc;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/***
 * 编写一个程序，开启 3 个线程，这三个线程的 ID 分别为 A、B、C，
 * 每个线程将自己的 ID 在屏幕上打印 10 遍，要求输出的结果必须按顺序显示。
 * 如：ABCABCABC…… 依次递归
 *
 * 线程本来是抢占式进行的，要按序交替，所以必须实现线程通信，
 * 那就要用到等待唤醒。可以使用同步方法，也可以用同步锁。
 *
 * 以下编码就满足需求。创建三个线程，分别调用loopA、loopB和loopC方法，这三个线程使用condition进行通信。
 */
public class TestLoopPrint {
    public static void main(String[] args) {
        AlternationDemo ad = new AlternationDemo();

        new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                ad.loopA();
            }
        }, "A").start();
        new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                ad.loopB();
            }
        }, "B").start();
        new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                ad.loopC();
            }
        }, "C").start();
    }
}
class AlternationDemo{
    private Integer number = 1; //当前正在执行的线程的标记
    private Lock lock = new ReentrantLock();
    Condition condition1 = lock.newCondition();
    Condition condition2 = lock.newCondition();
    Condition condition3 = lock.newCondition();

    public void loopA(){
        lock.lock();
        try {
            if (this.number != 1){
                this.condition1.await();
            }
            System.out.println(Thread.currentThread().getName());
            this.number = 2;
            this.condition2.signal();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            lock.unlock();
        }
    }

    public void loopB(){
        lock.lock();
        try {
            if (this.number != 2){
                this.condition2.await();
            }
            System.out.println(Thread.currentThread().getName());
            this.number = 3;
            this.condition3.signal();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            lock.unlock();
        }
    }


    public void loopC(){
        lock.lock();
        try {
            if (this.number != 3){
                this.condition3.await();
            }
            System.out.println(Thread.currentThread().getName());
            this.number = 1;
            this.condition1.signal();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            lock.unlock();
        }
    }
}
