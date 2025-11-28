import 'package:flutter/material.dart';
import '../../../../../core/theme/app_theme.dart';

class DynamicFieldsForm extends StatelessWidget {
  final Map<String, dynamic> schema;
  final Map<String, dynamic> values;
  final Map<String, String> errors;
  final Function(String, dynamic) onFieldChanged;
  final Function(String, String) onFieldError;
  final BuildContext context;

  const DynamicFieldsForm({
    super.key,
    required this.schema,
    required this.values,
    required this.errors,
    required this.onFieldChanged,
    required this.onFieldError,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    final sections = schema['sections'] as List<dynamic>? ?? [];
    
    if (sections.isEmpty) {
      // Fallback: render fields directly if no sections
      final fields = schema['fields'] as List<dynamic>? ?? [];
      return _buildFieldsList(fields);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections.map((section) {
        final sectionData = section as Map<String, dynamic>;
        final sectionTitle = sectionData['title'] as String? ?? 'Additional Details';
        final fields = sectionData['fields'] as List<dynamic>? ?? [];

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
            _buildFieldsList(fields),
            const SizedBox(height: AppTheme.spacingLg),
          ],
        );
      }).toList(),
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
    
    final displayLabel = required ? '$label *' : label;
    final error = errors[name];

    switch (type) {
      case 'text':
        return _buildTextField(name, displayLabel, description, validation, error);
      case 'textarea':
        return _buildTextAreaField(name, displayLabel, description, validation, error);
      case 'number':
        return _buildNumberField(name, displayLabel, description, validation, error);
      case 'select':
        return _buildSelectField(name, displayLabel, description, field, error);
      case 'radio':
        return _buildRadioField(name, displayLabel, description, field, error);
      case 'checkbox':
        return _buildCheckboxField(name, displayLabel, description, field, error);
      case 'date':
        return _buildDateField(name, displayLabel, description, validation, error);
      case 'boolean':
        return _buildBooleanField(name, displayLabel, description, error);
      case 'email':
        return _buildEmailField(name, displayLabel, description, validation, error);
      case 'url':
        return _buildUrlField(name, displayLabel, description, validation, error);
      case 'phone':
        return _buildPhoneField(name, displayLabel, description, validation, error);
      case 'range':
        return _buildRangeField(name, displayLabel, description, field, error);
      case 'color':
        return _buildColorField(name, displayLabel, description, error);
      case 'rating':
        return _buildRatingField(name, displayLabel, description, field, error);
      default:
        return _buildTextField(name, displayLabel, description, validation, error);
    }
  }

  Widget _buildTextField(String name, String label, String? description, Map<String, dynamic> validation, String? error) {
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
          initialValue: values[name]?.toString(),
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
          ),
          maxLength: maxLength,
          onChanged: (value) => onFieldChanged(name, value),
          validator: (value) {
            if (minLength != null && (value?.length ?? 0) < minLength) {
              return 'Minimum $minLength characters required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildTextAreaField(String name, String label, String? description, Map<String, dynamic> validation, String? error) {
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
          initialValue: values[name]?.toString(),
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
            alignLabelWithHint: true,
          ),
          maxLines: 4,
          maxLength: maxLength,
          onChanged: (value) => onFieldChanged(name, value),
          validator: (value) {
            if (minLength != null && (value?.length ?? 0) < minLength) {
              return 'Minimum $minLength characters required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildNumberField(String name, String label, String? description, Map<String, dynamic> validation, String? error) {
    final min = validation['minimum'] as num?;
    final max = validation['maximum'] as num?;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        TextFormField(
          initialValue: values[name]?.toString(),
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            final numValue = num.tryParse(value);
            onFieldChanged(name, numValue);
          },
          validator: (value) {
            final numValue = num.tryParse(value ?? '');
            if (min != null && numValue != null && numValue < min) {
              return 'Minimum value is $min';
            }
            if (max != null && numValue != null && numValue > max) {
              return 'Maximum value is $max';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSelectField(String name, String label, String? description, Map<String, dynamic> field, String? error) {
    final options = field['options'] as List<dynamic>? ?? [];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
          ),
          value: values[name]?.toString(),
          items: options.map((option) {
            final optionData = option as Map<String, dynamic>;
            final value = optionData['value'] as String;
            final label = optionData['label'] as String? ?? value;
            return DropdownMenuItem(value: value, child: Text(label));
          }).toList(),
          onChanged: (value) => onFieldChanged(name, value),
        ),
      ],
    );
  }

  Widget _buildRadioField(String name, String label, String? description, Map<String, dynamic> field, String? error) {
    final options = field['options'] as List<dynamic>? ?? [];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        if (description != null) ...[
          const SizedBox(height: 4),
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
        ...options.map((option) {
          final optionData = option as Map<String, dynamic>;
          final value = optionData['value'] as String;
          final label = optionData['label'] as String? ?? value;
          return RadioListTile<String>(
            title: Text(label),
            value: value,
            groupValue: values[name]?.toString(),
            onChanged: (newValue) => onFieldChanged(name, newValue),
          );
        }),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildCheckboxField(String name, String label, String? description, Map<String, dynamic> field, String? error) {
    final currentValue = values[name] as bool? ?? false;
    
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
          onChanged: (value) => onFieldChanged(name, value ?? false),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildDateField(String name, String label, String? description, Map<String, dynamic> validation, String? error) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        TextFormField(
          initialValue: values[name]?.toString(),
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          readOnly: true,
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (date != null) {
              onFieldChanged(name, date.toIso8601String().split('T')[0]);
            }
          },
        ),
      ],
    );
  }

  Widget _buildBooleanField(String name, String label, String? description, String? error) {
    final currentValue = values[name] as bool? ?? false;
    
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
          onChanged: (value) => onFieldChanged(name, value),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildEmailField(String name, String label, String? description, Map<String, dynamic> validation, String? error) {
    return _buildTextField(name, label, description, validation, error);
  }

  Widget _buildUrlField(String name, String label, String? description, Map<String, dynamic> validation, String? error) {
    return _buildTextField(name, label, description, validation, error);
  }

  Widget _buildPhoneField(String name, String label, String? description, Map<String, dynamic> validation, String? error) {
    return _buildTextField(name, label, description, validation, error);
  }

  Widget _buildRangeField(String name, String label, String? description, Map<String, dynamic> field, String? error) {
    final min = field['min'] as num? ?? 0;
    final max = field['max'] as num? ?? 100;
    final step = field['step'] as num? ?? 1;
    final currentValue = values[name] as num? ?? min;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        Text('$label: ${currentValue.toStringAsFixed(0)}'),
        Slider(
          value: currentValue.toDouble(),
          min: min.toDouble(),
          max: max.toDouble(),
          divisions: ((max - min) / step).round(),
          onChanged: (value) => onFieldChanged(name, value),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildColorField(String name, String label, String? description, String? error) {
    final currentValue = values[name] as String? ?? '#000000';
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
        ],
        TextFormField(
          initialValue: currentValue,
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            border: const OutlineInputBorder(),
            suffixIcon: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Color(int.parse(currentValue.replaceFirst('#', ''), radix: 16) + 0xFF000000),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          onChanged: (value) => onFieldChanged(name, value),
        ),
      ],
    );
  }

  Widget _buildRatingField(String name, String label, String? description, Map<String, dynamic> field, String? error) {
    final maxRating = field['maxRating'] as int? ?? 5;
    final currentValue = values[name] as int? ?? 0;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        if (description != null) ...[
          const SizedBox(height: 4),
          Text(description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
        const SizedBox(height: 8),
        Row(
          children: List.generate(maxRating, (index) {
            return IconButton(
              icon: Icon(
                index < currentValue ? Icons.star : Icons.star_border,
                color: Colors.amber,
              ),
              onPressed: () => onFieldChanged(name, index + 1),
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
}