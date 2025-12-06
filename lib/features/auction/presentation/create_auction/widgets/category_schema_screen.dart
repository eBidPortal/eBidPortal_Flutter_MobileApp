import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../catalog/domain/category.dart';
import '../../../data/template_service.dart';
import '../create_auction_provider.dart';
import '../create_auction_state.dart';
import 'enhanced_dynamic_fields_form.dart';

class CategorySchemaScreen extends ConsumerStatefulWidget {
  final Category category;

  const CategorySchemaScreen({super.key, required this.category});

  @override
  ConsumerState<CategorySchemaScreen> createState() => _CategorySchemaScreenState();
}

class _CategorySchemaScreenState extends ConsumerState<CategorySchemaScreen> {
  final GlobalKey<EnhancedDynamicFieldsFormState> _formKey = GlobalKey<EnhancedDynamicFieldsFormState>();

  @override
  void initState() {
    super.initState();
    print('📋 TAB: CategorySchemaScreen - initState called (category: ${widget.category.name})');
    print('📋 TAB: CategorySchemaScreen - Category details:');
    print('  - ID: ${widget.category.id}');
    print('  - Name: ${widget.category.name}');
    print('  - Description: ${widget.category.description}');
    print('  - Parent ID: ${widget.category.parentId}');
    print('  - Image URL: ${widget.category.imageUrl}');
    print('  - Is Active: ${widget.category.isActive}');
  }

  @override
  void dispose() {
    print('📋 TAB: CategorySchemaScreen - dispose called (category: ${widget.category.name})');
    super.dispose();
  }

  void _onFieldChanged(String fieldName, dynamic value) {
    // Update the main CreateAuctionProvider with dynamic field changes
    ref.read(createAuctionProvider.notifier).setDynamicField(fieldName, value);
    print('📝 CategorySchemaScreen: Field "$fieldName" changed to: $value');
  }

  bool validateForm() {
    // Validate the current form and return the result
    return _formKey.currentState?.validateForm() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createAuctionProvider);
    final templateAsync = ref.watch(categoryTemplateProvider(widget.category.id));

    return templateAsync.when(
        data: (template) {
          if (template != null) {
            print('📋 TAB: CategorySchemaScreen - Template loaded successfully for category: ${widget.category.name} (${widget.category.id})');
            print('📋 TAB: CategorySchemaScreen - Template details:');
            print('  - Name: ${template.name}');
            print('  - Description: ${template.description}');
            print('  - Sections: ${template.sections.length}');
            for (int i = 0; i < template.sections.length; i++) {
              final section = template.sections[i];
              print('    Section ${i + 1}: ${section.title} (${section.fields.length} fields)');
              for (int j = 0; j < section.fields.length; j++) {
                final field = section.fields[j];
                print('      Field ${j + 1}: ${field.name} (${field.type}) - ${field.label}');
                if (field.uiConfig.containsKey('options') && field.uiConfig['options'] != null) {
                  final options = field.uiConfig['options'] as List;
                  print('        Options: ${options.length} static options');
                }
                if (field.uiConfig.containsKey('dynamic_options') && field.uiConfig['dynamic_options'] != null) {
                  print('        Dynamic options configured');
                }
              }
            }
            return _buildFormView(context, template, state);
          } else {
            print('📋 TAB: CategorySchemaScreen - No template found for category: ${widget.category.name} (${widget.category.id})');
            return _buildNoSchemaView(context);
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Failed to load form', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text('$error', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(categoryTemplateProvider(widget.category.id)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
    );
  }

  Widget _buildFormView(BuildContext context, CategoryTemplate template, CreateAuctionState state) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EnhancedDynamicFieldsForm(
            key: _formKey,
            categoryId: widget.category.id,
            values: state.dynamicFields,
            errors: state.dynamicFieldErrors,
            onValueChanged: _onFieldChanged,
          ),

          const SizedBox(height: 32),
        ],
      ),
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
}