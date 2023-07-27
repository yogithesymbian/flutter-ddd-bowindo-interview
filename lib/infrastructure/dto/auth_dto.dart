import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthDTO {
  AuthDTO({
    required this.success,
    required this.message,
    required this.token,
    required this.data,
    required this.refresh,
  });

  final bool success;
  final DataDTO data;
  final String message;
  final String token;
  final String refresh;

  factory AuthDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DataDTO {
  final String userId;
  final String userName;
  final int levelId;
  final dynamic userMail;
  final String branchId;
  final String levelName;
  final dynamic userMenu;
  final int storeId;
  final String storeName;
  final String storeAddress;
  final String storePhone;
  final int flagStore;
  final dynamic storeTaxId;
  final dynamic pkpDate;
  final int isPkp;
  final dynamic ledgerDate;
  final int allowMinusTransaction;
  final dynamic lastAllowedDate;
  final int printSizeDefault;
  final String taxRatio;
  final dynamic validUntil;

  DataDTO({
    required this.userId,
    required this.userName,
    required this.levelId,
    required this.userMail,
    required this.branchId,
    required this.levelName,
    required this.userMenu,
    required this.storeId,
    required this.storeName,
    required this.storeAddress,
    required this.storePhone,
    required this.flagStore,
    required this.storeTaxId,
    required this.pkpDate,
    required this.isPkp,
    required this.ledgerDate,
    required this.allowMinusTransaction,
    required this.lastAllowedDate,
    required this.printSizeDefault,
    required this.taxRatio,
    required this.validUntil,
  });
  factory DataDTO.fromJson(Map<String, dynamic> json) =>
      _$DataDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DataDTOToJson(this);
}
