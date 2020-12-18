import 'package:flutter/material.dart';
import 'package:flutter_change_theme/utils/screen_adapter.dart';

class CaculatorItem extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color color;
  final Color highlightColor;
  final double width;
  final ValueChanged<String> onValueChange;

  const CaculatorItem(
      {Key key,
      this.text,
      this.textColor,
      this.color,
      this.highlightColor,
      this.width,
      this.onValueChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: InkWell(
        onTap: () {
          onValueChange('$text');
        },
        borderRadius: BorderRadius.all(Radius.circular(40)),
        highlightColor: highlightColor ?? color,
        child: Container(
          width: width ?? 70,
          height: 70,
          padding: EdgeInsets.only(left: width == null ? 0 : 25),
          alignment: width == null ? Alignment.center : Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: ScreenAdapter.sp(24),
            ),
          ),
        ),
      ),
    );
  }
}
