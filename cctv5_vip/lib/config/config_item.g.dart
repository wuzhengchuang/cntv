// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigItem _$ConfigItemFromJson(Map<String, dynamic> json) {
  return ConfigItem(
    title: json['title'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ConfigItemToJson(ConfigItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
    };
