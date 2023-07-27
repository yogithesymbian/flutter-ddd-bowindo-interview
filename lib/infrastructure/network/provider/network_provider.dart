import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/network/provider/network_auth_interceptor.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/config/env.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final networkClientProvider =
    Provider<Dio>((ref) => NetworkClient.getInstance(ref));

class NetworkClient with DioMixin implements Dio {
  NetworkClient._({required Ref ref, BaseOptions? options}) {
    options = BaseOptions(
      baseUrl: Env.apiHost,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    // Interceptors
    // TODO: add api interceptor
    interceptors.add(NetworkAuthInterceptor(this, ref));

    // Firebase Performance
    // TODO: dio_firebase_performance does not yet support NNBD.
    // interceptors.add(DioFirebasePerformanceInterceptor());

    if (kDebugMode) {
      interceptors.add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 300),
      );
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static getInstance(Ref ref) => NetworkClient._(ref: ref);
}
