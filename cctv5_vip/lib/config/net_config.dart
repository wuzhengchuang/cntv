import 'package:cctv5_vip/config/types.dart';
import 'package:cctv5_vip/http/http.dart';

class NetConfig {
  factory NetConfig() => _getInstance();
  static Http get instance => _getInstance();
  static NetConfig _instance;
  static _getInstance() {
    if (_instance != null) {
      _instance = NetConfig._init();
    }
    return _instance;
  }

  NetConfig._init() {
    switch (ENV) {
      case EnvType.Default:
        {
          String BASEURL = 'https://static-vip.sports.cctv.com/';
        }
        break;
      case EnvType.T100:
        {
          String BASEURL = 'https://static-vip.sports.cctv.com/';
        }
        break;
      case EnvType.P100:
        {
          String BASEURL = 'https://static-vip.sports.cctv.com/';
        }
        break;
      case EnvType.P200:
        {
          String BASEURL = 'https://static-vip.sports.cctv.com/';
        }
        break;
      default:
        {
          String BASEURL = 'https://static-vip.sports.cctv.com/';
        }
        break;
    }
  }
  EnvType ENV = EnvType.Default;
  String AGREEPROTOCOLURL = 'http://www.apppark.cn/privacy.html';
  String PROTOCOLURL = 'http://www.zhibo.tv/privacypolicy.html';
  String BASEURL = 'https://static-vip.sports.cctv.com/';
  String MAINCONFIGJSON = 'config.json';
}
