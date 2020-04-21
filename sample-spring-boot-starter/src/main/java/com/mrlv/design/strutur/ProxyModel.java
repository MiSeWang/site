package com.mrlv.design.strutur;

/**
 * 代理（Proxy）模式：为某对象提供一种代理以控制对该对象的访问。即客户端通过代理间接地访问该对象，从而限制、增强或修改该对象的一些特性。
 */
public class ProxyModel {
    public static void main(String[] args) {
        ISourced source = new Proxy();
        source.method();
    }
}
interface ISourced {
    void method();
}
class Sourced implements ISourced{
    @Override
    public void method() {
        System.out.println("放屁");
    }
}
class Proxy implements ISourced {
    private ISourced source;
    public Proxy(){
        super();
        this.source = new Sourced();
    }

    @Override
    public void method() {
        before();
        source.method();
        after();
    }
    private void after() {
        System.out.println("after proxy!");
    }
    private void before() {
        System.out.println("before proxy!");
    }
}
