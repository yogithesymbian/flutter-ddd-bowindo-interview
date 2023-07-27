// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthPayload _$AuthPayloadFromJson(Map<String, dynamic> json) => AuthPayload(
      userId: json['user_id'] as String,
      userPassword: json['user_password'] as String,
    );

Map<String, dynamic> _$AuthPayloadToJson(AuthPayload instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_password': instance.userPassword,
    };
