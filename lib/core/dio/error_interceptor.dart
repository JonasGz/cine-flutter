import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('API error: ${err.type} - ${err.message}');
    debugPrint('Response: ${err.response?.data}');

    handler.next(err);
  }
}
