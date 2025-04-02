import 'package:dio/dio.dart';
import 'package:sistem_kelas/shared/api.dart';

class AuthService {
  final Dio dio = ApiConfig.dio;

  Future<String> signUp(String username, String password) async {
    final response = await dio.post(
      "/auth/register",
      data: {"username": username, "password": password},
    );
    if (response.statusCode != 200) throw Exception(response.data["message"]);
    return response.data;
  }

  Future<String> signIn(String username, String password) async {
    final response = await dio.post(
      "/auth/login",
      data: {"username": username, "password": password},
    );
    if (response.statusCode != 200) throw Exception(response.data["message"]);
    return response.data;
  }
}
