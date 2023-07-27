import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wonderwoman_projectscoid/application/auth_bloc.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/network/provider/network_error.dart';

// TODO: Check QueuedInterceptor
class NetworkAuthInterceptor extends Interceptor {
  NetworkAuthInterceptor(this.dio, this.ref);
  final Ref ref;
  final Dio dio;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await ref.read(authBlocProvider.notifier).token();
    if (!options.uri.toString().contains('/login')) {
      options.headers["token"] = token;
    }
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    NetworkError error = NetworkError(err);

    if (error.type == NetworkErrorType.tokenExpired) {
      // do request
    }
    handler.next(err);
  }
}
