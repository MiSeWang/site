package com.mrlv.juc;

/***
 * 内存可见性问题：当多个线程操作共享数据时，彼此不可见。
 * 1.要解决这个问题，可以加锁 synchronized
 * 2.不想加锁，又要解决内存可见性问题，那么就可以使用volatile关键字
 * volatile关键字：当多个线程操作共享数据时，可以保证内存中的数据可见。
 * 用这个关键字修饰共享数据，就会及时的把线程缓存中的数据刷新到主存中去，也可以理解为，就是直接操作主存中的数据。所以在不使用锁的情况下，可以使用volatile。
 *
 * volatile和synchronized的区别：
 * volatile不具备互斥性(当一个线程持有锁时，其他线程进不来，这就是互斥性)。
 * volatile不具备原子性。
 */
public class TestVolatile {
    public static void main(String[] args) {
        ThreadDemo threadDemo = new ThreadDemo();
        new Thread(threadDemo).start();

        while (true){
            //1.要解决这个问题，可以加锁 synchronized
            //1.synchronized(threadDemo) {
                if (threadDemo.isFlag()) {
                    System.out.println("主线程读取到的flag = " + threadDemo.isFlag());
                    break;
                }
            //}
        }
    }
}

class ThreadDemo implements  Runnable{
    private volatile boolean flag = false;
    @Override
    public void run() {
        try {
            Thread.sleep(200);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        this.flag = true;
        System.out.println("ThreadDemo线程修改后的flag = " + isFlag());
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }
}
