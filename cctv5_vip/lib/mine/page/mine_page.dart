import 'package:cctv5_vip/style/vip5_theme_data.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '个人中心',
          style: TextStyle(fontSize: Vip5ThemeData.NAV_TITLE_SIZE),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF222224).withOpacity(1.0),
              Color(0xFF222224).withOpacity(0.95),
              Color(0xFF222224).withOpacity(0.9),
            ], stops: [
              0.0,
              0.5,
              1.0
            ]),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF222224).withOpacity(1.0),
            Color(0xFF222224).withOpacity(0.95),
            Color(0xFF222224).withOpacity(0.9),
          ], stops: [
            0.0,
            0.5,
            1.0
          ]),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
