import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../catalog/domain/category.dart';
import '../../../data/template_service.dart';

class CategorySchemaScreen extends ConsumerWidget {
  final Category category;

  const CategorySchemaScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📋 SCREEN: CategorySchemaScreen - build called (category: ${category.name})');
    final templateAsync = ref.watch(categoryTemplateProvider(category.id));

    return Scaffold(
      appBar: AppBar(
        title: Text('${category.name} Schema'),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => _proceedToAuction(context),
            child: const Text('Create Auction'),
          ),
        ],
      ),
      body: templateAsync.when(
        data: (template) => template != null
            ? _buildSchemaView(context, template)
            : _buildNoSchemaView(context),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Failed to load schema', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text('$error', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(categoryTemplateProvider(category.id)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: ElevatedButton(
          onPressed: () => _proceedToAuction(context),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Continue to Auction Creation'),
        ),
      ),
    );
  }

  Widget _buildSchemaView(BuildContext context, CategoryTemplate template) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Header
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
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
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            if (category.description != null)
                              Text(
                                category.description!,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Template Info
          Text(
            'Template Information',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    template.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (template.description.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      template.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  const SizedBox(height: 8),
                  Chip(
                    label: Text(template.categoryType),
                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Schema Sections
          Text(
            'Form Fields (${_getTotalFields(template)} fields)',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          ...template.sections.map((section) => _buildSection(context, section)),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildNoSchemaView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.description_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No Schema Available',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'This category doesn\'t have a predefined schema yet.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'You can still create an auction with basic fields.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, TemplateSection section) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    section.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (section.isCollapsible)
                  Icon(
                    Icons.expand_more,
                    color: Colors.grey[600],
                  ),
              ],
            ),
            if (section.description.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                section.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
            const SizedBox(height: 16),
            ...section.fields.map((field) => _buildField(context, field)),
          ],
        ),
      ),
    );
  }

  Widget _buildField(BuildContext context, TemplateField field) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  field.label,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              if (field.required)
                const Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.red,
                ),
              const SizedBox(width: 8),
              Chip(
                label: Text(
                  field.type,
                  style: const TextStyle(fontSize: 10),
                ),
                backgroundColor: _getFieldTypeColor(field.type),
                labelStyle: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          if (field.uiConfig['placeholder'] != null) ...[
            const SizedBox(height: 4),
            Text(
              'Placeholder: ${field.uiConfig['placeholder']}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[500],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
          if (field.validation.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              'Validation: ${_formatValidation(field.validation)}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[500],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getFieldTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'text':
        return Colors.blue;
      case 'textarea':
        return Colors.green;
      case 'number':
        return Colors.orange;
      case 'select':
        return Colors.purple;
      case 'multiselect':
        return Colors.indigo;
      case 'checkbox':
        return Colors.teal;
      case 'date':
        return Colors.pink;
      case 'file':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }

  String _formatValidation(Map<String, dynamic> validation) {
    final rules = <String>[];
    if (validation.containsKey('minLength')) {
      rules.add('Min: ${validation['minLength']} chars');
    }
    if (validation.containsKey('maxLength')) {
      rules.add('Max: ${validation['maxLength']} chars');
    }
    if (validation.containsKey('min')) {
      rules.add('Min: ${validation['min']}');
    }
    if (validation.containsKey('max')) {
      rules.add('Max: ${validation['max']}');
    }
    if (validation.containsKey('pattern')) {
      rules.add('Pattern required');
    }
    return rules.join(', ');
  }

  int _getTotalFields(CategoryTemplate template) {
    return template.sections.fold(0, (sum, section) => sum + section.fields.length);
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

  void _proceedToAuction(BuildContext context) {
    // Navigate to auction creation with the selected category
    context.push('/create-auction', extra: category);
  }
}