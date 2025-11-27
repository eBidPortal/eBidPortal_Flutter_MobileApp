import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/auction_repository.dart';
import '../../data/image_upload_service.dart';
import 'create_auction_state.dart';

final imageUploadServiceProvider = Provider((ref) => ImageUploadService());

class CreateAuctionNotifier extends StateNotifier<CreateAuctionState> {
  final AuctionRepository _repository;
  final ImageUploadService _imageService;

  CreateAuctionNotifier(this._repository, this._imageService)
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

  void setCategory(String categoryId) {
    state = state.copyWith(
      categoryId: categoryId,
      categoryError: null,
    );
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
      await _repository.createAuction(
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

        state = state.copyWith(
          titleError: titleError,
          descriptionError: descriptionError,
          categoryError: categoryError,
        );

        return titleError == null &&
            descriptionError == null &&
            categoryError == null;

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
}

final createAuctionProvider =
    StateNotifierProvider<CreateAuctionNotifier, CreateAuctionState>((ref) {
  final repository = ref.watch(auctionRepositoryProvider);
  final imageService = ref.watch(imageUploadServiceProvider);
  return CreateAuctionNotifier(repository, imageService);
});
