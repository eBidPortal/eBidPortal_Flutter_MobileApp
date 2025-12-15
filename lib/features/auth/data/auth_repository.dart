import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_constants.dart';
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
      // Auth endpoints are at root level, not under /api/v1
      final loginUrl = '${ApiConstants.baseUrl}${ApiConstants.login}';
      
      print('🌐 AUTH_REPO: Making login request to $loginUrl');
      print('🌐 AUTH_REPO: Email/Mobile: $emailOrMobile');
      
      final response = await _apiClient.dio.post(
        loginUrl,
        data: {
          'emailOrMobile': emailOrMobile,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      
      print('🌐 AUTH_REPO: Response status: ${response.statusCode}');
      print('🌐 AUTH_REPO: Response data: ${response.data}');
      
      // Assuming response format: { success: true, data: { token: "...", user: { ... } } }
      if (response.data['success'] == true) {
        print('🌐 AUTH_REPO: Login successful, returning data');
        return response.data['data'];
      } else {
        print('🌐 AUTH_REPO: Login failed: ${response.data['message']}');
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || 
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw Exception('Network connection error. Please check your internet connection.');
      }
      
      throw Exception(e.response?.data['message'] ?? 'Network error');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<User> getMe() async {
    try {
      // Auth endpoints are at root level, not under /api/v1
      final meUrl = '${ApiConstants.baseUrl}${ApiConstants.me}';
      print('🌐 AUTH_REPO: getMe() - calling $meUrl');
      final response = await _apiClient.dio.get(
        meUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      
      print('🌐 AUTH_REPO: getMe() response: ${response.statusCode}');
      
      if (response.data['success'] == true) {
        final user = User.fromJson(response.data['data']['user']);
        print('🌐 AUTH_REPO: getMe() success - user: ${user.name}');
        return user;
      } else {
        print('🌐 AUTH_REPO: getMe() failed: ${response.data['message']}');
        throw Exception('Failed to fetch user profile');
      }
    } on DioException catch (e) {
      print('🌐 AUTH_REPO: getMe() DioException: ${e.message}');
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    try {
      final refreshUrl = '${ApiConstants.baseUrl}${ApiConstants.refreshToken}';
      print('🌐 AUTH_REPO: Making refresh token request to $refreshUrl');
      
      final response = await _apiClient.dio.post(
        refreshUrl,
        data: {
          'refreshToken': refreshToken,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      
      print('🌐 AUTH_REPO: Refresh response status: ${response.statusCode}');
      print('🌐 AUTH_REPO: Refresh response data: ${response.data}');
      
      if (response.data['success'] == true) {
        print('🌐 AUTH_REPO: Token refresh successful');
        return response.data['data'];
      } else {
        print('🌐 AUTH_REPO: Token refresh failed: ${response.data['message']}');
        throw Exception(response.data['message'] ?? 'Token refresh failed');
      }
    } on DioException catch (e) {
      print('🌐 AUTH_REPO: Refresh token DioException: ${e.message}');
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        throw Exception('Refresh token expired. Please login again.');
      }
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }
}
