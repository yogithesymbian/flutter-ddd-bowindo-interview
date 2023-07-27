import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../dto/error_dto.dart';

enum NetworkErrorType {
  network,
  tokenExpired,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown,
  unprocessableEntity,
}

class NetworkError {
  late String message;
  late NetworkErrorType type;
  late ErrorDTO? data;

  NetworkError(Exception? error) {
    if (error is DioError) {
      try {
        data = ErrorDTO.fromJson(jsonDecode(error.response.toString()));
        // log('parse to errorDTO ${error.response.toString()}');
        // log('parse to errorDTO ${data?.toJson()}');
      } catch (err) {
        data = ErrorDTO.fromJson(
            jsonDecode('{"error":"NO ERROR","message":"something wrong"}'));
      }
      message = error.message;
      switch (error.type) {
        case DioErrorType.other:
          if (error.error is SocketException) {
            // SocketException: Failed host lookup: '***'
            // (OS Error: No address associated with hostname, errno = 7)
            type = NetworkErrorType.network;
            data = ErrorDTO.fromJson(jsonDecode(
                '{"error":"NO ERROR","message":"no network connection"}'));
          } else {
            type = NetworkErrorType.unknown;
          }
          break;
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          type = NetworkErrorType.timeout;
          break;
        case DioErrorType.sendTimeout:
          type = NetworkErrorType.network;
          break;
        case DioErrorType.response:
          // TODO(api): need define more http status;
          switch (error.response?.statusCode) {
            case HttpStatus.badRequest: // 400
              type = NetworkErrorType.badRequest;
              break;
            case HttpStatus.unauthorized: // 401
              type = NetworkErrorType.unauthorized; //
              break;
            case HttpStatus.unprocessableEntity: // 422
              type = NetworkErrorType.unprocessableEntity;
              data = ErrorDTO.fromJson(jsonDecode(
                  '{"error":"ERROR","message":"check on screen, field is required"}'));
              break;
            case HttpStatus.notFound:
              type = NetworkErrorType.unknown;
              break;
            case HttpStatus.internalServerError: // 500
            case HttpStatus.badGateway: // 502
            case HttpStatus.serviceUnavailable: // 503
              type = NetworkErrorType.server;
              break;
            case HttpStatus.gatewayTimeout: // 504
              type = NetworkErrorType.server;
              break;
            default:
              type = NetworkErrorType.unknown;
              break;
          }
          break;
        case DioErrorType.cancel:
          type = NetworkErrorType.cancel;
          break;
        default:
          type = NetworkErrorType.unknown;
      }
    } else {
      debugPrint('AppError(UnKnown): $error');
      type = NetworkErrorType.unknown;
      message = 'AppError: $error';
    }
  }
}
