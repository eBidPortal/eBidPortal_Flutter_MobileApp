import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/catalog_repository.dart';
import '../domain/category.dart';

part 'categories_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Category>> categories(Ref ref) async {
  final repository = ref.watch(catalogRepositoryProvider);
  return repository.getCategories();
}
