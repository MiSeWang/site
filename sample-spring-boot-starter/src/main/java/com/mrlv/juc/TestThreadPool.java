package com.mrlv.juc;

import java.io.IOException;
import java.util.concurrent.*;

/***
 * 我们使用线程时，需要new一个，用完了又要销毁，这样频繁的创建销毁也很耗资源，所以就提供了线程池。
 * 道理和连接池差不多，连接池是为了避免频繁的创建和释放连接，所以在连接池中就有一定数量的连接，要用时从连接池拿出，用完归还给连接池。
 * 线程池也一样。线程池中有一个线程队列，里面保存着所有等待状态的线程。
 *
 */
public class TestThreadPool {

    public static void main(String[] args) {

        testCallerRunsPolicy();

    }

    public static void testCallerRunsPolicy(){
        //1.创建线程池
        ExecutorService fixedThreadPool = new ThreadPoolExecutor(1, 1,
                0L, TimeUnit.MILLISECONDS,
                new LinkedBlockingQueue<Runnable>(1),
                new ThreadPoolExecutor.CallerRunsPolicy());
        //2.为线程池中的线程分配任务
        fixedThreadPool.submit(() -> {
            try {
                System.out.println(Thread.currentThread() + ":老一启动");
                TimeUnit.SECONDS.sleep(10);
                System.out.println(Thread.currentThread() + ":老一结束");
            } catch (InterruptedException interruptedException) {
                interruptedException.printStackTrace();
            }
        });
        fixedThreadPool.submit(() -> {
            try {
                System.out.println(Thread.currentThread() + ":老二启动");
                TimeUnit.SECONDS.sleep(10);
                System.out.println(Thread.currentThread() + ":老二结束");
            } catch (InterruptedException interruptedException) {
                interruptedException.printStackTrace();
            }
        });
        fixedThreadPool.submit(() -> {
            try {
                System.out.println(Thread.currentThread() + ":老三启动");
                TimeUnit.SECONDS.sleep(5);
                System.out.println(Thread.currentThread() + ":老三结束");
            } catch (InterruptedException interruptedException) {
                interruptedException.printStackTrace();
            }
        });
        fixedThreadPool.submit(() -> {
            try {
                System.out.println(Thread.currentThread() + ":老四启动");
                TimeUnit.SECONDS.sleep(10);
                System.out.println(Thread.currentThread() + ":老四结束");
            } catch (InterruptedException interruptedException) {
                interruptedException.printStackTrace();
            }
        });
        //3.关闭线程池
        fixedThreadPool.shutdown();
        System.out.println("!111");
    }

    public void testFixedThreadPool(){
        //1.创建线程池
        ExecutorService fixedThreadPool = Executors.newFixedThreadPool(5);     //一池5个处理线程
        //2.为线程池中的线程分配任务
        fixedThreadPool.submit(new ThreadPoolDemo());
        //3.关闭线程池
        fixedThreadPool.shutdown();
    }
    public void testSingleThreadExecutor(){
        //1.创建线程池
        ExecutorService singleThreadExecutor = Executors.newSingleThreadExecutor();     //一池1个处理线程
        //2.为线程池中的线程分配任务
        singleThreadExecutor.submit(new ThreadPoolDemo());
        //3.关闭线程池
        singleThreadExecutor.shutdown();
    }
    public void testCachedThreadPool(){
        //1.创建线程池
        ExecutorService cachedThreadPool = Executors.newCachedThreadPool();             //一池N个处理线程
        //2.为线程池中的线程分配任务
        cachedThreadPool.submit(new ThreadPoolDemo());
        //3.关闭线程池
        cachedThreadPool.shutdown();
    }
}

class ThreadPoolDemo implements Runnable {

    private int i = 0;

    @Override
    public void run() {
        while (i < 100) {
            System.out.println(Thread.currentThread().getName() + ":" + (i++));
        }
    }
}
