import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../catalog/presentation/categories_provider.dart';
import '../../catalog/domain/category.dart' as domain_category;
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
    // Merge ui_config/uiConfig, ui, and dynamic_options into uiConfig
    final uiConfig = <String, dynamic>{};
    
    // Add ui_config or uiConfig
    final existingUiConfig = json['ui_config'] ?? json['uiConfig'] ?? {};
    if (existingUiConfig is Map<String, dynamic>) {
      uiConfig.addAll(existingUiConfig);
    }
    
    // Add ui section
    final ui = json['ui'];
    if (ui is Map<String, dynamic>) {
      uiConfig.addAll(ui);
    }
    
    // Add dynamic_options
    final dynamicOptions = json['dynamic_options'];
    if (dynamicOptions is Map<String, dynamic>) {
      uiConfig['dynamic_options'] = dynamicOptions;
    }

    return TemplateField(
      name: json['name'] ?? '',
      label: json['label'] ?? json['name'] ?? '',
      type: json['type'] ?? 'text',
      required: json['required'] ?? false,
      validation: json['validation'] ?? {},
      uiConfig: uiConfig,
      conditionalLogic: json['conditional_logic'] ?? json['conditionalLogic'] ?? json['visibleIf'],
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
      final response = await _apiClient.get('/sell/category-schema/$categoryId');

      if (response.statusCode == 200 && response.data['success'] == true) {
        print('TemplateService: Successfully loaded template from API for category: $categoryId');
        return CategoryTemplate.fromJson(response.data['data']);
      }

      print('TemplateService: API returned unsuccessful response for category: $categoryId, status: ${response.statusCode}, data: ${response.data}');
      return null;
    } catch (e) {
      print('🔴 TEMPLATE SERVICE CATCH BLOCK EXECUTED');
      print('TemplateService: Error loading template from API for category $categoryId');
      print('TemplateService: Exception type: ${e.runtimeType}');
      print('TemplateService: Exception message: $e');
      print('TemplateService: Is DioException? ${e is DioException}');

      // Handle DioException specifically for detailed logging
      if (e is DioException) {
        print('TemplateService: DioException details:');
        print('  - Request: ${e.requestOptions.method} ${e.requestOptions.uri}');
        print('  - Status Code: ${e.response?.statusCode}');
        print('  - Status Message: ${e.response?.statusMessage}');
        print('  - Response Data: ${e.response?.data}');
        print('  - Error Type: ${e.type}');
        print('  - Error Message: ${e.message}');
        if (e.response?.headers != null) {
          print('  - Response Headers: ${e.response!.headers.map}');
        }
      }

      return null;
    }
  }

  /// Create template from category input_schema
  CategoryTemplate? createTemplateFromCategoryInputSchema(Map<String, dynamic> inputSchema) {
    try {
      print('TemplateService: Creating template from input_schema: $inputSchema');

      final fields = inputSchema['fields'] as List<dynamic>?;
      if (fields == null || fields.isEmpty) {
        print('TemplateService: No fields found in input_schema');
        return null;
      }

      // Convert fields to TemplateField objects
      final templateFields = fields.map((fieldJson) {
        return TemplateField.fromJson(fieldJson as Map<String, dynamic>);
      }).toList();

      // Group fields into sections (for now, put all in one section)
      final section = TemplateSection(
        title: 'Listing Details',
        order: 1,
        description: 'Please provide the details for your listing',
        isCollapsible: false,
        fields: templateFields,
      );

      return CategoryTemplate(
        name: 'Dynamic Category Template',
        description: 'Template generated from category input schema',
        categoryType: 'dynamic',
        isActive: true,
        sections: [section],
      );
    } catch (e) {
      print('TemplateService: Error creating template from input_schema: $e');
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

  // Try to load template from API
  final apiTemplate = await templateService.loadTemplateFromApi(categoryId);
  if (apiTemplate != null) {
    return apiTemplate;
  }

  // Fallback to category input_schema if API fails
  print('API template loading failed, falling back to category input_schema for category: $categoryId');

  // Get all categories
  final categoriesAsync = await ref.watch(categoriesProvider.future);

  // Helper function to find category recursively
  domain_category.Category? findCategoryById(List<domain_category.Category> categories, String id) {
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
  if (category == null || category.inputSchema == null) {
    print('Category not found or no input_schema for category: $categoryId');
    return null;
  }

  // Create template from category input_schema
  print('Creating template from category input_schema for: ${category.name}');
  final template = templateService.createTemplateFromCategoryInputSchema(category.inputSchema!);
  return template;
});