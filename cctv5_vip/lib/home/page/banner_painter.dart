import 'package:flutter/material.dart';

class BannerPainter extends CustomPainter {
  Path _path = Path();
  Paint _paint;
  final double width;
  final double height;
  final double scale = 0.5;
  BannerPainter(this.width, this.height) {
    _paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
  }
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    _path.moveTo(0, height * scale);
    _path.lineTo(0, height);
    _path.lineTo(width, height);
    _path.lineTo(width, height * scale);
    _path.quadraticBezierTo(width / 2, height, 0, height * scale);
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
