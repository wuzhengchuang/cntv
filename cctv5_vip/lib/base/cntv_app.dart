import 'dart:async';

import 'package:cctv5_vip/base/root_page.dart';
import 'package:cctv5_vip/config/net_config.dart';
import 'package:cctv5_vip/config/routes_config.dart';
import 'package:cctv5_vip/web/vip5_web_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CNTVApp extends StatefulWidget {
  @override
  _CNTVAppState createState() => _CNTVAppState();
}

class _CNTVAppState extends State<CNTVApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: MaterialApp(
          builder: (BuildContext context, Widget child) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child);
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.red,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          initialRoute: '/',
          routes: {
            RoutesConfig.VIP5WEBPAGE: (_) => Vip5WebView(
                  url: NetConfig().PROTOCOLURL,
                ),
            RoutesConfig.VIP5ROOTPAGE: (_) => RootPage(),
          },
          home: RootPage(),
        ),
        onWillPop: () {
          _dispose();
          return Future.value(true);
        });
  }

  @override
  void dispose() {
    _dispose();
    // TODO: implement dispose
    super.dispose();
  }

  _dispose() {}
}
