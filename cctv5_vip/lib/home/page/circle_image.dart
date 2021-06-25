import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final ImageProvider image;
  final double size;
  final Color shadowColor;
  final Color borderColor;
  final double borderWidth;
  CircleImage(
      {Key key,
      @required this.image,
      this.size,
      this.shadowColor,
      this.borderColor,
      this.borderWidth})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: Colors.transparent,
        foregroundImage: this.image,
      ),
    );
  }
}
