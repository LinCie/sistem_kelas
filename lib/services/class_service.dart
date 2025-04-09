import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sistem_kelas/shared/api.dart';
import 'package:sistem_kelas/structures/class_structure.dart';

class ClassService {
  final Dio dio = ApiConfig.dio;

  Future<List<Class>> getClasses(String as) async {
    final response = await dio.get("/classes", queryParameters: {"as": as});

    if (response.statusCode != 200) {
      throw Exception(response.data["message"]);
    }

    final List<dynamic> jsonList = jsonDecode(response.data) as List<dynamic>;

    return jsonList
        .map((json) => Class.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
