// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDTO _$ResponseDTOFromJson(Map<String, dynamic> json) => ResponseDTO(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as int?,
    );

Map<String, dynamic> _$ResponseDTOToJson(ResponseDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
