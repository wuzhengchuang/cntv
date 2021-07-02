import 'dart:io';

import 'package:cctv5_vip/base/root_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'base/cntv_app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) {
        return RootProvider();
      }),
    ],
    child: CNTVApp(),
  ));
  if (Platform.isAndroid) {
    print('运行了安卓');
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
// void main() {
//   FileManager.redFileInfo();
// }
