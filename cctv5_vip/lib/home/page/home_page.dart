import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image(
          image: AssetImage('images/assets/cntv_logo.png'),
          width: 53,
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
