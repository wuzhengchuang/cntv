import 'package:flutter/cupertino.dart';

class RootProvider extends ChangeNotifier {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
