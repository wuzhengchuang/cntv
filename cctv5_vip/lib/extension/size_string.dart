import 'package:flutter/material.dart';

extension SizeString on String {
  double height(
      double fontSize, FontWeight fontWeight, double maxWidth, int maxLines) {
    String value = this;
    TextPainter painter = TextPainter(
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
        text: TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
            )));
    painter.layout(maxWidth: maxWidth);

    ///文字的宽度:painter.width
    return painter.height;
  }

  double width(double fontSize, FontWeight fontWeight) {
    String value = this;
    TextPainter painter = TextPainter(
        maxLines: 1,
        textDirection: TextDirection.ltr,
        text: TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
            )));
    painter.layout();

    ///文字的宽度:painter.width
    return painter.width + 10;
  }
}
