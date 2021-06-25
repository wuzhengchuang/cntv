// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
    type: json['type'] as int,
    copyright: json['copyright'] as int,
    id: json['id'] as String,
    guid: json['guid'] as String,
    title: json['title'] as String,
    shareTitle: json['shareTitle'] as String,
    duration: json['duration'] as String,
    imgUrl: json['imgUrl'] as String,
    isVip: json['isVip'] as String,
    shareUrl: json['shareUrl'] as String,
    shareImage: json['shareImage'] as String,
    shareDescription: json['shareDescription'] as String,
  );
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'type': instance.type,
      'copyright': instance.copyright,
      'id': instance.id,
      'guid': instance.guid,
      'title': instance.title,
      'shareTitle': instance.shareTitle,
      'duration': instance.duration,
      'imgUrl': instance.imgUrl,
      'isVip': instance.isVip,
      'shareUrl': instance.shareUrl,
      'shareImage': instance.shareImage,
      'shareDescription': instance.shareDescription,
    };
