import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final storage = const FlutterSecureStorage();

  Future<String?> read(String key) async {
    throw UnimplementedError();
  }

  Future<void> write(String key, String value) async {
    throw UnimplementedError();
  }
}
