// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeDTO _$EmployeeDTOFromJson(Map<String, dynamic> json) => EmployeeDTO(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EmployeeDetailDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$EmployeeDTOToJson(EmployeeDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

EmployeeDetailDTO _$EmployeeDetailDTOFromJson(Map<String, dynamic> json) =>
    EmployeeDetailDTO(
      employeeId: json['employee_id'] as int?,
      employeeName: json['employee_name'] as String?,
      employeeAddress: json['employee_address'] as String?,
      employeeDob: json['employee_dob'] == null
          ? null
          : DateTime.parse(json['employee_dob'] as String),
      employeeMail: json['employee_mail'] as String?,
      departmentId: json['department_id'] as int?,
      flagEmployee: json['flag_employee'] as int?,
      branchId: json['branch_id'] as String?,
      branchName: json['branch_name'] as String?,
      departmentName: json['department_name'] as String?,
    );

Map<String, dynamic> _$EmployeeDetailDTOToJson(EmployeeDetailDTO instance) =>
    <String, dynamic>{
      'employee_id': instance.employeeId,
      'employee_name': instance.employeeName,
      'employee_address': instance.employeeAddress,
      'employee_dob': instance.employeeDob?.toIso8601String(),
      'employee_mail': instance.employeeMail,
      'department_id': instance.departmentId,
      'flag_employee': instance.flagEmployee,
      'branch_id': instance.branchId,
      'branch_name': instance.branchName,
      'department_name': instance.departmentName,
    };
