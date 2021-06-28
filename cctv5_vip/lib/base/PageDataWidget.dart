import 'package:flutter/material.dart';

class PageDataWidget extends InheritedWidget {
  final PageController pageController;
  final int currentIndex;
  PageDataWidget(
      {Key key, @required Widget child, this.pageController, this.currentIndex})
      : assert(child != null),
        super(key: key, child: child);
  static PageDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PageDataWidget>();
  }

  @override
  bool updateShouldNotify(covariant PageDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.pageController != pageController ||
        oldWidget.currentIndex != currentIndex;
  }
}
