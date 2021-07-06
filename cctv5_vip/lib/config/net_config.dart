import 'package:cctv5_vip/config/types.dart';
import 'package:cctv5_vip/http/http.dart';

class NetConfig {
  factory NetConfig() => _getInstance();
  static Http get instance => _getInstance();
  static NetConfig _instance;
  static _getInstance() {
    if (_instance == null) {
      _instance = NetConfig._init();
    }
    return _instance;
  }

  NetConfig._init() {
    switch (ENV) {
      case EnvType.Default:
        {
          BASEURL = 'https://static-vip.sports.cctv.com/';
        }
        break;
      case EnvType.T100:
        {
          BASEURL = 'https://t100-static-vip.sports.cctv.com/';
        }
        break;
      case EnvType.P100:
        {
          BASEURL = 'https://static-vip.sports.cctv.com/';
        }
        break;
      case EnvType.P200:
        {
          BASEURL = 'https://static-vip.sports.cctv.com/';
        }
        break;
      default:
        {
          BASEURL = 'https://static-vip.sports.cctv.com/';
        }
        break;
    }
  }

  EnvType ENV = EnvType.Default;
  String AGREEPROTOCOLURL = 'https://www.apppark.cn/privacy.html';
  String PROTOCOLURL = 'https://www.zhibo.tv/privacypolicy.html';
  String BASEURL = 'https://static-vip.sports.cctv.com/';
  String MAINCONFIGJSON = 'config.json';
  String index_interface = 'https://api-vip.sports.cctv.com/feed/index';
}
