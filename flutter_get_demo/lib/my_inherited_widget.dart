import 'package:flutter/material.dart';

class UserInfo {
  String name;
  int age;

  UserInfo({this.name, this.age});
}

// ignore: must_be_immutable
class MyInheritedWidget extends InheritedWidget {
  ValueNotifier<UserInfo> _valueNotifier;

  ValueNotifier<UserInfo> get valueNotifier => _valueNotifier;

  MyInheritedWidget(UserInfo userInfo, {Widget child}) : super(child: child) {
    _valueNotifier = ValueNotifier(userInfo);
  }

  static MyInheritedWidget of(BuildContext context) {
    // 会注册依赖关系
    // return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
    // 未注册依赖关系
    return context
        .getElementForInheritedWidgetOfExactType<MyInheritedWidget>()
        .widget;
  }

  void updateData(UserInfo info) {
    _valueNotifier.value = info;
  }

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return false;
  }
}

class A extends StatefulWidget {
  final Widget child;

  const A({Key key, this.child}) : super(key: key);

  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
  @override
  void initState() {
    super.initState();
    print('A initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('A didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('A build');
    return Center(
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('A dispose');
  }
}

class F extends StatefulWidget {
  @override
  _FState createState() => _FState();
}

class _FState extends State<F> {
  @override
  void initState() {
    super.initState();
    print('F initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('F didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('F build');
    return ValueListenableBuilder(
      valueListenable: MyInheritedWidget.of(context).valueNotifier,
      builder: (context, UserInfo value, child) {
        return Text('${value.name}-${value.age}');
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('F dispose');
  }
}
