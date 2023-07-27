import 'package:flutter_wonderwoman_projectscoid/application/employee_bloc.dart';
import 'package:flutter_wonderwoman_projectscoid/domain/model/employee_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/network/employee_network_service.dart';
import '../../infrastructure/network/payload/employee_payload.dart';
import '../model/app_result.dart';

final employeeServiceProvider = Provider((ref) {
  return EmployeeService(ref.read);
});

class EmployeeService {
  EmployeeService(this._reader);
  final Reader _reader;
  late final _networkService = _reader(employeeNetworkServiceProvider);

  Future<AppResult<EmployeeState>> get({
    int? page,
    int? size,
    String? sort,
    String? keyword,
  }) {
    return AppResult.guardFuture(
      () async => _networkService
          .list(
              // page: page,
              // size: size,
              // sort: sort,
              // keyword: keyword,
              )
          .then(
        (dto) {
          List<EmployeeDetailModel>? dataModel = dto.data
              ?.map(
                (d) => EmployeeDetailModel.fromJson(d.toJson()),
              )
              .toList();
          // final pagination = EmployeePagination(
          //   totalItems: dto.totalItems,
          //   totalPages: dto.totalPages,
          //   currentPage: dto.currentPage,
          // );
          return EmployeeState(
            // employeePagination: pagination,
            employeeModel: dataModel ?? [],
            isLoaded: true,
          );
        },
      ),
    );
  }

  Future<AppResult<String?>> post(EmployeePayload payload) {
    return AppResult.guardFuture(
      () async => _networkService.add(payload).then(
        (dto) {
          return dto.toString();
        },
      ),
    );
  }

  Future<AppResult<String?>> put(EmployeePayload payload) {
    return AppResult.guardFuture(
      () async => _networkService.edit(payload).then(
        (dto) {
          return dto.toString();
        },
      ),
    );
  }

  Future<AppResult<String?>> delete(EmployeePayload payload) {
    return AppResult.guardFuture(
      () async => _networkService.delete(payload).then(
        (dto) {
          return dto.toString();
        },
      ),
    );
  }
}
