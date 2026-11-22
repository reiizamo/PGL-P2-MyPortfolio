import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  TokenStorage({FlutterSecureStorage? storage}): _storage = storage ?? const FlutterSecureStorage();
  
  final FlutterSecureStorage _storage;

  static const String _tokenKey = 'auth_token';

  Future<void> save(String token) {
    return _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> read() {
    return _storage.read(key: _tokenKey);
  }

  Future<void> delete() {
    return _storage.delete(key: _tokenKey);
  }
}