import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_constants.dart';
import '../storage/storage_service.dart';
import '../../features/auth/presentation/auth_provider.dart';
import '../../features/auth/data/auth_repository.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  final storageService = ref.watch(storageServiceProvider);
  return ApiClient(storageService, ref);
});

class ApiClient {
  final StorageService _storageService;
  final Ref _ref;
  late final Dio _dio;

  ApiClient(this._storageService, this._ref) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.apiBaseUrl,
        connectTimeout: const Duration(
          milliseconds: ApiConstants.connectTimeout,
        ),
        receiveTimeout: const Duration(
          milliseconds: ApiConstants.receiveTimeout,
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add Auth Token if available
          final token = await _storageService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          print(
            '🌐 API_CLIENT: Making ${options.method} request to: ${options.uri}',
          );
          print('🌐 API_CLIENT: Headers: ${options.headers}');
          if (options.data != null) {
            print('🌐 API_CLIENT: Request Body: ${options.data}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print(
            '🌐 API_CLIENT: Response Received - Status: ${response.statusCode}',
          );
          print('🌐 API_CLIENT: Response Data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          print('🌐 API_CLIENT: Error Occurred - ${e.message}');
          print('🌐 API_CLIENT: Error Status: ${e.response?.statusCode}');
          print('🌐 API_CLIENT: Error Response: ${e.response?.data}');

          // Handle 401 Unauthorized - Try token refresh first
          if (e.response?.statusCode == 401) {
            print('🌐 API_CLIENT: 401 Unauthorized - Attempting token refresh...');
            
            try {
              final newToken = await _refreshAccessToken();
              if (newToken != null) {
                print('🌐 API_CLIENT: Token refreshed successfully, retrying request...');
                // Update the authorization header and retry the request
                e.requestOptions.headers['Authorization'] = 'Bearer $newToken';
                final retryResponse = await _dio.fetch(e.requestOptions);
                return handler.resolve(retryResponse);
              }
            } catch (refreshError) {
              print('🌐 API_CLIENT: Token refresh failed: $refreshError');
            }
            
            // If refresh fails or no refresh token, handle token expiration
            print('🌐 API_CLIENT: Token refresh failed, clearing auth data');
            await _handleTokenExpired();
          }

          return handler.next(e);
        },
      ),
    );
  }

  // GET Request
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  // POST Request
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  // PUT Request
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  // DELETE Request
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  // PATCH Request
  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  // Attempt to refresh the access token
  Future<String?> _refreshAccessToken() async {
    try {
      print('🌐 API_CLIENT: Attempting to refresh access token...');
      
      final refreshToken = await _storageService.getRefreshToken();
      if (refreshToken == null) {
        print('🌐 API_CLIENT: No refresh token available');
        return null;
      }

      // Create a separate auth repository instance to avoid circular dependency
      final tempAuthRepo = AuthRepository(this);
      final tokenData = await tempAuthRepo.refreshToken(refreshToken);
      
      final newAccessToken = tokenData['token'] as String?
          ?? tokenData['accessToken'] as String?;
      final newRefreshToken = tokenData['refreshToken'] as String?;
      
      if (newAccessToken == null) {
        print('🌐 API_CLIENT: No access token in refresh response');
        return null;
      }
      
      // Calculate expiry (assuming 1 hour if not provided)
      DateTime? expiry;
      if (tokenData['expiresIn'] != null) {
        final expiresInSeconds = tokenData['expiresIn'] as int;
        expiry = DateTime.now().add(Duration(seconds: expiresInSeconds));
      } else if (tokenData['expiry'] != null) {
        expiry = DateTime.parse(tokenData['expiry'] as String);
      } else {
        expiry = DateTime.now().add(const Duration(days: 7)); // Default 7 days per API docs
      }
      
      // Save new tokens
      await _storageService.setToken(newAccessToken);
      if (newRefreshToken != null) {
        await _storageService.setRefreshToken(newRefreshToken);
      }
      await _storageService.setTokenExpiry(expiry);
      
      print('🌐 API_CLIENT: Access token refreshed successfully');
      return newAccessToken;
      
    } catch (e) {
      print('🌐 API_CLIENT: Token refresh failed: $e');
      return null;
    }
  }

  // Handle token expiration
  Future<void> _handleTokenExpired() async {
    try {
      // Clear stored auth data
      await _storageService.clearToken();

      // Trigger logout in auth provider
      _ref.read(authProvider.notifier).logout();

      print('🌐 API_CLIENT: Auth data cleared due to token expiration');
    } catch (e) {
      print('🌐 API_CLIENT: Error clearing auth data: $e');
    }
  }

  Dio get dio => _dio;
}
