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
    print('CatalogRepository: Fetching categories with tree=true');
    try {
      final response = await _apiClient.get(
        ApiConstants.categories,
        queryParameters: {'tree': true},
      );

      print('CatalogRepository: Received response with status: ${response.statusCode}');
      print('CatalogRepository: Response data keys: ${response.data.keys.toList()}');
      print('CatalogRepository: Response data: ${response.data}');

      if (response.data['success'] == true) {
        final List<dynamic> data = response.data['data'];
        print('CatalogRepository: Processing ${data.length} category items');
        final categories = data.map((json) {
          try {
            print('CatalogRepository: Parsing category: $json');
            return Category.fromJson(json);
          } catch (e) {
            print('CatalogRepository: Failed to parse category: $json, error: $e');
            rethrow;
          }
        }).toList();
        print('CatalogRepository: Successfully parsed ${categories.length} categories');
        return categories;
      } else {
        final message = response.data['message'] ?? 'Failed to fetch categories';
        print('CatalogRepository: API returned success=false with message: $message');
        throw Exception(message);
      }
    } on DioException catch (e) {
      print('CatalogRepository: DioException occurred: $e');
      print('CatalogRepository: DioException response: ${e.response?.data}');
      throw Exception(e.response?.data['message'] ?? 'Network error');
    } catch (e, stackTrace) {
      print('CatalogRepository: Unexpected error: $e');
      print('CatalogRepository: Stack trace: $stackTrace');
      throw Exception('Unexpected error occurred');
    }
  }

  Future<Map<String, dynamic>> getCategorySchema(String categoryId) async {
    print('CatalogRepository: Fetching schema for category $categoryId');
    try {
      final url = '${ApiConstants.categories}/$categoryId/schema';
      print('CatalogRepository: Making request to $url');
      final response = await _apiClient.get(url);

      print('CatalogRepository: Schema response status: ${response.statusCode}');
      print('CatalogRepository: Schema response data keys: ${response.data.keys.toList()}');
      print('CatalogRepository: Schema response data: ${response.data}');

      if (response.data['success'] == true) {
        final schema = response.data['data']['schema'] ?? {};
        print('CatalogRepository: Successfully fetched schema with ${schema.length} keys');
        if (schema.isNotEmpty) {
          print('CatalogRepository: Schema contains sections: ${schema.containsKey('sections')}');
          print('CatalogRepository: Schema contains fields: ${schema.containsKey('fields')}');
        }
        return schema;
      } else {
        final message = response.data['message'] ?? 'Failed to fetch schema';
        print('CatalogRepository: Schema API returned success=false with message: $message');
        throw Exception(message);
      }
    } on DioException catch (e) {
      print('CatalogRepository: DioException in getCategorySchema: $e');
      print('CatalogRepository: DioException response: ${e.response?.data}');
      throw Exception(e.response?.data['message'] ?? 'Network error');
    } catch (e, stackTrace) {
      print('CatalogRepository: Unexpected error in getCategorySchema: $e');
      print('CatalogRepository: Stack trace: $stackTrace');
      throw Exception('Unexpected error occurred');
    }
  }
}
