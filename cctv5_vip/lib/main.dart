import 'package:cctv5_vip/base/root_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base/cntv_app.dart';

void main() {
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) {
        return RootProvider();
      }),
    ],
    child: CNTVApp(),
  ));
}
// void main() {
//   FileManager.redFileInfo();
// }
