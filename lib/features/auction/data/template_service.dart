import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
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
    
    // Check if static options exist in validation - these take priority
    final validation = json['validation'] ?? {};
    final hasStaticOptions = validation is Map<String, dynamic> && 
                           validation.containsKey('options') && 
                           validation['options'] is List && 
                           (validation['options'] as List).isNotEmpty;
    
    // Check if this is a brand field that should always use dynamic options
    final fieldName = json['name'] as String?;
    final isBrandField = (fieldName == 'brand');
    
    if (hasStaticOptions && !isBrandField) {
      // Use static options from validation (except for brand field)
      uiConfig['options'] = validation['options'];
    } else {
      // Add dynamic_options if they exist
      final dynamicOptions = json['dynamic_options'];
      if (dynamicOptions is Map<String, dynamic>) {
        uiConfig['dynamic_options'] = Map<String, dynamic>.from(dynamicOptions);
        
        // Modify dynamic_options for known cascading fields
        final fieldName = json['name'] as String?;
        if (fieldName == 'model') {
          uiConfig['dynamic_options']['api_url'] = '/cars/models?brand_id={brand}';
          uiConfig['dynamic_options']['depends_on'] = 'brand';
        } else if (fieldName == 'variant') {
          uiConfig['dynamic_options']['api_url'] = '/cars/variants?model_id={model}';
          uiConfig['dynamic_options']['depends_on'] = 'model';
        }
      }
      
      // If no dynamic_options but has apiUrl or similar, create dynamic_options
      if (!uiConfig.containsKey('dynamic_options')) {
        final apiUrl = json['apiUrl'] ?? json['api_url'] ?? json['api_endpoint'] ?? uiConfig['api_endpoint'];
        final dataPath = json['dataPath'] ?? json['data_path'] ?? uiConfig['data_path'] ?? 'data';
        final labelField = json['labelField'] ?? json['label_field'] ?? uiConfig['label_field'] ?? 'name';
        final valueField = json['valueField'] ?? json['value_field'] ?? uiConfig['value_field'] ?? 'id';
        final dependsOn = json['depends_on'] ?? json['dependsOn'];
        
        // Only create dynamic_options if we have a valid API URL
        if (apiUrl != null && apiUrl.isNotEmpty) {
          String? finalDependsOn = dependsOn;
          String finalApiUrl = apiUrl;
          String finalValueField = valueField ?? 'id';
          String finalDataPath = dataPath ?? 'data'; // Create a mutable copy for modifications
          
          // Set dependencies and modify URLs for known cascading fields
          final fieldName = json['name'] as String?;
          if (fieldName == 'brand' || fieldName == 'vehicle_type') {
            finalValueField = 'id'; // Ensure brand uses ID as value
          } else if (fieldName == 'model') {
            finalDependsOn = finalDependsOn ?? 'brand';
            // Support multiple vehicle types: cars, bikes, etc.
            if (finalApiUrl.contains('/models') && !finalApiUrl.contains('/brands/')) {
              // Convert generic models URL to brand-specific URL
              if (finalApiUrl.contains('/cars/')) {
                finalApiUrl = '/cars/brands/{brand}/models';
              } else if (finalApiUrl.contains('/bikes/')) {
                finalApiUrl = '/bikes/brands/{brand}/models';
              } else {
                // Generic vehicle type support
                finalApiUrl = finalApiUrl.replaceAll('/models', '/brands/{brand}/models');
              }
            }
          } else if (fieldName == 'variant') {
            finalDependsOn = finalDependsOn ?? 'model';
            // Support variants for multiple vehicle types
            if (finalApiUrl.contains('/variants') && !finalApiUrl.contains('/models/')) {
              // Convert generic variants URL to model-specific URL
              if (finalApiUrl.contains('/cars/')) {
                finalApiUrl = '/cars/models/{model}/variants';
                finalDataPath = 'data.variants'; // Cars have nested variants
              } else if (finalApiUrl.contains('/bikes/')) {
                finalApiUrl = '/bikes/models/{model}/variants';
                finalDataPath = 'data.variants'; // Bikes also have nested variants
              } else {
                // Generic vehicle type support
                finalApiUrl = finalApiUrl.replaceAll('/variants', '/models/{model}/variants');
                finalDataPath = 'data.variants';
              }
            }
          }
          
          uiConfig['dynamic_options'] = {
            'api_url': finalApiUrl,
            'data_path': finalDataPath,
            'label_field': labelField ?? 'name',
            'value_field': finalValueField,
            if (finalDependsOn != null) 'depends_on': finalDependsOn,
          };
        }
      }

      // Special handling for brand field - ensure it uses dynamic API options
      if (isBrandField) {
        // Check if there's a vehicle_type dependency to determine API endpoint
        final hasVehicleTypeDependency = json.containsKey('depends_on') && json['depends_on'] == 'vehicle_type';
        
        if (hasVehicleTypeDependency) {
          // Dynamic vehicle type support: /cars/brands, /bikes/brands, etc.
          uiConfig['dynamic_options'] = {
            'api_url': '/{vehicle_type}s/brands',
            'data_path': 'data',
            'label_field': 'name',
            'value_field': 'id',
            'depends_on': 'vehicle_type',
          };
        } else {
          // Default to cars if no vehicle type dependency
          uiConfig['dynamic_options'] = {
            'api_url': '/cars/brands',
            'data_path': 'data',
            'label_field': 'name',
            'value_field': 'id',
          };
        }
      }
    }

    // Add default options for common fields if no options are provided
    if (!uiConfig.containsKey('options') && !uiConfig.containsKey('dynamic_options')) {
      // Note: Intentionally leaving fields without options so admin can configure them
      // No default dummy data added - admin should provide proper options via backend
    }

    return TemplateField(
      name: (json['name']?.toString()) ?? '',
      label: (json['label']?.toString()) ?? (json['name']?.toString()) ?? '',
      type: (json['type']?.toString()) ?? 'text',
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
      print('TemplateService: API Response - Status: ${response.statusCode}, Success: ${response.data['success']}, Data keys: ${response.data.keys}');

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

  /// Load template from assets for specific categories
  Future<CategoryTemplate?> loadTemplateFromAssets(String categoryId) async {
    try {
      print('TemplateService: Loading template from assets for category: $categoryId');

      // Map category IDs to template files (can be extended dynamically)
      final templateFiles = <String, String>{
        'd71109b1-5715-4595-9774-8acc00adb19e': 'assets/templates/co-working-spaces-template.json',
        '958c195b-c2cf-4104-916d-3f1640d30619': 'assets/templates/apartment-template.json', // Apparment category
        // Add more mappings as needed - this can be made dynamic based on server data
      };

      // Try exact category ID match first
      String? templateFile = templateFiles[categoryId];

      // If no exact match, try to find by category type or other logic
      if (templateFile == null) {
        // For now, return null if no mapping exists
        // In the future, this could be enhanced to dynamically discover templates
        print('TemplateService: No template file mapped for category: $categoryId');
        return null;
      }

      final jsonString = await rootBundle.loadString(templateFile);
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;

      print('TemplateService: Successfully loaded template from assets for category: $categoryId');
      return CategoryTemplate.fromJson(jsonData);
    } catch (e) {
      print('TemplateService: Error loading template from assets for category $categoryId: $e');
      return null;
    }
  }

  /// Create template from category input_schema
  CategoryTemplate? createTemplateFromCategoryInputSchema(Map<String, dynamic> inputSchema) {
    try {
      print('TemplateService: Creating template from input_schema keys: ${inputSchema.keys}');
      print('TemplateService: Full input_schema: $inputSchema');

      // Check if inputSchema has sections (new format)
      final sectionsJson = inputSchema['sections'] as List<dynamic>?;
      if (sectionsJson != null && sectionsJson.isNotEmpty) {
        print('TemplateService: Parsing template with sections format');
        
        final sections = <TemplateSection>[];
        for (final sectionJson in sectionsJson) {
          if (sectionJson is! Map<String, dynamic>) {
            print('TemplateService: Skipping invalid section: $sectionJson');
            continue;
          }
          try {
            final section = TemplateSection.fromJson(sectionJson);
            sections.add(section);
          } catch (e) {
            print('TemplateService: Error parsing section $sectionJson: $e');
          }
        }

        if (sections.isEmpty) {
          print('TemplateService: No valid sections found in input_schema');
          return null;
        }

        return CategoryTemplate(
          name: inputSchema['name'] ?? 'Dynamic Category Template',
          description: inputSchema['description'] ?? 'Template generated from category input schema',
          categoryType: inputSchema['category_type'] ?? 'dynamic',
          isActive: inputSchema['is_active'] ?? true,
          sections: sections,
        );
      }

      // Fallback to old format with fields directly
      final fields = inputSchema['fields'] as List<dynamic>?;
      if (fields == null || fields.isEmpty) {
        print('TemplateService: No fields found in input_schema');
        return null;
      }

      // Convert fields to TemplateField objects
      final templateFields = <TemplateField>[];
      for (final fieldJson in fields) {
        if (fieldJson is! Map<String, dynamic>) {
          print('TemplateService: Skipping invalid field: $fieldJson');
          continue;
        }
        try {
          final templateField = TemplateField.fromJson(fieldJson);
          templateFields.add(templateField);
        } catch (e) {
          print('TemplateService: Error parsing field $fieldJson: $e');
        }
      }

      if (templateFields.isEmpty) {
        print('TemplateService: No valid fields found in input_schema');
        return null;
      }

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

  // First priority: Try to load template from API (handles both old and new formats dynamically)
  final apiTemplate = await templateService.loadTemplateFromApi(categoryId);
  if (apiTemplate != null) {
    print('TemplateService: Using template from API for category: $categoryId (${apiTemplate.sections.length} sections)');
    return apiTemplate;
  }

  // Second priority: Try to load template from assets for known categories
  final assetTemplate = await templateService.loadTemplateFromAssets(categoryId);
  if (assetTemplate != null) {
    print('TemplateService: Using template from assets for category: $categoryId (${assetTemplate.sections.length} sections)');
    return assetTemplate;
  }

  // Third priority: Fallback to category input_schema (handles both old and new formats dynamically)
  print('TemplateService: API and assets failed, falling back to category input_schema for category: $categoryId');

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
  print('TemplateService: Found category: ${category?.name}, Has inputSchema: ${category?.inputSchema != null}');
  if (category?.inputSchema != null) {
    print('TemplateService: InputSchema keys: ${category!.inputSchema!.keys}');
    print('TemplateService: InputSchema content: ${category.inputSchema}');
  }
  
  if (category == null || category.inputSchema == null) {
    print('TemplateService: Category not found or no input_schema for category: $categoryId');
    return null;
  }

  // Create template from category input_schema (handles both old and new formats dynamically)
  print('TemplateService: Creating template from category input_schema for: ${category.name}');
  final template = templateService.createTemplateFromCategoryInputSchema(category.inputSchema!);
  if (template != null) {
    print('TemplateService: Created template with ${template.sections.length} sections from input_schema');
    return template;
  } else {
    print('TemplateService: Failed to create template from input_schema for category: ${category.name}');
  }
  
  // Final fallback: Create a basic template with common fields
  print('TemplateService: Creating basic fallback template for category: ${category.name}');
  return CategoryTemplate(
    name: 'Basic Template',
    description: 'Default template for ${category.name}',
    categoryType: 'basic',
    isActive: true,
    sections: [
      TemplateSection(
        title: '${category.name} Details',
        order: 1,
        description: 'Please provide the details for your ${category.name.toLowerCase()}',
        isCollapsible: false,
        fields: [
          TemplateField(
            name: 'title',
            label: 'Title',
            type: 'text',
            required: true,
            validation: {'rules': ['required']},
            uiConfig: {'placeholder': 'Enter a title for your ${category.name.toLowerCase()}'},
          ),
          TemplateField(
            name: 'description',
            label: 'Description',
            type: 'textarea',
            required: true,
            validation: {'rules': ['required']},
            uiConfig: {'placeholder': 'Describe your ${category.name.toLowerCase()}', 'rows': 4},
          ),
          TemplateField(
            name: 'condition',
            label: 'Condition',
            type: 'select',
            required: true,
            validation: {'rules': ['required']},
            uiConfig: {
              'options': [
                {'label': 'New', 'value': 'new'},
                {'label': 'Like New', 'value': 'like_new'},
                {'label': 'Good', 'value': 'good'},
                {'label': 'Fair', 'value': 'fair'},
                {'label': 'Poor', 'value': 'poor'},
              ]
            },
          ),
        ],
      ),
    ],
  );
});