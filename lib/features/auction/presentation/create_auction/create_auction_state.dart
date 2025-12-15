import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_auction_state.freezed.dart';

enum AuctionType {
  english,
  dutch,
  sealed,
  reverse,
}

enum AuctionStatus {
  pending,
  active,
  ended,
  cancelled,
}

@freezed
class CreateAuctionState with _$CreateAuctionState {
  const factory CreateAuctionState({
      // Location
      Map<String, dynamic>? country,
      Map<String, dynamic>? state,
      Map<String, dynamic>? city,
    //  Step 1: Basic Info
    @Default('') String title,
    @Default('') String description,
    String? categoryId,
    @Default(AuctionType.english) AuctionType type,
    @Default(AuctionStatus.pending) AuctionStatus status,

    // Dynamic Fields
    @Default({}) Map<String, dynamic> dynamicFields,

    // Step 2: Pricing & Duration
    String? startPrice,
    String? reservePrice,
    String? currentPrice,
    DateTime? startTime,
    DateTime? endTime,

    // Step 3: Images
    @Default([]) List<File> localImages,
    @Default([]) List<String> uploadedImageUrls,
    @Default(false) bool isUploadingImages,
    @Default(0.0) double uploadProgress,

    // Step 4: Additional Details
    @Default([]) List<String> tags,
    String? returnPolicy,

    // Professional Auction Fields
    @Default(false) bool authenticationRequired,
    @Default(false) bool shippingIncluded,
    String? bidIncrement,
    String? commissionRate,
    String? buyerPremium,
    String? timezone,
    @Default({}) Map<String, dynamic> paymentTerms,
    String? lotNumber,
    @Default(false) bool reserveVisible,
    String? businessLicense,
    String? sellerRating,
    String? catalogReference,
    String? auctioneerNotes,
    String? conditionReport,
    String? appraisalCertificate,
    String? biddingRules,
    @Default([]) List<Map<String, dynamic>> financingOptions,
    @Default(false) bool insuranceRequired,
    @Default(false) bool pickupAvailable,

    // Form State
    @Default(0) int currentStep,
    @Default(false) bool isSubmitting,
    String? error,

    // Validation Errors
    String? titleError,
    String? descriptionError,
    String? categoryError,
    String? startPriceError,
    String? reservePriceError,
    String? currentPriceError,
    String? startTimeError,
    String? endTimeError,
    String? imagesError,
    String? bidIncrementError,
    String? commissionRateError,
    String? buyerPremiumError,
    String? timezoneError,
    String? lotNumberError,
    String? businessLicenseError,
    String? sellerRatingError,
    String? catalogReferenceError,
    String? auctioneerNotesError,
    String? appraisalCertificateError,
    @Default({}) Map<String, String> dynamicFieldErrors,
  }) = _CreateAuctionState;
}
