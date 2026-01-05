import 'package:flutter/material.dart';
import '../../../catalog/domain/category.dart';
import '../../../auction/data/template_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/product_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreateProductScreen extends ConsumerStatefulWidget {
  final Category? initialCategory;
  const CreateProductScreen({super.key, this.initialCategory});

  @override
  ConsumerState<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends ConsumerState<CreateProductScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // All data now comes from template fields
  Map<String, dynamic> _formData = {};
  List<File> _selectedImages = [];
  Map<String, dynamic>? _locationData;
  bool _isLoading = false;

  // Template loading state
  CategoryTemplate? _template;
  bool _isLoadingTemplate = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialCategory != null) {
      _loadTemplate(widget.initialCategory!.id);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadTemplate(String categoryId) async {
    setState(() => _isLoadingTemplate = true);
    try {
      final templateAsync = ref.read(categoryTemplateProvider(categoryId).future);
      final template = await templateAsync;
      setState(() => _template = template);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading template: $e')),
        );
      }
    } finally {
      setState(() => _isLoadingTemplate = false);
    }
  }

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final images = await picker.pickMultiImage();
    if (images.isNotEmpty) {
      setState(() {
        _selectedImages.addAll(images.map((image) => File(image.path)));
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permissions are denied';
        }
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      setState(() {
        _locationData = {
          'latitude': position.latitude,
          'longitude': position.longitude,
          'city': 'Current Location',
          'state': '',
          'country': 'India',
        };
      });

      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Location added successfully')),
      );
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Error getting location: $e')),
      );
    }
  }

  Future<void> _submitProduct() async {
    if (!_formKey.currentState!.validate()) return;
    if (widget.initialCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Category is required')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Map template fields to API fields as per v3.2.8 Unified API
      final productData = {
        'category_id': widget.initialCategory!.id,
        'status': 'pending',
        if (_locationData != null) 'location': _locationData,
        if (_selectedImages.isNotEmpty) 
          'images': _selectedImages.map((file) => 'uploaded://${file.path}').toList(),
        
        // All form data and common fields go to dynamic_attributes for extraction
        'dynamic_attributes': {
          ..._formData,
          'currency': 'INR',
          'condition': _formData['condition'] ?? 'new',
          'shipping_included': _formData['shipping_included'] ?? true,
          if (_locationData != null) 'location': _locationData,
          if (_selectedImages.isNotEmpty) 
            'images': _selectedImages.map((file) => 'uploaded://${file.path}').toList(),
        },
      };

      await ref.read(productRepositoryProvider).createProduct(productData);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product listed successfully!')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error listing product: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sell Product')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.initialCategory != null)
                Card(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: ListTile(
                    leading: widget.initialCategory!.iconUrl != null
                        ? CircleAvatar(backgroundImage: NetworkImage(widget.initialCategory!.iconUrl!))
                        : const CircleAvatar(child: Icon(Icons.category)),
                    title: Text(widget.initialCategory!.name),
                    subtitle: const Text('Selected Category'),
                  ),
                ),
              
              // Template-based form fields
              if (_isLoadingTemplate)
                const Center(child: CircularProgressIndicator())
              else if (_template != null) ...[
                ..._buildDynamicFormFields(),
                const SizedBox(height: 24),
              ] else ...[
                const Center(
                  child: Text('No template available for this category'),
                ),
              ],

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitProduct,
                  child: _isLoading 
                    ? const CircularProgressIndicator()
                    : const Text('List Product'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDynamicFormFields() {
    final fields = <Widget>[];
    
    for (final section in _template!.sections) {
      fields.add(
        Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(section.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                if (section.description.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(section.description, style: const TextStyle(color: Colors.grey)),
                ],
                const SizedBox(height: 16),
                ...section.fields.map((field) => _buildFieldWidget(field)),
              ],
            ),
          ),
        ),
      );
    }
    
    return fields;
  }

  Widget _buildFieldWidget(TemplateField field) {
    final fieldKey = field.name;
    final placeholder = field.uiConfig['placeholder'] ?? '';
    
    switch (field.type) {
      case 'text':
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextFormField(
            initialValue: _formData[fieldKey]?.toString() ?? '',
            decoration: InputDecoration(
              labelText: field.label,
              border: const OutlineInputBorder(),
              hintText: placeholder,
            ),
            validator: field.required ? (value) => value?.isEmpty ?? true ? 'Required' : null : null,
            onChanged: (value) => _formData[fieldKey] = value,
          ),
        );
      
      case 'textarea':
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextFormField(
            initialValue: _formData[fieldKey]?.toString() ?? '',
            decoration: InputDecoration(
              labelText: field.label,
              border: const OutlineInputBorder(),
              hintText: placeholder,
              alignLabelWithHint: true,
            ),
            maxLines: 4,
            validator: field.required ? (value) => value?.isEmpty ?? true ? 'Required' : null : null,
            onChanged: (value) => _formData[fieldKey] = value,
          ),
        );
      
      case 'number':
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextFormField(
            initialValue: _formData[fieldKey]?.toString() ?? '',
            decoration: InputDecoration(
              labelText: field.label,
              border: const OutlineInputBorder(),
              hintText: placeholder,
            ),
            keyboardType: TextInputType.number,
            validator: field.required ? (value) => value?.isEmpty ?? true ? 'Required' : null : null,
            onChanged: (value) => _formData[fieldKey] = double.tryParse(value) ?? value,
          ),
        );
      
      case 'select':
        final options = field.uiConfig['options'] as List<dynamic>? ?? [];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: DropdownButtonFormField<String>(
            initialValue: _formData[fieldKey],
            decoration: InputDecoration(
              labelText: field.label,
              border: const OutlineInputBorder(),
            ),
            items: options.map((option) {
              final label = option is Map ? option['label'] : option.toString();
              final value = option is Map ? option['value'] : option.toString();
              return DropdownMenuItem<String>(value: value, child: Text(label));
            }).toList(),
            validator: field.required ? (value) => value == null ? 'Required' : null : null,
            onChanged: (value) => setState(() => _formData[fieldKey] = value),
          ),
        );
      
      case 'images':
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImages,
                    icon: const Icon(Icons.photo_library),
                    label: Text(field.label),
                  ),
                  const SizedBox(width: 16),
                  Text('${_selectedImages.length} selected'),
                ],
              ),
              if (_selectedImages.isNotEmpty) ...[
                const SizedBox(height: 8),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _selectedImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                _selectedImages[index],
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: const Icon(Icons.close, size: 16),
                                onPressed: () {
                                  setState(() {
                                    _selectedImages.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        );
      
      case 'location':
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _getCurrentLocation,
                    icon: const Icon(Icons.location_on),
                    label: Text(field.label),
                  ),
                  const SizedBox(width: 16),
                  if (_locationData != null)
                    const Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
              if (_locationData != null) ...[
                const SizedBox(height: 8),
                Text('Location: ${_locationData!['city']}, ${_locationData!['state']}'),
              ],
            ],
          ),
        );
      
      default:
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextFormField(
            initialValue: _formData[fieldKey]?.toString() ?? '',
            decoration: InputDecoration(
              labelText: field.label,
              border: const OutlineInputBorder(),
              hintText: placeholder,
            ),
            validator: field.required ? (value) => value?.isEmpty ?? true ? 'Required' : null : null,
            onChanged: (value) => _formData[fieldKey] = value,
          ),
        );
    }
  }
}
