import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/category.dart';
import '../categories_provider.dart';

class CategorySelector extends ConsumerStatefulWidget {
  final String? selectedCategoryId;
  final Function(Category) onCategorySelected;
  final String? errorText;

  const CategorySelector({
    super.key,
    this.selectedCategoryId,
    required this.onCategorySelected,
    this.errorText,
  });

  @override
  ConsumerState<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends ConsumerState<CategorySelector> {
  String? _selectedPath;

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);

    print('CategorySelector: Building with selectedCategoryId: ${widget.selectedCategoryId}');

    // Update path when categories or selected ID changes
    categoriesAsync.whenData((categories) {
      print('CategorySelector: Categories loaded successfully, count: ${categories.length}');
      _updateSelectedPath(categories);
    });

    return categoriesAsync.when(
      data: (categories) {
        print('CategorySelector: Rendering with ${categories.length} categories');
        return TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Category *',
            hintText: 'Select a category',
            errorText: widget.errorText,
            prefixIcon: const Icon(Icons.category),
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
          controller: TextEditingController(text: _selectedPath),
          onTap: () => _showCategoryPicker(context),
        );
      },
      loading: () {
        print('CategorySelector: Categories are loading');
        return const TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Category *',
            hintText: 'Loading categories...',
            prefixIcon: Icon(Icons.category),
          ),
        );
      },
      error: (error, stackTrace) {
        print('CategorySelector: Error loading categories: $error');
        print('CategorySelector: Stack trace: $stackTrace');
        return TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Category *',
            hintText: 'Select a category',
            errorText: 'Failed to load categories',
            prefixIcon: const Icon(Icons.category),
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
          controller: TextEditingController(text: 'Failed to load categories'),
        );
      },
    );
  }

  void _updateSelectedPath(List<Category> categories) {
    if (widget.selectedCategoryId != null) {
      _selectedPath = _buildCategoryPath(categories, widget.selectedCategoryId!);
    } else {
      _selectedPath = null;
    }
  }

  String _buildCategoryPath(List<Category> categories, String categoryId) {
    for (final category in categories) {
      if (category.id == categoryId) {
        return category.name;
      }
      if (category.children.isNotEmpty) {
        final childPath = _buildCategoryPath(category.children, categoryId);
        if (childPath.isNotEmpty) {
          return '${category.name} > $childPath';
        }
      }
    }
    return '';
  }

  void _showCategoryPicker(BuildContext context) {
    final categoriesAsync = ref.read(categoriesProvider);
    
    categoriesAsync.when(
      data: (categoryList) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => CategoryPickerBottomSheet(
            selectedCategoryId: widget.selectedCategoryId,
            categories: categoryList,
            onCategorySelected: (category) {
              widget.onCategorySelected(category);
              Navigator.of(context).pop();
            },
          ),
        );
      },
      loading: () {
        // Show loading indicator or do nothing
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Loading categories...')),
        );
      },
      error: (error, stack) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading categories: $error')),
        );
      },
    );
  }


}

class CategoryPickerBottomSheet extends ConsumerStatefulWidget {
  final String? selectedCategoryId;
  final List<Category> categories;
  final Function(Category) onCategorySelected;

  const CategoryPickerBottomSheet({
    super.key,
    this.selectedCategoryId,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  ConsumerState<CategoryPickerBottomSheet> createState() => _CategoryPickerBottomSheetState();
}

class _CategoryPickerBottomSheetState extends ConsumerState<CategoryPickerBottomSheet> {
  final List<String> _expandedCategories = [];

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);

    print('CategoryPickerBottomSheet: Building with selectedCategoryId: ${widget.selectedCategoryId}');

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Select Category',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: categoriesAsync.when(
                data: (categories) {
                  print('CategoryPickerBottomSheet: Rendering category tree with ${categories.length} root categories');
                  return ListView(
                    controller: scrollController,
                    children: _buildCategoryList(categories, 0),
                  );
                },
                loading: () {
                  print('CategoryPickerBottomSheet: Categories are loading in bottom sheet');
                  return const Center(child: CircularProgressIndicator());
                },
                error: (error, stackTrace) {
                  print('CategoryPickerBottomSheet: Error in bottom sheet: $error');
                  print('CategoryPickerBottomSheet: Stack trace: $stackTrace');
                  return const Center(child: Text('Failed to load categories'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCategoryList(List<Category> categories, int depth) {
    final widgets = <Widget>[];

    for (final category in categories) {
      if (!category.isActive) continue;

      final isExpanded = _expandedCategories.contains(category.id);
      final hasChildren = category.children.isNotEmpty;
      final isSelected = category.id == widget.selectedCategoryId;

      widgets.add(
        Column(
          children: [
            ListTile(
              leading: SizedBox(
                width: depth * 20.0,
                child: depth > 0 ? const VerticalDivider() : null,
              ),
              title: Text(
                category.name,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Theme.of(context).primaryColor : null,
                ),
              ),
              trailing: hasChildren
                  ? Icon(isExpanded ? Icons.expand_less : Icons.expand_more)
                  : isSelected
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
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
                  widget.onCategorySelected(category);
                }
              },
            ),
            if (hasChildren && isExpanded)
              ..._buildCategoryList(category.children, depth + 1),
          ],
        ),
      );
    }

    return widgets;
  }
}