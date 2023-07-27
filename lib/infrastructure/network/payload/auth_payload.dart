import 'package:json_annotation/json_annotation.dart';
part 'auth_payload.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthPayload {
  final String userId;
  final String userPassword;

  AuthPayload({
    required this.userId,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() => _$AuthPayloadToJson(this);
}
