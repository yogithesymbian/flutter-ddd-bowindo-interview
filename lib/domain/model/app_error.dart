import 'package:flutter_wonderwoman_projectscoid/infrastructure/network/provider/network_error.dart';

enum AppErrorType {
  highPriority,
  lowPriority,
  general,
}

class AppError {
  final String? message;
  final AppErrorType type;

  AppError({this.message, required this.type});

  factory AppError.fromNetwork(NetworkError? error) {
    if (error != null) {
      // TODO: Handle error.data
      switch (error.type) {
        case NetworkErrorType.network:
          // TODO: Handle this case.
          break;
        case NetworkErrorType.badRequest:
          // TODO: Handle this case.
          break;
        case NetworkErrorType.unauthorized:
          // TODO: Handle this case.
          break;
        case NetworkErrorType.cancel:
          // TODO: Handle this case.
          break;
        case NetworkErrorType.timeout:
          // TODO: Handle this case.
          break;
        case NetworkErrorType.server:
          // TODO: Handle this case.
          break;
        case NetworkErrorType.unknown:
          // TODO: Handle this case.
          break;
      }
      return AppError(
        type: AppErrorType.highPriority,
        message: '${error.data?.message}',
      );
    }
    return AppError(type: AppErrorType.general);
  }
}
