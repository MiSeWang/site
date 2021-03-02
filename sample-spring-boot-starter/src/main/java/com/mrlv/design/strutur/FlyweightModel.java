package com.mrlv.design.strutur;

import java.util.HashMap;
import java.util.Map;

/**
 * 享元（Flyweight）模式的定义：运用共享技术来有効地支持大量细粒度对象的复用。
 * 它通过共享已经存在的又橡来大幅度减少需要创建的对象数量、
 * 避免大量相似类的开销，从而提高系统资源的利用率。
 */
public class FlyweightModel {
    public static void main(String[] args) {
        FlyweightFactory factory=new FlyweightFactory();
        Flyweight f01=factory.getFlyweight("a");
        Flyweight f02=factory.getFlyweight("a");
        Flyweight f03=factory.getFlyweight("a");
        Flyweight f11=factory.getFlyweight("b");
        Flyweight f12=factory.getFlyweight("b");
        f01.operation(new UnsharedConcreteFlyweight("第1次调用a。"));
        f02.operation(new UnsharedConcreteFlyweight("第2次调用a。"));
        f03.operation(new UnsharedConcreteFlyweight("第3次调用a。"));
        f11.operation(new UnsharedConcreteFlyweight("第1次调用b。"));
        f12.operation(new UnsharedConcreteFlyweight("第2次调用b。"));
    }
}

//非享元角色
class  UnsharedConcreteFlyweight{
    private String info;

    UnsharedConcreteFlyweight(String info) {
        this.info=info;
    }
    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }
}

interface  Flyweight{
    void operation(UnsharedConcreteFlyweight state);
}
//具体享元角色
class ConcreteFlyweight implements Flyweight {
    private String key;
    ConcreteFlyweight(String key){
        this.key=key;
        System.out.println("具体享元"+key+"被创建！");
    }
    public void operation(UnsharedConcreteFlyweight outState)
    {
        System.out.print("具体享元"+key+"被调用，");
        System.out.println("非享元信息是:"+outState.getInfo());
    }
}
//享元工厂角色
class FlyweightFactory
{
    private Map<String, Flyweight> flyweights=new HashMap<>();
    public Flyweight getFlyweight(String key) {
        Flyweight flyweight = flyweights.get(key);
        if(flyweight!=null) {
            System.out.println("具体享元"+key+"已经存在，被成功获取！");
        } else {
            flyweight=new ConcreteFlyweight(key);
            flyweights.put(key, flyweight);
        }
        return flyweight;
    }
}

