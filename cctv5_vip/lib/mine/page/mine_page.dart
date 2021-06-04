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
            gradient: LinearGradient(colors: [Colors.black, Colors.black]),
          ),
        ),
      ),
      body: Stack(
        children: [
          Image(
            image: AssetImage('images/assets/black_bg.png'),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 300,
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
