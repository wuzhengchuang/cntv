import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  int type;
  int copyright;
  String id;
  String guid;
  String title;
  String shareTitle;
  String duration;
  String imgUrl;
  String isVip;
  String shareUrl;
  String shareImage;
  String shareDescription;
  Video(
      {this.type,
      this.copyright,
      this.id,
      this.guid,
      this.title,
      this.shareTitle,
      this.duration,
      this.imgUrl,
      this.isVip,
      this.shareUrl,
      this.shareImage,
      this.shareDescription});
  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
  Map<String, dynamic> toJson(Video instance) => _$VideoToJson(instance);
}
