package com.mrlv.juc.lock;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;


enum Resource {
    AA("AA", 1, 5), BB("BB", 2, 10), CC("CC", 3, 15);

    private String name;
    private Integer code;
    private Integer num;
    public static Resource getResourceByCode(int code){
        for (Resource element: Resource.values()) {
            if (element.code.equals(code)) {
                return element;
            }
        }
        return null;
    }
    Resource(String name, Integer code, Integer num){
        this.name = name;
        this.code = code;
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}
public class ShareResource {
    private Resource resource = Resource.AA;

    public void  print(Lock lock, Resource resource, Resource toResource, Condition condition, Condition toCondition){
        lock.lock();
        try{
            //1.判断
            while (this.resource != resource){
                condition.await();
            }
            //2.干活
            for (int i = 1; i <= this.resource.getNum(); i++) {
                System.out.println(this.resource.getName() + ":打印" + i + "次");
            }
            this.resource = toResource;
            //3.通知
            toCondition.signal();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            lock.unlock();
        }

    }




    /**
     * AA打印 5 次， BB打印 10 次， CC打印 15 次
     * 紧接着
     * AA打印 5 次， BB打印 10 次， CC打印 15 次
     * ...
     * 来 10 轮
     * @param args
     */
    public static void main(String[] args) {
        Lock lock = new ReentrantLock();
        Condition c_AA = lock.newCondition();
        Condition c_BB = lock.newCondition();
        Condition c_CC = lock.newCondition();

        ShareResource shareResource = new ShareResource();

        new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                shareResource.print(lock, Resource.AA, Resource.BB, c_AA, c_BB);
            }

        }, Resource.AA.getName()).start();
        new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                shareResource.print(lock, Resource.BB, Resource.CC, c_BB, c_CC);
            }

        }, Resource.BB.getName()).start();
        new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                shareResource.print(lock, Resource.CC, Resource.AA, c_CC, c_AA);
            }

        }, Resource.CC.getName()).start();
    }
}

