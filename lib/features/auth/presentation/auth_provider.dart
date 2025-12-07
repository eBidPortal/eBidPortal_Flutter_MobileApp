import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/storage/storage_service.dart';
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
    
    print('🔐 AUTH_PROVIDER: stored token: ${token != null ? "found (${token.length} chars)" : "none"}');
    
    if (token != null) {
      // First try to get cached user data
      final cachedUserData = await storage.getUserData();
      if (cachedUserData != null) {
        try {
          print('🔐 AUTH_PROVIDER: using cached user data');
          final userJson = Map<String, dynamic>.from(
            jsonDecode(cachedUserData) as Map
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
    state = const AsyncValue.loading();
    
    try {
      final repo = ref.read(authRepositoryProvider);
      final data = await repo.login(emailOrMobile, password);
      
      final token = data['token'] as String;
      final user = User.fromJson(data['user']);
      
      final storage = ref.read(storageServiceProvider);
      
      // Save token and user data
      await storage.setToken(token);
      await storage.setUserData(jsonEncode(user.toJson()));
      
      // Update state
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> logout() async {
    await ref.read(storageServiceProvider).clearToken();
    state = const AsyncValue.data(null);
  }
}
