import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/constants/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/token_storage/token_storage.dart';

@module
abstract class ApiModule {
  @singleton
  Dio provideDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://fitness.elevateegy.com/",
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20),
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final String? token = await TokenStorage.getToken();
          final String? local = await TokenStorage.getLocal();
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          if (local != null && local.isNotEmpty) {
            options.headers["Accept-Language"] = local;
          }
          return handler.next(options);
        },
      ),
    );
    return dio;
  }

  @singleton
  @Named(Endpoints.mealsDio)
  Dio provideMealsDio() {
    final dio = Dio(BaseOptions(baseUrl: Endpoints.urlThemeAdb));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final String? token = await TokenStorage.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );
    return dio;
  }
}
