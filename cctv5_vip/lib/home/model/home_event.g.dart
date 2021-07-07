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
    id: json['id'].toString(),
    copyright: json['copyright'].toString(),
    cateId: json['cateId'].toString(),
    title: json['title'] as String,
    status: json['status'] as String,
    liveType: json['liveType'] as int,
    isThird: json['isThird'] as int,
    time: json['time'].toString(),
    end_time: json['end_time'].toString(),
    round: json['round'].toString(),
    liveChannel: json['liveChannel'].toString(),
    timeStr: json['timeStr'].toString(),
    md: json['md'].toString(),
    week: json['week'].toString(),
    scheduleIcon: json['scheduleIcon'].toString(),
    shareTitle: json['shareTitle'].toString(),
    awayIcon: json['awayIcon'].toString(),
    awayName: json['awayName'].toString(),
    homeIcon: json['homeIcon'].toString(),
    homeName: json['homeName'].toString(),
    awayScore: json['awayScore'].toString(),
    homeScore: json['homeScore'].toString(),
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
