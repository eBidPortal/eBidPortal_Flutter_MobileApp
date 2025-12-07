import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

class StorageService {
  final _secureStorage = const FlutterSecureStorage();
  
  static const String _tokenKey = 'auth_token';
  static const String _userDataKey = 'user_data';
  static const String _themeKey = 'theme_mode';

  // Secure Storage (for sensitive data like tokens)
  Future<void> setToken(String token) async {
    print('💾 STORAGE: Setting auth token (length: ${token.length})');
    await _secureStorage.write(key: _tokenKey, value: token);
    print('💾 STORAGE: Auth token saved successfully');
  }

  Future<String?> getToken() async {
    print('💾 STORAGE: Retrieving auth token...');
    final token = await _secureStorage.read(key: _tokenKey);
    print('💾 STORAGE: Token retrieved: ${token != null ? "✅ Found (${token.length} chars)" : "❌ None"}');
    return token;
  }

  Future<void> clearToken() async {
    print('💾 STORAGE: Clearing auth token and user data...');
    await _secureStorage.delete(key: _tokenKey);
    await _secureStorage.delete(key: _userDataKey);
    print('💾 STORAGE: Auth data cleared successfully');
  }

  // User data storage
  Future<void> setUserData(String userData) async {
    print('💾 STORAGE: Setting user data (length: ${userData.length})');
    await _secureStorage.write(key: _userDataKey, value: userData);
    print('💾 STORAGE: User data saved successfully');
  }

  Future<String?> getUserData() async {
    print('💾 STORAGE: Retrieving user data...');
    final userData = await _secureStorage.read(key: _userDataKey);
    print('💾 STORAGE: User data retrieved: ${userData != null ? "✅ Found (${userData.length} chars)" : "❌ None"}');
    return userData;
  }

  // Shared Preferences (for settings)
  Future<void> setThemeMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

  Future<bool?> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey);
  }
}
