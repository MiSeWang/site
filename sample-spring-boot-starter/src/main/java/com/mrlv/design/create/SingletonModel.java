package com.mrlv.design.create;

/**
 * 单例模式
 */
public class SingletonModel {

    public static void main(String[] args) {

    }
}
//双重判断方式
class Singleton {
    private volatile static Singleton singleton;
    private Singleton(){}
    public static Singleton getInstance(){
        if (singleton == null){
            synchronized (singleton) {
                if (singleton == null){
                    singleton = new Singleton();
                }
            }
        }
        return singleton;
    }

    /* 如果该对象被用于序列化，可以保证对象在序列化前后保持一致 */
    public Object readResolve() {
        return getInstance();
    }
}


//静态内部类方式(利用了静态内部类的特性)
class SingletonStatic {
    private SingletonStatic(){}

    private static class SingletonFactory{
        private static SingletonStatic singleton = new SingletonStatic();
    }

    public static SingletonStatic getInstance(){
        return SingletonFactory.singleton;
    }

    /* 如果该对象被用于序列化，可以保证对象在序列化前后保持一致 */
    public Object readResolve() {
        return getInstance();
    }
}


//枚举方式(利用了枚举特性，防止了反序列化和反射攻击)
enum SingletonEnum {
    INSTANCE;
    public SingletonEnum getInstance(){
        return SingletonEnum.INSTANCE;
    }
}
