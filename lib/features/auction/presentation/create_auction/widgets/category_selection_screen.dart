import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../catalog/domain/category.dart';
import '../../../../catalog/presentation/categories_provider.dart';

class CategorySelectionScreen extends ConsumerStatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  ConsumerState<CategorySelectionScreen> createState() => _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends ConsumerState<CategorySelectionScreen> {
  final List<String> _expandedCategories = [];
  Category? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    print('🎯 SCREEN: CategorySelectionScreen - build called');
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Category'),
        elevation: 0,
      ),
      body: categoriesAsync.when(
        data: (categories) => _buildCategoryTree(categories),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Failed to load categories', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text('$error', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(categoriesProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _selectedCategory != null
          ? Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: ElevatedButton(
                onPressed: () => _proceedToForm(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Continue with ${_selectedCategory!.name}'),
              ),
            )
          : null,
    );
  }

  Widget _buildCategoryTree(List<Category> categories) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Choose a category for your auction',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        ..._buildCategoryList(categories, 0),
      ],
    );
  }

  List<Widget> _buildCategoryList(List<Category> categories, int depth) {
    final widgets = <Widget>[];

    for (final category in categories) {
      if (!category.isActive) continue;

      final isExpanded = _expandedCategories.contains(category.id);
      final hasChildren = category.children.isNotEmpty;
      final isSelected = category.id == _selectedCategory?.id;

      widgets.add(
        Card(
          margin: EdgeInsets.only(left: depth * 16.0, bottom: 8),
          elevation: isSelected ? 4 : 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
              width: isSelected ? 2 : 0,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              if (hasChildren) {
                setState(() {
                  if (isExpanded) {
                    _expandedCategories.remove(category.id);
                  } else {
                    _expandedCategories.add(category.id);
                  }
                });
              } else {
                setState(() {
                  _selectedCategory = category;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Category icon or image
                  if (category.iconUrl != null)
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(category.iconUrl!),
                    )
                  else
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                      child: Icon(
                        _getCategoryIcon(category.name),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                color: isSelected ? Theme.of(context).primaryColor : null,
                              ),
                        ),
                        if (category.description != null && category.description!.isNotEmpty)
                          Text(
                            category.description!,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  if (hasChildren)
                    Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.grey[600],
                    )
                  else if (isSelected)
                    const Icon(Icons.check_circle, color: Colors.green)
                  else
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
                ],
              ),
            ),
          ),
        ),
      );

      if (hasChildren && isExpanded) {
        widgets.addAll(_buildCategoryList(category.children, depth + 1));
      }
    }

    return widgets;
  }

  IconData _getCategoryIcon(String categoryName) {
    final name = categoryName.toLowerCase();
    if (name.contains('car') || name.contains('vehicle') || name.contains('automotive')) {
      return Icons.directions_car;
    } else if (name.contains('electronics') || name.contains('mobile') || name.contains('computer')) {
      return Icons.devices;
    } else if (name.contains('fashion') || name.contains('clothing')) {
      return Icons.shopping_bag;
    } else if (name.contains('home') || name.contains('furniture')) {
      return Icons.home;
    } else if (name.contains('book') || name.contains('education')) {
      return Icons.book;
    } else if (name.contains('sports') || name.contains('hobby')) {
      return Icons.sports_soccer;
    } else if (name.contains('property') || name.contains('real estate')) {
      return Icons.location_city;
    } else if (name.contains('service')) {
      return Icons.build;
    } else if (name.contains('pet') || name.contains('animal')) {
      return Icons.pets;
    } else {
      return Icons.category;
    }
  }

  void _proceedToForm() {
    if (_selectedCategory == null) return;

    // Navigate to the category schema screen with the selected category
    context.push('/category-schema', extra: _selectedCategory);
  }
}