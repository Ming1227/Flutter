import 'package:flutter/material.dart';
import 'package:flutter_change_theme/widgets/sizebox/sizebox.dart';

class ContainerSizePage extends StatefulWidget {
  @override
  _ContainerSizePageState createState() => _ContainerSizePageState();
}

class _ContainerSizePageState extends State<ContainerSizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('定位装饰组件Container'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChild(),
      ),
    );
  }

  Widget buildChild() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          ASSizeBox(),
          buildChild1(),
          ASSizeBox(),
          buildChild2(),
          ASSizeBox(),
          buildChild3(),
          ASSizeBox(),
          buildChild4(),
          ASSizeBox(),
          buildChild6(),
          ASSizeBox(),
          buildChild5(),
        ],
      ),
    );
  }

  Widget buildChild6() {
    return Container(
      color: Theme.of(context).accentColor,
      height: 100,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: .6,
        heightFactor: .5,
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }

  Widget buildChild1() {
    return Container(
        color: Theme.of(context).accentColor,
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          color: Colors.green,
          child: Text('实况比分'),
        ));
  }

  Widget buildChild2() {
    return Container(
      /// color 与 decoration 不能同时存在
      child: Text('热爱运动、热爱足球、梅西C罗'),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.pink,
          width: 1,
        ),
        color: Theme.of(context).accentColor,
      ),
    );
  }

  Widget buildChild3() {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.pink,
          width: 2.0,
        ),
        // borderRadius: BorderRadius.all(Radius.circular(5)),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildChild4() {
    return Container(
      height: 100,
      color: Theme.of(context).accentColor,
      padding: EdgeInsets.all(10),
      alignment: Alignment(0.5, -0.5),
      child: Text('实况比分、体育赛事'),
    );
  }

  Widget buildChild5() {
    return Container(
      color: Theme.of(context).accentColor,
      child: Text('热爱体育、体育赛事'),
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      height: 60,
      width: 300,
      transform: Matrix4.rotationZ(0.2),
    );
  }
}
