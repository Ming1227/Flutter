import 'package:flutter/material.dart';
import 'package:flutter_get_demo/basic/buttons/custom_button.dart';

class ShowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('buttons'),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CCFButton(
                states: CCButtonStates.defaultState,
                child: Text('default'),
              ),
              CCFButton(
                states: CCButtonStates.focusState,
                child: Text('focus'),
              ),
              CCFButton(
                states: CCButtonStates.loadingState,
                child: Text('loading'),
              ),
              CCFButton(
                states: CCButtonStates.unableState,
                child: Text('unable'),
              ),
              CCFButton(
                states: CCButtonStates.successState,
                child: Text('success'),
              ),
              CCFButton(
                states: CCButtonStates.dangerState,
                child: Text('danger'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
