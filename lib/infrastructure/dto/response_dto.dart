import 'package:json_annotation/json_annotation.dart';
part 'response_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResponseDTO {
  ResponseDTO({
    this.success,
    this.message,
    this.data,
  });

  final bool? success;
  final String? message;
  final int? data;
  factory ResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDTOToJson(this);
}
