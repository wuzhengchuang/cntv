import 'package:cctv5_vip/http/response_obj.dart';
import 'package:dio/dio.dart';

typedef HttpProgressCallBack = void Function(int count, int total);

class Http {
  /*baseUrl 域名
   *url 接口名称
   *params 参数
   * */
  Future<ResponseObj> get(String baseUrl, String url,
      {Map<String, dynamic> params,
      HttpProgressCallBack onReceiveProgress}) async {
    String path = baseUrl + url;
    Response response;
    try {
      response = await Dio().get(path, queryParameters: params,
          onReceiveProgress: (int count, int total) {
        onReceiveProgress(count, total);
      });
    } on DioError catch (e) {
      print(e.response.data);
    }
    return ResponseObj();
  }
}
