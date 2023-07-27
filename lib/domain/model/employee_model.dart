// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

class EmployeeModel {
  bool? success;
  List<EmployeeDetailModel>? data;
  String? message;

  EmployeeModel({
    this.success,
    this.data,
    this.message,
  });

  factory EmployeeModel.fromRawJson(String str) =>
      EmployeeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<EmployeeDetailModel>.from(
                json["data"]!.map((x) => EmployeeDetailModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class EmployeeDetailModel {
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

  EmployeeDetailModel({
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

  factory EmployeeDetailModel.fromRawJson(String str) =>
      EmployeeDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EmployeeDetailModel.fromJson(Map<String, dynamic> json) =>
      EmployeeDetailModel(
        employeeId: json["employee_id"],
        employeeName: json["employee_name"],
        employeeAddress: json["employee_address"],
        employeeDob: json["employee_dob"] == null
            ? null
            : DateTime.parse(json["employee_dob"]),
        employeeMail: json["employee_mail"],
        departmentId: json["department_id"],
        flagEmployee: json["flag_employee"],
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        departmentName: json["department_name"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "employee_name": employeeName,
        "employee_address": employeeAddress,
        "employee_dob":
            "${employeeDob!.year.toString().padLeft(4, '0')}-${employeeDob!.month.toString().padLeft(2, '0')}-${employeeDob!.day.toString().padLeft(2, '0')}",
        "employee_mail": employeeMail,
        "department_id": departmentId,
        "flag_employee": flagEmployee,
        "branch_id": branchId,
        "branch_name": branchName,
        "department_name": departmentName,
      };
}
