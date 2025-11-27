import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../domain/category.dart';

final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return CatalogRepository(apiClient);
});

class CatalogRepository {
  final ApiClient _apiClient;

  CatalogRepository(this._apiClient);

  Future<List<Category>> getCategories() async {
    try {
      final response = await _apiClient.get(
        ApiConstants.categories,
        queryParameters: {'tree': true},
      );

      if (response.data['success'] == true) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => Category.fromJson(json)).toList();
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch categories');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<Map<String, dynamic>> getCategorySchema(String categoryId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.categories}/$categoryId/schema');

      if (response.data['success'] == true) {
        return response.data['data']['schema'] ?? {};
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch schema');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }
}
