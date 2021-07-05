import 'package:cctv5_vip/home/page/vip5_appbar.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Vip5AppBar(
        backgroundColor: Colors.red,
        title: Text('赛事详情'),
      ),
      body: Center(child: Text('赛事详情')),
    );
  }
}
