import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/storage/storage_service.dart';
import '../data/auth_repository.dart';
import '../domain/user.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  FutureOr<User?> build() async {
    final storage = ref.watch(storageServiceProvider);
    final token = await storage.getToken();
    
    if (token != null) {
      try {
        final repo = ref.read(authRepositoryProvider);
        return await repo.getMe();
      } catch (e) {
        // Token might be invalid
        await storage.clearToken();
        return null;
      }
    }
    return null;
  }

  Future<void> login(String emailOrMobile, String password) async {
    state = const AsyncValue.loading();
    
    try {
      final repo = ref.read(authRepositoryProvider);
      final data = await repo.login(emailOrMobile, password);
      
      final token = data['token'] as String;
      final user = User.fromJson(data['user']);
      
      // Save token
      await ref.read(storageServiceProvider).setToken(token);
      
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
