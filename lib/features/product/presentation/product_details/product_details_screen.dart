import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/product.dart';
import '../../data/product_repository.dart';

final productDetailProvider = FutureProvider.family.autoDispose<Product, String>((ref, id) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getProduct(id);
});

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  ConsumerState<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // Watch for updates to this product
    final productAsync = ref.watch(productDetailProvider(widget.product.id));
    
    return productAsync.when(
      data: (product) => _buildContent(context, product),
      loading: () => _buildContent(context, widget.product, isLoading: true),
      error: (err, stack) => _buildContent(context, widget.product),
    );
  }

  Widget _buildContent(BuildContext context, Product product, {bool isLoading = false}) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, product),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context, product),
                  const SizedBox(height: 16),
                  _buildStatusBadge(product),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Description'),
                  const SizedBox(height: 8),
                  Text(
                    product.description ?? 'No description provided.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.5,
                          color: Colors.grey[800],
                        ),
                  ),
                  const SizedBox(height: 24),
                  if (product.dynamicAttributes.isNotEmpty) ...[
                    _buildSectionTitle('Specifications'),
                    const SizedBox(height: 12),
                    _buildSpecifications(product),
                    const SizedBox(height: 24),
                  ],
                  if (product.location != null) ...[
                    _buildSectionTitle('Location'),
                    const SizedBox(height: 12),
                    _buildLocationInfo(product),
                    const SizedBox(height: 24),
                  ],
                ],
              ),
            ),
          ),
          if (isLoading)
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context, product),
    );
  }

  Widget _buildAppBar(BuildContext context, Product product) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: product.images.isNotEmpty
            ? PageView.builder(
                itemCount: product.images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    product.images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, size: 50),
                    ),
                  );
                },
              )
            : Container(
                color: Colors.grey[200],
                child: const Icon(Icons.image, size: 100, color: Colors.grey),
              ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          '${product.currency} ${product.price}',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
              ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(Product product) {
    Color color;
    switch (product.status) {
      case ProductStatus.active:
        color = Colors.green;
        break;
      case ProductStatus.pending:
        color = Colors.orange;
        break;
      case ProductStatus.sold:
        color = Colors.blue;
        break;
      case ProductStatus.cancelled:
        color = Colors.red;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(
        product.status.displayName,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSpecifications(Product product) {
    final attributes = product.dynamicAttributes;
    return Column(
      children: attributes.entries.map((entry) {
        if (['images', 'location', 'productName', 'title', 'description', 'price', 'product_price'].contains(entry.key)) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatKey(entry.key),
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
              Text(
                entry.value.toString(),
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _formatKey(String key) {
    return key.split('_').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }

  Widget _buildLocationInfo(Product product) {
    final location = product.location!;
    final city = location['city'] ?? '';
    final state = location['state'] ?? '';
    final country = location['country'] ?? '';
    
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            [city, state, country].where((s) => s.isNotEmpty).join(', '),
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context, Product product) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Edit Listing'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('View Analytics'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
