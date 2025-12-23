import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/storage/storage_service.dart';
import '../../../../core/services/fcm_service.dart';
import '../data/auth_repository.dart';
import '../domain/user.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  FutureOr<User?> build() async {
    print('🔐 AUTH_PROVIDER: build() called - checking for stored token');
    final storage = ref.watch(storageServiceProvider);
    final token = await storage.getToken();

    print(
      '🔐 AUTH_PROVIDER: stored token: ${token != null ? "found (${token.length} chars)" : "none"}',
    );

    if (token != null) {
      // Check if token is expired
      final isExpired = await storage.isTokenExpired();
      if (isExpired) {
        print('🔐 AUTH_PROVIDER: token expired, attempting refresh...');
        
        try {
          final refreshedUser = await _tryRefreshToken();
          if (refreshedUser != null) {
            print('🔐 AUTH_PROVIDER: token refreshed successfully, user: ${refreshedUser.name}');
            return refreshedUser;
          }
        } catch (e) {
          print('🔐 AUTH_PROVIDER: token refresh failed: $e');
        }
        
        // If refresh fails, clear auth data
        await storage.clearToken();
        return null;
      }
      
      // First try to get cached user data
      final cachedUserData = await storage.getUserData();
      if (cachedUserData != null) {
        try {
          print('🔐 AUTH_PROVIDER: using cached user data');
          final userJson = Map<String, dynamic>.from(
            jsonDecode(cachedUserData) as Map,
          );
          final user = User.fromJson(userJson);
          print('🔐 AUTH_PROVIDER: cached user loaded: ${user.name}');
          return user;
        } catch (e) {
          print('🔐 AUTH_PROVIDER: failed to parse cached user data: $e');
        }
      }

      // If no cached data or parsing failed, try API
      try {
        print('🔐 AUTH_PROVIDER: attempting to validate token with getMe()');
        final repo = ref.read(authRepositoryProvider);
        final user = await repo.getMe();
        print('🔐 AUTH_PROVIDER: token valid, user: ${user.name}');

        // Cache the user data
        await storage.setUserData(jsonEncode(user.toJson()));
        return user;
      } catch (e) {
        print('🔐 AUTH_PROVIDER: token validation failed: $e');
        // Token might be invalid - clear all data
        await storage.clearToken();
        return null;
      }
    }
    print('🔐 AUTH_PROVIDER: no stored token, user not authenticated');
    return null;
  }

  Future<void> login(String emailOrMobile, String password) async {
    print('🔐 AUTH_PROVIDER: login() called with email: $emailOrMobile');
    state = const AsyncValue.loading();

    try {
      print('🔐 AUTH_PROVIDER: Getting auth repository...');
      final repo = ref.read(authRepositoryProvider);

      print('🔐 AUTH_PROVIDER: Calling repo.login()...');
      final data = await repo.login(emailOrMobile, password);
      print('🔐 AUTH_PROVIDER: Login response received: ${data.keys}');

      final token = data['token'] as String? ?? data['accessToken'] as String;
      final refreshToken = data['refreshToken'] as String?;
      final user = User.fromJson(data['user']);
      print('🔐 AUTH_PROVIDER: Token and user parsed successfully');

      // Calculate expiry (assuming 1 hour if not provided)
      DateTime? expiry;
      if (data['expiresIn'] != null) {
        final expiresInSeconds = data['expiresIn'] as int;
        expiry = DateTime.now().add(Duration(seconds: expiresInSeconds));
      } else if (data['expiry'] != null) {
        expiry = DateTime.parse(data['expiry'] as String);
      } else {
        expiry = DateTime.now().add(const Duration(hours: 1)); // Default 1 hour
      }

      final storage = ref.read(storageServiceProvider);

      // Save complete auth data
      print('🔐 AUTH_PROVIDER: Saving complete auth data...');
      await storage.saveAuthData(
        token: token,
        refreshToken: refreshToken,
        expiry: expiry,
        userData: jsonEncode(user.toJson()),
      );
      print('🔐 AUTH_PROVIDER: Complete auth data saved');

      // Update state
      state = AsyncValue.data(user);
      print('🔐 AUTH_PROVIDER: State updated with user: ${user.name}');

      // Register FCM token after successful login
      try {
        print('🔐 AUTH_PROVIDER: Registering FCM token after login...');
        final fcmService = ref.read(fcmServiceProvider);
        final fcmRegistered = await fcmService.registerToken();
        if (fcmRegistered) {
          print('🔐 AUTH_PROVIDER: FCM token registered successfully after login');
        } else {
          print('🔐 AUTH_PROVIDER: FCM token registration failed after login');
        }
      } catch (e) {
        print('🔐 AUTH_PROVIDER: Error registering FCM token after login: $e');
        // Don't fail login if FCM registration fails
      }

    } catch (e, st) {
      print('🔐 AUTH_PROVIDER: Login failed with error: $e');
      print('🔐 AUTH_PROVIDER: Stack trace: $st');
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  // Try to refresh the access token
  Future<User?> _tryRefreshToken() async {
    print('🔐 AUTH_PROVIDER: _tryRefreshToken() called');
    
    final storage = ref.read(storageServiceProvider);
    final refreshToken = await storage.getRefreshToken();
    
    if (refreshToken == null) {
      print('🔐 AUTH_PROVIDER: No refresh token available');
      return null;
    }
    
    try {
      final repo = ref.read(authRepositoryProvider);
      final tokenData = await repo.refreshToken(refreshToken);
      
      final newToken = tokenData['token'] as String? ?? tokenData['accessToken'] as String;
      final newRefreshToken = tokenData['refreshToken'] as String?;
      final userJson = tokenData['user'] as Map<String, dynamic>?;
      
      // Calculate expiry
      DateTime? expiry;
      if (tokenData['expiresIn'] != null) {
        final expiresInSeconds = tokenData['expiresIn'] as int;
        expiry = DateTime.now().add(Duration(seconds: expiresInSeconds));
      } else if (tokenData['expiry'] != null) {
        expiry = DateTime.parse(tokenData['expiry'] as String);
      } else {
        expiry = DateTime.now().add(const Duration(hours: 1));
      }
      
      User? user;
      if (userJson != null) {
        user = User.fromJson(userJson);
      } else {
        // If user data not included in refresh response, use cached data
        final cachedUserData = await storage.getUserData();
        if (cachedUserData != null) {
          final userJsonCached = Map<String, dynamic>.from(
            jsonDecode(cachedUserData) as Map,
          );
          user = User.fromJson(userJsonCached);
        }
      }
      
      if (user == null) {
        print('🔐 AUTH_PROVIDER: No user data available after token refresh');
        return null;
      }
      
      // Save refreshed auth data
      await storage.saveAuthData(
        token: newToken,
        refreshToken: newRefreshToken ?? refreshToken, // Keep old refresh token if new one not provided
        expiry: expiry,
        userData: jsonEncode(user.toJson()),
      );
      
      print('🔐 AUTH_PROVIDER: Token refreshed successfully for user: ${user.name}');
      return user;
      
    } catch (e) {
      print('🔐 AUTH_PROVIDER: Token refresh failed: $e');
      return null;
    }
  }

  // Manual token refresh method (can be called from UI)
  Future<bool> refreshToken() async {
    print('🔐 AUTH_PROVIDER: Manual token refresh requested');
    
    try {
      final refreshedUser = await _tryRefreshToken();
      if (refreshedUser != null) {
        state = AsyncValue.data(refreshedUser);
        return true;
      }
      return false;
    } catch (e) {
      print('🔐 AUTH_PROVIDER: Manual token refresh failed: $e');
      return false;
    }
  }

  Future<void> logout() async {
    // Remove FCM token from backend before clearing local data
    try {
      await ref.read(fcmServiceProvider).removeToken();
    } catch (e) {
      print('Error removing FCM token during logout: $e');
      // Don't fail logout if FCM token removal fails
    }

    await ref.read(storageServiceProvider).clearToken();
    state = const AsyncValue.data(null);
  }
}
