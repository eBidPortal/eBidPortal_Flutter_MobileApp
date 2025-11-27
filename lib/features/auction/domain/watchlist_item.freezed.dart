// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WatchlistItem _$WatchlistItemFromJson(Map<String, dynamic> json) {
  return _WatchlistItem.fromJson(json);
}

/// @nodoc
mixin _$WatchlistItem {
  String get id => throw _privateConstructorUsedError;
  String get auctionId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get addedAt =>
      throw _privateConstructorUsedError; // Include auction data for display
  String? get auctionTitle => throw _privateConstructorUsedError;
  double? get currentBid => throw _privateConstructorUsedError;
  double? get startingPrice => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;

  /// Serializes this WatchlistItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WatchlistItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WatchlistItemCopyWith<WatchlistItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistItemCopyWith<$Res> {
  factory $WatchlistItemCopyWith(
    WatchlistItem value,
    $Res Function(WatchlistItem) then,
  ) = _$WatchlistItemCopyWithImpl<$Res, WatchlistItem>;
  @useResult
  $Res call({
    String id,
    String auctionId,
    String userId,
    DateTime addedAt,
    String? auctionTitle,
    double? currentBid,
    double? startingPrice,
    String? status,
    DateTime? endTime,
    List<String>? images,
  });
}

/// @nodoc
class _$WatchlistItemCopyWithImpl<$Res, $Val extends WatchlistItem>
    implements $WatchlistItemCopyWith<$Res> {
  _$WatchlistItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchlistItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? auctionId = null,
    Object? userId = null,
    Object? addedAt = null,
    Object? auctionTitle = freezed,
    Object? currentBid = freezed,
    Object? startingPrice = freezed,
    Object? status = freezed,
    Object? endTime = freezed,
    Object? images = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            auctionId: null == auctionId
                ? _value.auctionId
                : auctionId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            addedAt: null == addedAt
                ? _value.addedAt
                : addedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            auctionTitle: freezed == auctionTitle
                ? _value.auctionTitle
                : auctionTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentBid: freezed == currentBid
                ? _value.currentBid
                : currentBid // ignore: cast_nullable_to_non_nullable
                      as double?,
            startingPrice: freezed == startingPrice
                ? _value.startingPrice
                : startingPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            images: freezed == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WatchlistItemImplCopyWith<$Res>
    implements $WatchlistItemCopyWith<$Res> {
  factory _$$WatchlistItemImplCopyWith(
    _$WatchlistItemImpl value,
    $Res Function(_$WatchlistItemImpl) then,
  ) = __$$WatchlistItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String auctionId,
    String userId,
    DateTime addedAt,
    String? auctionTitle,
    double? currentBid,
    double? startingPrice,
    String? status,
    DateTime? endTime,
    List<String>? images,
  });
}

/// @nodoc
class __$$WatchlistItemImplCopyWithImpl<$Res>
    extends _$WatchlistItemCopyWithImpl<$Res, _$WatchlistItemImpl>
    implements _$$WatchlistItemImplCopyWith<$Res> {
  __$$WatchlistItemImplCopyWithImpl(
    _$WatchlistItemImpl _value,
    $Res Function(_$WatchlistItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WatchlistItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? auctionId = null,
    Object? userId = null,
    Object? addedAt = null,
    Object? auctionTitle = freezed,
    Object? currentBid = freezed,
    Object? startingPrice = freezed,
    Object? status = freezed,
    Object? endTime = freezed,
    Object? images = freezed,
  }) {
    return _then(
      _$WatchlistItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        auctionId: null == auctionId
            ? _value.auctionId
            : auctionId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        addedAt: null == addedAt
            ? _value.addedAt
            : addedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        auctionTitle: freezed == auctionTitle
            ? _value.auctionTitle
            : auctionTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentBid: freezed == currentBid
            ? _value.currentBid
            : currentBid // ignore: cast_nullable_to_non_nullable
                  as double?,
        startingPrice: freezed == startingPrice
            ? _value.startingPrice
            : startingPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        images: freezed == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchlistItemImpl implements _WatchlistItem {
  const _$WatchlistItemImpl({
    required this.id,
    required this.auctionId,
    required this.userId,
    required this.addedAt,
    this.auctionTitle,
    this.currentBid,
    this.startingPrice,
    this.status,
    this.endTime,
    final List<String>? images,
  }) : _images = images;

  factory _$WatchlistItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchlistItemImplFromJson(json);

  @override
  final String id;
  @override
  final String auctionId;
  @override
  final String userId;
  @override
  final DateTime addedAt;
  // Include auction data for display
  @override
  final String? auctionTitle;
  @override
  final double? currentBid;
  @override
  final double? startingPrice;
  @override
  final String? status;
  @override
  final DateTime? endTime;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WatchlistItem(id: $id, auctionId: $auctionId, userId: $userId, addedAt: $addedAt, auctionTitle: $auctionTitle, currentBid: $currentBid, startingPrice: $startingPrice, status: $status, endTime: $endTime, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.auctionId, auctionId) ||
                other.auctionId == auctionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.auctionTitle, auctionTitle) ||
                other.auctionTitle == auctionTitle) &&
            (identical(other.currentBid, currentBid) ||
                other.currentBid == currentBid) &&
            (identical(other.startingPrice, startingPrice) ||
                other.startingPrice == startingPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    auctionId,
    userId,
    addedAt,
    auctionTitle,
    currentBid,
    startingPrice,
    status,
    endTime,
    const DeepCollectionEquality().hash(_images),
  );

  /// Create a copy of WatchlistItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistItemImplCopyWith<_$WatchlistItemImpl> get copyWith =>
      __$$WatchlistItemImplCopyWithImpl<_$WatchlistItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchlistItemImplToJson(this);
  }
}

abstract class _WatchlistItem implements WatchlistItem {
  const factory _WatchlistItem({
    required final String id,
    required final String auctionId,
    required final String userId,
    required final DateTime addedAt,
    final String? auctionTitle,
    final double? currentBid,
    final double? startingPrice,
    final String? status,
    final DateTime? endTime,
    final List<String>? images,
  }) = _$WatchlistItemImpl;

  factory _WatchlistItem.fromJson(Map<String, dynamic> json) =
      _$WatchlistItemImpl.fromJson;

  @override
  String get id;
  @override
  String get auctionId;
  @override
  String get userId;
  @override
  DateTime get addedAt; // Include auction data for display
  @override
  String? get auctionTitle;
  @override
  double? get currentBid;
  @override
  double? get startingPrice;
  @override
  String? get status;
  @override
  DateTime? get endTime;
  @override
  List<String>? get images;

  /// Create a copy of WatchlistItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchlistItemImplCopyWith<_$WatchlistItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
