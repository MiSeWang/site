package com.mrlv.juc.lock;

import java.util.concurrent.TimeUnit;

public class DeadLock implements Runnable{

    private String lockA;

    private String lockB;

    public DeadLock(String lockA, String lockB){
        this.lockA = lockA;
        this.lockB = lockB;
    }

    @Override
    public void run() {
        synchronized (this.lockA) {
            System.out.println("手持 " + this.lockA + " 等" + this.lockB);
            try {
                TimeUnit.SECONDS.sleep(2);
            } catch (InterruptedException interruptedException) {
                interruptedException.printStackTrace();
            }
            synchronized (this.lockB) {
                System.out.println("手持 " + this.lockB + " 等" + this.lockA);
            }
        }
    }



    public static void main(String[] args) {
        String lockA = "lockA";
        String lockB = "lockB";
        new Thread(new DeadLock(lockA, lockB), "ThreadA").start();
            new Thread(new DeadLock(lockB, lockA), "ThreadB").start();
    }
}
