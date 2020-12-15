import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_change_theme/widgets/sizebox/sizebox.dart';

class TimePickerPage extends StatefulWidget {
  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('时间选择器'),
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
          child: Text('弹出时间选择器'),
          onPressed: () async {
            var result = showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              helpText: '选择时间',
              cancelText: '取消',
              confirmText: '确定',
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(alwaysUse24HourFormat: true),
                  child: child,
                );
              },
            );
            print('时间选择: $result');
          },
        ),
        Container(
          color: Theme.of(context).accentColor,
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.ms,
            minuteInterval: 5,
            secondInterval: 10,
            onTimerDurationChanged: (value) {
              print('ios原生时间选择: $value');
            },
          ),
        ),
      ],
    );
  }
}
