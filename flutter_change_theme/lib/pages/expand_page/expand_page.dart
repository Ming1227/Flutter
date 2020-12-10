import 'package:flutter/material.dart';
import 'package:flutter_change_theme/widgets/sizebox/sizebox.dart';

class ExpandPage extends StatefulWidget {
  @override
  _ExpandPageState createState() => _ExpandPageState();
}

///Spacer 是通过 Expanded 实现的，Expanded继承自Flexible。
///填满剩余空间直接使用Expanded更方便。
///Spacer 用于撑开 Row、Column、Flex 的子组件的空隙。
class _ExpandPageState extends State<ExpandPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('权重组件'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(),
      ),
    );
  }

  Widget buildChildWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ASSizeBox(),
          child1(),
          ASSizeBox(),
          child2(),
          ASSizeBox(),
          child3(),
        ],
      ),
    );
  }

  Widget child3() {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 100,
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 100,
            color: Colors.green,
            child: Text('1'),
          ),
          Spacer(
            flex: 2,
          ),
          Container(
            height: 50,
            width: 100,
            color: Colors.pink,
            child: Text('2'),
          ),
          Spacer(),
          Container(
            height: 50,
            width: 100,
            color: Colors.purple,
            child: Text('3'),
          ),
        ],
      ),
    );
  }

  Widget child2() {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.blue,
              child: Text('1'),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.yellow,
              child: Text('2'),
            ),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.pink,
              child: Text('3'),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: 100,
              color: Colors.green,
              child: Text('4'),
            ),
          ),
        ],
      ),
    );
  }

  Widget child1() {
    return Container(
      color: Theme.of(context).accentColor,
      height: 50,
      child: Row(
        children: [
          Container(
            color: Colors.blue,
            width: 100,
          ),
          Flexible(
              child: Container(
            color: Colors.yellow,
          )),
          Container(
            color: Colors.pink,
            width: 80,
          ),
        ],
      ),
    );
  }
}
