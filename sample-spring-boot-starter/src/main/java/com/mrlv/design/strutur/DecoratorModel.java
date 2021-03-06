package com.mrlv.design.strutur;

import javax.swing.*;
import java.awt.*;

/**
 * 装饰模式的定义与特点
 * 装饰（Decorator）模式的定义：指在不改变现有对象结构的情况下，动态地给该对象增加一些职责（即增加其额外功能）的模式，它属于对象结构型模式。
 * <p>
 * 装饰（Decorator）模式的主要优点有：
 * 采用装饰模式扩展对象的功能比采用继承方式更加灵活。
 * 可以设计出多个不同的具体装饰类，创造出多个不同行为的组合。
 * <p>
 * 其主要缺点是：装饰模式增加了许多子类，如果过度使用会使程序变得很复杂。
 * <p>
 * 装饰模式的结构与实现
 * 通常情况下，扩展一个类的功能会使用继承方式来实现。但继承具有静态特征，耦合度高，并且随着扩展功能的增多，子类会很膨胀。
 * 如果使用组合关系来创建一个包装对象（即装饰对象）来包裹真实对象，并在保持真实对象的类结构不变的前提下，为其提供额外的功能，这就是装饰模式的目标。
 * 下面来分析其基本结构和实现方法。
 * <p>
 * 1. 模式的结构
 * 装饰模式主要包含以下角色。
 * 抽象构件（Component）角色：定义一个抽象接口以规范准备接收附加责任的对象。
 * 具体构件（Concrete    Component）角色：实现抽象构件，通过装饰角色为其添加一些职责。
 * 抽象装饰（Decorator）角色：继承抽象构件，并包含具体构件的实例，可以通过其子类扩展具体构件的功能。
 * 具体装饰（ConcreteDecorator）角色：实现抽象装饰的相关方法，并给具体构件对象添加附加的责任。
 */
public class DecoratorModel {
    public static void main(String[] args) {
        Morrigan m0 = new Original();
        m0.display();
        Morrigan m1 = new Succubus(m0);
        m1.display();
        Morrigan m2 = new Girl(m0);
        m2.display();
    }
}

//抽象构件角色：莫莉卡
interface Morrigan {
    void display();
}

//具体构件角色：原身
class Original extends JFrame implements Morrigan {
    private static final long serialVersionUID = 1L;
    private String t = "Morrigan_0.jpg";

    public Original() {
        super("《恶魔战士》中的莫莉卡·安斯兰");
    }

    public void setImage(String t) {
        this.t = t;
    }

    @Override
    public void display() {
        this.setLayout(new FlowLayout());
        JLabel l1 = new JLabel(new ImageIcon(getClass().getResource("/img/decorator/" + t)));
        this.add(l1);
        this.pack();
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setVisible(true);
    }
}

//抽象装饰角色：变形
class Changer implements Morrigan {
    Morrigan morrigan;

    public Changer(Morrigan morrigan) {
        this.morrigan = morrigan;
    }

    public void display() {
        morrigan.display();
    }
}

//具体装饰角色：女妖
class Succubus extends Changer {
    public Succubus(Morrigan morrigan) {
        super(morrigan);
    }

    public void display() {
        setChanger();
        morrigan.display();
    }

    public void setChanger() {
        ((Original) super.morrigan).setImage("Morrigan_1.jpg");
    }
}

//具体装饰角色：少女
class Girl extends Changer {
    public Girl(Morrigan morrigan) {
        super(morrigan);
    }

    public void display() {
        setChanger();
        super.display();
    }

    public void setChanger() {
        ((Original) super.morrigan).setImage("Morrigan_2.jpg");
    }
}
