import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/product.dart';
import 'product_service.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final service = ref.watch(productServiceProvider);
  return ProductRepository(service);
});

class ProductRepository {
  final ProductService _service;

  ProductRepository(this._service);

  Future<Product> createProduct(Map<String, dynamic> data) async {
    final response = await _service.createProduct(data);
    return Product.fromJson(response['data']);
  }

  Future<List<Product>> getMyListings({
    int page = 1, 
    int limit = 20, 
    String? status
  }) async {
    final response = await _service.getMyListings(
      page: page, 
      limit: limit, 
      status: status
    );
    final List list = response['data']['products'];
    return list.map((e) => Product.fromJson(e)).toList();
  }

  Future<Product> getProduct(String id) async {
    final response = await _service.getProduct(id);
    return Product.fromJson(response['data']);
  }

  Future<Product> updateProduct(String id, Map<String, dynamic> data) async {
    final response = await _service.updateProduct(id, data);
    return Product.fromJson(response['data']);
  }

  Future<void> deleteProduct(String id) async {
    await _service.deleteProduct(id);
  }
}
