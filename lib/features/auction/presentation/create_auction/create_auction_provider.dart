import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../catalog/data/catalog_repository.dart';
import '../../data/auction_repository.dart';
import '../../data/image_upload_service.dart';
import 'create_auction_state.dart';

final imageUploadServiceProvider = Provider((ref) => ImageUploadService());

class CreateAuctionNotifier extends StateNotifier<CreateAuctionState> {
  final AuctionRepository _auctionRepository;
  final CatalogRepository _catalogRepository;
  final ImageUploadService _imageService;

  CreateAuctionNotifier(this._auctionRepository, this._catalogRepository, this._imageService)
      : super(const CreateAuctionState());

  // Step 1: Basic Info
  void setTitle(String title) {
    state = state.copyWith(
      title: title,
      titleError: _validateTitle(title),
    );
  }

  void setDescription(String description) {
    state = state.copyWith(
      description: description,
      descriptionError: _validateDescription(description),
    );
  }

  void setCategory(String categoryId) async {
    print('CreateAuctionProvider: Setting category to $categoryId');
    state = state.copyWith(
      categoryId: categoryId,
      categoryError: null,
      isLoadingSchema: true,
      schemaError: null,
      categorySchema: null,
      dynamicFields: {},
      dynamicFieldErrors: {},
    );

    try {
      print('CreateAuctionProvider: Fetching schema for category $categoryId');
      final schema = await _catalogRepository.getCategorySchema(categoryId);
      print('CreateAuctionProvider: Successfully fetched schema with ${schema.length} keys');
      state = state.copyWith(
        categorySchema: schema,
        isLoadingSchema: false,
      );
    } catch (e) {
      print('CreateAuctionProvider: Failed to fetch schema for category $categoryId: $e');
      state = state.copyWith(
        schemaError: 'Failed to load category schema',
        isLoadingSchema: false,
      );
    }
  }

  void setType(AuctionType type) {
    state = state.copyWith(type: type);
  }

  // Step 2: Pricing & Duration
  void setStartPrice(String price) {
    state = state.copyWith(
      startPrice: price,
      startPriceError: _validateStartPrice(price),
    );
  }

  void setReservePrice(String price) {
    state = state.copyWith(
      reservePrice: price,
      reservePriceError: _validateReservePrice(price, state.startPrice),
    );
  }

  void setStartTime(DateTime time) {
    state = state.copyWith(
      startTime: time,
      startTimeError: _validateStartTime(time),
    );
  }

  void setEndTime(DateTime time) {
    state = state.copyWith(
      endTime: time,
      endTimeError: _validateEndTime(time, state.startTime),
    );
  }

  // Step 3: Images
  void addImages(List<File> images) {
    final newImages = [...state.localImages, ...images];
    if (newImages.length > 10) {
      state = state.copyWith(
        imagesError: 'Maximum 10 images allowed',
      );
      return;
    }

    state = state.copyWith(
      localImages: newImages,
      imagesError: null,
    );
  }

  void removeImage(int index) {
    final newImages = [...state.localImages];
    newImages.removeAt(index);
    state = state.copyWith(localImages: newImages);
  }

  void reorderImages(int oldIndex, int newIndex) {
    final newImages = [...state.localImages];
    final image = newImages.removeAt(oldIndex);
    newImages.insert(newIndex, image);
    state = state.copyWith(localImages: newImages);
  }

  // Dynamic Fields
  void setDynamicField(String fieldName, dynamic value) {
    final newFields = Map<String, dynamic>.from(state.dynamicFields);
    newFields[fieldName] = value;

    final newErrors = Map<String, String>.from(state.dynamicFieldErrors);
    newErrors.remove(fieldName); // Clear error when user changes value

    state = state.copyWith(
      dynamicFields: newFields,
      dynamicFieldErrors: newErrors,
    );
  }

  void setDynamicFieldError(String fieldName, String error) {
    final newErrors = Map<String, String>.from(state.dynamicFieldErrors);
    if (error.isEmpty) {
      newErrors.remove(fieldName);
    } else {
      newErrors[fieldName] = error;
    }
    state = state.copyWith(dynamicFieldErrors: newErrors);
  }

  // Step 4: Tags
  void addTag(String tag) {
    if (state.tags.length >= 20) {
      return;
    }
    if (tag.isEmpty || tag.length > 50) {
      return;
    }
    state = state.copyWith(tags: [...state.tags, tag]);
  }

  void removeTag(String tag) {
    state = state.copyWith(
      tags: state.tags.where((t) => t != tag).toList(),
    );
  }

  // Navigation
  void nextStep() {
    if (_validateCurrentStep()) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void goToStep(int step) {
    state = state.copyWith(currentStep: step);
  }

  // Submission
  Future<bool> submitAuction() async {
    if (!_validateAllSteps()) {
      return false;
    }

    state = state.copyWith(isSubmitting: true, error: null);

    try {
      // Generate temporary auction ID for image upload
      final tempAuctionId = DateTime.now().millisecondsSinceEpoch.toString();

      // Upload images
      state = state.copyWith(isUploadingImages: true);
      final imageUrls = await _imageService.uploadMultipleImages(
        state.localImages,
        tempAuctionId,
      );
      state = state.copyWith(
        uploadedImageUrls: imageUrls,
        isUploadingImages: false,
      );

      // Create auction
      await _auctionRepository.createAuction(
        title: state.title,
        description: state.description,
        startPrice: double.parse(state.startPrice!),
        reservePrice: state.reservePrice != null && state.reservePrice!.isNotEmpty
            ? double.parse(state.reservePrice!)
            : null,
        categoryId: state.categoryId!,
        startTime: state.startTime!,
        endTime: state.endTime!,
        type: state.type.name,
        images: imageUrls,
        tags: state.tags,
        dynamicFields: state.dynamicFields,
      );

      state = state.copyWith(isSubmitting: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: e.toString(),
      );
      return false;
    }
  }

  // Validation helpers
  String? _validateTitle(String title) {
    if (title.trim().isEmpty) {
      return 'Title is required';
    }
    if (title.trim().length < 3) {
      return 'Title must be at least 3 characters';
    }
    if (title.trim().length > 200) {
      return 'Title must not exceed 200 characters';
    }
    return null;
  }

  String? _validateDescription(String description) {
    if (description.trim().isEmpty) {
      return 'Description is required';
    }
    if (description.trim().length < 10) {
      return 'Description must be at least 10 characters';
    }
    if (description.trim().length > 5000) {
      return 'Description must not exceed 5000 characters';
    }
    return null;
  }

  String? _validateStartPrice(String price) {
    if (price.isEmpty) {
      return 'Start price is required';
    }
    final parsed = double.tryParse(price);
    if (parsed == null) {
      return 'Invalid price';
    }
    if (parsed <= 0) {
      return 'Price must be greater than 0';
    }
    return null;
  }

  String? _validateReservePrice(String? reservePrice, String? startPrice) {
    if (reservePrice == null || reservePrice.isEmpty) {
      return null; // Reserve price is optional
    }
    final reserve = double.tryParse(reservePrice);
    if (reserve == null) {
      return 'Invalid price';
    }
    if (startPrice != null && startPrice.isNotEmpty) {
      final start = double.tryParse(startPrice);
      if (start != null && reserve < start) {
        return 'Reserve price must be >= start price';
      }
    }
    return null;
  }

  String? _validateStartTime(DateTime? time) {
    if (time == null) {
      return 'Start time is required';
    }
    if (time.isBefore(DateTime.now())) {
      return 'Start time must be in the future';
    }
    return null;
  }

  String? _validateEndTime(DateTime? endTime, DateTime? startTime) {
    if (endTime == null) {
      return 'End time is required';
    }
    if (startTime != null && endTime.isBefore(startTime)) {
      return 'End time must be after start time';
    }
    if (startTime != null) {
      final duration = endTime.difference(startTime);
      if (duration.inDays > 30) {
        return 'Duration  must not exceed 30 days';
      }
    }
    return null;
  }

  bool _validateCurrentStep() {
    switch (state.currentStep) {
      case 0: // Basic Info
        final titleError = _validateTitle(state.title);
        final descriptionError = _validateDescription(state.description);
        final categoryError =
            state.categoryId == null ? 'Category is required' : null;
        
        // Validate dynamic fields if schema is present
        final dynamicFieldErrors = <String, String>{};
        if (state.categorySchema != null) {
          final fields = _extractFieldsFromSchema(state.categorySchema!);
          for (final field in fields) {
            final fieldName = field['name'] as String;
            final error = _validateDynamicField(field, state.dynamicFields[fieldName]);
            if (error != null) {
              dynamicFieldErrors[fieldName] = error;
            }
          }
        }

        state = state.copyWith(
          titleError: titleError,
          descriptionError: descriptionError,
          categoryError: categoryError,
          dynamicFieldErrors: dynamicFieldErrors,
        );

        return titleError == null &&
            descriptionError == null &&
            categoryError == null &&
            dynamicFieldErrors.isEmpty;

      case 1: // Pricing & Duration
        final startPriceError = _validateStartPrice(state.startPrice ?? '');
        final reservePriceError =
            _validateReservePrice(state.reservePrice, state.startPrice);
        final startTimeError = _validateStartTime(state.startTime);
        final endTimeError = _validateEndTime(state.endTime, state.startTime);

        state = state.copyWith(
          startPriceError: startPriceError,
          reservePriceError: reservePriceError,
          startTimeError: startTimeError,
          endTimeError: endTimeError,
        );

        return startPriceError == null &&
            reservePriceError == null &&
            startTimeError == null &&
            endTimeError == null;

      case 2: // Images
        if (state.localImages.isEmpty) {
          state = state.copyWith(
            imagesError: 'At least one image is required',
          );
          return false;
        }
        return true;

      default:
        return true;
    }
  }

  bool _validateAllSteps() {
    return _validateCurrentStep();
  }

  List<Map<String, dynamic>> _extractFieldsFromSchema(Map<String, dynamic> schema) {
    final sections = schema['sections'] as List<dynamic>? ?? [];
    final fields = <Map<String, dynamic>>[];
    
    if (sections.isNotEmpty) {
      for (final section in sections) {
        final sectionData = section as Map<String, dynamic>;
        final sectionFields = sectionData['fields'] as List<dynamic>? ?? [];
        fields.addAll(sectionFields.map((f) => f as Map<String, dynamic>));
      }
    } else {
      final directFields = schema['fields'] as List<dynamic>? ?? [];
      fields.addAll(directFields.map((f) => f as Map<String, dynamic>));
    }
    
    return fields;
  }

  String? _validateDynamicField(Map<String, dynamic> field, dynamic value) {
    final required = field['required'] as bool? ?? false;
    final validation = field['validation'] as Map<String, dynamic>? ?? {};
    
    // Check required
    if (required && (value == null || (value is String && value.isEmpty))) {
      return 'This field is required';
    }
    
    // Skip further validation if empty and not required
    if (value == null || (value is String && value.isEmpty)) {
      return null;
    }
    
    // Type-specific validation
    final type = field['type'] as String;
    switch (type) {
      case 'email':
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value.toString())) {
          return 'Invalid email address';
        }
        break;
      case 'url':
        final urlRegex = RegExp(r'^https?://');
        if (!urlRegex.hasMatch(value.toString())) {
          return 'Invalid URL (must start with http:// or https://)';
        }
        break;
      case 'phone':
        final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]+$');
        if (!phoneRegex.hasMatch(value.toString())) {
          return 'Invalid phone number';
        }
        break;
      case 'number':
        final numValue = num.tryParse(value.toString());
        if (numValue == null) {
          return 'Invalid number';
        }
        final min = validation['minimum'] as num?;
        final max = validation['maximum'] as num?;
        if (min != null && numValue < min) {
          return 'Minimum value is $min';
        }
        if (max != null && numValue > max) {
          return 'Maximum value is $max';
        }
        break;
    }
    
    // General validation
    final minLength = validation['minLength'] as int?;
    final maxLength = validation['maxLength'] as int?;
    final pattern = validation['pattern'] as String?;
    
    if (minLength != null && value.toString().length < minLength) {
      return 'Minimum $minLength characters required';
    }
    if (maxLength != null && value.toString().length > maxLength) {
      return 'Maximum $maxLength characters allowed';
    }
    if (pattern != null) {
      final regex = RegExp(pattern);
      if (!regex.hasMatch(value.toString())) {
        return 'Invalid format';
      }
    }
    
    return null;
  }
}

final createAuctionProvider =
    StateNotifierProvider<CreateAuctionNotifier, CreateAuctionState>((ref) {
  final auctionRepository = ref.watch(auctionRepositoryProvider);
  final catalogRepository = ref.watch(catalogRepositoryProvider);
  final imageService = ref.watch(imageUploadServiceProvider);
  return CreateAuctionNotifier(auctionRepository, catalogRepository, imageService);
});
