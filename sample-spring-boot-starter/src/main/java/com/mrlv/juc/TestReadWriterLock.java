package com.mrlv.juc;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/***
 * ReadWriterLock读写锁
 * 我们在读数据的时候，可以多个线程同时读，不会出现问题，但是写数据的时候，如果多个线程同时写数据，那么到底是写入哪个线程的数据呢？
 * 所以，如果有两个线程，写写/读写需要互斥，读读不需要互斥。这个时候可以用读写锁。看例子：
 *
 * 这个就是读写锁的用法。上面的代码实现了一个线程写，一百个线程同时读的操作。
 */
public class TestReadWriterLock {
    public static void main(String[] args) {
        ReadWriterLockDemo readWriterLockDemo = new ReadWriterLockDemo();
        new Thread(() -> {
           readWriterLockDemo.set(101);}, "write:").start();
        for (int i = 0;i<100;i++){//100个线程读
            new Thread(() -> readWriterLockDemo.get()).start();
        }
    }
}

class ReadWriterLockDemo{
    private int number = 0;
    //初始化一个读写锁
    private ReadWriteLock readWriteLock = new ReentrantReadWriteLock();
    //读(可以多个线程同时操作)
    public void get(){
        readWriteLock.readLock().lock();//锁之
        try {
            System.out.println(Thread.currentThread().getName()+":"+ this.number);
        } finally {
            readWriteLock.readLock().unlock();
        }
    }
    //写(一次只能有一个线程操作)
    public void set(int number){
        readWriteLock.writeLock().lock();//锁之
        try {
            System.out.println(Thread.currentThread().getName());
            this.number = number;
        } finally {
            readWriteLock.writeLock().unlock();
        }
    }
}
