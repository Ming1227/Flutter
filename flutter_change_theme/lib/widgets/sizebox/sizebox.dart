import 'package:flutter/material.dart';
import 'package:flutter_change_theme/utils/screen_adapter.dart';

class ASSizeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenAdapter.height(20),
      child: Container(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
