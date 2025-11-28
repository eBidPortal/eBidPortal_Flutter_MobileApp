import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/catalog_repository.dart';
import '../domain/category.dart';

part 'categories_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Category>> categories(Ref ref) async {
  print('CategoriesProvider: Starting to fetch categories');
  final repository = ref.watch(catalogRepositoryProvider);
  try {
    final categories = await repository.getCategories();
    print('CategoriesProvider: Successfully fetched ${categories.length} categories');
    return categories;
  } catch (e, stackTrace) {
    print('CategoriesProvider: Failed to fetch categories: $e');
    print('CategoriesProvider: Stack trace: $stackTrace');
    rethrow;
  }
}
