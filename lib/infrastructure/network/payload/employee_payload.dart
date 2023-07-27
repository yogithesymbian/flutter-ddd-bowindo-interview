import 'package:json_annotation/json_annotation.dart';
part 'employee_payload.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EmployeePayload {
  int? employeeId;
  String? employeeName;
  String? employeeAddress;
  String? employeeMail;
  DateTime? employeeDob;
  int? departmentId;
  String? branchId;
  EmployeePayload({
    this.employeeId,
    this.employeeName,
    this.employeeAddress,
    this.employeeMail,
    this.employeeDob,
    this.departmentId,
    this.branchId,
  });
  factory EmployeePayload.fromJson(Map<String, dynamic> json) =>
      _$EmployeePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeePayloadToJson(this);
}
