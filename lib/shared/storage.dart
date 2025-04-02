import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static final Storage _instance = Storage._internal();
  late final FlutterSecureStorage storage;

  factory Storage() {
    return _instance;
  }

  Storage._internal() {
    storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  Future<void> saveToken(String token) async {
    await storage.write(key: "jwt", value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: "jwt");
  }

  Future<void> deleteToken() async {
    await storage.delete(key: "jwt");
  }
}
