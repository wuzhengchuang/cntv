import 'dart:io';

import 'package:cctv5_vip/base/root_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orientation/orientation.dart';
import 'package:provider/provider.dart';

import 'base/cntv_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OrientationPlugin.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  OrientationPlugin.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  PaintingBinding.instance.imageCache.maximumSize = 20;
  if (Platform.isIOS) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  } else {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) {
        return RootProvider();
      }),
    ],
    child: CNTVApp(),
  ));
}
