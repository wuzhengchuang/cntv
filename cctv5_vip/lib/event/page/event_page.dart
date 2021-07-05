import 'package:cctv5_vip/home/page/vip5_appbar.dart';
import 'package:cctv5_vip/style/vip5_theme_data.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Vip5AppBar(
        // centerTitle: true,
        // elevation: 0,
        title: Text(
          '赛程',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Vip5ThemeData.NAV_BG_COLOR,
      ),
      body: Container(
          // color: Colors.white,
          ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
