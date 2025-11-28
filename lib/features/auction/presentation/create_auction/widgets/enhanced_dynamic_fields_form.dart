import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  bool _dynamicOptionsInitialized = false;

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
        }

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

    switch (field.type) {
      case 'text':
        return TextFormField(
          initialValue: currentValue?.toString(),
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'],
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          onChanged: (value) => _onFieldValueChanged(field.name, value),
        );

      case 'textarea':
        return TextFormField(
          initialValue: currentValue?.toString(),
          maxLines: field.uiConfig['rows'] ?? 4,
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'],
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          onChanged: (value) => _onFieldValueChanged(field.name, value),
        );

      case 'number':
        return TextFormField(
          initialValue: currentValue?.toString(),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'],
            prefixText: field.uiConfig['prefix'],
            suffixText: field.uiConfig['suffix'],
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          onChanged: (value) {
            final numValue = num.tryParse(value);
            _onFieldValueChanged(field.name, numValue);
          },
        );

      case 'boolean':
        return Row(
          children: [
            Checkbox(
              value: currentValue ?? field.uiConfig['defaultValue'] ?? false,
            onChanged: (value) => _onFieldValueChanged(field.name, value),
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
              _onFieldValueChanged(field.name, date.toIso8601String().split('T')[0]);
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
        return _buildCheckboxField(field);

      case 'file':
        return _buildFileField(field);

      case 'email':
        return TextFormField(
          initialValue: currentValue?.toString(),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'] ?? 'Enter email address',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            prefixIcon: const Icon(Icons.email),
          ),
          validator: (value) {
            if (field.required && (value == null || value.isEmpty)) {
              return 'Email is required';
            }
            if (value != null && value.isNotEmpty) {
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email address';
              }
            }
            return null;
          },
          onChanged: (value) => _onFieldValueChanged(field.name, value),
        );

      case 'url':
        return TextFormField(
          initialValue: currentValue?.toString(),
          keyboardType: TextInputType.url,
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'] ?? 'Enter URL',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            prefixIcon: const Icon(Icons.link),
          ),
          validator: (value) {
            if (field.required && (value == null || value.isEmpty)) {
              return 'URL is required';
            }
            if (value != null && value.isNotEmpty) {
              final urlRegex = RegExp(r'^https?://[^\s/$.?#].[^\s]*$');
              if (!urlRegex.hasMatch(value)) {
                return 'Please enter a valid URL';
              }
            }
            return null;
          },
          onChanged: (value) => _onFieldValueChanged(field.name, value),
        );

      case 'phone':
        return TextFormField(
          initialValue: currentValue?.toString(),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'] ?? 'Enter phone number',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            prefixIcon: const Icon(Icons.phone),
          ),
          validator: (value) {
            if (field.required && (value == null || value.isEmpty)) {
              return 'Phone number is required';
            }
            if (value != null && value.isNotEmpty) {
              final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]{10,}$');
              if (!phoneRegex.hasMatch(value)) {
                return 'Please enter a valid phone number';
              }
            }
            return null;
          },
          onChanged: (value) => _onFieldValueChanged(field.name, value),
        );

      case 'range':
        return _buildRangeField(field);

      case 'color':
        return _buildColorField(field);

      case 'rating':
        return _buildRatingField(field);

      case 'map':
        return _buildMapField(field);

      case 'object':
        return _buildObjectField(field);

      case 'select':
        return _buildSelectField(field);

      case 'radio':
        return _buildRadioField(field);

      default:
        return Text('Unsupported field type: ${field.type}');
    }
  }

  Widget _buildSelectField(TemplateField field) {
    final currentValue = widget.values[field.name];
    final isLoading = _loadingOptions[field.name] ?? false;
    final optionsError = _optionsErrors[field.name];
    final dynamicOptions = _dynamicOptions[field.name];

    // Check if field has dynamic options
    if (field.uiConfig.containsKey('dynamic_options')) {
      if (isLoading) {
        return const CircularProgressIndicator();
      }

      if (optionsError != null) {
        return Text('Error loading options: $optionsError');
      }

      final options = dynamicOptions ?? [];
      return SizedBox(
        width: double.infinity,
        child: DropdownButtonFormField<String>(
          initialValue: currentValue,
          decoration: InputDecoration(
            hintText: field.uiConfig['placeholder'],
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          items: options.map((option) {
            return DropdownMenuItem<String>(
              value: option['value'],
              child: Text(option['label']),
            );
          }).toList(),
          onChanged: (value) => _onFieldValueChanged(field.name, value),
        ),
      );
    }

    // Static options
    final staticOptions = field.uiConfig['options'] as List<dynamic>? ?? [];
    return SizedBox(
      width: double.infinity,
      child: DropdownButtonFormField<String>(
        initialValue: currentValue,
        decoration: InputDecoration(
          hintText: field.uiConfig['placeholder'],
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
        items: staticOptions.map((option) {
          if (option is String) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          } else if (option is Map) {
            return DropdownMenuItem<String>(
              value: option['value'],
              child: Text(option['label']),
            );
          }
          return null;
        }).whereType<DropdownMenuItem<String>>().toList(),
        onChanged: (value) => _onFieldValueChanged(field.name, value),
      ),
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

  Widget _buildRadioField(TemplateField field) {
    final currentValue = widget.values[field.name];
    final options = field.uiConfig['options'] as List<dynamic>? ?? [];

    return Column(
      children: options.map((option) {
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

        return Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: currentValue,
              onChanged: (String? value) {
                if (value != null) {
                  _onFieldValueChanged(field.name, value);
                }
              },
            ),
            const SizedBox(width: 8),
            Text(label),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildCheckboxField(TemplateField field) {
    final currentValue = widget.values[field.name] as List<dynamic>? ?? [];
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

          final isChecked = currentValue.contains(value);

          return Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? checked) {
                  final newValue = List<dynamic>.from(currentValue);
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

  Widget _buildFileField(TemplateField field) {
    final currentValue = widget.values[field.name];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: () async {
            // TODO: Implement file picker
            // For now, show a placeholder
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('File picker not implemented yet')),
            );
          },
          icon: const Icon(Icons.file_upload),
          label: Text(field.uiConfig['buttonText'] ?? 'Choose File'),
        ),
        if (currentValue != null) ...[
          const SizedBox(height: 8),
          Text('Selected: $currentValue'),
        ],
      ],
    );
  }

  Widget _buildRangeField(TemplateField field) {
    final currentValue = widget.values[field.name] as num? ?? field.uiConfig['defaultValue'] ?? 50;
    final min = field.uiConfig['min'] ?? 0;
    final max = field.uiConfig['max'] ?? 100;
    final step = field.uiConfig['step'] ?? 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${field.label}: ${currentValue.round()}'),
        Slider(
          value: currentValue.toDouble(),
          min: min.toDouble(),
          max: max.toDouble(),
          divisions: ((max - min) / step).round(),
          onChanged: (value) => _onFieldValueChanged(field.name, value.round()),
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

  Widget _buildColorField(TemplateField field) {
    final currentValue = widget.values[field.name] as String? ?? field.uiConfig['defaultValue'] ?? '#FF0000';

    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Color(int.parse(currentValue.replaceFirst('#', ''), radix: 16) + 0xFF000000),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextFormField(
            initialValue: currentValue,
            decoration: InputDecoration(
              hintText: field.uiConfig['placeholder'] ?? '#FF0000',
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              prefixIcon: const Icon(Icons.color_lens),
            ),
            onChanged: (value) => _onFieldValueChanged(field.name, value),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingField(TemplateField field) {
    final currentValue = widget.values[field.name] as num? ?? 0;
    final maxRating = field.uiConfig['maxRating'] ?? 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${field.label}: ${currentValue.round()}/$maxRating'),
        Row(
          children: List.generate(maxRating, (index) {
            return IconButton(
              icon: Icon(
                index < currentValue ? Icons.star : Icons.star_border,
                color: Colors.amber,
              ),
              onPressed: () => _onFieldValueChanged(field.name, index + 1),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildMapField(TemplateField field) {
    final currentValue = widget.values[field.name];

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

  Widget _buildObjectField(TemplateField field) {
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

  Widget _buildArrayField(TemplateField field) {
    final currentValue = widget.values[field.name] as List<dynamic>? ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${field.label} (${currentValue.length} items)'),
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
        if (currentValue.isNotEmpty) ...[
          const SizedBox(height: 8),
          ...currentValue.map((item) => ListTile(
            title: Text(item.toString()),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                final newValue = List<dynamic>.from(currentValue);
                newValue.remove(item);
                _onFieldValueChanged(field.name, newValue);
              },
            ),
          )),
        ],
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // Dynamic options are now loaded when template is available
  }

  void _loadDynamicOptionsForTemplate(CategoryTemplate template) {
    _fieldDependencies.clear();

    for (final section in template.sections) {
      for (final field in section.fields) {
        final dynamicOptions = field.uiConfig['dynamic_options'] as Map<String, dynamic>?;
        final autoDynamicOptions = _getAutoDynamicOptions(field.name, field);

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
    // Only auto-configure if field doesn't already have static options
    if (field.uiConfig.containsKey('options') && (field.uiConfig['options'] as List?)?.isNotEmpty == true) {
      return null;
    }

    // Auto-configure dynamic options for common vehicle fields
    switch (fieldName) {
      case 'brand':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for brand field');
        return {
          'api_url': 'https://api.ebidportal.com/api/v1/cars/brands',
          'data_path': 'data',
          'label_field': 'name',
          'value_field': 'id',
        };
      case 'model':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for model field');
        return {
          'api_url': 'https://api.ebidportal.com/api/v1/cars/brands/{brand}/models',
          'data_path': 'data.models',
          'label_field': 'name',
          'value_field': 'id',
          'depends_on': 'brand',
        };
      case 'variant':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for variant field');
        return {
          'api_url': 'https://api.ebidportal.com/api/v1/cars/models/{model}/variants',
          'data_path': 'data.variants',
          'label_field': 'name',
          'value_field': 'id',
          'depends_on': 'model',
        };
      case 'fuel':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for fuel field');
        return {
          'api_url': 'https://api.ebidportal.com/api/v1/cars/fuel-types',
          'data_path': 'data',
          'label_field': 'name',
          'value_field': 'id',
        };
      case 'owners':
        print('EnhancedDynamicFieldsForm: Auto-configuring dynamic options for owners field');
        return {
          'api_url': 'https://api.ebidportal.com/api/v1/cars/owner-options',
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
      print('EnhancedDynamicFieldsForm: Error loading options for field "$fieldName": $e');
      setState(() {
        _optionsErrors[fieldName] = 'Failed to load options: $e';
        _loadingOptions[fieldName] = false;
      });
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