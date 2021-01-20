abstract class BasketBall {
  String position;

  BasketBall(this.position);

  void basketballPosition() {
    print('basketball play position $position');
  }

  void play() {
    print('basketball');
  }
}

abstract class FootBall {
  String position;

  FootBall(this.position);

  void footballPositon() {
    print('FootBall play position $position');
  }

  void play() {
    print('football');
  }
}

class Father implements BasketBall {
  void play() {
    print('father basketball');
  }

  @override
  String position;

  @override
  void basketballPosition() {
    print('小前锋');
  }
}

class Mother implements FootBall {
  void play() {
    print('mother play America Football');
  }

  @override
  String position;

  @override
  void footballPositon() {
    print('前锋');
  }
}

/// implements关键字只是声明要实现接口方法,具体的方法实现要在使用的类中重写
class Harry extends Father implements FootBall {
  @override
  String position;

  @override
  void basketballPosition() {
    super.basketballPosition();
    print('后卫');
  }

  @override
  void footballPositon() {
    print('边锋');
  }

  @override
  void play() {
    super.play();
    print('basketball and football');
  }
}

abstract class BasketBall1 {
  void play() {
    print('basketball1');
  }
}

abstract class FootBall1 {
  void play() {
    print('football1');
  }
}

class Father1 {
  void play() {
    print('father1 basketball');
  }
}

/// with关键字能够实现mixin,可以想象成多继承，而且是以类似于栈的形式实现 (最后一个混入的 mixins 会覆盖前面一个 mixins 的特性)
/// mixin 中不可申明构造函数
class Tompson extends Father1 with BasketBall1, FootBall1 {
  @override
  void play() {
    super.play();
    print('basketball1 and football1');
  }
}

class Durant extends Father1 with BasketBall1 implements FootBall1 {
  @override
  void play() {
    super.play();
    print('basketball1 and football1');
  }
}

class Father2 {
  void init() {
    print('Father2 init');
  }

  void play() {
    print('father2 basketball');
  }

  // @override
  // void initMother() {
  //   print('father2 init mother');
  // }
}

// 当使用on关键字，则表示该mixin只能在那个类的子类使用了，
// 那么结果显然的，mixin中可以调用那个类定义的方法、属性
mixin FirstMiXin on Father2 {
  @override
  void init() {
    print('FirstMiXin init start');
    super.init();
    print('FirstMixin init end');
  }
}

mixin SecondMiXin on Father2 {
  @override
  void init() {
    print('secondMiXin init start');
    super.init();
    print('secondMiXin init end');
  }
}

class OtherFamily {
  void init() {
    print('other family');
  }
}

mixin otherFamilyMiXin on OtherFamily {
  @override
  void init() {
    super.init();
  }
}

/// with关键字把FirstMixin和SecondMixin以及Father自动关联为父子
/// 这一切都是基于on关键字
class Son extends Father2 with FirstMiXin, SecondMiXin {
  @override
  void init() {
    print('son init start');
    super.init();
    print('son init end');
  }
}

/// 这个时候OtherFamily会覆盖前面的mixin
/// super直接指向otherFamily中的init
/// 但依旧能继承Father2中play方法
/// 谨慎使用
class Son1 extends Father2 with FirstMiXin, SecondMiXin, OtherFamily {
  @override
  void init() {
    print('son1 init start');
    super.init();
    print('son1 init end');
  }

  @override
  void play() {
    super.play();
    print('son1 basketball');
  }
}

abstract class Mother2 {
  void initMother();
}

mixin FirstMiXin2 on Father2 implements Mother2 {
  @override
  void init() {
    print('FirstMiXin2 init start');
    super.init();
    print('FirstMiXin2 init end');
  }

  @override
  void initMother() {
    print('FirstMiXin2 init start');
  }
}

/// on后面连接两个接口时
/// 会将连接的接口逐级连接起来，只要往前能实现第二个接口即可实现
mixin SecondMiXin2 on Father2, Mother2 {
  @override
  void init() {
    print('SecondMiXin2 init start');
    super.init();
    print('SecondMiXin2 init end');
  }
}

class Son2 extends Father2 with FirstMiXin2, SecondMiXin2 {
  @override
  void initMother() {
    super.initMother();
    print('son2 initmother');
  }

  @override
  void init() {
    print('son2 init start');
    super.init();
    print('son2 init end');
  }
}
