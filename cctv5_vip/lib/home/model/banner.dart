import 'package:json_annotation/json_annotation.dart';
part 'banner.g.dart';

@JsonSerializable()
class Banner {
  String typeName;
  int type;
  List data;
  Banner({this.typeName, this.type, this.data});
  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
  toJson(Banner instance) => _$BannerToJson(instance);
}

class BannerItem {
  int type;
  int id;
  String imgUrl;
  String title;
  String url;
  BannerVideo data;
  BannerItem(
      {this.type, this.id, this.imgUrl, this.title, this.url, this.data});
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
        id: json['id'],
        type: json['type'],
        imgUrl: json['imgUrl'],
        title: json['title'],
        url: json['url'],
        data: BannerVideo.fromJson(json['data']));
  }
}

@JsonSerializable()
class BannerVideo {
  int copyright;
  int id;
  String cateId;
  String title;
  String time;
  String end_time;
  int status;
  String round;
  String liveChannel;
  String timeStr;
  String md;
  String week;
  int liveType;
  int isThird;
  String scheduleIcon;
  String shareTitle;
  String awayName;
  String awayIcon;
  String homeName;
  String homeIcon;
  String awayScore;
  String homeScore;
  String tournamentName;
  String scheduleDate;
  int liveState;
  int isVip;
  String livePrompt;
  String nodeInfo;
  BannerVideo(
      {this.copyright,
      this.id,
      this.cateId,
      this.title,
      this.time,
      this.end_time,
      this.status,
      this.round,
      this.liveChannel,
      this.timeStr,
      this.md,
      this.week,
      this.liveType,
      this.isThird,
      this.scheduleIcon,
      this.shareTitle,
      this.awayName,
      this.awayIcon,
      this.homeName,
      this.homeIcon,
      this.awayScore,
      this.homeScore,
      this.tournamentName,
      this.scheduleDate,
      this.liveState,
      this.isVip,
      this.livePrompt,
      this.nodeInfo});
  factory BannerVideo.fromJson(Map<String, dynamic> json) =>
      _$BannerVideoFromJson(json);
  toJson(BannerVideo instance) => _$BannerVideoToJson(instance);
}
