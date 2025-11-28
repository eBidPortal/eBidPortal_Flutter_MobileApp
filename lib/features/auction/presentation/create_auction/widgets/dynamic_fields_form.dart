import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/network/api_client.dart';

class DynamicFieldsForm extends ConsumerStatefulWidget {
  final Map<String, dynamic> schema;
  final Map<String, dynamic> values;
  final Map<String, String> errors;
  final Function(String, dynamic) onFieldChanged;
  final Function(String, String) onFieldError;

  const DynamicFieldsForm({
    super.key,
    required this.schema,
    required this.values,
    required this.errors,
    required this.onFieldChanged,
    required this.onFieldError,
  });

  @override
  ConsumerState<DynamicFieldsForm> createState() => _DynamicFieldsFormState();
}

class _DynamicFieldsFormState extends ConsumerState<DynamicFieldsForm> {
  final Map<String, List<Map<String, dynamic>>> _dynamicOptions = {};
  final Map<String, bool> _loadingOptions = {};
  final Map<String, String?> _optionsErrors = {};
  final Map<String, String> _fieldDependencies = {}; // field -> depends_on field

  @override
  void initState() {
    super.initState();
    _loadDynamicOptions();
  }

  @override
  void didUpdateWidget(DynamicFieldsForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.schema != widget.schema) {
      _loadDynamicOptions();
    }
    // Only handle value changes for cascading dropdowns, don't reload all options
    if (oldWidget.values != widget.values) {
      _handleValueChanges(oldWidget.values);
    }
  }

  /// Wrapper for field changes that handles both parent callback and dependent field reloading
  void _handleFieldChange(String fieldName, dynamic value) {
    // Call the parent's callback
    widget.onFieldChanged(fieldName, value);

    // Handle dependent field reloading
    _onFieldValueChanged(fieldName, value);
  }

  void _handleValueChanges(Map<String, dynamic> oldValues) {
    print('DynamicFieldsForm: _handleValueChanges called');
    print('DynamicFieldsForm: oldValues: $oldValues');
    print('DynamicFieldsForm: newValues: ${widget.values}');

    // Check if any field that others depend on has changed
    for (final entry in _fieldDependencies.entries) {
      final dependentField = entry.key;
      final dependsOnField = entry.value;

      print('DynamicFieldsForm: Checking if "$dependsOnField" changed for dependent field "$dependentField"');
      print('DynamicFieldsForm: old value: ${oldValues[dependsOnField]}, new value: ${widget.values[dependsOnField]}');

      if (oldValues[dependsOnField] != widget.values[dependsOnField]) {
        print('DynamicFieldsForm: Field "$dependsOnField" changed, reloading dependent field "$dependentField"');
        // The field this one depends on has changed, reload options
        _reloadDependentOptions(dependentField);
      }
    }
  }

  Future<void> _reloadDependentOptions(String fieldName) async {
    print('DynamicFieldsForm: Reloading options for dependent field "$fieldName"');

    final fields = widget.schema['fields'] as List<dynamic>? ?? [];
    final sections = widget.schema['sections'] as List<dynamic>? ?? [];
    final allFields = [...fields, ...sections.expand((s) => s['fields'] ?? [])];

    final field = allFields.firstWhere(
      (f) => f['name'] == fieldName,
      orElse: () => null,
    );

    if (field != null) {
      final fieldConfig = field as Map<String, dynamic>;
      final dynamicOptions = fieldConfig['dynamic_options'] as Map<String, dynamic>?;

      // Clear existing options for this field
      setState(() {
        _dynamicOptions[fieldName] = [];
      });

      if (dynamicOptions != null) {
        await _loadOptionsForField(fieldName, dynamicOptions);
      } else {
        // Check for auto-configured options
        final autoDynamicOptions = _getAutoDynamicOptions(fieldName, fieldConfig);
        if (autoDynamicOptions != null) {
          print('DynamicFieldsForm: Reloading auto-configured options for dependent field "$fieldName"');
          await _loadOptionsForField(fieldName, autoDynamicOptions);
        }
      }
    }
  }

  Future<void> _loadDynamicOptions() async {
    final fields = widget.schema['fields'] as List<dynamic>? ?? [];
    final sections = widget.schema['sections'] as List<dynamic>? ?? [];
    final allFields = [...fields, ...sections.expand((s) => s['fields'] ?? [])];

    print('DynamicFieldsForm: Loading dynamic options for ${allFields.length} fields');

    _fieldDependencies.clear();

    for (final field in allFields) {
      final fieldData = field as Map<String, dynamic>;
      final name = fieldData['name'] as String;
      final dynamicOptions = fieldData['dynamic_options'] as Map<String, dynamic>?;

      // Check if this field has dependencies (either explicit or in auto-config)
      final explicitDependsOn = fieldData['depends_on'] as String?;
      final autoDynamicOptions = _getAutoDynamicOptions(name, fieldData);
      final autoDependsOn = autoDynamicOptions?['depends_on'] as String?;
      final dependsOn = explicitDependsOn ?? autoDependsOn;

      // Only load options for fields that don't have dependencies initially
      final hasDependency = dependsOn != null;
      if (hasDependency) {
        _fieldDependencies[name] = dependsOn!;
        print('DynamicFieldsForm: Field "$name" depends on "$dependsOn"');
      }

      if (!hasDependency) {
        // Check if field already has dynamic options configured
        if (dynamicOptions != null) {
          print('DynamicFieldsForm: Field "$name" has configured dynamic options');
          await _loadOptionsForField(name, dynamicOptions);
        } else {
          // Auto-configure dynamic options for vehicle fields
          if (autoDynamicOptions != null) {
            print('DynamicFieldsForm: Field "$name" using auto-configured dynamic options');
            await _loadOptionsForField(name, autoDynamicOptions);
          } else {
            print('DynamicFieldsForm: Field "$name" has no dynamic options configured');
          }
        }
      } else {
        print('DynamicFieldsForm: Skipping field "$name" - has dependency on "$dependsOn"');
      }
    }
  }

  /// Called when a field value changes to reload dependent fields
  Future<void> _onFieldValueChanged(String fieldName, dynamic value) async {
    print('DynamicFieldsForm: _onFieldValueChanged called for field "$fieldName" with value: $value');

    // Find all fields that depend on this field
    final dependentFields = _fieldDependencies.entries
        .where((entry) => entry.value == fieldName)
        .map((entry) => entry.key)
        .toList();

    print('DynamicFieldsForm: Found dependent fields for "$fieldName": $dependentFields');
    print('DynamicFieldsForm: Field dependencies map: $_fieldDependencies');

    if (dependentFields.isNotEmpty) {
      print('DynamicFieldsForm: Reloading dependent fields: $dependentFields');

      // Create updated values map with the new field value
      final updatedValues = Map<String, dynamic>.from(widget.values);
      updatedValues[fieldName] = value;

      for (final dependentField in dependentFields) {
        // Clear existing options for this dependent field
        setState(() {
          _dynamicOptions[dependentField] = [];
        });

        // Get the field configuration
        final fields = widget.schema['fields'] as List<dynamic>? ?? [];
        final sections = widget.schema['sections'] as List<dynamic>? ?? [];
        final allFields = [...fields, ...sections.expand((s) => s['fields'] ?? [])];

        final fieldData = allFields.firstWhere(
          (field) => (field as Map<String, dynamic>)['name'] == dependentField,
          orElse: () => null,
        );

        if (fieldData != null) {
          final fieldConfig = fieldData as Map<String, dynamic>;
          final dynamicOptions = fieldConfig['dynamic_options'] as Map<String, dynamic>?;

          // Load options for the dependent field
          if (dynamicOptions != null) {
            print('DynamicFieldsForm: Reloading options for dependent field "$dependentField"');
            await _loadOptionsForField(dependentField, dynamicOptions, updatedValues);
          } else {
            // Auto-configure dynamic options for vehicle fields
            final autoDynamicOptions = _getAutoDynamicOptions(dependentField, fieldConfig);
            if (autoDynamicOptions != null) {
              print('DynamicFieldsForm: Reloading auto-configured options for dependent field "$dependentField"');
              await _loadOptionsForField(dependentField, autoDynamicOptions, updatedValues);
            }
          }
        }
      }
    }
  }

  Map<String, dynamic>? _getAutoDynamicOptions(String fieldName, Map<String, dynamic> field) {
    // Auto-configure dynamic options for common vehicle fields
    switch (fieldName) {
      case 'brand':
        print('DynamicFieldsForm: Auto-configuring dynamic options for brand field');
        return {
          'api_url': 'https://api.ebidportal.com/api/v1/cars/brands',
          'data_path': 'data',
          'label_field': 'name',
          'value_field': 'id',
        };
      case 'model':
        print('DynamicFieldsForm: Auto-configuring dynamic options for model field');
        return {
          'api_url': 'https://api.ebidportal.com/api/v1/cars/brands/{brand}/models',
          'data_path': 'data',
          'label_field': 'name',
          'value_field': 'id',
          'depends_on': 'brand',
        };
      case 'variant':
        print('DynamicFieldsForm: Auto-configuring dynamic options for variant field');
        return {
          'api_url': 'https://api.ebidportal.com/api/v1/cars/models/{model}/variants',
          'data_path': 'data',
          'label_field': 'name',
          'value_field': 'id',
          'depends_on': 'model',
        };
      default:
        return null;
    }
  }

  Future<void> _loadOptionsForField(String fieldName, Map<String, dynamic> dynamicOptions, [Map<String, dynamic>? currentValues]) async {
    setState(() {
      _loadingOptions[fieldName] = true;
      _optionsErrors[fieldName] = null;
    });

    try {
      String apiUrl = dynamicOptions['api_url'] as String;
      final dataPath = dynamicOptions['data_path'] as String? ?? 'data';
      final labelField = dynamicOptions['label_field'] as String? ?? 'name';
      final valueField = dynamicOptions['value_field'] as String? ?? 'id';

      // Replace URL template variables
      apiUrl = _resolveUrlTemplate(apiUrl, currentValues);

      print('DynamicFieldsForm: Loading options for field "$fieldName" from URL: $apiUrl');

      // Get API client from Riverpod
      final apiClient = ref.read(apiClientProvider);
      final response = await apiClient.get(apiUrl);

      print('DynamicFieldsForm: Received response for field "$fieldName": status=${response.statusCode}');

      if (response.data['success'] == true) {
        final data = response.data[dataPath] as List<dynamic>? ?? [];
        print('DynamicFieldsForm: Found ${data.length} options for field "$fieldName"');

        final options = data.map((item) {
          final itemData = item as Map<String, dynamic>;
          return {
            'value': itemData[valueField]?.toString() ?? '',
            'label': itemData[labelField]?.toString() ?? '',
          };
        }).toList();

        setState(() {
          _dynamicOptions[fieldName] = options;
          _loadingOptions[fieldName] = false;
        });

        print('DynamicFieldsForm: Successfully loaded ${options.length} options for field "$fieldName"');
      } else {
        final errorMsg = 'API returned success=false for field "$fieldName"';
        print('DynamicFieldsForm: $errorMsg');
        throw Exception(errorMsg);
      }
    } catch (e) {
      print('DynamicFieldsForm: Error loading options for field "$fieldName": $e');
      if (e is DioException) {
        print('DynamicFieldsForm: DioException details for field "$fieldName":');
        print('  - Type: ${e.type}');
        print('  - Message: ${e.message}');
        print('  - Status Code: ${e.response?.statusCode}');
        print('  - Response Data: ${e.response?.data}');
        print('  - Request URL: ${e.requestOptions.uri}');
        print('  - Request Method: ${e.requestOptions.method}');
      }

      setState(() {
        _optionsErrors[fieldName] = 'Failed to load options: $e';
        _loadingOptions[fieldName] = false;
      });
    }
  }

  String _resolveUrlTemplate(String urlTemplate, [Map<String, dynamic>? overrideValues]) {
    String resolvedUrl = urlTemplate;
    final values = overrideValues ?? widget.values;

    // Replace {field_name} with actual values
    final regExp = RegExp(r'\{(\w+)\}');
    final matches = regExp.allMatches(urlTemplate);

    for (final match in matches) {
      final fieldName = match.group(1)!;
      final fieldValue = values[fieldName]?.toString() ?? '';
      resolvedUrl = resolvedUrl.replaceAll('{$fieldName}', fieldValue);
      print('DynamicFieldsForm: Resolved {$fieldName} to "$fieldValue" in URL template');
    }

    print('DynamicFieldsForm: URL template "$urlTemplate" resolved to "$resolvedUrl"');
    return resolvedUrl;
  }

  List<Map<String, dynamic>> _getOptionsForField(Map<String, dynamic> field) {
    final name = field['name'] as String;
    final dynamicOptions = field['dynamic_options'] as Map<String, dynamic>?;
    final staticOptions = field['options'] as List<dynamic>? ?? [];

    if (dynamicOptions != null) {
      return _dynamicOptions[name] ?? [];
    }

    // Check if this field has auto-configured dynamic options
    final autoDynamicOptions = _getAutoDynamicOptions(name, field);
    if (autoDynamicOptions != null) {
      return _dynamicOptions[name] ?? [];
    }

    // If static options exist, use them
    if (staticOptions.isNotEmpty) {
      return staticOptions.map((option) => option as Map<String, dynamic>).toList();
    }

    // Provide default options for common fields
    return _getDefaultOptionsForField(name);
  }

  List<Map<String, dynamic>> _getDefaultOptionsForField(String fieldName) {
    switch (fieldName) {
      case 'condition':
        return [
          {'value': 'new', 'label': 'New'},
          {'value': 'excellent', 'label': 'Excellent'},
          {'value': 'very_good', 'label': 'Very Good'},
          {'value': 'good', 'label': 'Good'},
          {'value': 'fair', 'label': 'Fair'},
          {'value': 'poor', 'label': 'Poor'},
        ];
      case 'fuel':
      case 'fuel_type':
        return [
          {'value': 'petrol', 'label': 'Petrol'},
          {'value': 'diesel', 'label': 'Diesel'},
          {'value': 'cng', 'label': 'CNG'},
          {'value': 'lpg', 'label': 'LPG'},
          {'value': 'electric', 'label': 'Electric'},
          {'value': 'hybrid', 'label': 'Hybrid'},
        ];
      case 'transmission':
        return [
          {'value': 'manual', 'label': 'Manual'},
          {'value': 'automatic', 'label': 'Automatic'},
          {'value': 'cvt', 'label': 'CVT'},
          {'value': 'dct', 'label': 'DCT'},
        ];
      case 'owners':
        return [
          {'value': '1', 'label': '1st Owner'},
          {'value': '2', 'label': '2nd Owner'},
          {'value': '3', 'label': '3rd Owner'},
          {'value': '4', 'label': '4th Owner'},
          {'value': '4+', 'label': 'More than 4 Owners'},
        ];
      case 'vehicle_type':
        return [
          {'value': 'car', 'label': 'Car'},
          {'value': 'bike', 'label': 'Bike'},
        ];
      case 'property_type':
        return [
          {'value': 'apartment', 'label': 'Apartment'},
          {'value': 'house', 'label': 'House'},
          {'value': 'villa', 'label': 'Villa'},
          {'value': 'plot', 'label': 'Plot'},
          {'value': 'commercial', 'label': 'Commercial'},
        ];
      case 'space_type':
        return [
          {'value': 'private_office', 'label': 'Private Office'},
          {'value': 'meeting_room', 'label': 'Meeting Room'},
          {'value': 'conference_room', 'label': 'Conference Room'},
          {'value': 'open_workspace', 'label': 'Open Workspace'},
          {'value': 'coworking_space', 'label': 'Co-working Space'},
        ];
      default:
        // For brand, model, variant - they should use dynamic options
        // but if not configured, return empty list
        if (['brand', 'model', 'variant'].contains(fieldName)) {
          return [];
        }
        // For other fields, return empty list
        return [];
    }
  }

  bool _isLoadingOptionsForField(String fieldName) {
    return _loadingOptions[fieldName] ?? false;
  }

  String? _getOptionsErrorForField(String fieldName) {
    return _optionsErrors[fieldName];
  }

  bool _evaluateCondition(Map<String, dynamic> condition) {
    final field = condition['field'] as String;
    final operator = condition['operator'] as String;
    final value = condition['value'];

    final fieldValue = widget.values[field];

    switch (operator) {
      case 'equals':
        return fieldValue == value;
      case 'not_equals':
        return fieldValue != value;
      case 'contains':
        return fieldValue?.toString().contains(value.toString()) ?? false;
      case 'not_contains':
        return !(fieldValue?.toString().contains(value.toString()) ?? false);
      case 'is_empty':
        return fieldValue == null || fieldValue.toString().isEmpty;
      case 'is_not_empty':
        return fieldValue != null && fieldValue.toString().isNotEmpty;
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sections = widget.schema['sections'] as List<dynamic>? ?? [];
    final fields = widget.schema['fields'] as List<dynamic>? ?? [];

    if (sections.isEmpty && fields.isEmpty) {
      return const Text('No form fields configured for this category');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Render sections if available
        ...sections.map((section) {
          final sectionData = section as Map<String, dynamic>;
          final sectionTitle = sectionData['title'] as String? ?? 'Additional Details';
          final sectionFields = sectionData['fields'] as List<dynamic>? ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sectionTitle,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppTheme.spacingMd),
              _buildFieldsList(sectionFields),
              const SizedBox(height: AppTheme.spacingLg),
            ],
          );
        }),

        // Render root-level fields if no sections
        if (sections.isEmpty) _buildFieldsList(fields),
      ],
    );
  }

  Widget _buildFieldsList(List<dynamic> fields) {
    return Column(
      children: fields.map((field) {
        final fieldData = field as Map<String, dynamic>;
        return Padding(
          padding: const EdgeInsets.only(bottom: AppTheme.spacingMd),
          child: _buildFieldWidget(fieldData),
        );
      }).toList(),
    );
  }

  Widget _buildFieldWidget(Map<String, dynamic> field) {
    final name = field['name'] as String;
    final label = field['label'] as String? ?? name;
    final type = field['type'] as String;
    final required = field['required'] as bool? ?? false;
    final description = field['description'] as String?;
    final validation = field['validation'] as Map<String, dynamic>? ?? {};
    final visibleIf = field['visibleIf'] as Map<String, dynamic>?;
    final disabledIf = field['disabledIf'] as Map<String, dynamic>?;

    // Check visibility conditions
    if (visibleIf != null && !_evaluateCondition(visibleIf)) {
      return const SizedBox.shrink();
    }

    final displayLabel = required ? '$label *' : label;
    final error = widget.errors[name];
    final isDisabled = disabledIf != null && _evaluateCondition(disabledIf);

    switch (type) {
      case 'text':
        return _buildTextField(name, displayLabel, description, validation, error, isDisabled);
      case 'textarea':
        return _buildTextAreaField(name, displayLabel, description, validation, error, isDisabled);
      case 'number':
        return _buildNumberField(name, displayLabel, description, validation, error, isDisabled);
      case 'select':
        return _buildSelectField(name, displayLabel, description, field, error, isDisabled);
      case 'radio':
        return _buildRadioField(name, displayLabel, description, field, error, isDisabled);
      case 'checkbox':
        return _buildCheckboxField(name, displayLabel, description, field, error, isDisabled);
      case 'date':
        return _buildDateField(name, displayLabel, description, validation, error, isDisabled);
      case 'boolean':
        return _buildBooleanField(name, displayLabel, description, error, isDisabled);
      case 'email':
        return _buildEmailField(name, displayLabel, description, validation, error, isDisabled);
      case 'url':
        return _buildUrlField(name, displayLabel, description, validation, error, isDisabled);
      case 'phone':
        return _buildPhoneField(name, displayLabel, description, validation, error, isDisabled);
      case 'range':
        return _buildRangeField(name, displayLabel, description, field, error, isDisabled);
      case 'color':
        return _buildColorField(name, displayLabel, description, error, isDisabled);
      case 'rating':
        return _buildRatingField(name, displayLabel, description, field, error, isDisabled);
      case 'file':
        return _buildFileField(name, displayLabel, description, validation, error, isDisabled);
      case 'map':
        return _buildMapField(name, displayLabel, description, error, isDisabled);
      case 'object':
        return _buildObjectField(name, displayLabel, description, field, error, isDisabled);
      case 'array':
        return _buildArrayField(name, displayLabel, description, field, error, isDisabled);
      default:
        return _buildTextField(name, displayLabel, description, validation, error, isDisabled);
    }
  }

  Widget _buildTextField(String name, String label, String? description, Map<String, dynamic> validation, String? error, bool isDisabled) {
    final minLength = validation['minLength'] as int?;
    final maxLength = validation['maxLength'] as int?;
    final pattern = validation['pattern'] as String?;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        TextFormField(
          initialValue: widget.values[name]?.toString(),
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
          ),
          maxLength: maxLength,
          enabled: !isDisabled,
          onChanged: (value) => _handleFieldChange(name, value),
        ),
      ],
    );
  }

  Widget _buildTextAreaField(String name, String label, String? description, Map<String, dynamic> validation, String? error, bool isDisabled) {
    final minLength = validation['minLength'] as int?;
    final maxLength = validation['maxLength'] as int?;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        TextFormField(
          initialValue: widget.values[name]?.toString(),
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
            alignLabelWithHint: true,
          ),
          maxLength: maxLength,
          maxLines: 5,
          enabled: !isDisabled,
          onChanged: (value) => _handleFieldChange(name, value),
        ),
      ],
    );
  }

  Widget _buildNumberField(String name, String label, String? description, Map<String, dynamic> validation, String? error, bool isDisabled) {
    final min = validation['min'] as num?;
    final max = validation['max'] as num?;
    final step = validation['step'] as num? ?? 1;
    final integer = validation['integer'] as bool? ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        TextFormField(
          initialValue: widget.values[name]?.toString(),
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          enabled: !isDisabled,
          onChanged: (value) {
            final numValue = num.tryParse(value);
            _handleFieldChange(name, numValue);
          },
        ),
      ],
    );
  }

  Widget _buildSelectField(String name, String label, String? description, Map<String, dynamic> field, String? error, bool isDisabled) {
    final options = _getOptionsForField(field);
    final isLoading = _isLoadingOptionsForField(name);
    final optionsError = _getOptionsErrorForField(name);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        if (isLoading) ...[
          const CircularProgressIndicator(),
        ] else if (optionsError != null) ...[
          Text(optionsError, style: const TextStyle(color: Colors.red)),
        ] else ...[
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: label,
              errorText: error,
              border: const OutlineInputBorder(),
            ),
            value: widget.values[name]?.toString(),
            items: options.map((option) {
              final value = option['value'] as String;
              final label = option['label'] as String? ?? value;
              return DropdownMenuItem(value: value, child: Text(label));
            }).toList(),
            onChanged: isDisabled ? null : (value) => _handleFieldChange(name, value),
          ),
        ],
      ],
    );
  }

  Widget _buildRadioField(String name, String label, String? description, Map<String, dynamic> field, String? error, bool isDisabled) {
    final options = _getOptionsForField(field);
    final currentValue = widget.values[name]?.toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        if (description != null) ...[
          const SizedBox(height: 4),
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
        ...options.map((option) {
          final value = option['value'] as String;
          final optionLabel = option['label'] as String? ?? value;
          return RadioListTile<String>(
            title: Text(optionLabel),
            value: value,
            groupValue: currentValue,
            onChanged: isDisabled ? null : (newValue) => _handleFieldChange(name, newValue),
            controlAffinity: ListTileControlAffinity.leading,
          );
        }),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildCheckboxField(String name, String label, String? description, Map<String, dynamic> field, String? error, bool isDisabled) {
    final currentValue = widget.values[name] as bool? ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        CheckboxListTile(
          title: Text(label),
          value: currentValue,
          onChanged: isDisabled ? null : (value) => _handleFieldChange(name, value ?? false),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildDateField(String name, String label, String? description, Map<String, dynamic> validation, String? error, bool isDisabled) {
    final minDate = validation['minDate'] as String?;
    final maxDate = validation['maxDate'] as String?;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        TextFormField(
          initialValue: widget.values[name]?.toString(),
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          enabled: !isDisabled,
          readOnly: true,
          onTap: isDisabled ? null : () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: minDate != null ? DateTime.parse(minDate) : DateTime(1900),
              lastDate: maxDate != null ? DateTime.parse(maxDate) : DateTime(2100),
            );
            if (date != null) {
              _handleFieldChange(name, date.toIso8601String().split('T')[0]);
            }
          },
        ),
      ],
    );
  }

  Widget _buildBooleanField(String name, String label, String? description, String? error, bool isDisabled) {
    final currentValue = widget.values[name] as bool? ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        SwitchListTile(
          title: Text(label),
          value: currentValue,
          onChanged: isDisabled ? null : (value) => _handleFieldChange(name, value),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildEmailField(String name, String label, String? description, Map<String, dynamic> validation, String? error, bool isDisabled) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        TextFormField(
          initialValue: widget.values[name]?.toString(),
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
          enabled: !isDisabled,
          onChanged: (value) => _handleFieldChange(name, value),
        ),
      ],
    );
  }

  Widget _buildUrlField(String name, String label, String? description, Map<String, dynamic> validation, String? error, bool isDisabled) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        TextFormField(
          initialValue: widget.values[name]?.toString(),
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.url,
          enabled: !isDisabled,
          onChanged: (value) => _handleFieldChange(name, value),
        ),
      ],
    );
  }

  Widget _buildPhoneField(String name, String label, String? description, Map<String, dynamic> validation, String? error, bool isDisabled) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        TextFormField(
          initialValue: widget.values[name]?.toString(),
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.phone,
          enabled: !isDisabled,
          onChanged: (value) => _handleFieldChange(name, value),
        ),
      ],
    );
  }

  Widget _buildRangeField(String name, String label, String? description, Map<String, dynamic> field, String? error, bool isDisabled) {
    final min = field['min'] as num? ?? 0;
    final max = field['max'] as num? ?? 100;
    final step = field['step'] as num? ?? 1;
    final currentValue = widget.values[name] as num? ?? min;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        Text(label),
        Slider(
          value: currentValue.toDouble(),
          min: min.toDouble(),
          max: max.toDouble(),
          divisions: ((max - min) / step).round(),
          label: currentValue.toString(),
          onChanged: isDisabled ? null : (value) => _handleFieldChange(name, value.round()),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildColorField(String name, String label, String? description, String? error, bool isDisabled) {
    final currentValue = widget.values[name] as String? ?? '#000000';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: currentValue,
                decoration: InputDecoration(
                  labelText: label,
                  errorText: error,
                  border: const OutlineInputBorder(),
                ),
                enabled: !isDisabled,
                onChanged: (value) => _handleFieldChange(name, value),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Color(int.parse(currentValue.replaceAll('#', ''), radix: 16) + 0xFF000000),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingField(String name, String label, String? description, Map<String, dynamic> field, String? error, bool isDisabled) {
    final maxRating = field['maxRating'] as int? ?? 5;
    final allowHalf = field['allowHalf'] as bool? ?? false;
    final currentValue = widget.values[name] as num? ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        Text(label),
        Row(
          children: List.generate(maxRating, (index) {
            final rating = index + 1;
            final isSelected = currentValue >= rating;
            return IconButton(
              icon: Icon(
                isSelected ? Icons.star : Icons.star_border,
                color: isSelected ? Colors.amber : Colors.grey,
              ),
              onPressed: isDisabled ? null : () => _handleFieldChange(name, rating),
            );
          }),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildFileField(String name, String label, String? description, Map<String, dynamic> validation, String? error, bool isDisabled) {
    final maxFiles = validation['maxFiles'] as int? ?? 1;
    final allowedTypes = validation['allowedTypes'] as List<dynamic>?;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        ElevatedButton.icon(
          onPressed: isDisabled ? null : () {
            // TODO: Implement file picker
          },
          icon: const Icon(Icons.file_upload),
          label: Text(label),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildMapField(String name, String label, String? description, String? error, bool isDisabled) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Center(
            child: Text('Map widget not implemented yet'),
          ),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildObjectField(String name, String label, String? description, Map<String, dynamic> field, String? error, bool isDisabled) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text('Complex object fields not implemented yet'),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildArrayField(String name, String label, String? description, Map<String, dynamic> field, String? error, bool isDisabled) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text('Array fields not implemented yet'),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }
}