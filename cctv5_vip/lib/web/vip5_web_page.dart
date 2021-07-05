import 'package:cctv5_vip/config/types.dart';
import 'package:cctv5_vip/home/page/vip5_appbar.dart';
import 'package:cctv5_vip/style/vip5_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Vip5WebView extends StatefulWidget {
  PagePopResult result;
  String url;
  Vip5WebView({Key key, this.url, this.result}) : super(key: key);
  @override
  _Vip5WebViewState createState() => _Vip5WebViewState();
}

class _Vip5WebViewState extends State<Vip5WebView> {
  WebViewController _webViewController;
  String _title = '';
  int _progress = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url == null) {
      Map args = ModalRoute.of(context).settings.arguments;
      widget.url = args['url'];
      widget.result = args['result'];
    }
    return Scaffold(
      appBar: Vip5AppBar(
        backgroundColor: Vip5ThemeData.NAV_BG_COLOR,
        title: Text(
          '$_title',
          style: TextStyle(
              fontSize: Vip5ThemeData.NAV_TITLE_SIZE,
              color: Vip5ThemeData.NAV_TITLE_COLOR),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: _progress == 100 ? 0 : 0.5,
              child: Row(
                children: [
                  Container(
                    color: Vip5ThemeData.NAV_LINE_COLOR,
                    width: MediaQuery.of(context).size.width *
                        _progress *
                        1.0 /
                        100,
                  )
                ],
              ),
            ),
            Expanded(
                child: WebView(
              initialUrl: widget.url,
              onWebViewCreated: (WebViewController controller) {
                _webViewController = controller;
              },
              onPageFinished: (String url) {
                _webViewController.getTitle().then((value) {
                  _title = value;
                  setState(() {});
                });
              },
              onProgress: (progress) {
                print('$progress');
                setState(() {
                  _progress = progress;
                });
              },
            )),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.result != null) {
      widget.result({'result': '网页页面销毁了'});
    }
  }
}
