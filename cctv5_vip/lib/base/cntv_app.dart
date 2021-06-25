import 'package:cctv5_vip/base/launch_page.dart';
import 'package:cctv5_vip/base/root_page.dart';
import 'package:cctv5_vip/config/net_config.dart';
import 'package:cctv5_vip/config/routes_config.dart';
import 'package:cctv5_vip/config/types.dart';
import 'package:cctv5_vip/web/vip5_web_page.dart';
import 'package:flutter/material.dart';

class CNTVApp extends StatefulWidget {
  @override
  _CNTVAppState createState() => _CNTVAppState();
}

class _CNTVAppState extends State<CNTVApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
      home: LaunchPage(
        pageType: LaunchPageType.First,
      ),
    );
  }
}
