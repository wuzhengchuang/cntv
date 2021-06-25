import 'package:cctv5_vip/home/model/video.dart';
import 'package:json_annotation/json_annotation.dart';
part 'home.g.dart';

class Home {
  Control control;
  HomeData data;
  Home({this.control, this.data});
  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
        control: Control.fromJson(json["control"]),
        data: HomeData.fromJson(json['data']));
  }
}

@JsonSerializable()
class Control {
  int serverTime;
  int status;
  String message;
  String version;
  Control({this.serverTime, this.status, this.message, this.version});
  factory Control.fromJson(Map<String, dynamic> json) =>
      _$ControlFromJson(json);
  toJson(Control instance) => _$ControlToJson(instance);
}

class HomeData {
  List index;
  int authTime;
  int page;
  int totalPage;
  HomeData({this.index, this.authTime, this.page, this.totalPage});
  static List getFeedList(List<Map<String, dynamic>> json) {
    List list = [];
    json.forEach((Map<String, dynamic> element) {
      if (element['type'].toString() == '3') {
        list.add(Video.fromJson(element));
      }
    });
    return list;
  }

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
        index: json['index'],
        page: json['page'],
        authTime: json['authTime'],
        totalPage: json['totalPage']);
  }
}
