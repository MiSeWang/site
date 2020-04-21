package com.mrlv.juc;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/***
 * 生产消费模式是等待唤醒机制的一个经典案例
 * 1、虚假唤醒问题.
 */
public class TestProductorAndConsumer {

    public static void main(String[] args) {
        Shopping shopping = new Shopping("1号当铺", 1);
        Productor productor = new Productor(shopping);
        Consumer consumer = new Consumer(shopping);
        new Thread(productor, "生产者A").start();
        new Thread(productor, "生产者B").start();
        new Thread(productor, "生产者C").start();
        new Thread(consumer, "消费者A").start();
        new Thread(consumer, "消费者B").start();
        new Thread(consumer, "消费者C").start();
    }
}

class Shopping {
    private String name;
    private Integer goodsSum = 0;
    private Integer maxSum;

    private Lock lock = new ReentrantLock();//创建锁对象
    private Condition condition = lock.newCondition();

    public Shopping(String name, Integer maxSum){
        this.name = name;
        this.maxSum = maxSum;
    }

    public void goodsIn (){ //进货
        lock.lock();//上锁
        try {
            while (goodsSum >= maxSum) {
                System.out.println(Thread.currentThread().getName() + " <===> " +  "超市:" + name + "货架已满");
                try {
                    condition.await();//满了就等待
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("超市:" + name + "进货 <========= " + Thread.currentThread().getName() + "， 库存" + ++goodsSum);
            condition.signalAll();//没满就可以进货
        } finally {
            lock.unlock();
        }
    }

    public void goodsOut (){ //出货
        lock.lock();//上锁
        try {
            while (goodsSum <= 0) {
                System.out.println(Thread.currentThread().getName() + " <===> " +  "超市:" + name + "货物已被售完");
                try {
                    condition.await();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("超市:" + name + "卖出 =========> " + Thread.currentThread().getName() + "，库存" + --goodsSum);
            condition.signalAll();
        } finally {
            lock.unlock();
        }
    }
}


class Productor implements Runnable{
    private Shopping shopping;

    public Productor(Shopping shopping){
        this.shopping = shopping;
    }

    @Override
    public void run() {
        for (int i = 0; i < 20; i++) {
//            try {
//                Thread.sleep(200);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
            shopping.goodsIn();
        }
    }
}

class Consumer implements Runnable {
    private Shopping shopping;

    public Consumer(Shopping shopping){
        this.shopping = shopping;
    }
    @Override
    public void run() {
        for (int i = 0; i < 20; i++) {
//            try {
//                Thread.sleep(200);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
            shopping.goodsOut();
        }
    }
}
