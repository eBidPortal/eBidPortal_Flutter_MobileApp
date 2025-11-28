// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_auction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CreateAuctionState {
  //  Step 1: Basic Info
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  AuctionType get type => throw _privateConstructorUsedError; // Dynamic Fields
  Map<String, dynamic> get dynamicFields =>
      throw _privateConstructorUsedError; // Step 2: Pricing & Duration
  String? get startPrice => throw _privateConstructorUsedError;
  String? get reservePrice => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError; // Step 3: Images
  List<File> get localImages => throw _privateConstructorUsedError;
  List<String> get uploadedImageUrls => throw _privateConstructorUsedError;
  bool get isUploadingImages => throw _privateConstructorUsedError;
  double get uploadProgress =>
      throw _privateConstructorUsedError; // Step 4: Additional Details
  List<String> get tags => throw _privateConstructorUsedError; // Form State
  int get currentStep => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError; // Validation Errors
  String? get titleError => throw _privateConstructorUsedError;
  String? get descriptionError => throw _privateConstructorUsedError;
  String? get categoryError => throw _privateConstructorUsedError;
  String? get startPriceError => throw _privateConstructorUsedError;
  String? get reservePriceError => throw _privateConstructorUsedError;
  String? get startTimeError => throw _privateConstructorUsedError;
  String? get endTimeError => throw _privateConstructorUsedError;
  String? get imagesError => throw _privateConstructorUsedError;
  Map<String, String> get dynamicFieldErrors =>
      throw _privateConstructorUsedError;

  /// Create a copy of CreateAuctionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateAuctionStateCopyWith<CreateAuctionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAuctionStateCopyWith<$Res> {
  factory $CreateAuctionStateCopyWith(
    CreateAuctionState value,
    $Res Function(CreateAuctionState) then,
  ) = _$CreateAuctionStateCopyWithImpl<$Res, CreateAuctionState>;
  @useResult
  $Res call({
    String title,
    String description,
    String? categoryId,
    AuctionType type,
    Map<String, dynamic> dynamicFields,
    String? startPrice,
    String? reservePrice,
    DateTime? startTime,
    DateTime? endTime,
    List<File> localImages,
    List<String> uploadedImageUrls,
    bool isUploadingImages,
    double uploadProgress,
    List<String> tags,
    int currentStep,
    bool isSubmitting,
    String? error,
    String? titleError,
    String? descriptionError,
    String? categoryError,
    String? startPriceError,
    String? reservePriceError,
    String? startTimeError,
    String? endTimeError,
    String? imagesError,
    Map<String, String> dynamicFieldErrors,
  });
}

/// @nodoc
class _$CreateAuctionStateCopyWithImpl<$Res, $Val extends CreateAuctionState>
    implements $CreateAuctionStateCopyWith<$Res> {
  _$CreateAuctionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateAuctionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? categoryId = freezed,
    Object? type = null,
    Object? dynamicFields = null,
    Object? startPrice = freezed,
    Object? reservePrice = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? localImages = null,
    Object? uploadedImageUrls = null,
    Object? isUploadingImages = null,
    Object? uploadProgress = null,
    Object? tags = null,
    Object? currentStep = null,
    Object? isSubmitting = null,
    Object? error = freezed,
    Object? titleError = freezed,
    Object? descriptionError = freezed,
    Object? categoryError = freezed,
    Object? startPriceError = freezed,
    Object? reservePriceError = freezed,
    Object? startTimeError = freezed,
    Object? endTimeError = freezed,
    Object? imagesError = freezed,
    Object? dynamicFieldErrors = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as AuctionType,
            dynamicFields: null == dynamicFields
                ? _value.dynamicFields
                : dynamicFields // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            startPrice: freezed == startPrice
                ? _value.startPrice
                : startPrice // ignore: cast_nullable_to_non_nullable
                      as String?,
            reservePrice: freezed == reservePrice
                ? _value.reservePrice
                : reservePrice // ignore: cast_nullable_to_non_nullable
                      as String?,
            startTime: freezed == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            localImages: null == localImages
                ? _value.localImages
                : localImages // ignore: cast_nullable_to_non_nullable
                      as List<File>,
            uploadedImageUrls: null == uploadedImageUrls
                ? _value.uploadedImageUrls
                : uploadedImageUrls // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isUploadingImages: null == isUploadingImages
                ? _value.isUploadingImages
                : isUploadingImages // ignore: cast_nullable_to_non_nullable
                      as bool,
            uploadProgress: null == uploadProgress
                ? _value.uploadProgress
                : uploadProgress // ignore: cast_nullable_to_non_nullable
                      as double,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            currentStep: null == currentStep
                ? _value.currentStep
                : currentStep // ignore: cast_nullable_to_non_nullable
                      as int,
            isSubmitting: null == isSubmitting
                ? _value.isSubmitting
                : isSubmitting // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            titleError: freezed == titleError
                ? _value.titleError
                : titleError // ignore: cast_nullable_to_non_nullable
                      as String?,
            descriptionError: freezed == descriptionError
                ? _value.descriptionError
                : descriptionError // ignore: cast_nullable_to_non_nullable
                      as String?,
            categoryError: freezed == categoryError
                ? _value.categoryError
                : categoryError // ignore: cast_nullable_to_non_nullable
                      as String?,
            startPriceError: freezed == startPriceError
                ? _value.startPriceError
                : startPriceError // ignore: cast_nullable_to_non_nullable
                      as String?,
            reservePriceError: freezed == reservePriceError
                ? _value.reservePriceError
                : reservePriceError // ignore: cast_nullable_to_non_nullable
                      as String?,
            startTimeError: freezed == startTimeError
                ? _value.startTimeError
                : startTimeError // ignore: cast_nullable_to_non_nullable
                      as String?,
            endTimeError: freezed == endTimeError
                ? _value.endTimeError
                : endTimeError // ignore: cast_nullable_to_non_nullable
                      as String?,
            imagesError: freezed == imagesError
                ? _value.imagesError
                : imagesError // ignore: cast_nullable_to_non_nullable
                      as String?,
            dynamicFieldErrors: null == dynamicFieldErrors
                ? _value.dynamicFieldErrors
                : dynamicFieldErrors // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateAuctionStateImplCopyWith<$Res>
    implements $CreateAuctionStateCopyWith<$Res> {
  factory _$$CreateAuctionStateImplCopyWith(
    _$CreateAuctionStateImpl value,
    $Res Function(_$CreateAuctionStateImpl) then,
  ) = __$$CreateAuctionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String description,
    String? categoryId,
    AuctionType type,
    Map<String, dynamic> dynamicFields,
    String? startPrice,
    String? reservePrice,
    DateTime? startTime,
    DateTime? endTime,
    List<File> localImages,
    List<String> uploadedImageUrls,
    bool isUploadingImages,
    double uploadProgress,
    List<String> tags,
    int currentStep,
    bool isSubmitting,
    String? error,
    String? titleError,
    String? descriptionError,
    String? categoryError,
    String? startPriceError,
    String? reservePriceError,
    String? startTimeError,
    String? endTimeError,
    String? imagesError,
    Map<String, String> dynamicFieldErrors,
  });
}

/// @nodoc
class __$$CreateAuctionStateImplCopyWithImpl<$Res>
    extends _$CreateAuctionStateCopyWithImpl<$Res, _$CreateAuctionStateImpl>
    implements _$$CreateAuctionStateImplCopyWith<$Res> {
  __$$CreateAuctionStateImplCopyWithImpl(
    _$CreateAuctionStateImpl _value,
    $Res Function(_$CreateAuctionStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateAuctionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? categoryId = freezed,
    Object? type = null,
    Object? dynamicFields = null,
    Object? startPrice = freezed,
    Object? reservePrice = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? localImages = null,
    Object? uploadedImageUrls = null,
    Object? isUploadingImages = null,
    Object? uploadProgress = null,
    Object? tags = null,
    Object? currentStep = null,
    Object? isSubmitting = null,
    Object? error = freezed,
    Object? titleError = freezed,
    Object? descriptionError = freezed,
    Object? categoryError = freezed,
    Object? startPriceError = freezed,
    Object? reservePriceError = freezed,
    Object? startTimeError = freezed,
    Object? endTimeError = freezed,
    Object? imagesError = freezed,
    Object? dynamicFieldErrors = null,
  }) {
    return _then(
      _$CreateAuctionStateImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AuctionType,
        dynamicFields: null == dynamicFields
            ? _value._dynamicFields
            : dynamicFields // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        startPrice: freezed == startPrice
            ? _value.startPrice
            : startPrice // ignore: cast_nullable_to_non_nullable
                  as String?,
        reservePrice: freezed == reservePrice
            ? _value.reservePrice
            : reservePrice // ignore: cast_nullable_to_non_nullable
                  as String?,
        startTime: freezed == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        localImages: null == localImages
            ? _value._localImages
            : localImages // ignore: cast_nullable_to_non_nullable
                  as List<File>,
        uploadedImageUrls: null == uploadedImageUrls
            ? _value._uploadedImageUrls
            : uploadedImageUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isUploadingImages: null == isUploadingImages
            ? _value.isUploadingImages
            : isUploadingImages // ignore: cast_nullable_to_non_nullable
                  as bool,
        uploadProgress: null == uploadProgress
            ? _value.uploadProgress
            : uploadProgress // ignore: cast_nullable_to_non_nullable
                  as double,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        currentStep: null == currentStep
            ? _value.currentStep
            : currentStep // ignore: cast_nullable_to_non_nullable
                  as int,
        isSubmitting: null == isSubmitting
            ? _value.isSubmitting
            : isSubmitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        titleError: freezed == titleError
            ? _value.titleError
            : titleError // ignore: cast_nullable_to_non_nullable
                  as String?,
        descriptionError: freezed == descriptionError
            ? _value.descriptionError
            : descriptionError // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryError: freezed == categoryError
            ? _value.categoryError
            : categoryError // ignore: cast_nullable_to_non_nullable
                  as String?,
        startPriceError: freezed == startPriceError
            ? _value.startPriceError
            : startPriceError // ignore: cast_nullable_to_non_nullable
                  as String?,
        reservePriceError: freezed == reservePriceError
            ? _value.reservePriceError
            : reservePriceError // ignore: cast_nullable_to_non_nullable
                  as String?,
        startTimeError: freezed == startTimeError
            ? _value.startTimeError
            : startTimeError // ignore: cast_nullable_to_non_nullable
                  as String?,
        endTimeError: freezed == endTimeError
            ? _value.endTimeError
            : endTimeError // ignore: cast_nullable_to_non_nullable
                  as String?,
        imagesError: freezed == imagesError
            ? _value.imagesError
            : imagesError // ignore: cast_nullable_to_non_nullable
                  as String?,
        dynamicFieldErrors: null == dynamicFieldErrors
            ? _value._dynamicFieldErrors
            : dynamicFieldErrors // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
      ),
    );
  }
}

/// @nodoc

class _$CreateAuctionStateImpl implements _CreateAuctionState {
  const _$CreateAuctionStateImpl({
    this.title = '',
    this.description = '',
    this.categoryId,
    this.type = AuctionType.english,
    final Map<String, dynamic> dynamicFields = const {},
    this.startPrice,
    this.reservePrice,
    this.startTime,
    this.endTime,
    final List<File> localImages = const [],
    final List<String> uploadedImageUrls = const [],
    this.isUploadingImages = false,
    this.uploadProgress = 0.0,
    final List<String> tags = const [],
    this.currentStep = 0,
    this.isSubmitting = false,
    this.error,
    this.titleError,
    this.descriptionError,
    this.categoryError,
    this.startPriceError,
    this.reservePriceError,
    this.startTimeError,
    this.endTimeError,
    this.imagesError,
    final Map<String, String> dynamicFieldErrors = const {},
  }) : _dynamicFields = dynamicFields,
       _localImages = localImages,
       _uploadedImageUrls = uploadedImageUrls,
       _tags = tags,
       _dynamicFieldErrors = dynamicFieldErrors;

  //  Step 1: Basic Info
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final String? categoryId;
  @override
  @JsonKey()
  final AuctionType type;
  // Dynamic Fields
  final Map<String, dynamic> _dynamicFields;
  // Dynamic Fields
  @override
  @JsonKey()
  Map<String, dynamic> get dynamicFields {
    if (_dynamicFields is EqualUnmodifiableMapView) return _dynamicFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dynamicFields);
  }

  // Step 2: Pricing & Duration
  @override
  final String? startPrice;
  @override
  final String? reservePrice;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  // Step 3: Images
  final List<File> _localImages;
  // Step 3: Images
  @override
  @JsonKey()
  List<File> get localImages {
    if (_localImages is EqualUnmodifiableListView) return _localImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localImages);
  }

  final List<String> _uploadedImageUrls;
  @override
  @JsonKey()
  List<String> get uploadedImageUrls {
    if (_uploadedImageUrls is EqualUnmodifiableListView)
      return _uploadedImageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uploadedImageUrls);
  }

  @override
  @JsonKey()
  final bool isUploadingImages;
  @override
  @JsonKey()
  final double uploadProgress;
  // Step 4: Additional Details
  final List<String> _tags;
  // Step 4: Additional Details
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  // Form State
  @override
  @JsonKey()
  final int currentStep;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final String? error;
  // Validation Errors
  @override
  final String? titleError;
  @override
  final String? descriptionError;
  @override
  final String? categoryError;
  @override
  final String? startPriceError;
  @override
  final String? reservePriceError;
  @override
  final String? startTimeError;
  @override
  final String? endTimeError;
  @override
  final String? imagesError;
  final Map<String, String> _dynamicFieldErrors;
  @override
  @JsonKey()
  Map<String, String> get dynamicFieldErrors {
    if (_dynamicFieldErrors is EqualUnmodifiableMapView)
      return _dynamicFieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dynamicFieldErrors);
  }

  @override
  String toString() {
    return 'CreateAuctionState(title: $title, description: $description, categoryId: $categoryId, type: $type, dynamicFields: $dynamicFields, startPrice: $startPrice, reservePrice: $reservePrice, startTime: $startTime, endTime: $endTime, localImages: $localImages, uploadedImageUrls: $uploadedImageUrls, isUploadingImages: $isUploadingImages, uploadProgress: $uploadProgress, tags: $tags, currentStep: $currentStep, isSubmitting: $isSubmitting, error: $error, titleError: $titleError, descriptionError: $descriptionError, categoryError: $categoryError, startPriceError: $startPriceError, reservePriceError: $reservePriceError, startTimeError: $startTimeError, endTimeError: $endTimeError, imagesError: $imagesError, dynamicFieldErrors: $dynamicFieldErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAuctionStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._dynamicFields,
              _dynamicFields,
            ) &&
            (identical(other.startPrice, startPrice) ||
                other.startPrice == startPrice) &&
            (identical(other.reservePrice, reservePrice) ||
                other.reservePrice == reservePrice) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(
              other._localImages,
              _localImages,
            ) &&
            const DeepCollectionEquality().equals(
              other._uploadedImageUrls,
              _uploadedImageUrls,
            ) &&
            (identical(other.isUploadingImages, isUploadingImages) ||
                other.isUploadingImages == isUploadingImages) &&
            (identical(other.uploadProgress, uploadProgress) ||
                other.uploadProgress == uploadProgress) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.titleError, titleError) ||
                other.titleError == titleError) &&
            (identical(other.descriptionError, descriptionError) ||
                other.descriptionError == descriptionError) &&
            (identical(other.categoryError, categoryError) ||
                other.categoryError == categoryError) &&
            (identical(other.startPriceError, startPriceError) ||
                other.startPriceError == startPriceError) &&
            (identical(other.reservePriceError, reservePriceError) ||
                other.reservePriceError == reservePriceError) &&
            (identical(other.startTimeError, startTimeError) ||
                other.startTimeError == startTimeError) &&
            (identical(other.endTimeError, endTimeError) ||
                other.endTimeError == endTimeError) &&
            (identical(other.imagesError, imagesError) ||
                other.imagesError == imagesError) &&
            const DeepCollectionEquality().equals(
              other._dynamicFieldErrors,
              _dynamicFieldErrors,
            ));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    title,
    description,
    categoryId,
    type,
    const DeepCollectionEquality().hash(_dynamicFields),
    startPrice,
    reservePrice,
    startTime,
    endTime,
    const DeepCollectionEquality().hash(_localImages),
    const DeepCollectionEquality().hash(_uploadedImageUrls),
    isUploadingImages,
    uploadProgress,
    const DeepCollectionEquality().hash(_tags),
    currentStep,
    isSubmitting,
    error,
    titleError,
    descriptionError,
    categoryError,
    startPriceError,
    reservePriceError,
    startTimeError,
    endTimeError,
    imagesError,
    const DeepCollectionEquality().hash(_dynamicFieldErrors),
  ]);

  /// Create a copy of CreateAuctionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAuctionStateImplCopyWith<_$CreateAuctionStateImpl> get copyWith =>
      __$$CreateAuctionStateImplCopyWithImpl<_$CreateAuctionStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CreateAuctionState implements CreateAuctionState {
  const factory _CreateAuctionState({
    final String title,
    final String description,
    final String? categoryId,
    final AuctionType type,
    final Map<String, dynamic> dynamicFields,
    final String? startPrice,
    final String? reservePrice,
    final DateTime? startTime,
    final DateTime? endTime,
    final List<File> localImages,
    final List<String> uploadedImageUrls,
    final bool isUploadingImages,
    final double uploadProgress,
    final List<String> tags,
    final int currentStep,
    final bool isSubmitting,
    final String? error,
    final String? titleError,
    final String? descriptionError,
    final String? categoryError,
    final String? startPriceError,
    final String? reservePriceError,
    final String? startTimeError,
    final String? endTimeError,
    final String? imagesError,
    final Map<String, String> dynamicFieldErrors,
  }) = _$CreateAuctionStateImpl;

  //  Step 1: Basic Info
  @override
  String get title;
  @override
  String get description;
  @override
  String? get categoryId;
  @override
  AuctionType get type; // Dynamic Fields
  @override
  Map<String, dynamic> get dynamicFields; // Step 2: Pricing & Duration
  @override
  String? get startPrice;
  @override
  String? get reservePrice;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime; // Step 3: Images
  @override
  List<File> get localImages;
  @override
  List<String> get uploadedImageUrls;
  @override
  bool get isUploadingImages;
  @override
  double get uploadProgress; // Step 4: Additional Details
  @override
  List<String> get tags; // Form State
  @override
  int get currentStep;
  @override
  bool get isSubmitting;
  @override
  String? get error; // Validation Errors
  @override
  String? get titleError;
  @override
  String? get descriptionError;
  @override
  String? get categoryError;
  @override
  String? get startPriceError;
  @override
  String? get reservePriceError;
  @override
  String? get startTimeError;
  @override
  String? get endTimeError;
  @override
  String? get imagesError;
  @override
  Map<String, String> get dynamicFieldErrors;

  /// Create a copy of CreateAuctionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateAuctionStateImplCopyWith<_$CreateAuctionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
