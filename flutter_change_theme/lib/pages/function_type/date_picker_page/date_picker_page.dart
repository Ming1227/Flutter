import 'package:flutter/material.dart';
import 'package:flutter_change_theme/widgets/sizebox/sizebox.dart';

class ASDataPickerPage extends StatefulWidget {
  @override
  _ASDataPickerPageState createState() => _ASDataPickerPageState();
}

class _ASDataPickerPageState extends State<ASDataPickerPage> {
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日期选择器'),
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
          child: Text('弹出日期组件'),
          onPressed: () async {
            _dateTime = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2018),
              lastDate: DateTime(2022),
              initialEntryMode: DatePickerEntryMode.input,
              // initialDatePickerMode: DatePickerMode.year,
              helpText: '选择日期',
              cancelText: '取消',
              confirmText: '确定',
              errorFormatText: '错误的日期格式',
              errorInvalidText: '日期格式非法',
              fieldHintText: '月/日/年',
              fieldLabelText: '填写日期',
              selectableDayPredicate: (day) {
                return day.difference(DateTime.now()).inMilliseconds < 0;
              },
              builder: (context, child) {
                return Theme(
                  data: ThemeData.dark(),
                  child: child,
                );
              },
            );
            print('选择的日期:$_dateTime');
          },
        ),
        ASSizeBox(),
        Container(
          color: Theme.of(context).accentColor,
          child: CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime(2022),
            onDateChanged: (d) {
              _dateTime = d;
              print('日期:$_dateTime');
            },
          ),
        ),
        ASSizeBox(),
        RaisedButton(
          child: Text('范围日期'),
          onPressed: () async {
            var date = showDateRangePicker(
              context: context,
              firstDate: DateTime(2018),
              lastDate: DateTime(2022),
              helpText: '选择日期',
              cancelText: '取消',
              confirmText: '确定',
              errorFormatText: '错误的日期格式',
              errorInvalidText: '日期格式非法',
              builder: (context, child) {
                return Theme(
                  data: ThemeData.dark(),
                  child: child,
                );
              },
            );
            print('范围日期:$date');
          },
        ),
      ],
    );
  }
}
