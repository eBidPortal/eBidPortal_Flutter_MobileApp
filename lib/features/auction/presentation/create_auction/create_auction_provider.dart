import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../catalog/domain/category.dart';
import 'package:auctions/core/network/api_client.dart';
import '../../data/auction_repository.dart';
import '../../data/image_upload_service.dart';
import 'create_auction_state.dart';


class CreateAuctionNotifier extends StateNotifier<CreateAuctionState> {
  final AuctionRepository _auctionRepository;
  final ImageUploadService _imageService;

  CreateAuctionNotifier(this._auctionRepository, this._imageService)
    : super(const CreateAuctionState());

  // Location setters
  void setCountry(Map<String, dynamic>? country) {
    state = state.copyWith(country: country);
  }
  void setState(Map<String, dynamic>? stateVal) {
    state = state.copyWith(state: stateVal);
  }
  void setCity(Map<String, dynamic>? city) {
    state = state.copyWith(city: city);
  }

  // Step 1: Basic Info
  void setTitle(String title) {
    state = state.copyWith(title: title, titleError: _validateTitle(title));
  }

  void setDescription(String description) {
    state = state.copyWith(
      description: description,
      descriptionError: _validateDescription(description),
    );
  }

  void setCategory(Category category) {
    print(
      'CreateAuctionProvider: Setting category to ${category.id} (${category.name})',
    );
    state = state.copyWith(
      categoryId: category.id,
      categoryError: null,
      dynamicFields: {},
      dynamicFieldErrors: {},
    );
  }

  void setStatus(AuctionStatus status) {
    state = state.copyWith(status: status);
  }

  void setType(AuctionType type) {
    state = state.copyWith(type: type);
  }

  // Professional Auction Fields
  void setAuthenticationRequired(bool required) {
    state = state.copyWith(authenticationRequired: required);
  }

  void setShippingIncluded(bool included) {
    state = state.copyWith(shippingIncluded: included);
  }

  void setBidIncrement(String increment) {
    state = state.copyWith(
      bidIncrement: increment,
      bidIncrementError: _validateBidIncrement(increment),
    );
  }

  void setCommissionRate(String rate) {
    state = state.copyWith(
      commissionRate: rate,
      commissionRateError: _validateCommissionRate(rate),
    );
  }

  void setBuyerPremium(String premium) {
    state = state.copyWith(
      buyerPremium: premium,
      buyerPremiumError: _validateBuyerPremium(premium),
    );
  }

  void setTimezone(String timezone) {
    state = state.copyWith(
      timezone: timezone,
      timezoneError: _validateTimezone(timezone),
    );
  }

  void setPaymentTerms(Map<String, dynamic> terms) {
    state = state.copyWith(paymentTerms: terms);
  }

  void setLotNumber(String lotNumber) {
    state = state.copyWith(
      lotNumber: lotNumber,
      lotNumberError: _validateLotNumber(lotNumber),
    );
  }

  void setReserveVisible(bool visible) {
    state = state.copyWith(reserveVisible: visible);
  }

  void setBusinessLicense(String license) {
    state = state.copyWith(
      businessLicense: license,
      businessLicenseError: _validateBusinessLicense(license),
    );
  }

  void setSellerRating(String rating) {
    state = state.copyWith(
      sellerRating: rating,
      sellerRatingError: _validateSellerRating(rating),
    );
  }

  void setCatalogReference(String reference) {
    state = state.copyWith(
      catalogReference: reference,
      catalogReferenceError: _validateCatalogReference(reference),
    );
  }

  void setAuctioneerNotes(String notes) {
    state = state.copyWith(
      auctioneerNotes: notes,
      auctioneerNotesError: _validateAuctioneerNotes(notes),
    );
  }

  void setConditionReport(String report) {
    state = state.copyWith(conditionReport: report);
  }

  void setAppraisalCertificate(String certificate) {
    state = state.copyWith(
      appraisalCertificate: certificate,
      appraisalCertificateError: _validateAppraisalCertificate(certificate),
    );
  }

  void setBiddingRules(String rules) {
    state = state.copyWith(biddingRules: rules);
  }

  void setFinancingOptions(List<Map<String, dynamic>> options) {
    state = state.copyWith(financingOptions: options);
  }

  void setInsuranceRequired(bool required) {
    state = state.copyWith(insuranceRequired: required);
  }

  void setPickupAvailable(bool available) {
    state = state.copyWith(pickupAvailable: available);
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

  void setCurrentPrice(String price) {
    state = state.copyWith(
      currentPrice: price,
      currentPriceError: _validateCurrentPrice(price, state.startPrice),
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
      state = state.copyWith(imagesError: 'Maximum 10 images allowed');
      return;
    }

    state = state.copyWith(localImages: newImages, imagesError: null);
  }

  void removeImage(int index) {
    final newImages = [...state.localImages];
    newImages.removeAt(index);
    state = state.copyWith(localImages: newImages);
  }

  void setUploadProgress(double progress) {
    state = state.copyWith(uploadProgress: progress);
  }

  void setImageUploadError(String error) {
    state = state.copyWith(imagesError: error, isUploadingImages: false);
  }

  void clearImageUploadError() {
    state = state.copyWith(imagesError: null);
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
    state = state.copyWith(tags: state.tags.where((t) => t != tag).toList());
  }

  void setTags(List<String> tags) {
    state = state.copyWith(tags: tags);
  }

  void setReturnPolicy(String? policy) {
    state = state.copyWith(returnPolicy: policy);
  }

  // Bulk update method for advanced settings
  void updateAuctionSettings({
    double? startPrice,
    double? reservePrice,
    DateTime? startTime,
    DateTime? endTime,
    String? auctionType,
    List<String>? tags,
    String? returnPolicy,
    String? bidIncrement,
    String? commissionRate,
    String? buyerPremium,
    String? timezone,
    String? lotNumber,
    bool? authenticationRequired,
    bool? shippingIncluded,
    bool? reserveVisible,
    Map<String, dynamic>? paymentTerms,
    String? conditionReport,
    String? biddingRules,
    List<Map<String, dynamic>>? financingOptions,
  }) {
    state = state.copyWith(
      startPrice: startPrice?.toString(),
      reservePrice: reservePrice?.toString(),
      startTime: startTime,
      endTime: endTime,
      type: auctionType != null ? _parseAuctionType(auctionType) : state.type,
      tags: tags ?? state.tags,
      returnPolicy: returnPolicy,
      bidIncrement: bidIncrement,
      commissionRate: commissionRate,
      buyerPremium: buyerPremium,
      timezone: timezone,
      lotNumber: lotNumber,
      authenticationRequired: authenticationRequired ?? state.authenticationRequired,
      shippingIncluded: shippingIncluded ?? state.shippingIncluded,
      reserveVisible: reserveVisible ?? state.reserveVisible,
      paymentTerms: paymentTerms ?? state.paymentTerms,
      conditionReport: conditionReport ?? state.conditionReport,
      biddingRules: biddingRules ?? state.biddingRules,
      financingOptions: financingOptions ?? state.financingOptions,
    );
  }

  AuctionType _parseAuctionType(String type) {
    switch (type.toLowerCase()) {
      case 'english':
        return AuctionType.english;
      case 'dutch':
        return AuctionType.dutch;
      case 'sealed_bid':
      case 'sealed':
        return AuctionType.sealed;
      case 'reverse':
        return AuctionType.reverse;
      default:
        return AuctionType.english;
    }
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
    print('🔄 CreateAuctionProvider: Starting auction submission');
    print('🔄 State before validation:');
    print('  - Category ID: ${state.categoryId}');
    print('  - Start Price: ${state.startPrice}');
    print('  - Reserve Price: ${state.reservePrice}');
    print('  - Start Time: ${state.startTime}');
    print('  - End Time: ${state.endTime}');
    print('  - Dynamic Fields: ${state.dynamicFields}');
    print('  - Tags: ${state.tags}');
    print('  - Return Policy: ${state.returnPolicy}');

    if (!_validateAllSteps()) {
      print('🔴 CreateAuctionProvider: Validation failed');
      print('  - Category Error: ${state.categoryError}');
      print('  - Start Price Error: ${state.startPriceError}');
      print('  - Reserve Price Error: ${state.reservePriceError}');
      print('  - Start Time Error: ${state.startTimeError}');
      print('  - End Time Error: ${state.endTimeError}');
      
      // Set a more specific error message for validation failures
      final validationErrors = [
        if (state.categoryError != null) 'Category: ${state.categoryError!}',
        if (state.startPriceError != null) 'Start Price: ${state.startPriceError!}',
        if (state.reservePriceError != null) 'Reserve Price: ${state.reservePriceError!}',
        if (state.startTimeError != null) 'Start Time: ${state.startTimeError!}',
        if (state.endTimeError != null) 'End Time: ${state.endTimeError!}',
        if (!_hasValidTitleField()) 'Product Name: Please fill in a title/name field',
      ];
      
      state = state.copyWith(error: validationErrors.join('\n'));
      return false;
    }

    print('✅ CreateAuctionProvider: Validation passed');
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      // Generate temporary auction ID for image upload
      final tempAuctionId = DateTime.now().millisecondsSinceEpoch.toString();

      // Upload images with progress tracking
      if (state.localImages.isNotEmpty) {
        state = state.copyWith(isUploadingImages: true, uploadProgress: 0.0);
        
        try {
          final imageResults = await _imageService.uploadMultipleImages(
            state.localImages,
            tempAuctionId,
          );
          final imageUrls = imageResults.map((result) => result.url).toList();
          state = state.copyWith(
            uploadedImageUrls: imageUrls,
            isUploadingImages: false,
            uploadProgress: 1.0,
          );
        } catch (e) {
          state = state.copyWith(
            isUploadingImages: false,
            imagesError: 'Failed to upload images: ${e.toString()}',
          );
          return false;
        }
      }

      // Prepare dynamic fields including bidding rules
      final dynamicFieldsWithBiddingRules = Map<String, dynamic>.from(state.dynamicFields);
      if (state.biddingRules != null && state.biddingRules!.isNotEmpty) {
        // Try to parse as JSON, otherwise treat as string description
        try {
          dynamicFieldsWithBiddingRules['bidding_rules'] = state.biddingRules!.startsWith('{') 
            ? jsonDecode(state.biddingRules!) 
            : {'description': state.biddingRules};
        } catch (e) {
          dynamicFieldsWithBiddingRules['bidding_rules'] = {'description': state.biddingRules};
        }
      }

      // Create auction with simplified API structure
      // All product data comes from dynamic template fields, not hardcoded title/description
      await _auctionRepository.createAuction(
        title:
            '', // Will be used as fallback only if productName not in template
        description:
            '', // Will be used as fallback only if description not in template
        startPrice: double.parse(state.startPrice!),
        currentPrice: state.currentPrice != null && state.currentPrice!.isNotEmpty
            ? double.parse(state.currentPrice!)
            : null,
        reservePrice:
            state.reservePrice != null && state.reservePrice!.isNotEmpty
            ? double.parse(state.reservePrice!)
            : null,
        categoryId: state.categoryId!,
        startTime: state.startTime!,
        endTime: state.endTime!,
        type: state.type.name,
        images: state.uploadedImageUrls,
        tags: state.tags,
        dynamicFields:
            dynamicFieldsWithBiddingRules, // This contains all category template data including bidding rules
        returnPolicy: state.returnPolicy,
        // Professional auction fields
        authenticationRequired: state.authenticationRequired,
        shippingIncluded: state.shippingIncluded,
        bidIncrement: state.bidIncrement != null && state.bidIncrement!.isNotEmpty
            ? double.parse(state.bidIncrement!)
            : null,
        commissionRate: state.commissionRate != null && state.commissionRate!.isNotEmpty
            ? double.parse(state.commissionRate!)
            : null,
        buyerPremium: state.buyerPremium != null && state.buyerPremium!.isNotEmpty
            ? double.parse(state.buyerPremium!)
            : null,
        timezone: state.timezone,
        paymentTerms: state.paymentTerms,
        lotNumber: state.lotNumber,
        reserveVisible: state.reserveVisible,
        businessLicense: state.businessLicense,
        sellerRating: state.sellerRating,
        catalogReference: state.catalogReference,
        auctioneerNotes: state.auctioneerNotes,
        conditionReport: state.conditionReport,
        appraisalCertificate: state.appraisalCertificate,
        // biddingRules: state.biddingRules, // Removed - now part of dynamicFields
        financingOptions: state.financingOptions,
        insuranceRequired: state.insuranceRequired,
        pickupAvailable: state.pickupAvailable,
        status: state.status.name,
      );

      state = state.copyWith(isSubmitting: false);
      print('✅ CreateAuctionProvider: Auction created successfully');
      return true;
    } catch (e) {
      print('🔴 CreateAuctionProvider: Error creating auction: $e');
      print('🔴 CreateAuctionProvider: Error type: ${e.runtimeType}');
      if (e is Exception) {
        print('🔴 CreateAuctionProvider: Exception details: ${e.toString()}');
      }
      state = state.copyWith(isSubmitting: false, error: e.toString());
      return false;
    }
  }

  void updateDynamicField(String key, dynamic value) {
    final updatedFields = Map<String, dynamic>.from(state.dynamicFields);
    updatedFields[key] = value;
    state = state.copyWith(dynamicFields: updatedFields);
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

  String? _validateCurrentPrice(String? currentPrice, String? startPrice) {
    if (currentPrice == null || currentPrice.isEmpty) {
      return null; // Current price is optional, will default to start price
    }
    final current = double.tryParse(currentPrice);
    if (current == null) {
      return 'Invalid price';
    }
    if (current <= 0) {
      return 'Price must be greater than 0';
    }
    if (startPrice != null && startPrice.isNotEmpty) {
      final start = double.tryParse(startPrice);
      if (start != null && current < start) {
        return 'Current price must be >= start price';
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

  String? _validateBusinessLicense(String? license) {
    if (license == null || license.isEmpty) {
      return null; // Business license is optional
    }
    if (license.length < 3) {
      return 'Business license must be at least 3 characters';
    }
    if (license.length > 50) {
      return 'Business license must not exceed 50 characters';
    }
    return null;
  }

  String? _validateSellerRating(String? rating) {
    if (rating == null || rating.isEmpty) {
      return null; // Seller rating is optional
    }
    final parsed = double.tryParse(rating);
    if (parsed == null) {
      return 'Invalid rating';
    }
    if (parsed < 0 || parsed > 5) {
      return 'Rating must be between 0 and 5';
    }
    return null;
  }

  String? _validateCatalogReference(String? reference) {
    if (reference == null || reference.isEmpty) {
      return null; // Catalog reference is optional
    }
    if (reference.length < 3) {
      return 'Catalog reference must be at least 3 characters';
    }
    if (reference.length > 200) {
      return 'Catalog reference must not exceed 200 characters';
    }
    return null;
  }

  String? _validateAuctioneerNotes(String? notes) {
    if (notes == null || notes.isEmpty) {
      return null; // Auctioneer notes are optional
    }
    if (notes.length > 1000) {
      return 'Auctioneer notes must not exceed 1000 characters';
    }
    return null;
  }

  String? _validateAppraisalCertificate(String? certificate) {
    if (certificate == null || certificate.isEmpty) {
      return null; // Appraisal certificate is optional
    }
    // Basic URL validation
    if (!certificate.startsWith('http://') && !certificate.startsWith('https://')) {
      return 'Appraisal certificate must be a valid URL';
    }
    return null;
  }

  bool _validateCurrentStep() {
    switch (state.currentStep) {
      case 0: // Category Template Fields - validation handled by EnhancedDynamicFieldsForm
        final categoryError = state.categoryId == null
            ? 'Category is required'
            : null;

        // Dynamic field validation is now handled by EnhancedDynamicFieldsForm
        // We only check if category is selected and at least productName exists in dynamic fields
        final hasProductName =
            state.dynamicFields.containsKey('productName') &&
            state.dynamicFields['productName']?.toString().trim().isNotEmpty ==
                true;

        state = state.copyWith(
          categoryError: categoryError,
          titleError: null, // Clear old title/description errors
          descriptionError: null,
        );

        return categoryError == null && hasProductName;

      case 1: // Pricing & Duration
        final startPriceError = _validateStartPrice(state.startPrice ?? '');
        final reservePriceError = _validateReservePrice(
          state.reservePrice,
          state.startPrice,
        );
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
          state = state.copyWith(imagesError: 'At least one image is required');
          return false;
        }
        return true;

      default:
        return true;
    }
  }

  bool _validateAllSteps() {
    // For tab-based UI, validate all required fields across both tabs

    // Tab 1: Category Template Fields
    final categoryError = state.categoryId == null
        ? 'Category is required'
        : null;
    
    // Check for title field - can be productName, property_title, listing_title, etc.
    final hasTitle = _hasValidTitleField();
    if (!hasTitle) {
      print('🔴 CreateAuctionProvider: No valid title field found in dynamic fields: ${state.dynamicFields.keys}');
    }

    // Tab 2: Advanced Settings
    final startPriceError = _validateStartPrice(state.startPrice ?? '');
    final reservePriceError = _validateReservePrice(
      state.reservePrice,
      state.startPrice,
    );
    final startTimeError = _validateStartTime(state.startTime);
    final endTimeError = _validateEndTime(state.endTime, state.startTime);

    // Update state with any validation errors
    state = state.copyWith(
      categoryError: categoryError,
      startPriceError: startPriceError,
      reservePriceError: reservePriceError,
      startTimeError: startTimeError,
      endTimeError: endTimeError,
      titleError: null, // Clear legacy errors
      descriptionError: null,
      imagesError: null, // Images are optional in new structure
    );

    final isValid = categoryError == null &&
        hasTitle &&
        startPriceError == null &&
        reservePriceError == null &&
        startTimeError == null &&
        endTimeError == null;
        
    if (!isValid) {
      print('🔴 CreateAuctionProvider: Validation failed details:');
      print('  - Category valid: ${categoryError == null}');
      print('  - Has title: $hasTitle');
      print('  - Start price valid: ${startPriceError == null}');
      print('  - Reserve price valid: ${reservePriceError == null}');
      print('  - Start time valid: ${startTimeError == null}');
      print('  - End time valid: ${endTimeError == null}');
    }
        
    return isValid;
  }
  
  bool _hasValidTitleField() {
    // Check for common title field names used in different category templates
    final titleFields = [
      // Product-related titles
      'productName',
      'product_title',
      'item_title',
      
      // Property-related titles  
      'property_title',
      'clear_title',
      
      // Vehicle/listing-related titles
      'listing_title',
      'ad_title',
      
      // Job-related titles
      'job_title',
      
      // Space/service-related titles
      'space_title',
      'service_title',
      
      // Generic titles
      'title',
      'name',
    ];
    
    for (String field in titleFields) {
      if (state.dynamicFields.containsKey(field) &&
          state.dynamicFields[field]?.toString().trim().isNotEmpty == true) {
        return true;
      }
    }
    
    return false;
  }

  // Validation methods for professional auction fields
  String? _validateBidIncrement(String? increment) {
    if (increment == null || increment.isEmpty) {
      return null; // Optional field
    }
    final value = double.tryParse(increment);
    if (value == null) {
      return 'Bid increment must be a valid number';
    }
    if (value <= 0) {
      return 'Bid increment must be greater than 0';
    }
    if (value > 1000000) {
      return 'Bid increment must not exceed 1,000,000';
    }
    return null;
  }

  String? _validateCommissionRate(String? rate) {
    if (rate == null || rate.isEmpty) {
      return null; // Optional field
    }
    final value = double.tryParse(rate);
    if (value == null) {
      return 'Commission rate must be a valid number';
    }
    if (value < 0 || value > 1) {
      return 'Commission rate must be between 0 and 1 (0% to 100%)';
    }
    return null;
  }

  String? _validateBuyerPremium(String? premium) {
    if (premium == null || premium.isEmpty) {
      return null; // Optional field
    }
    final value = double.tryParse(premium);
    if (value == null) {
      return 'Buyer premium must be a valid number';
    }
    if (value < 0 || value > 1) {
      return 'Buyer premium must be between 0 and 1 (0% to 100%)';
    }
    return null;
  }

  String? _validateTimezone(String? timezone) {
    if (timezone == null || timezone.isEmpty) {
      return null; // Optional field
    }
    // Basic timezone validation - could be enhanced with a proper timezone library
    if (timezone.length < 3 || timezone.length > 50) {
      return 'Timezone must be between 3 and 50 characters';
    }
    return null;
  }

  String? _validateLotNumber(String? lotNumber) {
    if (lotNumber == null || lotNumber.isEmpty) {
      return null; // Optional field
    }
    if (lotNumber.length > 50) {
      return 'Lot number must not exceed 50 characters';
    }
    return null;
  }
}

final createAuctionProvider =
    StateNotifierProvider<CreateAuctionNotifier, CreateAuctionState>((ref) {
      final auctionRepository = ref.watch(auctionRepositoryProvider);
      final apiClient = ref.watch(apiClientProvider);
      final imageService = ImageUploadService(apiClient);
      return CreateAuctionNotifier(auctionRepository, imageService);
    });
