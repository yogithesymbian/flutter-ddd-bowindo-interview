import 'dart:developer';

import 'package:flutter_wonderwoman_projectscoid/application/error_bloc.dart';
import 'package:flutter_wonderwoman_projectscoid/application/loader_bloc.dart';
import 'package:flutter_wonderwoman_projectscoid/domain/model/employee_model.dart';
import 'package:flutter_wonderwoman_projectscoid/domain/service/employee_service.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/network/payload/employee_payload.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmployeeState {
  EmployeeState({
    this.isLoaded,
    // this.employeePagination,
    required this.employeeModel,
  });
  bool? isLoaded;
  // EmployeePagination? employeePagination;
  List<EmployeeDetailModel?> employeeModel;

  EmployeeState copywith({
    bool? isLoaded,
    // EmployeePagination? employeePagination,
    List<EmployeeDetailModel?>? employeeModel,
  }) {
    return EmployeeState(
      // employeePagination: employeePagination ?? this.employeePagination,
      employeeModel: employeeModel ?? this.employeeModel,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}

final employeeBlocProvider =
    StateNotifierProvider<EmployeeBlocNotifier, EmployeeState>(
        (ref) => EmployeeBlocNotifier(ref));

class EmployeeBlocNotifier extends StateNotifier<EmployeeState> {
  EmployeeBlocNotifier(this.ref) : super(EmployeeState(employeeModel: []));
  final Ref ref;

  Future<void> setEmployeetPagination({
    int? totalItems,
    int? totalPages,
    int? currentPage,
    bool? isLoaded,
  }) async {
    state = state.copywith(
      // employeePagination: EmployeePagination(
      //   totalItems: totalItems ?? state.employeePagination?.totalItems,
      //   totalPages: totalPages ?? state.employeePagination?.totalPages,
      //   currentPage: currentPage ?? state.employeePagination?.currentPage,
      // ),
      isLoaded: isLoaded ?? state.isLoaded,
    );
  }

  Future<void> getEmployee(
    bool isRefreshScreen, {
    int? page,
    int? size,
    String? sort,
    String? keyword,
  }) async {
    final loaderBloc = ref.read(loaderBlocProvider.notifier);
    final errorBloc = ref.read(errorBlocProvider.notifier);
    final employeeSerivce = ref.read(employeeServiceProvider);

    loaderBloc
        .whileLoading(() => employeeSerivce.get(
              page: page,
              size: size,
              sort: 'DESC',
              keyword: '',
            ))
        .then((value) {
      value.when(success: (model) async {
        if (model.employeeModel.isNotEmpty == true) {
          if (isRefreshScreen) {
            state = model;
          } else {
            state = state.copywith(
              employeeModel: [...state.employeeModel, ...model.employeeModel],
              isLoaded: true,
            );
          }
        } else {
          state = state.copywith(
            isLoaded: false,
          );
        }
      }, failure: (error) {
        log('message: ${error.type}');
        log('message: ${error.message}');
        errorBloc.handle(error);
      });
    });
  }

  Future<void> postEmployee(EmployeePayload payload) async {
    final loaderBloc = ref.read(loaderBlocProvider.notifier);
    final errorBloc = ref.read(errorBlocProvider.notifier);
    final employeeService = ref.read(employeeServiceProvider);

    await loaderBloc
        .whileLoading(() => employeeService.post(payload))
        .then((value) {
      value.when(success: (model) async {
        // state = state.copywith(
        //   employeeModel: [...state.employeeModel, model],
        // );
        log('isSuccess onAdd: $model');
      }, failure: (error) {
        errorBloc.handle(error);
      });
    });
  }

  Future<void> putEmployee(EmployeePayload payload) async {
    final loaderBloc = ref.read(loaderBlocProvider.notifier);
    final errorBloc = ref.read(errorBlocProvider.notifier);
    final employeeService = ref.read(employeeServiceProvider);

    await loaderBloc
        .whileLoading(() => employeeService.put(payload))
        .then((value) {
      value.when(success: (model) async {
        log('isSuccess onEdit: $model');
        // state = state.copywith(
        //   employeeModel: [
        //     for (final employeeModel in state.employeeModel)
        //       // we're marking only the matching employeeModel as completed
        //       if (employeeModel?.employeeId == employeeID)
        //         // Once more, since our state is immutable, we need to make a copy of the employeeModel. We're using our `copyWith` method implemented before to help with that.
        //         employeeModel?.copyWith(nameEmployee: model?.nameEmployee)
        //       else
        //         // other employeeModels are not modified
        //         employeeModel,
        //   ],
        // );
      }, failure: (error) {
        errorBloc.handle(error);
      });
    });
  }

  Future<void> delEmployee(EmployeePayload payload) async {
    final loaderBloc = ref.read(loaderBlocProvider.notifier);
    final errorBloc = ref.read(errorBlocProvider.notifier);
    final employeeService = ref.read(employeeServiceProvider);

    await loaderBloc
        .whileLoading(() => employeeService.delete(payload))
        .then((value) {
      value.when(success: (model) async {
        log('isSuccess onDelete: $model');
        // state = state.copywith(
        //   employeeModel: [
        //     for (final employeeModel in state.employeeModel)
        //       if (employeeModel?.employeeId != employeeID) employeeModel,
        //   ],
        // );
      }, failure: (error) {
        errorBloc.handle(error);
      });
    });
  }
}
