import 'package:flutter/material.dart';

class EventPainter extends CustomPainter {
  final double radius;
  Paint _paint;
  Path _path = Path();
  EventPainter({this.radius}) {
    _paint = Paint()
      ..strokeWidth = 1
      ..color = Color(0xFFF5F5F5)
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    _path.moveTo(radius, 0);
    _path.relativeLineTo(20, 0);
    _path.relativeLineTo(0, 104.5);
    _path.relativeLineTo(-20, 0);
    _path.quadraticBezierTo(0, 104.5 / 2, radius, 0);
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
