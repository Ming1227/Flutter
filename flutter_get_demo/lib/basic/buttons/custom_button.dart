import 'package:flutter/material.dart';

enum CCButtonStates {
  defaultState,
  focusState,
  loadingState,
  unableState,
  successState,
  dangerState
}

class CCFButton extends ElevatedButton {
  const CCFButton(
      {Key key,
      this.onPressed,
      this.onLongPressed,
      @required this.states,
      this.child})
      : super(
            key: key,
            onPressed: onPressed,
            onLongPress: onLongPressed,
            child: child);

  final VoidCallback onPressed;
  final VoidCallback onLongPressed;
  final CCButtonStates states;
  final Widget child;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    switch (states) {
      case CCButtonStates.defaultState:
        return super.defaultStyleOf(context).copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue));
      case CCButtonStates.focusState:
        return super.defaultStyleOf(context).copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white38));
      case CCButtonStates.loadingState:
        return super.defaultStyleOf(context).copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow));
      case CCButtonStates.unableState:
        return super.defaultStyleOf(context).copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white70));
      case CCButtonStates.successState:
        return super.defaultStyleOf(context).copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green));
      case CCButtonStates.dangerState:
        return super.defaultStyleOf(context).copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red));
      default:
        return super.defaultStyleOf(context);
    }
  }
}
