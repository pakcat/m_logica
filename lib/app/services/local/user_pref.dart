import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserPref {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _tokenKey = 'token';
  static const String _dataKey = 'data';

  Future<void> setDataPref(String? value) async {
    await _storage.write(key: _dataKey, value: value);
  }

  Future<void> setString(String keyStorage, String? value) async {
    await _storage.write(key: keyStorage, value: value);
  }

  Future<String?> getString(String keyStorage) async {
    return await _storage.read(key: keyStorage);
  }

  Future<void> clearString(String keyStorage) async {
    _storage.delete(key: keyStorage);
  }

  Future<String?> getDataPref() async {
    return await _storage.read(key: _dataKey);
  }

  Future<void> setTokenPref(String? value) async {
    await _storage.write(key: _tokenKey, value: value);
  }

  Future<String?> getTokenPref() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> clearPref() async {
    String? emailSaved = await getString("email");
    _storage.deleteAll();
    await setString("email", emailSaved);
  }
}
