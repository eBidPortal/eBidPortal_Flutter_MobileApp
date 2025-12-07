import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_constants.dart';
import '../storage/storage_service.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  final storageService = ref.watch(storageServiceProvider);
  return ApiClient(storageService);
});

class ApiClient {
  final StorageService _storageService;
  late final Dio _dio;

  ApiClient(this._storageService) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.apiBaseUrl,
        connectTimeout: const Duration(milliseconds: ApiConstants.connectTimeout),
        receiveTimeout: const Duration(milliseconds: ApiConstants.receiveTimeout),
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
          print('🌐 API_CLIENT: Making ${options.method} request to: ${options.uri}');
          print('🌐 API_CLIENT: Headers: ${options.headers}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('🌐 API_CLIENT: Response received - Status: ${response.statusCode}');
          print('🌐 API_CLIENT: Response data type: ${response.data.runtimeType}');
          print('🌐 API_CLIENT: Response data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print('🌐 API_CLIENT: Error occurred - ${e.message}');
          print('🌐 API_CLIENT: Error type: ${e.type}');
          print('🌐 API_CLIENT: Error response: ${e.response?.data}');
          print('🌐 API_CLIENT: Error status: ${e.response?.statusCode}');
          // Handle global errors (e.g., 401 Unauthorized)
          if (e.response?.statusCode == 401) {
            // TODO: Trigger logout or refresh token flow
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

  Dio get dio => _dio;
}
