import 'package:cctv5_vip/home/page/vip5_appbar.dart';
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
    return Stack(
      children: [
        Image(
          image: AssetImage('images/assets/black_bg.png'),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: Vip5AppBar(
            // centerTitle: true,
            // elevation: 0,
            title: Text(
              '个人中心',
              style: TextStyle(fontSize: Vip5ThemeData.NAV_TITLE_SIZE),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Container(),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
