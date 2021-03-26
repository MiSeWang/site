package com.mrlv.juc.lock;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/**
 * 手写一个自旋锁
 *  指尝试获取锁的线程不会立刻阻塞，而是采用循环的方式取尝试获取锁，这样的好处是减少线程上下文切换的消耗，缺点是循环会消耗CPU
 */
public class SpinLock {
    //原子引用线程
    AtomicReference<Thread> atomicReference = new AtomicReference<>();

    public void myLock(){
        Thread thread = Thread.currentThread();
        while (!atomicReference.compareAndSet(null, thread)){

        }
    }

    public void myUnLock(){
        Thread thread = Thread.currentThread();
        atomicReference.compareAndSet(thread, null);
    }

    public static void main(String[] args) {
        SpinLock spinLock = new SpinLock();
        new Thread(() -> {
            spinLock.myLock();
            try {
                System.out.println("啊，西巴");
                TimeUnit.SECONDS.sleep(5);
            } catch (InterruptedException e) {
                e.printStackTrace();
            } finally {
                spinLock.myUnLock();
            }
        }, "t1").start();

        new Thread(() -> {
            spinLock.myLock();
            System.out.println("东风破！");
            spinLock.myUnLock();
        }, "t2").start();
    }
}
