import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_change_theme/utils/screen_adapter.dart';
import 'package:flutter_change_theme/widgets/sizebox/sizebox.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  final TextEditingController _passwordController =
      TextEditingController(text: '');
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文本组件'),
      ),
      body: GestureDetector(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: _buildChildWidget(context),
        ),
        onTap: () {
          print('取消键盘编辑');
          _focusNode.unfocus();
        },
      ),
    );
  }

  Widget _buildChildWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenAdapter.width(15),
          vertical: ScreenAdapter.height(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildGraident(),
          buildSizeBox(),
          buildTextRich(),
          buildSizeBox(),
          buildTextRichSpan(),
          buildSizeBox(),
          buildPasswordFiled(),
          buildSizeBox(),
        ],
      ),
    );
  }

  Widget buildPasswordFiled() {
    return Container(
      child: Expanded(
        child: TextField(
          controller: _passwordController,
          focusNode: _focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).accentColor),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            hintText: '输入密码',
            hintStyle: Theme.of(context).textTheme.bodyText1,
            fillColor: Colors.green,
            filled: true,
            suffixIcon: Icon(Icons.edit),
            prefixIcon: Icon(Icons.person),
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.go,
          obscureText: true,
          style: Theme.of(context).textTheme.headline6,
          maxLength: 16,
          cursorColor: Theme.of(context).dividerColor,
          onChanged: (value) {
            print('$value');
          },
        ),
      ),
    );
  }

  /// 服务协议
  Widget buildTextRichSpan() {
    return Text.rich(
      TextSpan(
        text: '登录即代表同意并阅读',
        style: Theme.of(context).textTheme.bodyText1,
        children: [
          TextSpan(
            text: '《服务协议》',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('点击了服务协议');
              },
          ),
        ],
      ),
    );
  }

  /// 设置带前后置标签的文本
  Widget buildTextRich() {
    return RichText(
      text: TextSpan(
        children: <InlineSpan>[
          WidgetSpan(
            child: Container(
              margin: EdgeInsets.only(right: ScreenAdapter.width(10)),
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).accentColor,
              ),
              child: Text(
                '实况比分',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          WidgetSpan(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: ScreenAdapter.height(2)),
              child: Text(
                '专注于体育赛事',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          WidgetSpan(
            child: Container(
              margin: EdgeInsets.only(left: ScreenAdapter.width(10)),
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenAdapter.width(10),
                  vertical: ScreenAdapter.height(1)),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).accentColor,
              ),
              child: Text(
                '足球',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 设置过渡的文本
  Widget buildGraident() {
    final height = 40.0;
    final linearGradient = LinearGradient(
      colors: <Color>[Colors.red, Colors.blue],
    ).createShader(
      Rect.fromLTWH(0.0, 0.0, MediaQuery.of(context).size.width, height),
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '过渡颜色文字',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              '实况比分，一款专注于体育赛事的App',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 间隔
  Widget buildSizeBox() {
    return ASSizeBox();
  }
}
