import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/product_repository.dart';
import '../../domain/product.dart';

// Simple provider for fetching my listings
final myProductsProvider = FutureProvider.autoDispose<List<Product>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getMyListings();
});

class MyProductsScreen extends ConsumerWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(myProductsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Products')),
      body: productsAsync.when(
        data: (products) {
          if (products.isEmpty) {
            return const Center(
              child: Text('No products listed yet.'),
            );
          }
          return ListView.builder(
            itemCount: products.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: product.images.isNotEmpty
                      ? Image.network(product.images.first, width: 50, height: 50, fit: BoxFit.cover)
                      : Container(
                          width: 50, 
                          height: 50, 
                          color: Colors.grey[200], 
                          child: const Icon(Icons.image)
                        ),
                  title: Text(product.title),
                  subtitle: Text('${product.currency} ${product.price} • ${product.status.name}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to details
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to create product (via category selection)
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
