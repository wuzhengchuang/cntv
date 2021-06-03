import 'package:flutter/material.dart';

class Vip5PageRouter extends PageRouteBuilder {
  final Widget widget;
  Vip5PageRouter({this.widget})
      : super(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            });
  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration {
    return Duration(milliseconds: 500);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return FadeTransition(
      opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.fastLinearToSlowEaseIn,
      )),
      child: child,
    );
  }
}
