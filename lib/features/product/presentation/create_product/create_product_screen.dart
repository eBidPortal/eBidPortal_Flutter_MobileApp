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
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController(text: '1');
  bool _isLoading = false;

  // Dynamic form data
  Map<String, dynamic> _dynamicAttributes = {};
  List<File> _selectedImages = [];
  Map<String, dynamic>? _locationData;

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
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
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
          'city': 'Current Location', // You might want to reverse geocode this
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
      final productData = {
        'productName': _titleController.text, // API expects productName
        'description': _descriptionController.text,
        'product_price': double.parse(_priceController.text), // API expects product_price
        'quantity': int.parse(_quantityController.text),
        'category_id': widget.initialCategory!.id,
        'currency': 'INR',
        'condition': 'new', // Default to new
        'images': _selectedImages.isNotEmpty 
          ? _selectedImages.map((file) => 'uploaded://${file.path}').toList() // Placeholder for uploaded URLs
          : [],
        'dynamic_attributes': _dynamicAttributes,
        if (_locationData != null) 'location': _locationData,
        'shipping_included': true, // Default
        'status': 'pending', // Products start as pending
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
              
              const Text('Product Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                  hintText: 'e.g. iPhone 15 Pro Max',
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Please enter a name' : null,
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 4,
                validator: (value) => value?.isEmpty ?? true ? 'Please enter a description' : null,
              ),
              const SizedBox(height: 16),
              
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(),
                        prefixText: '₹ ',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                         if (value == null || value.isEmpty) return 'Required';
                         if (double.tryParse(value) == null) return 'Invalid price';
                         return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _quantityController,
                      decoration: const InputDecoration(
                        labelText: 'Quantity',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                         if (value == null || value.isEmpty) return 'Required';
                         if (int.tryParse(value) == null) return 'Invalid quantity';
                         return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Image Upload Section
              const Text('Images', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImages,
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Add Images'),
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
              const SizedBox(height: 24),

              // Location Section
              const Text('Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _getCurrentLocation,
                    icon: const Icon(Icons.location_on),
                    label: const Text('Use Current Location'),
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
              const SizedBox(height: 24),

              // Dynamic Attributes Section
              if (_isLoadingTemplate)
                const Center(child: CircularProgressIndicator())
              else if (_template != null) ...[
                const Text('Additional Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ..._buildDynamicFormFields(),
                const SizedBox(height: 24),
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
            initialValue: _dynamicAttributes[fieldKey]?.toString() ?? '',
            decoration: InputDecoration(
              labelText: field.label,
              border: const OutlineInputBorder(),
              hintText: placeholder,
            ),
            validator: field.required ? (value) => value?.isEmpty ?? true ? 'Required' : null : null,
            onChanged: (value) => _dynamicAttributes[fieldKey] = value,
          ),
        );
      
      case 'textarea':
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextFormField(
            initialValue: _dynamicAttributes[fieldKey]?.toString() ?? '',
            decoration: InputDecoration(
              labelText: field.label,
              border: const OutlineInputBorder(),
              hintText: placeholder,
              alignLabelWithHint: true,
            ),
            maxLines: 4,
            validator: field.required ? (value) => value?.isEmpty ?? true ? 'Required' : null : null,
            onChanged: (value) => _dynamicAttributes[fieldKey] = value,
          ),
        );
      
      case 'number':
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextFormField(
            initialValue: _dynamicAttributes[fieldKey]?.toString() ?? '',
            decoration: InputDecoration(
              labelText: field.label,
              border: const OutlineInputBorder(),
              hintText: placeholder,
            ),
            keyboardType: TextInputType.number,
            validator: field.required ? (value) => value?.isEmpty ?? true ? 'Required' : null : null,
            onChanged: (value) => _dynamicAttributes[fieldKey] = double.tryParse(value) ?? value,
          ),
        );
      
      case 'select':
        final options = field.uiConfig['options'] as List<dynamic>? ?? [];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: DropdownButtonFormField<String>(
            value: _dynamicAttributes[fieldKey],
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
            onChanged: (value) => setState(() => _dynamicAttributes[fieldKey] = value),
          ),
        );
      
      default:
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextFormField(
            initialValue: _dynamicAttributes[fieldKey]?.toString() ?? '',
            decoration: InputDecoration(
              labelText: field.label,
              border: const OutlineInputBorder(),
              hintText: placeholder,
            ),
            validator: field.required ? (value) => value?.isEmpty ?? true ? 'Required' : null : null,
            onChanged: (value) => _dynamicAttributes[fieldKey] = value,
          ),
        );
    }
  }
}
