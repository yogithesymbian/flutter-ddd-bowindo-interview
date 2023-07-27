import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_wonderwoman_projectscoid/domain/model/app_error.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/network/provider/network_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_result.freezed.dart';

@freezed
class AppResult<T> with _$AppResult<T> {
  AppResult._();

  factory AppResult.success({required T data}) = Success<T>;

  factory AppResult.failure({required AppError error}) = Failure<T>;

  static AppResult<T> guard<T>(T Function() body) {
    try {
      return AppResult.success(data: body());
    } on DioError catch (e) {
      return AppResult.failure(error: AppError.fromNetwork(NetworkError(e)));
    }
  }

  static Future<AppResult<T>> guardFuture<T>(
      Future<T> Function() future) async {
    try {
      return AppResult.success(data: await future());
    } on DioError catch (e) {
      return AppResult.failure(error: AppError.fromNetwork(NetworkError(e)));
    }
  }

  bool get isSuccess => when(success: (data) => true, failure: (e) => false);

  bool get isFailure => !isSuccess;

  void ifSuccess(Function(T data) body) {
    maybeWhen(
      success: (data) => body(data),
      orElse: () {
        // no-op
      },
    );
  }

  void ifFailure(Function(AppError e) body) {
    maybeWhen(
      failure: (e) => body(e),
      orElse: () {
        // no-op
      },
    );
  }

  T get dataOrThrow {
    return when(
      success: (data) => data,
      failure: (e) => throw e,
    );
  }
}
