import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../catalog/presentation/categories_provider.dart';
import '../../catalog/domain/category.dart';
import '../../../core/network/api_client.dart';

/// Template data structure matching the API response
class CategoryTemplate {
  final String name;
  final String description;
  final String categoryType;
  final bool isActive;
  final List<TemplateSection> sections;

  CategoryTemplate({
    required this.name,
    required this.description,
    required this.categoryType,
    required this.isActive,
    required this.sections,
  });

  factory CategoryTemplate.fromJson(Map<String, dynamic> json) {
    return CategoryTemplate(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      categoryType: json['category_type'] ?? '',
      isActive: json['is_active'] ?? true,
      sections: (json['sections'] as List<dynamic>?)
          ?.map((section) => TemplateSection.fromJson(section))
          .toList() ?? [],
    );
  }
}

class TemplateSection {
  final String title;
  final int order;
  final String description;
  final bool isCollapsible;
  final List<TemplateField> fields;

  TemplateSection({
    required this.title,
    required this.order,
    required this.description,
    required this.isCollapsible,
    required this.fields,
  });

  factory TemplateSection.fromJson(Map<String, dynamic> json) {
    return TemplateSection(
      title: json['title'] ?? '',
      order: json['order'] ?? 0,
      description: json['description'] ?? '',
      isCollapsible: json['is_collapsible'] ?? true,
      fields: (json['fields'] as List<dynamic>?)
          ?.map((field) => TemplateField.fromJson(field))
          .toList() ?? [],
    );
  }
}

class TemplateField {
  final String name;
  final String label;
  final String type;
  final bool required;
  final Map<String, dynamic> validation;
  final Map<String, dynamic> uiConfig;
  final Map<String, dynamic>? conditionalLogic;

  TemplateField({
    required this.name,
    required this.label,
    required this.type,
    required this.required,
    required this.validation,
    required this.uiConfig,
    this.conditionalLogic,
  });

  factory TemplateField.fromJson(Map<String, dynamic> json) {
    return TemplateField(
      name: json['name'] ?? '',
      label: json['label'] ?? json['name'] ?? '',
      type: json['type'] ?? 'text',
      required: json['required'] ?? false,
      validation: json['validation'] ?? {},
      uiConfig: json['ui_config'] ?? json['uiConfig'] ?? {},
      conditionalLogic: json['conditional_logic'] ?? json['conditionalLogic'],
    );
  }
}

/// Service for loading and managing category templates
class TemplateService {
  final ApiClient _apiClient;

  TemplateService(this._apiClient);

  /// Load template for a specific category from API
  Future<CategoryTemplate?> loadTemplateFromApi(String categoryId) async {
    try {
      print('TemplateService: Loading template from API for category: $categoryId');
      final response = await _apiClient.get('/api/v1/sell/category-schema/$categoryId');

      if (response.statusCode == 200 && response.data['success'] == true) {
        print('TemplateService: Successfully loaded template from API for category: $categoryId');
        return CategoryTemplate.fromJson(response.data['data']);
      }

      print('TemplateService: API returned unsuccessful response for category: $categoryId, status: ${response.statusCode}');
      return null;
    } catch (e) {
      print('TemplateService: Error loading template from API for category $categoryId: $e');
      return null;
    }
  }

  /// Load template for a specific category from category data (fallback)
  CategoryTemplate? createTemplateFromCategoryData(Map<String, dynamic> categoryData) {
    try {
      final inputSchema = categoryData['input_schema'];

      List<TemplateField> fields;

      if (inputSchema != null) {
        // Use the defined input schema
        fields = (inputSchema['fields'] as List<dynamic>?)
            ?.map((field) => TemplateField.fromJson(field))
            .toList() ?? [];
      } else {
        // Create default fields for categories without input_schema
        fields = [
          TemplateField(
            name: 'title',
            type: 'text',
            label: 'Title',
            required: true,
            validation: {'maxLength': 100, 'minLength': 5},
            uiConfig: {'placeholder': 'Enter item title'},
            conditionalLogic: null,
          ),
          TemplateField(
            name: 'description',
            type: 'textarea',
            label: 'Description',
            required: true,
            validation: {'maxLength': 1000, 'minLength': 10},
            uiConfig: {'placeholder': 'Describe your item', 'rows': 4},
            conditionalLogic: null,
          ),
          TemplateField(
            name: 'price',
            type: 'number',
            label: 'Starting Price',
            required: true,
            validation: {'min': 1},
            uiConfig: {'placeholder': 'Enter starting price', 'prefix': '₹'},
            conditionalLogic: null,
          ),
          TemplateField(
            name: 'condition',
            type: 'select',
            label: 'Condition',
            required: false,
            validation: {},
            uiConfig: {
              'placeholder': 'Select condition',
              'options': ['New', 'Like New', 'Good', 'Fair', 'Poor']
            },
            conditionalLogic: null,
          ),
          TemplateField(
            name: 'location',
            type: 'text',
            label: 'Location',
            required: false,
            validation: {'maxLength': 100},
            uiConfig: {'placeholder': 'Enter location'},
            conditionalLogic: null,
          ),
        ];
      }

      // Create a single section for all fields
      final section = TemplateSection(
        title: 'Details',
        order: 1,
        description: 'Enter the details for this item',
        isCollapsible: false,
        fields: fields,
      );

      return CategoryTemplate(
        name: categoryData['name'] ?? '',
        description: categoryData['description'] ?? '',
        categoryType: 'auction',
        isActive: categoryData['is_active'] ?? true,
        sections: [section],
      );
    } catch (e) {
      print('Error creating template from category data: $e');
      return null;
    }
  }

  /// Validate field value against template validation rules
  String? validateField(TemplateField field, dynamic value) {
    if (field.required && (value == null || value.toString().isEmpty)) {
      return '${field.label} is required';
    }

    final validation = field.validation;
    if (validation.isEmpty) return null;

    // Handle different validation types
    final rules = validation['rules'] as List<dynamic>? ?? [];

    for (final rule in rules) {
      if (rule == 'required' && (value == null || value.toString().isEmpty)) {
        return '${field.label} is required';
      }

      if (rule.startsWith('min_length:') && value is String) {
        final minLength = int.tryParse(rule.split(':')[1]) ?? 0;
        if (value.length < minLength) {
          return '${field.label} must be at least $minLength characters';
        }
      }

      if (rule.startsWith('max_length:') && value is String) {
        final maxLength = int.tryParse(rule.split(':')[1]) ?? 0;
        if (value.length > maxLength) {
          return '${field.label} cannot exceed $maxLength characters';
        }
      }

      if (rule.startsWith('min:') && value is num) {
        final min = num.tryParse(rule.split(':')[1]) ?? 0;
        if (value < min) {
          return '${field.label} must be at least $min';
        }
      }

      if (rule.startsWith('max:') && value is num) {
        final max = num.tryParse(rule.split(':')[1]) ?? 0;
        if (value > max) {
          return '${field.label} cannot exceed $max';
        }
      }

      if (rule.startsWith('pattern:') && value is String) {
        final pattern = rule.split(':')[1];
        final regExp = RegExp(pattern);
        if (!regExp.hasMatch(value)) {
          return '${field.label} format is invalid';
        }
      }
    }

    // Custom validation message
    final customMessage = validation['custom_message'] as String?;
    if (customMessage != null && customMessage.isNotEmpty) {
      return customMessage;
    }

    return null;
  }
}

/// Riverpod provider for template service
final templateServiceProvider = Provider<TemplateService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return TemplateService(apiClient);
});

/// Provider for loading category templates
final categoryTemplateProvider = FutureProvider.family<CategoryTemplate?, String>((ref, categoryId) async {
  final templateService = ref.watch(templateServiceProvider);

  // Try to load template from API first
  final apiTemplate = await templateService.loadTemplateFromApi(categoryId);
  if (apiTemplate != null) {
    return apiTemplate;
  }

  // Fallback to local category data if API fails
  print('API template loading failed, falling back to local category data for category: $categoryId');

  // First get all categories
  final categoriesAsync = await ref.watch(categoriesProvider.future);

  // Helper function to find category recursively
  Category? findCategoryById(List<Category> categories, String id) {
    for (final category in categories) {
      if (category.id == id) {
        return category;
      }
      // Search in children recursively
      final foundInChildren = findCategoryById(category.children, id);
      if (foundInChildren != null) {
        return foundInChildren;
      }
    }
    return null;
  }

  final category = findCategoryById(categoriesAsync, categoryId);
  if (category == null) {
    return null;
  }

  // Create template from category data
  final categoryData = {
    'name': category.name,
    'description': category.description,
    'is_active': category.isActive,
    'input_schema': category.inputSchema,
  };

  final template = templateService.createTemplateFromCategoryData(categoryData);
  return template;
});