import 'package:cctv5_vip/home/page/event_more_widget.dart';
import 'package:cctv5_vip/home/page/event_painter.dart';
import 'package:flutter/material.dart';

class DragWidget extends StatelessWidget {
  final double radius;
  DragWidget({this.radius = 0});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30 + radius,
      height: 104.5,
      child: Stack(
        children: [
          CustomPaint(
            painter: EventPainter(radius: radius),
          ),
          Positioned(right: 0, top: 0, bottom: 0, child: EventMoreWidget()),
        ],
      ),
    );
  }
}
