import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../catalog/domain/category.dart';
import '../../../data/template_service.dart';
import 'enhanced_dynamic_fields_form.dart';

class CategorySchemaScreen extends ConsumerStatefulWidget {
  final Category category;

  const CategorySchemaScreen({super.key, required this.category});

  @override
  ConsumerState<CategorySchemaScreen> createState() => _CategorySchemaScreenState();
}

class _CategorySchemaScreenState extends ConsumerState<CategorySchemaScreen> {
  final Map<String, dynamic> _formData = {};
  bool _isSubmitting = false;
  final GlobalKey<EnhancedDynamicFieldsFormState> _formKey = GlobalKey<EnhancedDynamicFieldsFormState>();

  @override
  void initState() {
    super.initState();
    print('📋 SCREEN: CategorySchemaScreen - initState called (category: ${widget.category.name})');
    print('📋 SCREEN: CategorySchemaScreen - Category details:');
    print('  - ID: ${widget.category.id}');
    print('  - Name: ${widget.category.name}');
    print('  - Description: ${widget.category.description}');
    print('  - Parent ID: ${widget.category.parentId}');
    print('  - Image URL: ${widget.category.imageUrl}');
    print('  - Is Active: ${widget.category.isActive}');
  }

  @override
  void dispose() {
    print('📋 SCREEN: CategorySchemaScreen - dispose called (category: ${widget.category.name})');
    super.dispose();
  }

  void _onFieldChanged(String fieldName, dynamic value) {
    setState(() {
      _formData[fieldName] = value;
    });
    print('📝 CategorySchemaScreen: Field "$fieldName" changed to: $value');
  }

  Future<void> _submitForm() async {
    // Validate the form before submitting
    final isFormValid = _formKey.currentState?.validateForm() ?? false;

    if (!isFormValid) {
      // Validation errors will be displayed directly on the fields
      // No need for additional SnackBar since TextFormField validators show errors inline
      return; // Don't proceed with submission
    }

    setState(() {
      _isSubmitting = true;
    });

    print('📋 SCREEN: CategorySchemaScreen - Submitting form for category: ${widget.category.name}');
    print('📋 SCREEN: CategorySchemaScreen - Form data:');
    _formData.forEach((key, value) {
      print('  - $key: $value');
    });

    try {
      // Here you would typically submit the form data
      // For now, just show a success message
      print('✅ CategorySchemaScreen: Form submitted with data: $_formData');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Auction created successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate back or to auction list
        context.go('/');
      }
    } catch (e) {
      print('❌ CategorySchemaScreen: Error submitting form: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error creating auction: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final templateAsync = ref.watch(categoryTemplateProvider(widget.category.id));

    return Scaffold(
      appBar: AppBar(
        title: Text('Create ${widget.category.name} Auction'),
        elevation: 0,
      ),
      body: templateAsync.when(
        data: (template) {
          if (template != null) {
            print('📋 SCREEN: CategorySchemaScreen - Template loaded successfully for category: ${widget.category.name} (${widget.category.id})');
            print('📋 SCREEN: CategorySchemaScreen - Template details:');
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
            return _buildFormView(context, template);
          } else {
            print('📋 SCREEN: CategorySchemaScreen - No template found for category: ${widget.category.name} (${widget.category.id})');
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
      ),
      bottomNavigationBar: templateAsync.maybeWhen(
        data: (template) => template != null ? _buildSubmitButton() : null,
        orElse: () => null,
      ),
    );
  }

  Widget _buildFormView(BuildContext context, CategoryTemplate template) {
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
                          _getCategoryIcon(widget.category.name),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Create ${widget.category.name} Auction',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            if (widget.category.description != null)
                              Text(
                                widget.category.description!,
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

          // Dynamic Form Fields
          Text(
            'Auction Details',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          EnhancedDynamicFieldsForm(
            key: _formKey,
            categoryId: widget.category.id,
            values: _formData,
            errors: const {}, // Add error handling if needed
            onValueChanged: _onFieldChanged,
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: ElevatedButton(
        onPressed: _isSubmitting ? null : _submitForm,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: _isSubmitting
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Text('Create Auction'),
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