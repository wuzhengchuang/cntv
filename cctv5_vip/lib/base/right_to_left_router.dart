import 'package:flutter/cupertino.dart';

class RightToLeftRouter extends PageRouteBuilder {
  final Widget child;
  final int durationMs;
  final Curve curve;
  RightToLeftRouter(
      {this.child, this.durationMs = 300, this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return child;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                  child: child,
                  position: Tween<Offset>(
                          begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(animation));
            });
}
