import 'package:flutter/material.dart';
import 'package:flutter_change_theme/pages/function_type/caculator_page/caculator_keyboard.dart';
import 'package:flutter_change_theme/utils/screen_adapter.dart';
import 'package:flutter_change_theme/widgets/sizebox/sizebox.dart';

class CaculatorPage extends StatefulWidget {
  @override
  _CaculatorPageState createState() => _CaculatorPageState();
}

class _CaculatorPageState extends State<CaculatorPage> {
  /// 显示当前输入的数字和计算结果
  String _text = '';

  /// 用于保存被加数
  String _beforeText = '';

  /// 表示当前值是否为计算的结果
  bool _isResult = false;

  /// 保存加减乘除
  String _oprateText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('计算器'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenAdapter.width(18),
            vertical: ScreenAdapter.height(5)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).accentColor,
                ),
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: ScreenAdapter.width(10)),
                child: Text(
                  '$_text',
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenAdapter.sp(48),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CaculatorKeyboard(
              onValueChange: (value) {
                updateText(value);
              },
            ),
            ASSizeBox(),
          ],
        ),
      ),
    );
  }

  void updateText(String value) {
    switch (value) {
      case 'AC':
        _text = '0';
        _beforeText = '0';
        _isResult = false;
        break;
      case '+/-':
        if (_text.startsWith('-')) {
          _text = _text.substring(1);
        } else {
          _text = '-$_text';
        }
        break;
      case '%':
        var d = _value2Double(_text);
        _isResult = true;
        _text = '${d / 100.0}';
        break;

      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '.':
        if (_isResult) {
          _text = value;
        }
        if (_oprateText.isNotEmpty && _beforeText.isEmpty) {
          _beforeText = _text;
          _text = '';
        }
        _text += value;
        if (_text.startsWith('0')) {
          _text = _text.substring(1);
        }
        break;

      case '+':
      case '-':
      case 'x':
      case '÷':
        _isResult = false;
        _oprateText = value;
        break;

      case '=':
        var d = _value2Double(_beforeText);
        var d1 = _value2Double(_text);
        switch (_oprateText) {
          case '+':
            _text = '${d + d1}';
            break;
          case '-':
            _text = '${d - d1}';
            break;
          case 'x':
            _text = '${d * d1}';
            break;
          case '÷':
            _text = '${d / d1}';
            break;
        }
        _beforeText = '';
        _isResult = true;
        _oprateText = '';
        break;
    }
    setState(() {});
  }

  double _value2Double(String value) {
    if (_text.startsWith('-')) {
      final s = value.substring(1);
      return double.parse(s) * -1;
    } else {
      return double.parse(value);
    }
  }
}
