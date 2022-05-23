import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final storage = const FlutterSecureStorage();

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }
}
