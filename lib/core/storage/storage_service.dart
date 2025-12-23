import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

class StorageService {
  final _secureStorage = const FlutterSecureStorage();
  
  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tokenExpiryKey = 'token_expiry';
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
    print('💾 STORAGE: Clearing all auth data...');
    await _secureStorage.delete(key: _tokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
    await _secureStorage.delete(key: _tokenExpiryKey);
    await _secureStorage.delete(key: _userDataKey);
    print('💾 STORAGE: All auth data cleared successfully');
  }

  // Refresh Token Management
  Future<void> setRefreshToken(String refreshToken) async {
    print('💾 STORAGE: Setting refresh token (length: ${refreshToken.length})');
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
    print('💾 STORAGE: Refresh token saved successfully');
  }

  Future<String?> getRefreshToken() async {
    print('💾 STORAGE: Retrieving refresh token...');
    final refreshToken = await _secureStorage.read(key: _refreshTokenKey);
    print('💾 STORAGE: Refresh token retrieved: ${refreshToken != null ? "✅ Found (${refreshToken.length} chars)" : "❌ None"}');
    return refreshToken;
  }

  // Token Expiry Management
  Future<void> setTokenExpiry(DateTime expiry) async {
    print('💾 STORAGE: Setting token expiry: ${expiry.toIso8601String()}');
    await _secureStorage.write(key: _tokenExpiryKey, value: expiry.toIso8601String());
    print('💾 STORAGE: Token expiry saved successfully');
  }

  Future<DateTime?> getTokenExpiry() async {
    print('💾 STORAGE: Retrieving token expiry...');
    final expiryString = await _secureStorage.read(key: _tokenExpiryKey);
    if (expiryString != null) {
      final expiry = DateTime.parse(expiryString);
      print('💾 STORAGE: Token expiry retrieved: ${expiry.toIso8601String()}');
      return expiry;
    }
    print('💾 STORAGE: No token expiry found');
    return null;
  }

  // Check if token is expired
  Future<bool> isTokenExpired() async {
    final expiry = await getTokenExpiry();
    if (expiry == null) {
      print('💾 STORAGE: No expiry set, considering token expired');
      return true;
    }
    final isExpired = DateTime.now().isAfter(expiry.subtract(const Duration(minutes: 5))); // 5 min buffer
    print('💾 STORAGE: Token expired check: ${isExpired ? "❌ Expired" : "✅ Valid"}');
    return isExpired;
  }

  // Save complete auth data
  Future<void> saveAuthData({
    required String token,
    String? refreshToken,
    DateTime? expiry,
    required String userData,
  }) async {
    print('💾 STORAGE: Saving complete auth data...');
    await setToken(token);
    if (refreshToken != null) {
      await setRefreshToken(refreshToken);
    }
    if (expiry != null) {
      await setTokenExpiry(expiry);
    }
    await setUserData(userData);
    print('💾 STORAGE: Complete auth data saved successfully');
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

  // Generic storage methods for non-sensitive data
  Future<void> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
