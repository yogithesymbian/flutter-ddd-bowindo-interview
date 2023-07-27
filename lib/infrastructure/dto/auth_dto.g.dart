// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDTO _$AuthDTOFromJson(Map<String, dynamic> json) => AuthDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      token: json['token'] as String,
      data: DataDTO.fromJson(json['data'] as Map<String, dynamic>),
      refresh: json['refresh'] as String,
    );

Map<String, dynamic> _$AuthDTOToJson(AuthDTO instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'token': instance.token,
      'refresh': instance.refresh,
    };

DataDTO _$DataDTOFromJson(Map<String, dynamic> json) => DataDTO(
      userId: json['user_id'] as String,
      userName: json['user_name'] as String,
      levelId: json['level_id'] as int,
      userMail: json['user_mail'],
      branchId: json['branch_id'] as String,
      levelName: json['level_name'] as String,
      userMenu: json['user_menu'],
      storeId: json['store_id'] as int,
      storeName: json['store_name'] as String,
      storeAddress: json['store_address'] as String,
      storePhone: json['store_phone'] as String,
      flagStore: json['flag_store'] as int,
      storeTaxId: json['store_tax_id'],
      pkpDate: json['pkp_date'],
      isPkp: json['is_pkp'] as int,
      ledgerDate: json['ledger_date'],
      allowMinusTransaction: json['allow_minus_transaction'] as int,
      lastAllowedDate: json['last_allowed_date'],
      printSizeDefault: json['print_size_default'] as int,
      taxRatio: json['tax_ratio'] as String,
      validUntil: json['valid_until'],
    );

Map<String, dynamic> _$DataDTOToJson(DataDTO instance) => <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'level_id': instance.levelId,
      'user_mail': instance.userMail,
      'branch_id': instance.branchId,
      'level_name': instance.levelName,
      'user_menu': instance.userMenu,
      'store_id': instance.storeId,
      'store_name': instance.storeName,
      'store_address': instance.storeAddress,
      'store_phone': instance.storePhone,
      'flag_store': instance.flagStore,
      'store_tax_id': instance.storeTaxId,
      'pkp_date': instance.pkpDate,
      'is_pkp': instance.isPkp,
      'ledger_date': instance.ledgerDate,
      'allow_minus_transaction': instance.allowMinusTransaction,
      'last_allowed_date': instance.lastAllowedDate,
      'print_size_default': instance.printSizeDefault,
      'tax_ratio': instance.taxRatio,
      'valid_until': instance.validUntil,
    };
