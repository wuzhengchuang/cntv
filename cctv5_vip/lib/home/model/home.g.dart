// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Control _$ControlFromJson(Map<String, dynamic> json) {
  return Control(
    serverTime: json['serverTime'] as int,
    status: json['status'] as int,
    message: json['message'] as String,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$ControlToJson(Control instance) => <String, dynamic>{
      'serverTime': instance.serverTime,
      'status': instance.status,
      'message': instance.message,
      'version': instance.version,
    };
