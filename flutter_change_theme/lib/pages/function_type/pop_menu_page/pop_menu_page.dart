import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_change_theme/widgets/sizebox/sizebox.dart';

class PopMenuPage extends StatefulWidget {
  @override
  _PopMenuPageState createState() => _PopMenuPageState();
}

class _PopMenuPageState extends State<PopMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹框和shape'),
        actions: [
          Container(
            padding: EdgeInsets.only(left: 10),
            child: PopupMenuButton<String>(
              initialValue: '足球',
              tooltip: '体育项目',
              elevation: 5,
              color: Theme.of(context).accentColor,
              offset: Offset(0, 100),
              icon: Icon(Icons.add),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(10),
              ),
              itemBuilder: (context) {
                return <PopupMenuEntry<String>>[
                  CheckedPopupMenuItem(
                    child: Text('足球'),
                    checked: true,
                    value: '足球',
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    child: Text('篮球'),
                    textStyle: Theme.of(context).textTheme.headline6,
                    value: '篮球',
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    child: Text('排球'),
                    textStyle: Theme.of(context).textTheme.headline6,
                    value: '排球',
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    child: Text('乒乓球'),
                    textStyle: Theme.of(context).textTheme.headline6,
                    value: '乒乓球',
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    child: Text('羽毛球'),
                    textStyle: Theme.of(context).textTheme.headline6,
                    value: '羽毛球',
                  ),
                ];
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(context),
      ),
    );
  }

  Widget buildChildWidget(BuildContext context) {
    return Column(
      children: [
        ASSizeBox(),
        RaisedButton(
          child: Text('showMenu'),
          onPressed: () {
            showMenu(
              context: context,
              position: RelativeRect.fill,
              items: <PopupMenuEntry>[
                PopupMenuItem(child: Text('1')),
                PopupMenuDivider(),
                CheckedPopupMenuItem(
                  child: Text('2'),
                  checked: true,
                ),
                PopupMenuDivider(),
                PopupMenuItem(child: Text('3')),
              ],
            );
          },
        ),
        ASSizeBox(),
        RaisedButton(
          child: Text('showDialog'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('提示'),
                  content: Text('确定退出吗？'),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('取消')),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('确定')),
                  ],
                );
              },
            );
          },
        ),
        ASSizeBox(),
        RaisedButton(
          child: Text('showCupertinoDialog'),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('提示'),
                  content: Text('确认退出吗?'),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          '取消',
                          style: TextStyle(color: Colors.red),
                        )),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          '确定',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                );
              },
            );
          },
        ),
        ASSizeBox(),
        RaisedButton(
          child: Text('showSimpleDialog'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: Container(
                    alignment: Alignment.center,
                    child: Text('提示'),
                  ),
                  children: <Widget>[
                    Container(
                      height: 80,
                      alignment: Alignment.center,
                      child: Text('确认退出吗？'),
                    ),
                    Divider(
                      height: 1,
                    ),
                    FlatButton(
                      child: Text('取消'),
                      onPressed: () {
                        Navigator.of(context).pop('cancel');
                      },
                    ),
                    Divider(
                      height: 1,
                    ),
                    FlatButton(
                      child: Text('确认'),
                      onPressed: () {
                        Navigator.of(context).pop('ok');
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        ASSizeBox(),
        Builder(
          builder: (context) {
            return RaisedButton(
              child: Text('SnackBar'),
              onPressed: () {
                Scaffold.of(context).removeCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    elevation: 5,
                    backgroundColor: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    content: Container(
                      height: 60,
                      alignment: Alignment.center,
                      child: Text(
                        '巴塞罗那VS尤文图斯 梅西与C罗的对话 你看好谁？',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    action: SnackBarAction(
                      label: '确定',
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        print('snackBaraction点击了确定');
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
        ASSizeBox(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                onPressed: () {},
                child: Text('实况'),
                shape: BeveledRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.yellow),
                    borderRadius: BorderRadius.circular(10)),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('比分'),
                shape: BeveledRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.yellow),
                    borderRadius: BorderRadius.circular(100)),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('体育'),
                shape: BeveledRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.yellow),
                    borderRadius: BorderRadius.circular(0)),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('足球'),
                shape: Border(
                  bottom: BorderSide(width: 2, color: Colors.yellow),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('篮球'),
                shape: Border(
                  top: BorderSide(width: 5, color: Colors.yellow),
                  left: BorderSide(width: 5, color: Colors.blue),
                  right: BorderSide(width: 5, color: Colors.red),
                  bottom: BorderSide(width: 5, color: Colors.pink),
                ),
              ),
            ],
          ),
        ),
        ASSizeBox(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                onPressed: () {},
                child: Text('实况'),
                shape: BorderDirectional(
                  start: BorderSide(color: Colors.red, width: 5),
                  end: BorderSide(color: Colors.blue, width: 5),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('比分'),
                shape: CircleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('体育'),
                shape: StadiumBorder(
                  side: BorderSide(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('足球'),
                shape: ContinuousRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('篮球'),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
