import 'dart:io';

import 'package:cctv5_vip/config/types.dart';
import 'package:flutter/material.dart';

import 'protocol_widget.dart';

class LaunchPage extends StatefulWidget {
  LaunchPageType pageType;
  LaunchPage({Key key, this.pageType = LaunchPageType.Default})
      : super(key: key);
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image(
              image: AssetImage(Platform.isIOS
                  ? 'images/assets/launch_ios.png'
                  : 'images/assets/launch_android.png'),
              fit: BoxFit.cover,
            ),
          ),
          widget.pageType == LaunchPageType.First
              ? ProtocolWidget()
              : Container(),
        ],
      ),
    );
  }
}
