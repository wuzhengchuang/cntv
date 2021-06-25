import 'package:cctv5_vip/home/page/event_painter.dart';
import 'package:flutter/material.dart';

class DragWidget extends StatelessWidget {
  final double radius;
  DragWidget({this.radius = 0});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20 + radius,
      height: 104.5,
      child: CustomPaint(
        painter: EventPainter(radius: radius),
      ),
    );
  }
}
