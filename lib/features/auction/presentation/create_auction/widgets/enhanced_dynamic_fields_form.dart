import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/template_service.dart';
import '../../../../../core/network/api_client.dart';

/// Enhanced dynamic fields form that renders full category templates
class EnhancedDynamicFieldsForm extends ConsumerStatefulWidget {
  final String categoryId;
  final Map<String, dynamic> values;
  final Function(String, dynamic) onValueChanged;
  final Map<String, String> errors;

  const EnhancedDynamicFieldsForm({
    super.key,
    required this.categoryId,
    required this.values,
    required this.onValueChanged,
    required this.errors,
  });

  @override
  ConsumerState<EnhancedDynamicFieldsForm> createState() => _EnhancedDynamicFieldsFormState();
}

class _EnhancedDynamicFieldsFormState extends ConsumerState<EnhancedDynamicFieldsForm> {
  final Map<String, bool> _expandedSections = {};
  final Map<String, List<Map<String, dynamic>>> _dynamicOptions = {};
  final Map<String, bool> _loadingOptions = {};
  final Map<String, String?> _optionsErrors = {};
  final Map<String, String> _fieldDependencies = {};
  final Map<String, TextEditingController> _controllers = {};
  bool _dynamicOptionsInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  @override
  void didUpdateWidget(EnhancedDynamicFieldsForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.values != widget.values || oldWidget.categoryId != widget.categoryId) {
      _updateControllers();
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _initializeControllers() {
    // Initialize controllers for all current values
    widget.values.forEach((fieldName, value) {
      if (!_controllers.containsKey(fieldName)) {
        _controllers[fieldName] = TextEditingController(text: value?.toString() ?? '');
      }
    });
  }

  void _updateControllers() {
    // Update existing controllers and create new ones for new fields
    widget.values.forEach((fieldName, value) {
      if (_controllers.containsKey(fieldName)) {
        final currentText = _controllers[fieldName]!.text;
        final newText = value?.toString() ?? '';
        if (currentText != newText) {
          _controllers[fieldName]!.text = newText;
        }
      } else {
        _controllers[fieldName] = TextEditingController(text: value?.toString() ?? '');
      }
    });

    // Remove controllers for fields that no longer exist
    final fieldsToRemove = _controllers.keys.where((fieldName) => !widget.values.containsKey(fieldName)).toList();
    for (final fieldName in fieldsToRemove) {
      _controllers[fieldName]!.dispose();
      _controllers.remove(fieldName);
    }
  }

  void _initializeControllersForTemplate(CategoryTemplate template) {
    // Initialize controllers for all template fields that don't have controllers yet
    for (final section in template.sections) {
      for (final field in section.fields) {
        if (!_controllers.containsKey(field.name)) {
          final currentValue = widget.values[field.name];
          _controllers[field.name] = TextEditingController(text: currentValue?.toString() ?? '');
          print('EnhancedDynamicFieldsForm: Created controller for field "${field.name}" with initial value: ${currentValue?.toString() ?? "null"}');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final templateAsync = ref.watch(categoryTemplateProvider(widget.categoryId));

    return templateAsync.when(
      data: (template) {
        if (template == null) {
          return const Center(
            child: Text('No template available for this category'),
          );
        }

        // Load dynamic options when template is available (only once)
        if (!_dynamicOptionsInitialized) {
          _dynamicOptionsInitialized = true;
          _loadDynamicOptionsForTemplate(template);
          _initializeControllersForTemplate(template);
        }

        print('EnhancedDynamicFieldsForm: Rendering template with ${template.sections.length} sections');

        return _buildTemplateForm(template);
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Text('Error loading template: $error'),
      ),
    );
  }

  Widget _buildTemplateForm(CategoryTemplate template) {
    // Sort sections by order
    final sortedSections = template.sections..sort((a, b) => a.order.compareTo(b.order));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Template header
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                template.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                template.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),

        // Render sections
        ...sortedSections.map((section) => _buildSection(section)),
      ],
    );
  }

  Widget _buildSection(TemplateSection section) {
    final isExpanded = _expandedSections[section.title] ?? !section.isCollapsible;

    if (!section.isCollapsible) {
      // Non-collapsible section
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    section.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (section.description.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      section.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Section fields
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: section.fields.map((field) => _buildField(field)).toList(),
              ),
            ),
          ],
        ),
      );
    }

    // Collapsible section
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          // Expandable header
          InkWell(
            onTap: () {
              setState(() {
                _expandedSections[section.title] = !isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: isExpanded
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      )
                    : BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          section.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (section.description.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            section.description,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ),
          ),

          // Expandable content
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: section.fields.map((field) => _buildField(field)).toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildField(TemplateField field) {
    // Check conditional logic
    if (field.conditionalLogic != null) {
      final visibleIf = field.conditionalLogic!['visibleIf'];
      if (visibleIf != null) {
        final fieldName = visibleIf['field'];
        final operator = visibleIf['operator'];
        final expectedValue = visibleIf['value'];

        final currentValue = widget.values[fieldName];
        bool isVisible = false;

        switch (operator) {
          case 'not_empty':
            isVisible = currentValue != null && currentValue.toString().isNotEmpty;
            break;
          case 'equals':
            isVisible = currentValue == expectedValue;
            break;
          case 'not_equals':
            isVisible = currentValue != expectedValue;
            break;
          case 'in':
            isVisible = (expectedValue as List).contains(currentValue);
            break;
          default:
            isVisible = true;
        }

        if (!isVisible) return const SizedBox.shrink();
      }
    }

    final error = widget.errors[field.name];

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Field label
          RichText(
            text: TextSpan(
              text: field.label,
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                if (field.required)
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Field widget based on type
          _buildFieldWidget(field),

          // Error message
          if (error != null) ...[
            const SizedBox(height: 4),
            Text(
              error,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ],

          // Help text
          if (field.uiConfig['helpText'] != null) ...[
            const SizedBox(height: 4),
            Text(
              field.uiConfig['helpText'],
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFieldWidget(TemplateField field) {
    final currentValue = widget.values[field.name];
    final fieldError = widget.errors[field.name];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldInput(field, currentValue),
        if (fieldError != null && fieldError.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            fieldError,
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
        ],
      ],
    );
  }

  Widget _buildFieldInput(TemplateField field, dynamic currentValue) {

    switch (field.type) {
      case 'text':
        // Controller should already be initialized in _initializeControllersForTemplate
        assert(_controllers.containsKey(field.name), 'Controller not found for field ${field.name}');
        return TextFormField(
          controller: _controllers[field.name],
          enabled: true,
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'],
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          onChanged: (value) {
            print('EnhancedDynamicFieldsForm: Text field "${field.name}" changed to: $value');
            _onFieldValueChanged(field.name, value);
          },
        );

      case 'textarea':
        // Controller should already be initialized in _initializeControllersForTemplate
        assert(_controllers.containsKey(field.name), 'Controller not found for field ${field.name}');
        return TextFormField(
          controller: _controllers[field.name],
          maxLines: field.uiConfig['rows'] ?? 4,
          enabled: true,
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'],
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          onChanged: (value) {
            print('EnhancedDynamicFieldsForm: Textarea field "${field.name}" changed to: $value');
            _onFieldValueChanged(field.name, value);
          },
        );

      case 'number':
        // Controller should already be initialized in _initializeControllersForTemplate
        assert(_controllers.containsKey(field.name), 'Controller not found for field ${field.name}');
        return TextFormField(
          controller: _controllers[field.name],
          keyboardType: TextInputType.number,
          enabled: true,
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'],
            prefixText: field.uiConfig['prefix'],
            suffixText: field.uiConfig['suffix'],
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          onChanged: (value) {
            final numValue = num.tryParse(value);
            print('EnhancedDynamicFieldsForm: Number field "${field.name}" changed to: $numValue');
            _onFieldValueChanged(field.name, numValue);
          },
        );

      case 'boolean':
        return Row(
          children: [
            Checkbox(
              value: currentValue ?? field.uiConfig['defaultValue'] ?? false,
              onChanged: (value) {
                _onFieldValueChanged(field.name, value);
              },
            ),
            const SizedBox(width: 8),
            Text(field.label),
          ],
        );

      case 'date':
        return InkWell(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: currentValue != null
                  ? DateTime.tryParse(currentValue.toString()) ?? DateTime.now()
                  : DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (date != null) {
              final dateString = date.toIso8601String().split('T')[0];
              _onFieldValueChanged(field.name, dateString);
            }
          },
          child: InputDecorator(
            decoration: InputDecoration(
              hintText: field.uiConfig['placeholder'],
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              suffixIcon: const Icon(Icons.calendar_today),
            ),
            child: Text(
              currentValue != null
                  ? DateTime.parse(currentValue.toString()).toLocal().toString().split(' ')[0]
                  : '',
            ),
          ),
        );

      case 'checkbox':
        return _buildCheckboxField(field, currentValue);

      case 'file':
        return _buildFileField(field, currentValue);

      case 'email':
        // Controller should already be initialized in _initializeControllersForTemplate
        assert(_controllers.containsKey(field.name), 'Controller not found for field ${field.name}');
        return TextFormField(
          controller: _controllers[field.name],
          keyboardType: TextInputType.emailAddress,
          enabled: true,
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'] ?? 'Enter email address',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            prefixIcon: const Icon(Icons.email),
          ),
          onChanged: (value) {
            print('EnhancedDynamicFieldsForm: Email field "${field.name}" changed to: $value');
            _onFieldValueChanged(field.name, value);
          },
        );

      case 'url':
        // Controller should already be initialized in _initializeControllersForTemplate
        assert(_controllers.containsKey(field.name), 'Controller not found for field ${field.name}');
        return TextFormField(
          controller: _controllers[field.name],
          keyboardType: TextInputType.url,
          enabled: true,
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'] ?? 'Enter URL',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            prefixIcon: const Icon(Icons.link),
          ),
          onChanged: (value) {
            print('EnhancedDynamicFieldsForm: URL field "${field.name}" changed to: $value');
            _onFieldValueChanged(field.name, value);
          },
        );

      case 'phone':
        // Controller should already be initialized in _initializeControllersForTemplate
        assert(_controllers.containsKey(field.name), 'Controller not found for field ${field.name}');
        return TextFormField(
          controller: _controllers[field.name],
          keyboardType: TextInputType.phone,
          enabled: true,
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'] ?? 'Enter phone number',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            prefixIcon: const Icon(Icons.phone),
          ),
          onChanged: (value) {
            print('EnhancedDynamicFieldsForm: Phone field "${field.name}" changed to: $value');
            _onFieldValueChanged(field.name, value);
          },
        );

      case 'range':
        return _buildRangeField(field, currentValue);

      case 'color':
        return _buildColorField(field, currentValue);

      case 'rating':
        return _buildRatingField(field, currentValue);

      case 'map':
        return _buildMapField(field, currentValue);

      case 'object':
        return _buildObjectField(field, currentValue);

      case 'select':
        return _buildSelectField(field, currentValue);

      case 'radio':
        return _buildRadioField(field, currentValue);

      case 'array':
        return _buildArrayField(field, currentValue);

      default:
        return Text('Unsupported field type: ${field.type}');
    }
  }

  String? _validateField(TemplateField field, dynamic value) {
    // Check required validation
    if (field.required && (value == null || value.toString().trim().isEmpty)) {
      return '${field.label} is required';
    }

    // Skip further validation if value is empty and field is not required
    if (value == null || value.toString().trim().isEmpty) {
      return null;
    }

    // Apply field-specific validation rules
    final validationRules = field.validation['rules'] as List<dynamic>? ?? [];

    for (final rule in validationRules) {
      final ruleType = rule['type'] as String?;
      final ruleValue = rule['value'];
      final errorMessage = rule['message'] as String? ?? 'Validation failed';

      switch (ruleType) {
        case 'minLength':
          if (value.toString().length < (ruleValue as num)) {
            return errorMessage;
          }
          break;

        case 'maxLength':
          if (value.toString().length > (ruleValue as num)) {
            return errorMessage;
          }
          break;

        case 'min':
          final numValue = num.tryParse(value.toString());
          if (numValue == null || numValue < (ruleValue as num)) {
            return errorMessage;
          }
          break;

        case 'max':
          final numValue = num.tryParse(value.toString());
          if (numValue == null || numValue > (ruleValue as num)) {
            return errorMessage;
          }
          break;

        case 'pattern':
          final pattern = RegExp(ruleValue as String);
          if (!pattern.hasMatch(value.toString())) {
            return errorMessage;
          }
          break;

        case 'email':
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegex.hasMatch(value.toString())) {
            return errorMessage;
          }
          break;

        case 'url':
          final urlRegex = RegExp(r'^https?://[^\s/$.?#].[^\s]*$');
          if (!urlRegex.hasMatch(value.toString())) {
            return errorMessage;
          }
          break;

        case 'phone':
          final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]{10,}$');
          if (!phoneRegex.hasMatch(value.toString())) {
            return errorMessage;
          }
          break;

        case 'custom':
          // For custom validation, we could call a function
          // For now, skip custom validation
          break;

        default:
          // Unknown validation rule, skip
          break;
      }
    }

    return null;
  }

  Widget _buildSelectField(TemplateField field, dynamic currentValue) {
    final isLoading = _loadingOptions[field.name] ?? false;
    final optionsError = _optionsErrors[field.name];
    final dynamicOptions = _dynamicOptions[field.name];

    // Check if field has dynamic options (either explicitly configured or auto-configured)
    // But don't treat as dynamic if static options are available
    final hasStaticOptions = field.uiConfig.containsKey('options') && 
                           (field.uiConfig['options'] as List?)?.isNotEmpty == true;
    
    final hasDynamicOptions = !hasStaticOptions && (
                             field.uiConfig.containsKey('dynamic_options') ||
                             _getAutoDynamicOptions(field.name, field) != null ||
                             dynamicOptions != null);

    if (hasDynamicOptions) {
      if (isLoading) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Center(child: CircularProgressIndicator()),
          ],
        );
      }

      if (optionsError != null) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Error loading options: $optionsError', style: const TextStyle(color: Colors.red)),
          ],
        );
      }

      final options = dynamicOptions ?? [];
      // Ensure the current value is valid, otherwise set to null
      final validValue = options.any((option) => option['value'] == currentValue) ? currentValue : null;

      return DropdownButtonFormField<String>(
        value: validValue,
        isExpanded: true,
        decoration: InputDecoration(
          hintText: field.uiConfig['placeholder'] ?? 'Select ${field.label.toLowerCase()}',
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
        items: options.map((option) {
          return DropdownMenuItem<String>(
            value: option['value'],
            child: Text(option['label']),
          );
        }).toList(),
        onChanged: options.isNotEmpty ? (value) {
          _onFieldValueChanged(field.name, value);
        } : null,
      );
    }

    // Static options (check both uiConfig and validation)
    final staticOptions = field.uiConfig['options'] as List<dynamic>? ?? 
                         field.validation['options'] as List<dynamic>? ?? [];
    // Convert static options to the same format as dynamic options
    final normalizedOptions = staticOptions.map((option) {
      if (option is String) {
        return {'value': option, 'label': option};
      } else if (option is Map) {
        return {'value': option['value'], 'label': option['label']};
      }
      return null;
    }).whereType<Map<String, dynamic>>().toList();

    // Ensure the current value is valid, otherwise set to null
    final validValue = normalizedOptions.any((option) => option['value'] == currentValue) ? currentValue : null;

    return DropdownButtonFormField<String>(
      value: validValue,
      isExpanded: true,
      decoration: InputDecoration(
        hintText: field.uiConfig['placeholder'] ?? 'Select ${field.label.toLowerCase()}',
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
      items: normalizedOptions.map((option) {
        return DropdownMenuItem<String>(
          value: option['value'],
          child: Text(option['label']),
        );
      }).toList(),
      onChanged: normalizedOptions.isNotEmpty ? (value) {
        _onFieldValueChanged(field.name, value);
      } : null,
    );
  }

  void _onFieldValueChanged(String fieldName, dynamic value) {
    widget.onValueChanged(fieldName, value);

    // Reload dependent fields
    _reloadDependentFields(fieldName, value);
  }

  void _reloadDependentFields(String changedFieldName, dynamic newValue) {
    final dependentFields = _fieldDependencies.entries
        .where((entry) => entry.value == changedFieldName)
        .map((entry) => entry.key);

    for (final dependentField in dependentFields) {
      print('EnhancedDynamicFieldsForm: Reloading options for dependent field "$dependentField" due to change in "$changedFieldName"');

      // Clear existing options
      setState(() {
        _dynamicOptions[dependentField] = [];
        _optionsErrors[dependentField] = null;
      });

      // Get the template to find the field configuration
      final templateAsync = ref.read(categoryTemplateProvider(widget.categoryId));
      templateAsync.when(
        data: (template) {
          if (template != null) {
            // Find the dependent field
            TemplateField? dependentTemplateField;
            for (final section in template.sections) {
              for (final field in section.fields) {
                if (field.name == dependentField) {
                  dependentTemplateField = field;
                  break;
                }
              }
              if (dependentTemplateField != null) break;
            }

            if (dependentTemplateField != null) {
              final dynamicOptions = dependentTemplateField.uiConfig['dynamic_options'] as Map<String, dynamic>?;
              final autoDynamicOptions = _getAutoDynamicOptions(dependentField, dependentTemplateField);

              final options = dynamicOptions ?? autoDynamicOptions;
              if (options != null) {
                // Create updated values map with the new value
                final updatedValues = Map<String, dynamic>.from(widget.values);
                updatedValues[changedFieldName] = newValue;

                _loadOptionsForField(dependentField, options, updatedValues);
              }
            }
          }
        },
        loading: () {},
        error: (error, stack) {
          print('EnhancedDynamicFieldsForm: Error reloading dependent fields: $error');
        },
      );
    }
  }

  Widget _buildRadioField(TemplateField field, dynamic currentValue) {
    final isLoading = _loadingOptions[field.name] ?? false;
    final optionsError = _optionsErrors[field.name];
    final dynamicOptions = _dynamicOptions[field.name];

    // Check if field has dynamic options (either explicitly configured or auto-configured)
    // But don't treat as dynamic if static options are available
    final hasStaticOptions = field.uiConfig.containsKey('options') && 
                           (field.uiConfig['options'] as List?)?.isNotEmpty == true;
    
    final hasDynamicOptions = !hasStaticOptions && (
                             field.uiConfig.containsKey('dynamic_options') ||
                             _getAutoDynamicOptions(field.name, field) != null ||
                             dynamicOptions != null);

    List<Map<String, dynamic>> options = [];

    if (hasDynamicOptions) {
      if (isLoading) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Center(child: CircularProgressIndicator()),
          ],
        );
      }

      if (optionsError != null) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Error loading options: $optionsError', style: const TextStyle(color: Colors.red)),
          ],
        );
      }

      options = (dynamicOptions ?? []).cast<Map<String, dynamic>>();
    } else {
      // Static options (check both uiConfig and validation)
      final staticOptions = field.uiConfig['options'] as List<dynamic>? ?? 
                           field.validation['options'] as List<dynamic>? ?? [];
      options = staticOptions.map((option) {
        if (option is String) {
          return {'value': option, 'label': option};
        } else if (option is Map) {
          return {'value': option['value'], 'label': option['label']};
        }
        return null;
      }).whereType<Map<String, dynamic>>().toList();
    }

    if (options.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(field.label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('No options available', style: TextStyle(color: Colors.grey)),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(field.label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Column(
          children: options.map((option) {
            return Row(
              children: [
                Radio<String>(
                  value: option['value'],
                  groupValue: currentValue,
                  onChanged: (String? value) {
                    if (value != null) {
                      _onFieldValueChanged(field.name, value);
                    }
                  },
                ),
                const SizedBox(width: 8),
                Text(option['label']),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCheckboxField(TemplateField field, dynamic currentValue) {
    final checkboxValue = currentValue as List<dynamic>? ?? [];
    final options = field.uiConfig['options'] as List<dynamic>? ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...options.map((option) {
          String value, label;
          if (option is String) {
            value = option;
            label = option;
          } else if (option is Map) {
            value = option['value'];
            label = option['label'];
          } else {
            return const SizedBox.shrink();
          }

          final isChecked = checkboxValue.contains(value);

          return Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? checked) {
                  final newValue = List<dynamic>.from(checkboxValue);
                  if (checked == true) {
                    if (!newValue.contains(value)) {
                      newValue.add(value);
                    }
                  } else {
                    newValue.remove(value);
                  }
                  _onFieldValueChanged(field.name, newValue);
                },
              ),
              const SizedBox(width: 8),
              Text(label),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget _buildFileField(TemplateField field, dynamic currentValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: () async {
            try {
              final picker = ImagePicker();
              final pickedFile = await picker.pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                _onFieldValueChanged(field.name, pickedFile.path);
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error picking file: $e')),
              );
            }
          },
          icon: const Icon(Icons.file_upload),
          label: Text(field.uiConfig['buttonText'] ?? 'Choose File'),
        ),
        if (currentValue != null) ...[
          const SizedBox(height: 8),
          Text('Selected: ${currentValue.toString().split('/').last}'),
        ],
      ],
    );
  }

  Widget _buildRangeField(TemplateField field, dynamic currentValue) {
    final rangeValue = currentValue as num? ?? field.uiConfig['defaultValue'] ?? 50;
    final min = field.uiConfig['min'] ?? 0;
    final max = field.uiConfig['max'] ?? 100;
    final step = field.uiConfig['step'] ?? 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${field.label}: ${rangeValue.round()}'),
        Slider(
          value: rangeValue.toDouble(),
          min: min.toDouble(),
          max: max.toDouble(),
          divisions: ((max - min) / step).round(),
          onChanged: (value) {
            final roundedValue = value.round();
            _onFieldValueChanged(field.name, roundedValue);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$min'),
            Text('$max'),
          ],
        ),
      ],
    );
  }

  Widget _buildColorField(TemplateField field, dynamic currentValue) {
    final colorValue = currentValue as String? ?? field.uiConfig['defaultValue'] ?? '#FF0000';

    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Color(int.parse(colorValue.replaceFirst('#', ''), radix: 16) + 0xFF000000),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextFormField(
            key: ValueKey(colorValue),
            initialValue: colorValue,
            decoration: InputDecoration(
              hintText: field.uiConfig['placeholder'] ?? '#FF0000',
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              prefixIcon: const Icon(Icons.color_lens),
            ),
            onChanged: (value) {
              _onFieldValueChanged(field.name, value);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRatingField(TemplateField field, dynamic currentValue) {
    final ratingValue = currentValue as num? ?? 0;
    final maxRating = field.uiConfig['maxRating'] ?? 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${field.label}: ${ratingValue.round()}/$maxRating'),
        Row(
          children: List.generate(maxRating, (index) {
            return IconButton(
              icon: Icon(
                index < ratingValue ? Icons.star : Icons.star_border,
                color: Colors.amber,
              ),
              onPressed: () {
                final newValue = index + 1;
                _onFieldValueChanged(field.name, newValue);
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildMapField(TemplateField field, dynamic currentValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: () async {
            // TODO: Implement map/location picker
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Map picker not implemented yet')),
            );
          },
          icon: const Icon(Icons.map),
          label: Text(field.uiConfig['buttonText'] ?? 'Pick Location'),
        ),
        if (currentValue != null) ...[
          const SizedBox(height: 8),
          Text('Selected location: $currentValue'),
        ],
      ],
    );
  }

  Widget _buildObjectField(TemplateField field, dynamic currentValue) {
    // For now, show a placeholder for nested object fields
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${field.label} (Object field)'),
          const SizedBox(height: 8),
          const Text('Nested object fields not yet implemented'),
          // TODO: Implement nested object field rendering
        ],
      ),
    );
  }

  Widget _buildArrayField(TemplateField field, dynamic currentValue) {
    final arrayValue = currentValue as List<dynamic>? ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${field.label} (${arrayValue.length} items)'),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Implement array item addition
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Array field management not implemented yet')),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Item'),
        ),
        if (arrayValue.isNotEmpty) ...[
          const SizedBox(height: 8),
          ...arrayValue.map((item) => ListTile(
            title: Text(item.toString()),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                final newValue = List<dynamic>.from(arrayValue);
                newValue.remove(item);
                _onFieldValueChanged(field.name, newValue);
              },
            ),
          )),
        ],
      ],
    );
  }

  void _loadDynamicOptionsForTemplate(CategoryTemplate template) {
    _fieldDependencies.clear();

    for (final section in template.sections) {
      for (final field in section.fields) {
        final dynamicOptions = field.uiConfig['dynamic_options'] as Map<String, dynamic>?;
        final hasStaticOptions = field.uiConfig.containsKey('options') && 
                               (field.uiConfig['options'] as List?)?.isNotEmpty == true;
        
        // Don't use auto-configuration if field has static options
        final autoDynamicOptions = hasStaticOptions ? null : _getAutoDynamicOptions(field.name, field);

        final options = dynamicOptions ?? autoDynamicOptions;

        if (options != null) {
          // Check for dependencies
          final dependsOn = options['depends_on'] as String?;
          if (dependsOn != null) {
            _fieldDependencies[field.name] = dependsOn;
            print('EnhancedDynamicFieldsForm: Field "${field.name}" depends on "$dependsOn"');
            // Don't load options for dependent fields initially
          } else {
            // Only load options for fields without dependencies if not already loaded
            final existingOptions = _dynamicOptions[field.name];
            if (existingOptions == null || existingOptions.isEmpty) {
              _loadOptionsForField(field.name, options, widget.values);
            }
          }
        }
      }
    }
  }

  Map<String, dynamic>? _getAutoDynamicOptions(String fieldName, TemplateField field) {
    // Always try to auto-configure dynamic options for known fields
    // Static options will be used as fallback if API fails
    switch (fieldName) {
      case 'brand':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for brand field');
        return {
          'api_url': '/cars/brands',
          'data_path': 'data',
          'label_field': 'name',
          'value_field': 'id',
        };
      case 'model':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for model field');
        return {
          'api_url': '/cars/brands/{brand}/models',
          'data_path': 'data.models',
          'label_field': 'name',
          'value_field': 'id',
          'depends_on': 'brand',
        };
      case 'variant':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for variant field');
        return {
          'api_url': '/cars/models/{model}/variants',
          'data_path': 'data.variants',
          'label_field': 'name',
          'value_field': 'id',
          'depends_on': 'model',
        };
      case 'vehicle_type':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for vehicle_type field');
        return {
          'api_url': '/cars/vehicle-types',
          'data_path': 'data',
          'label_field': 'name',
          'value_field': 'id',
        };
      case 'vehicle_condition':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for vehicle_condition field');
        return {
          'api_url': '/cars/conditions',
          'data_path': 'data',
          'label_field': 'name',
          'value_field': 'id',
        };
      case 'fuel':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for fuel field');
        return {
          'api_url': '/cars/fuel-types',
          'data_path': 'data',
          'label_field': 'name',
          'value_field': 'id',
        };
      case 'transmission':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for transmission field');
        return {
          'api_url': '/cars/transmission-types',
          'data_path': 'data',
          'label_field': 'name',
          'value_field': 'id',
        };
      case 'ownership':
      case 'owners':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for ownership field');
        return {
          'api_url': '/cars/owner-options',
          'data_path': 'data',
          'label_field': 'name',
          'value_field': 'id',
        };
      default:
        return null;
    }
  }

  Future<void> _loadOptionsForField(String fieldName, Map<String, dynamic> dynamicOptions, [Map<String, dynamic>? currentValuesParam]) async {
    // Check if options are already loaded and not empty
    final existingOptions = _dynamicOptions[fieldName];
    if (existingOptions != null && existingOptions.isNotEmpty) {
      print('EnhancedDynamicFieldsForm: Options already loaded for field "$fieldName", skipping API call');
      return;
    }

    // Check if already loading
    if (_loadingOptions[fieldName] == true) {
      print('EnhancedDynamicFieldsForm: Already loading options for field "$fieldName", skipping duplicate request');
      return;
    }

    setState(() {
      _loadingOptions[fieldName] = true;
      _optionsErrors[fieldName] = null;
    });

    try {
      String apiUrl = dynamicOptions['api_url'] as String? ?? '';
      final dataPath = dynamicOptions['data_path'] as String? ?? 'data';
      final labelField = dynamicOptions['label_field'] as String? ?? 'name';
      final valueField = dynamicOptions['value_field'] as String? ?? 'id';

      // Replace URL template variables
      final currentValues = currentValuesParam ?? widget.values;
      final regExp = RegExp(r'\{(\w+)\}');
      final matches = regExp.allMatches(apiUrl);

      for (final match in matches) {
        final varName = match.group(1)!;
        final varValue = currentValues[varName]?.toString() ?? '';
        apiUrl = apiUrl.replaceAll('{$varName}', varValue);
      }

      // Convert full URLs to relative paths for apiClient
      if (apiUrl.startsWith('https://api.ebidportal.com/api/v1/')) {
        apiUrl = apiUrl.replaceFirst('https://api.ebidportal.com/api/v1/', '/');
        print('EnhancedDynamicFieldsForm: Converted full URL to relative path: $apiUrl');
      }

      print('EnhancedDynamicFieldsForm: Loading options for field "$fieldName" from URL: $apiUrl');

      // Get API client
      final apiClient = ref.read(apiClientProvider);
      final response = await apiClient.get(apiUrl);

      print('EnhancedDynamicFieldsForm: Received response for field "$fieldName": status=${response.statusCode}');

      if (response.data['success'] == true) {
        // Extract data flexibly
        List<dynamic> data = _extractDataFromResponse(response.data, dataPath);
        print('EnhancedDynamicFieldsForm: Found ${data.length} options for field "$fieldName"');

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

        print('EnhancedDynamicFieldsForm: Successfully loaded ${options.length} options for field "$fieldName"');
      } else {
        final errorMsg = 'API returned success=false for field "$fieldName"';
        print('EnhancedDynamicFieldsForm: $errorMsg');
        throw Exception(errorMsg);
      }
    } catch (e) {
      print('EnhancedDynamicFieldsForm: Error loading options for field "$fieldName"');
      print('EnhancedDynamicFieldsForm: Exception type: ${e.runtimeType}');
      print('EnhancedDynamicFieldsForm: Exception message: $e');

      // Handle DioException specifically for detailed logging
      if (e is DioException) {
        print('EnhancedDynamicFieldsForm: DioException details for field "$fieldName":');
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

      // Try to fall back to static options from template if API fails
      bool fallbackUsed = false;
      try {
        final templateAsync = ref.read(categoryTemplateProvider(widget.categoryId));
        templateAsync.when(
          data: (template) {
            if (template != null) {
              // Find the field in the template
              TemplateField? templateField;
              for (final section in template.sections) {
                for (final field in section.fields) {
                  if (field.name == fieldName) {
                    templateField = field;
                    break;
                  }
                }
                if (templateField != null) break;
              }

              if (templateField != null && (templateField.uiConfig.containsKey('options') || templateField.validation.containsKey('options'))) {
                final staticOptions = templateField.uiConfig['options'] as List<dynamic>? ?? 
                                    templateField.validation['options'] as List<dynamic>?;
                if (staticOptions != null && staticOptions.isNotEmpty) {
                  final options = staticOptions.map((option) {
                    String value, label;
                    if (option is String) {
                      value = option;
                      label = option;
                    } else if (option is Map) {
                      value = option['value']?.toString() ?? '';
                      label = option['label']?.toString() ?? '';
                    } else {
                      return null;
                    }
                    return {'value': value, 'label': label};
                  }).where((option) => option != null).cast<Map<String, dynamic>>().toList();

                  setState(() {
                    _dynamicOptions[fieldName] = options;
                    _loadingOptions[fieldName] = false;
                    _optionsErrors[fieldName] = null; // Clear error since we have fallback
                  });

                  print('EnhancedDynamicFieldsForm: Using static fallback options for field "$fieldName": ${options.length} options');
                  fallbackUsed = true;
                }
              }
            }
          },
          loading: () {},
          error: (error, stack) {
            print('EnhancedDynamicFieldsForm: Error accessing template for fallback: $error');
          },
        );
      } catch (fallbackError) {
        print('EnhancedDynamicFieldsForm: Error setting up fallback for field "$fieldName": $fallbackError');
      }

      if (!fallbackUsed) {
        String errorMessage = 'Failed to load options';
        if (e is DioException) {
          errorMessage += ': ${e.response?.statusCode ?? 'Network Error'} - ${e.message ?? 'Unknown error'}';
        } else {
          errorMessage += ': $e';
        }

        setState(() {
          _optionsErrors[fieldName] = errorMessage;
          _loadingOptions[fieldName] = false;
        });
      }
    }
  }

  List<dynamic> _extractDataFromResponse(Map<String, dynamic> responseData, String dataPath) {
    final pathParts = dataPath.split('.');
    dynamic current = responseData;

    for (final part in pathParts) {
      if (current is Map && current.containsKey(part)) {
        current = current[part];
      } else {
        break;
      }
    }

    if (current is List) {
      return current;
    } else if (current is Map) {
      return current['models'] as List<dynamic>? ??
             current['data'] as List<dynamic>? ??
             current['items'] as List<dynamic>? ??
             current['results'] as List<dynamic>? ??
             [];
    }

    final fallbackData = responseData[dataPath];
    if (fallbackData is List) {
      return fallbackData;
    }

    return [];
  }
}