import 'package:cctv5_vip/base/root_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Vip5PageTool {
  static void jumpToPageController(context, int index) {
    Provider.of<RootProvider>(context, listen: false).changeIndex(1);
    PageController pageController =
        Provider.of<RootProvider>(context, listen: false).pageController;
    pageController.jumpToPage(index);
  }
}
