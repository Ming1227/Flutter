import 'package:flutter/material.dart';
import 'package:flutter_change_theme/widgets/sizebox/sizebox.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

enum ButtonStatus { none, loading, done }

class _GesturePageState extends State<GesturePage> {
  ButtonStatus _buttonStatus = ButtonStatus.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势'),
      ),
      body: Container(
        // color: Theme.of(context).primaryColor,
        child: buildChildWidget(),
      ),
    );
  }

  Widget buildChildWidget() {
    return Column(
      children: [
        ASSizeBox(),
        buildGesture(),
        ASSizeBox(),
        buildInkWell(),
        ASSizeBox(),
        buildListener(),
        ASSizeBox(),
        buildMaterialBtn(),
      ],
    );
    // return buildInkWell();
  }

  Widget buildGesture() {
    return GestureDetector(
      onTapDown: (details) {
        print('onTapDown: $details');
      },
      onTapUp: (details) {
        print('onTapUp: $details');
      },
      onTap: () {
        print('onTap');
      },
      onTapCancel: () {
        print('onTapCancel');
      },
      onDoubleTap: () {
        print('ondoubleTap');
      },
      onLongPressStart: (v) => print('onLongPressStart'),
      onLongPressMoveUpdate: (v) => print('onLongPressMoveUpdate'),
      onLongPressUp: () => print('onLongPressUp'),
      onLongPressEnd: (v) => print('onLongPressEnd'),
      onLongPress: () => print('onLongPress'),
      onVerticalDragStart: (v) => print('onVerticalDragStart'),
      onVerticalDragDown: (v) => print('onVerticalDragDown'),
      onVerticalDragUpdate: (v) => print('onVerticalDragUpdate'),
      onVerticalDragCancel: () => print('onVerticalDragCancel'),
      onVerticalDragEnd: (v) => print('onVerticalDragEnd'),
      onScaleStart: (v) => print('onScaleStart'),
      onScaleUpdate: (ScaleUpdateDetails v) => print('onScaleUpdate'),
      onScaleEnd: (v) => print('onScaleEnd'),
      child: Container(
        height: 50,
        width: 200,
        color: Colors.yellow,
      ),
    );
  }

  Widget buildInkWell() {
    /// InkWell 父组件不可设置颜色，不然失效
    return Container(
      padding: EdgeInsets.all(10),
      width: 250,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.pink],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          splashColor: Colors.green,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Text(
              'InkWell的点击效果',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          onTap: () {
            print('点击了InkWell');
          },
        ),
      ),
    );
  }

  Widget buildListener() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Theme.of(context).accentColor,
      child: Listener(
        onPointerDown: (PointerDownEvent pointerDownEvent) {
          print('$pointerDownEvent');
        },
        onPointerMove: (PointerMoveEvent pointerMoveEvent) {
          print('$pointerMoveEvent');
        },
        onPointerUp: (PointerUpEvent upEvent) {
          print('$upEvent');
        },
        child: Container(
          height: 200,
          width: 200,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text('Listener组件'),
        ),
      ),
    );
  }

  Widget buildMaterialBtn() {
    return Container(
      color: Theme.of(context).accentColor,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: MaterialButton(
        color: Colors.yellow,
        minWidth: 240,
        height: 50,
        onPressed: () {
          setState(() {
            _buttonStatus = ButtonStatus.loading;
            Future.delayed(Duration(seconds: 2), () {
              setState(() {
                _buttonStatus = ButtonStatus.done;
              });
            });
          });
        },
        child: builBtnChild(),
      ),
    );
  }

  Widget builBtnChild() {
    if (_buttonStatus == ButtonStatus.none) {
      return Text(
        '登录',
        style: Theme.of(context).textTheme.headline6,
      );
    } else if (_buttonStatus == ButtonStatus.loading) {
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2,
      );
    } else {
      return Icon(
        Icons.check,
        color: Colors.white,
      );
    }
  }
}
