// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:domain/exceptions.dart';

class TokenFilmsDio extends DioForNative {
  TokenFilmsDio([BaseOptions? options]) : super(options);

  @override
  Future<Response<T>> request<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) =>
      super
          .request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      )
          .catchError((e) {
        if (e is DioError && e.error is SocketException) {
          throw NoConnectionException();
        }
        throw e;
      });
}
