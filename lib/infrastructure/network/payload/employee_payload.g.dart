// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeePayload _$EmployeePayloadFromJson(Map<String, dynamic> json) =>
    EmployeePayload(
      employeeId: json['employee_id'] as int?,
      employeeName: json['employee_name'] as String?,
      employeeAddress: json['employee_address'] as String?,
      employeeMail: json['employee_mail'] as String?,
      employeeDob: json['employee_dob'] == null
          ? null
          : DateTime.parse(json['employee_dob'] as String),
      departmentId: json['department_id'] as int?,
      branchId: json['branch_id'] as String?,
    );

Map<String, dynamic> _$EmployeePayloadToJson(EmployeePayload instance) =>
    <String, dynamic>{
      'employee_id': instance.employeeId,
      'employee_name': instance.employeeName,
      'employee_address': instance.employeeAddress,
      'employee_mail': instance.employeeMail,
      'employee_dob': instance.employeeDob?.toIso8601String(),
      'department_id': instance.departmentId,
      'branch_id': instance.branchId,
    };
