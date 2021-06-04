import 'package:flutter/material.dart';

extension ColorHex on String {
  Color toColor() {
    String tempStr = this;
    if (!tempStr.startsWith('0x')) {
      tempStr = '0x' + tempStr;
    }
    if (tempStr.length != 8 || tempStr.length != 10) {
      return Color(0xFFFFFFFF);
    }
    if (tempStr.length == 8) {
      return Color(0xFF000000 + int.parse(tempStr));
    }
    return Color(int.parse(tempStr));
  }
}
