import 'package:flutter/material.dart';

class BorderWidget extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final Color bgColor;
  final double borderWidth;
  final double borderRadius;

  BorderWidget(
      {Key key,
      this.child,
      this.borderColor = Colors.blueAccent,
      this.borderRadius = 5,
      this.borderWidth = 0.5,
      this.bgColor = Colors.transparent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: bgColor,
        border: Border.all(width: borderWidth, color: borderColor),
      ),
      child: child,
    );
  }
}
