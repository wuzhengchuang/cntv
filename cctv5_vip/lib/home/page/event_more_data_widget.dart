import 'package:flutter/material.dart';

class EventMoreDataWidget extends InheritedWidget {
  final String moreStr;
  EventMoreDataWidget({Key key, this.moreStr, @required Widget child})
      : assert(child != null),
        super(key: key, child: child);
  static EventMoreDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EventMoreDataWidget>();
  }

  @override
  bool updateShouldNotify(covariant EventMoreDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.moreStr != moreStr;
  }
}
