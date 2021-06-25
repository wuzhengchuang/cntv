import 'package:json_annotation/json_annotation.dart';

part 'config_item.g.dart';

@JsonSerializable()
class ConfigItem {
  String title;
  String url;
  ConfigItem({this.title, this.url});
  factory ConfigItem.fromJson(Map<String, dynamic> json) =>
      _$ConfigItemFromJson(json);
  Map<String, dynamic> toJson(ConfigItem instance) =>
      _$ConfigItemToJson(instance);
}
