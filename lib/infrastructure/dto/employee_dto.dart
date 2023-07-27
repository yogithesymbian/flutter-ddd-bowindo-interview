import 'package:json_annotation/json_annotation.dart';
part 'employee_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EmployeeDTO {
  bool? success;
  List<EmployeeDetailDTO>? data;
  String? message;

  EmployeeDTO({
    this.success,
    this.data,
    this.message,
  });
  factory EmployeeDTO.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDTOFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class EmployeeDetailDTO {
  int? employeeId;
  String? employeeName;
  String? employeeAddress;
  DateTime? employeeDob;
  String? employeeMail;
  int? departmentId;
  int? flagEmployee;
  String? branchId;
  String? branchName;
  String? departmentName;
  EmployeeDetailDTO({
    this.employeeId,
    this.employeeName,
    this.employeeAddress,
    this.employeeDob,
    this.employeeMail,
    this.departmentId,
    this.flagEmployee,
    this.branchId,
    this.branchName,
    this.departmentName,
  });
  factory EmployeeDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDetailDTOFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDetailDTOToJson(this);
}
