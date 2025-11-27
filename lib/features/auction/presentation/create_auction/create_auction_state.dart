import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_auction_state.freezed.dart';

enum AuctionType {
  english,
  dutch,
  sealed,
  reverse,
}

@freezed
class CreateAuctionState with _$CreateAuctionState {
  const factory CreateAuctionState({
    //  Step 1: Basic Info
    @Default('') String title,
    @Default('') String description,
    String? categoryId,
    @Default(AuctionType.english) AuctionType type,
    
    // Step 2: Pricing & Duration
    String? startPrice,
    String? reservePrice,
   DateTime? startTime,
    DateTime? endTime,
    
    // Step 3: Images
    @Default([]) List<File> localImages,
    @Default([]) List<String> uploadedImageUrls,
    @Default(false) bool isUploadingImages,
    @Default(0.0) double uploadProgress,
    
    // Step 4: Additional Details
    @Default([]) List<String> tags,
    
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
    String? startTimeError,
    String? endTimeError,
    String? imagesError,
  }) = _CreateAuctionState;
}
