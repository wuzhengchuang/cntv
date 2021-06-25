// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEvent _$HomeEventFromJson(Map<String, dynamic> json) {
  return HomeEvent(
    type: json['type'] as int,
    typeName: json['typeName'] as String,
    data: json['data'] as List,
  );
}

Map<String, dynamic> _$HomeEventToJson(HomeEvent instance) => <String, dynamic>{
      'typeName': instance.typeName,
      'type': instance.type,
      'data': instance.data,
    };

HomeEventItem _$HomeEventItemFromJson(Map<String, dynamic> json) {
  return HomeEventItem(
    id: json['id'] as String,
    copyright: json['copyright'] as String,
    cateId: json['cateId'] as String,
    title: json['title'] as String,
    status: json['status'] as String,
    liveType: json['liveType'] as int,
    isThird: json['isThird'] as int,
    time: json['time'] as String,
    end_time: json['end_time'] as String,
    round: json['round'] as String,
    liveChannel: json['liveChannel'] as String,
    timeStr: json['timeStr'] as String,
    md: json['md'] as String,
    week: json['week'] as String,
    scheduleIcon: json['scheduleIcon'] as String,
    shareTitle: json['shareTitle'] as String,
    awayIcon: json['awayIcon'] as String,
    awayName: json['awayName'] as String,
    homeIcon: json['homeIcon'] as String,
    homeName: json['homeName'] as String,
    awayScore: json['awayScore'] as String,
    homeScore: json['homeScore'] as String,
  );
}

Map<String, dynamic> _$HomeEventItemToJson(HomeEventItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'copyright': instance.copyright,
      'cateId': instance.cateId,
      'title': instance.title,
      'status': instance.status,
      'liveType': instance.liveType,
      'isThird': instance.isThird,
      'time': instance.time,
      'end_time': instance.end_time,
      'round': instance.round,
      'liveChannel': instance.liveChannel,
      'timeStr': instance.timeStr,
      'md': instance.md,
      'week': instance.week,
      'scheduleIcon': instance.scheduleIcon,
      'shareTitle': instance.shareTitle,
      'awayName': instance.awayName,
      'awayIcon': instance.awayIcon,
      'homeName': instance.homeName,
      'homeIcon': instance.homeIcon,
      'awayScore': instance.awayScore,
      'homeScore': instance.homeScore,
    };
