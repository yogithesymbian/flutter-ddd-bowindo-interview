import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_dto.freezed.dart';
part 'error_dto.g.dart';

@freezed
class ErrorDTO with _$ErrorDTO {
  const factory ErrorDTO({
    String? message,
  }) = _ErrorDTO;

  factory ErrorDTO.fromJson(Map<String, dynamic> json) =>
      _$ErrorDTOFromJson(json);
}
