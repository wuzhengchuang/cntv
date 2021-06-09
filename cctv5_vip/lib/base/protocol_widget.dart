import 'dart:async';
import 'dart:io';

import 'package:cctv5_vip/animation/vip5_page_router.dart';
import 'package:cctv5_vip/base/root_page.dart';
import 'package:cctv5_vip/config/net_config.dart';
import 'package:cctv5_vip/web/vip5_web_page.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProtocolWidget extends StatefulWidget {
  @override
  _ProtocolWidgetState createState() => _ProtocolWidgetState();
}

class _ProtocolWidgetState extends State<ProtocolWidget> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewController _webViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 60),
      height: (MediaQuery.of(context).size.width - 60) * 1.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            '用户隐私协议',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey[200],
            height: 0.5,
          ),
          Padding(
              padding:
                  EdgeInsets.only(left: 28, top: 15, right: 28, bottom: 15),
              child: Text(
                '请您仔细阅读《用户协议》。我们根据国家最新法规要求，更新了《用户协议》，特此向您说明如下',
                style: TextStyle(fontSize: 14, color: Colors.black),
              )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 28, right: 28, bottom: 15),
            child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: '',
                onWebViewCreated: (WebViewController webViewController) {
                  _webViewController = webViewController;
                  _webViewController.loadUrl(
                    NetConfig().AGREEPROTOCOLURL,
                  );
                }),
          )),
          Padding(
            padding: EdgeInsets.only(left: 28, right: 28),
            child: Container(
              color: Colors.grey[200],
              height: 0.5,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Vip5WebView(
                      url: NetConfig().PROTOCOLURL,
                      result: (result) {
                        print(result['result']);
                      },
                    );
                  },
                  fullscreenDialog: true));
            },
            child: RichText(
                text: TextSpan(
                    text: '点击阅读',
                    style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
                    children: [
                  TextSpan(
                    text: '《用户隐私协议》',
                    style: TextStyle(fontSize: 12, color: Color(0xFF984B26)),
                  )
                ])),
          ),
          Padding(
            padding: EdgeInsets.only(left: 28, right: 28, top: 15, bottom: 10),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      exit(0);
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFF6F7F9),
                        borderRadius: BorderRadius.circular(22.5),
                      ),
                      child: Center(
                        child: Text(
                          '拒绝',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF222222)),
                        ),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          Vip5PageRouter(widget: RootPage()), (route) => false);
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.5),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [
                              0.0,
                              0.5,
                              1.0
                            ],
                            colors: [
                              Color(0xFFFFE7CE),
                              Color(0xFFECCCAC),
                              Color(0xFFE8B37F)
                            ]),
                      ),
                      child: Center(
                        child: Text(
                          '同意',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF984B26),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
