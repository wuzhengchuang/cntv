import 'package:cctv5_vip/home/page/banner_painter.dart' as HomeBannerPainter;
import 'package:flutter/material.dart';

class BannerBgWidget extends StatelessWidget {
  final double width;
  final double height;
  BannerBgWidget(this.width, this.height, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: width,
      height: height,
      child: CustomPaint(
        painter: HomeBannerPainter.BannerPainter(width, height),
      ),
    );
  }
}
