package com.mrlv.blockingQueue;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.TimeUnit;

/**
 * SynchronousQueue	不存储元素的阻塞队列，也即单个元素的队列。
 */
public class TestSynchronousQueue {
    public static void main(String[] args) {
        BlockingQueue<String> blockingQueue = new SynchronousQueue<>();
        new Thread(() -> {
            try{
                System.out.println(Thread.currentThread().getName() + " put 1");
                blockingQueue.put("1");

                System.out.println(Thread.currentThread().getName() + " put 2");
                blockingQueue.put("2");

                System.out.println(Thread.currentThread().getName() + " put 3");
                blockingQueue.put("3");
            } catch (Exception e){ }
        }, "AAA").start();
        new Thread(() -> {
            try{
               TimeUnit.SECONDS.sleep(3);
                System.out.println(Thread.currentThread().getName() + ":" +  blockingQueue.take());
            } catch (Exception e){ }
            try{
                TimeUnit.SECONDS.sleep(3);
                System.out.println(Thread.currentThread().getName() + ":" +  blockingQueue.take());
            } catch (Exception e){ }
            try{
                TimeUnit.SECONDS.sleep(3);
                System.out.println(Thread.currentThread().getName() + ":" +  blockingQueue.take());
            } catch (Exception e){ }
        }, "AAA").start();
    }
}
