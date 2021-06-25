import 'package:dio/dio.dart';

typedef HttpProgressCallBack = void Function(int count, int total);
typedef onSuccess = void Function(dynamic data);
typedef onError = void Function(String reason, int statusCode);

class Http {
  //项目的baseurl
  static const BASE_URL = '';
  factory Http() => _getInstance();
  static Http get instance => _getInstance();
  static Http _instance;
  Dio _dio;
  Http._internal() {
    // 可以在自己按需要配置
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
    ));
  }

  static Http _getInstance() {
    if (_instance == null) {
      _instance = new Http._internal();
    }
    return _instance;
  }

  /*baseUrl 域名
   *url 接口名称
   *params 参数
   * */
  void get(String baseUrl, String url,
      {Map<String, dynamic> params,
      HttpProgressCallBack onReceiveProgress,
      onSuccess success,
      onError error}) {
    String path = baseUrl + url;
    if (url.startsWith('http://') || url.startsWith('https://')) {
      path = url;
    }
    print('请求地址:$path');
    _dio.get(path, queryParameters: params,
        onReceiveProgress: (int count, int total) {
      if (onReceiveProgress != null) {
        onReceiveProgress(count, total);
      }
    }).then((value) {
      if (value.statusCode == 200) {
        if (success != null) {
          success(value.data);
        }
      } else {
        if (error != null) {
          error(value.statusMessage, value.statusCode);
        }
      }
    }).onError((error, stackTrace) {
      if (error != null) {
        error('网络错误', 500);
      }
    });
  }
}
