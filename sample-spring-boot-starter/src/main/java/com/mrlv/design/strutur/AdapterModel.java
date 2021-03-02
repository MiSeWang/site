package com.mrlv.design.strutur;

/**
 * 适配器（Adapter）模式：将一个类的接口转换成客户希望的另外一个接口，使得原本由于接口不兼容而不能一起工作的那些类能一起工作。
 * 适配器模式将某个类的接口转换成客户端期望的另一个接口表示，目的是消除由于接口不匹配所造成的类的兼容性问题。
 * 主要分为三类：类的适配器模式、对象的适配器模式、接口的适配器模式。
 */
public class AdapterModel {
    public static void main(String[] args) {
        Targetable target1 = new Adapter1();
        target1.method1();
        target1.method2();

        Source source = new Source();
        Targetable target2 = new Adapter2(source);
        target2.method1();
        target2.method2();
    }
}

class Source {
    public void method1() {
        System.out.println("this is original method!");
    }
}
interface Targetable {

    /* 与原类中的方法相同 */
    public void method1();

    /* 新类的方法 */
    public void method2();
}
//类的适配器：当希望将一个类转换成满足另一个新接口的类时，可以使用类的适配器模式，创建一个新类，继承原有的类，实现新的接口即可。
class Adapter1 extends  Source implements Targetable{
    @Override
    public void method2() { System.out.println("this is the targetable method!"); }
}
//对象的适配器：当希望将一个对象转换成满足另一个新接口的对象时，可以创建一个Wrapper类，持有原类的一个实例，在Wrapper类的方法中，调用实例的方法就行。
class Adapter2 implements  Targetable{

    private Source source;

    public Adapter2(Source source){
        super();
        this.source = source;
    }

    @Override
    public void method1() {
        source.method1();
    }

    @Override
    public void method2() {
        System.out.println("this is the targetable method!");
    }
}

//接口的适配器模式：当不希望实现一个接口中所有的方法时，可以创建一个抽象类Wrapper，实现所有方法，我们写别的类的时候，继承抽象类即可。
