package com.mrlv.juc;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 在JDK1.5之前，解决多线程安全问题有两种方式(synchronized隐式锁)：
 *
 * 同步代码块
 * 同步方法
 * 在JDK1.5之后，出现了更加灵活的方式(Lock显式锁)：
 *
 * 同步锁
 * Lock需要通过lock()方法上锁，通过unlock()方法释放锁。为了保证锁能释放，所有unlock方法一般放在finally中去执行。
 * 常用的几个方法
 *  lock(), 拿不到lock就不罢休，不然线程就一直block。 比较无赖的做法。
 *  tryLock()，马上返回，拿到lock就返回true，不然返回false。 比较潇洒的做法。
 *  带时间限制的tryLock()，拿不到lock，就等一段时间，超时返回false。比较聪明的做法。
 *  lockInterruptibly() lockInterruptibly()和上面的第一种情况是一样的， 线程在请求lock并被阻塞时，但如果被interrupt，则“此线程会被唤醒并被要求处理InterruptedException”。
 *
 * synchronized和lock区别
 * 　　1）Lock是一个接口，而synchronized是Java中的关键字，synchronized是内置的语言实现；
 *
 * 　　2）synchronized在发生异常时，会自动释放线程占有的锁，因此不会导致死锁现象发生；而Lock在发生异常时，如果没有主动通过unLock()去释放锁，则很可能造成死锁现象，因此使用Lock时需要在finally块中释放锁；
 *
 * 　　3）Lock可以让等待锁的线程响应中断，而synchronized却不行，使用synchronized时，等待的线程会一直等待下去，不能够响应中断；
 *
 * 　　4）通过Lock可以知道有没有成功获取锁，而synchronized却无法办到。
 *
 * 　　5）Lock可以提高多个线程进行读操作的效率。
 *
 * 　　在性能上来说，如果竞争资源不激烈，两者的性能是差不多的，而当竞争资源非常激烈时（即有大量线程同时竞争），此时Lock的性能要远远优于synchronized。所以说，在具体使用时要根据适当情况选择。
 *
 * 多个线程同时操作共享数据ticket，所以会出现线程安全问题。会出现同一张票卖了好几次或者票数为负数的情况。以前用同步代码块和同步方法解决，现在看看用同步锁怎么解决。
 *
 */
public class TestLock {

    public static void main(String[] args) {
        Ticket ticket = new Ticket();
        new Thread(ticket, "窗口1").start();
        new Thread(ticket, "窗口2").start();
        new Thread(ticket, "窗口3").start();
    }
}

class Ticket implements Runnable{
    private Lock lock = new ReentrantLock();    //创建一个lock锁，lock是个接口
    private int ticket = 100;
    @Override
    public void run() {
        while (true){
            lock.lock();  //上锁
            try {
                if (ticket > 0){
                    try {
                        Thread.sleep(500);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println(Thread.currentThread().getName() +  "完成售票，余票：" + --ticket);
                } else {
                    break;
                }
            } finally {
                lock.unlock();//释放锁
            }
        }
    }
}
