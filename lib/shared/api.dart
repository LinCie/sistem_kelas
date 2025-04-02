import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static Dio? _dio;

  static Dio get dio {
    _dio ??= Dio(
      BaseOptions(
        baseUrl: dotenv.env['SERVER_URL'] ?? "http://localhost:3000",
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ),
    );
    return _dio!;
  }

  static void setAuthorizationHeader(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }
}
