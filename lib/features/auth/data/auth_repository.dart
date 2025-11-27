import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../domain/user.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthRepository(apiClient);
});

class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);

  Future<Map<String, dynamic>> login(String emailOrMobile, String password) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.login,
        data: {
          'emailOrMobile': emailOrMobile,
          'password': password,
        },
      );
      
      // Assuming response format: { success: true, data: { token: "...", user: { ... } } }
      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<User> getMe() async {
    try {
      final response = await _apiClient.get(ApiConstants.me);
      
      if (response.data['success'] == true) {
        return User.fromJson(response.data['data']['user']);
      } else {
        throw Exception('Failed to fetch user profile');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }
}
