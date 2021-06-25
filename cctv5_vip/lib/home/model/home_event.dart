import 'package:json_annotation/json_annotation.dart';

part 'home_event.g.dart';

@JsonSerializable()
class HomeEvent {
  String typeName;
  int type;
  List data;
  HomeEvent({this.type, this.typeName, this.data});
  factory HomeEvent.fromJson(Map<String, dynamic> json) =>
      _$HomeEventFromJson(json);
  toJson(HomeEvent instance) => _$HomeEventToJson(instance);
}

@JsonSerializable()
class HomeEventItem {
  String id;
  String copyright;
  String cateId;
  String title;
  String status;
  int liveType;
  int isThird;
  String time;
  String end_time;
  String round;
  String liveChannel;
  String timeStr;
  String md;
  String week;
  String scheduleIcon;
  String shareTitle;
  String awayName;
  String awayIcon;
  String homeName;
  String homeIcon;
  String awayScore;
  String homeScore;
  HomeEventItem(
      {this.id,
      this.copyright,
      this.cateId,
      this.title,
      this.status,
      this.liveType,
      this.isThird,
      this.time,
      this.end_time,
      this.round,
      this.liveChannel,
      this.timeStr,
      this.md,
      this.week,
      this.scheduleIcon,
      this.shareTitle,
      this.awayIcon,
      this.awayName,
      this.homeIcon,
      this.homeName,
      this.awayScore,
      this.homeScore});
  factory HomeEventItem.fromJson(Map<String, dynamic> json) =>
      _$HomeEventItemFromJson(json);
  toJson(HomeEventItem instance) => _$HomeEventItemToJson(instance);
}
