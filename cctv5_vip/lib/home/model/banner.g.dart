// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner(
    typeName: json['typeName'] as String,
    type: json['type'] as int,
    data: json['data'] as List,
  );
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'typeName': instance.typeName,
      'type': instance.type,
      'data': instance.data,
    };

BannerVideo _$BannerVideoFromJson(Map<String, dynamic> json) {
  return BannerVideo(
    copyright: json['copyright'] as String,
    id: json['id'] as String,
    cateId: json['cateId'] as String,
    title: json['title'] as String,
    time: json['time'] as String,
    end_time: json['end_time'] as String,
    status: json['status'] as String,
    round: json['round'] as String,
    liveChannel: json['liveChannel'] as String,
    timeStr: json['timeStr'] as String,
    md: json['md'] as String,
    week: json['week'] as String,
    liveType: json['liveType'] as int,
    isThird: json['isThird'] as int,
    scheduleIcon: json['scheduleIcon'] as String,
    shareTitle: json['shareTitle'] as String,
    awayName: json['awayName'] as String,
    awayIcon: json['awayIcon'] as String,
    homeName: json['homeName'] as String,
    homeIcon: json['homeIcon'] as String,
    awayScore: json['awayScore'] as String,
    homeScore: json['homeScore'] as String,
    tournamentName: json['tournamentName'] as String,
    scheduleDate: json['scheduleDate'] as String,
    liveState: json['liveState'] as int,
    isVip: json['isVip'] as int,
    livePrompt: json['livePrompt'] as String,
    nodeInfo: json['nodeInfo'] as String,
  );
}

Map<String, dynamic> _$BannerVideoToJson(BannerVideo instance) =>
    <String, dynamic>{
      'copyright': instance.copyright,
      'id': instance.id,
      'cateId': instance.cateId,
      'title': instance.title,
      'time': instance.time,
      'end_time': instance.end_time,
      'status': instance.status,
      'round': instance.round,
      'liveChannel': instance.liveChannel,
      'timeStr': instance.timeStr,
      'md': instance.md,
      'week': instance.week,
      'liveType': instance.liveType,
      'isThird': instance.isThird,
      'scheduleIcon': instance.scheduleIcon,
      'shareTitle': instance.shareTitle,
      'awayName': instance.awayName,
      'awayIcon': instance.awayIcon,
      'homeName': instance.homeName,
      'homeIcon': instance.homeIcon,
      'awayScore': instance.awayScore,
      'homeScore': instance.homeScore,
      'tournamentName': instance.tournamentName,
      'scheduleDate': instance.scheduleDate,
      'liveState': instance.liveState,
      'isVip': instance.isVip,
      'livePrompt': instance.livePrompt,
      'nodeInfo': instance.nodeInfo,
    };
