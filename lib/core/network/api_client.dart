import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  final Dio _dio;
  final Future<String?> Function() getToken;
  final String baseUrl = 'https://stock-backend-r2qd.onrender.com';

  ApiClient(this._dio, {required this.getToken}) {
    init();
  }

  void init() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
        logPrint: (object) {
          if (kDebugMode) {
            print(object);
          }
        },
      ),
    );
  }
}
