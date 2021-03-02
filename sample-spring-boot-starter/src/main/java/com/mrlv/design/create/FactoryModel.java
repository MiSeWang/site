package com.mrlv.design.create;

/**
 * 简单工厂模式
 * 总体来说，工厂模式适合：凡是出现了大量的产品需要创建，并且具有共同的接口时，可以通过工厂方法模式进行创建。
 * 在以上的三种模式中，
 * 第一种如果传入的字符串有误，不能正确创建对象，
 * 第三种相对于第二种，不需要实例化工厂类，所以，大多数情况下，
 * 我们会选用第三种——静态工厂方法模式。
 */
public class FactoryModel {

    public static void main(String[] args) {
        Test2();
    }
    //简单工厂模式
    static void Test1(){
        SenderFactory factory = new SenderFactory();
        Sender sender = factory.produce("sms");
        sender.Send();
    }
    //工厂方法模式
    static void Test2(){
        Provider provider = new SendMailFactory();
        Sender sender = provider.produce();
        sender.Send();
    }

}

interface Provider {
    Sender produce();
}

class SendSmsFactory implements Provider{
    @Override
    public Sender produce(){ return new SmsSender(); }
}

class SendMailFactory implements Provider {
    @Override
    public Sender produce(){ return new MailSender(); }
}

//工厂类
class SenderFactory {
    public Sender produce(String type) {
        if ("mail".equals(type)) {
            return new MailSender();
        } else if ("sms".equals(type)) {
            return new SmsSender();
        } else {
            System.out.println("请输入正确的类型!");
            return null;
        }
    }
}

class MailSender implements Sender {
    @Override
    public void Send() {
        System.out.println("this is mailsender!");

    }
}

class SmsSender implements Sender {
    @Override
    public void Send() {
        System.out.println("this is sms sender!");
    }
}

interface Sender {
    void Send();
}
